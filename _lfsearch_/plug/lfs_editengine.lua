-- lfs_editengine.lua

local M             = require "lfs_message"
local Common        = require "lfs_common"
local CustomMessage = require "far2.message"
local CustomMenu    = require "far2.custommenu"
local F = far.Flags
local EditorGetString = editor.GetString
local EditorSetString = editor.SetString
local _lastclock
local floor, ceil, min = math.floor, math.ceil, math.min

-- All arguments must be in UTF-8.
local function GetReplaceChoice (aTitle, s_found, s_rep)
  s_found = s_found:gsub("%z", " ")
  if type(s_rep) == "string" then s_rep = s_rep:gsub("%z", " ") end
  local color = CustomMessage.GetInvertedColor("COL_DIALOGTEXT")
  local msg = s_rep~=true and
    {
      M.MUserChoiceReplace,"\n",
      { text=s_found, color=color },"\n",
      M.MUserChoiceWith,"\n",
      { text=s_rep, color=color },
    } or
    {
      M.MUserChoiceDeleteLine,"\n",
      { text=s_found, color=color },
    }
  local buttons = s_rep~=true and M.MUserChoiceButtons or M.MUserChoiceDeleteButtons
  local guid = win.Uuid("7f7ca8d3-f241-4018-97aa-ad4013188df8")
  local c = CustomMessage.Message(msg, aTitle, buttons, "c", nil, guid)
  return c==1 and "yes" or c==2 and "all" or c==3 and "no" or "cancel"
end


local function EditorSelect (b)
  if b then
    local startPos = b.TabStartPos or b.StartPos
    local endPos = b.TabEndPos or b.EndPos
    editor.Select(b.BlockType, b.StartLine, startPos, endPos-startPos+1, b.EndLine-b.StartLine+1)
  else
    editor.Select("BTYPE_NONE")
  end
end


local function CheckUserBreak (aTitle)
  return (win.ExtractKey() == "ESCAPE") and
    1 == far.Message(M.MUsrBrkPrompt, aTitle, ";YesNo", "w")
end


-- This function replaces the old 9-line function.
-- The reason for applying a new, much more complicated algorithm is that
-- the old algorithm has unacceptably poor performance on long subjects.
local function find_back (s, regex, init)
  local out = regex:ufind(s, 1)
  if out == nil or out[2]>=init then return nil end

  local BEST = 1
  local stage = 1
  local MIN, MAX = 2, init
  local start = ceil((MIN+MAX)/2)

  while true do
    local res = regex:ufind(s, start)
    if res and res[2]>=init then res=nil end
    local ok = false
    ---------------------------------------------------------------------------
    if stage == 1 then -- maximize out[2]
      if res then
        if res[2] > out[2] then
          BEST, out, ok = start, res, true
        elseif res[2] == out[2] then
          ok = true
        end
      end
      if MIN >= MAX then
        stage = 2
        MIN, MAX = 2, BEST-1
        start = floor((MIN+MAX)/2)
      elseif ok then
        MIN = start+1
        start = ceil((MIN+MAX)/2)
      else
        MAX = start-1
        start = floor((MIN+MAX)/2)
      end
    ---------------------------------------------------------------------------
    else -- minimize out[1]
      if res and res[2] >= out[2] then
        if res[1] < out[1] then
          out, ok = res, true
        elseif res[1] == out[1] then
          ok = true
        end
      end
      if MIN >= MAX then
        break
      elseif ok then
        MAX = start-1
        start = floor((MIN+MAX)/2)
      else
        MIN = start+1
        start = ceil((MIN+MAX)/2)
      end
    end
    ---------------------------------------------------------------------------
  end
  return out
end


-- Note: argument 'row' can be nil (using current line)
local function ScrollToPosition (row, pos, from, to, scroll)
  local editInfo = editor.GetInfo()
  local LeftPos = editInfo.LeftPos
  -- left-most (or right-most) char is not visible
  if (from <= LeftPos) or (to > LeftPos + editInfo.WindowSizeX) then
    if to - from + 1 >= editInfo.WindowSizeX then
      LeftPos = from - 1
    else
      LeftPos = floor((to + from - 1 - editInfo.WindowSizeX) / 2)
      if LeftPos < 0 then LeftPos = 0 end
    end
  end
  -----------------------------------------------------------------------------
  local top
  local halfscreen = editInfo.WindowSizeY / 2
  scroll = scroll or 0
  row = row or editInfo.CurLine
  if row < halfscreen - scroll then
    top = 1
  elseif row > halfscreen + scroll then
    top = row - floor(halfscreen + scroll - 0.5)
  else
    top = row - floor(halfscreen - scroll - 0.5)
  end
  -----------------------------------------------------------------------------
  editor.SetPosition { TopScreenLine=top, CurLine=row, LeftPos=LeftPos, CurPos=pos }
end


local function SelectItemInEditor(item)
  local fr, to = item.fr-item.offset, item.to-item.offset
  ScrollToPosition(item.lineno, to+1, fr, to)
  editor.Select("BTYPE_STREAM", nil, fr, to-fr+1, 1)
  actl.RedrawAll() -- editor.Redraw doesn't work from the dialog
end


local function ShowAll_ChangeState (hDlg, item, force_dock)
  local EI = editor.GetInfo()
  local rect = hDlg:GetDlgRect()
  local scrline = item.lineno - EI.TopScreenLine + 1
  if force_dock or (scrline >= rect.Top and scrline <= rect.Bottom) then
    local X = force_dock and (EI.WindowSizeX - (rect.Right - rect.Left + 1)) or rect.Left
    local Y = scrline <= EI.WindowSizeY/2 and EI.WindowSizeY - (rect.Bottom - rect.Top) or 1
    hDlg:MoveDialog(1, {X=X, Y=Y})
  end
  -- This additional editor.Redraw() is a workaround due to a bug in FAR
  -- that makes selection invisible in modal editors.
  editor.Redraw()
end


local function ShowCollectedLines (items, title, bForward, tBlockInfo)
  if #items == 0 then return end

  local Info = editor.GetInfo()

  local maxno = #tostring(items.maxline)
  local fmt = ("%%%dd%s %%s"):format(maxno, ("").char(9474))
  for _, item in ipairs(items) do
    local s = item.text:gsub("%z", " ") -- replace null bytes with spaces
    local n = maxno + 2
    item.offset, item.fr, item.to = n, item.fr+n, item.to+n
    item.text = fmt:format(item.lineno, s)
  end
  local bottom = #items..M.MLinesFound.." [F6,F7,F8,Ctrl-C]"

  local list = CustomMenu.NewList({
      hmax = floor(Info.WindowSizeY * 0.5) - 4,
      wmax = floor(Info.WindowSizeX * 0.7) - 6,
      autocenter = false,
      --resizeScreen = true, -- make it the default for CustomMenu?
      col_highlight = 0x6F,
      col_selectedhighlight = 0x4F,
      ellipsis = bForward and 3 or 0, -- position ellipsis at either line end or beginning
      searchstart = maxno + 3, -- required for correct work of ellipsis
    }, items)

  function list:onlistchange (hDlg, key, item)
    SelectItemInEditor(item)
    ShowAll_ChangeState(hDlg, item, false)
  end

  local newsearch = false
  function list:keyfunction (hDlg, key, item)
    if regex.match(key, "^R?Ctrl(?:Up|Down|Home|End|Num[1278])$") then
      editor.ProcessKey(far.NameToKey(key))
      actl.RedrawAll()
      hDlg:Redraw()
      return "done"
    elseif key=="CtrlNum0" or key=="RCtrlNum0" then
      self:onlistchange(hDlg, key, item)
      return "done"
    elseif key=="F8" then
      newsearch = true
      return "break"
    end
  end

  local OnInitDialog_original = list.OnInitDialog
  list.OnInitDialog = function (self, hDlg)
    OnInitDialog_original(self, hDlg)
    ShowAll_ChangeState(hDlg, self.items[1], true)
  end

  SelectItemInEditor(list.items[1])
  local item = CustomMenu.Menu(
    {
      DialogId  = win.Uuid("D0596479-B9AB-4C0E-A28B-D009C000C63C"),
      Title     = title,                  -- honored by CustomMenu
      Bottom    = bottom,                 -- honored by CustomMenu
      Flags     = F.FMENU_SHOWAMPERSAND + F.FMENU_WRAPMODE,
      HelpTopic = "EditorShowAll",
      X = Info.WindowSizeX - list.wmax - 6,
      Y = Info.WindowSizeY - list.hmax - 3,
    },
    list)
  if item and not newsearch then
    SelectItemInEditor(item)
  else
    editor.SetPosition(Info)
    EditorSelect(tBlockInfo) -- if tBlockInfo is false then selection is reset;
    editor.Redraw()
  end
  return newsearch
end


local function EditorSetCurString (text)
  if not EditorSetString(nil, text) then error("EditorSetString failed") end
end


-- @aOp: "search", "replace", "count", "showall"
local function DoAction (aOp, aParams, aWithDialog, aChoiceFunc)
  -----------------------------------------------------------------------------
  local bForward         = not aParams.bSearchBack
  local bAllowEmpty      = aWithDialog
  local fFilter, Regex   = aParams.FilterFunc, aParams.Regex
  local fChoice          = aChoiceFunc or GetReplaceChoice
  local bFastCount       = (aOp == "count") and bForward
  local sTitle           = (aOp == "replace") and M.MTitleReplace or M.MTitleSearch
  local fReplace         = (aOp == "replace") and Common.GetReplaceFunction(aParams.ReplacePat)
  local bDelNonMatchLine = (aOp == "replace") and aWithDialog and aParams.bDelNonMatchLine
  local tItems           = (aOp == "showall") and {}

  local sChoice, bEurBegin
  if aWithDialog and not aParams.bConfirmReplace then
    sChoice, bEurBegin = "all", true
    editor.UndoRedo("EUR_BEGIN") -- for undoing the bulk replacement in a single step
  end

  local nFound, nReps, nLine = 0, 0, 0
  local tInfo, tStartPos = editor.GetInfo(), editor.GetInfo()
  local nOp, nOpMax, last_update = 0, 5, 0

  local tBlockInfo
  if aParams.sScope == "block" then
    tBlockInfo = assert(editor.GetSelection(), "no selection")
  end

  local fLineInScope
  if tBlockInfo then
    fLineInScope = bForward
      and function(y) return y <= tBlockInfo.EndLine end
      or function(y) return y >= tBlockInfo.StartLine end
  else
    fLineInScope = bForward
      and function(y) return y <= tInfo.TotalLines end
      or function(y) return y >= 1 end
  end

  -- sLine must be set/modified only via set_sLine, in order to cache its length.
  -- This gives a very noticeable performance gain on long lines.
  local sLine, sLineLen
  local function set_sLine(s) sLine, sLineLen = s, s:len(); end

  local x, y, egs, part1, part3
  local function SetStartBlockParam (y)
    if aOp == "replace" then
      if tBlockInfo then EditorSelect(tBlockInfo)
      else editor.Select("BTYPE_NONE")
      end
    end
    egs = EditorGetString(y, 1)
    part1 = egs.StringText:sub(1, egs.SelStart-1)
    if egs.SelEnd == -1 then
      set_sLine(egs.StringText:sub(egs.SelStart))
      part3 = ""
    else
      set_sLine(egs.StringText:sub(egs.SelStart, egs.SelEnd))
      part3 = egs.StringText:sub(egs.SelEnd+1)
    end
  end

  if aWithDialog and aParams.sOrigin == "scope" then
    if tBlockInfo then
      y = bForward and tBlockInfo.StartLine or tBlockInfo.EndLine
      SetStartBlockParam(y)
      x = bForward and 1 or sLineLen+1
    else
      y = bForward and 1 or tInfo.TotalLines
      set_sLine(EditorGetString(y, 2))
      x = bForward and 1 or sLineLen+1
      part1, part3 = "", ""
    end
  else -- "cursor"
    if tBlockInfo then
      if tInfo.CurLine < tBlockInfo.StartLine then
        y = tBlockInfo.StartLine
        SetStartBlockParam(y)
        x = bForward and 1 or sLineLen
      elseif tInfo.CurLine > tBlockInfo.EndLine then
        y = tBlockInfo.EndLine
        SetStartBlockParam(y)
        x = bForward and 1 or sLineLen
      else
        y = tInfo.CurLine
        SetStartBlockParam(y)
        x = tInfo.CurPos <= egs.SelStart and 1
            or min(egs.SelEnd==-1 and sLineLen or egs.SelEnd,
                   tInfo.CurPos - egs.SelStart, sLineLen)
      end
    else
      y = tInfo.CurLine
      set_sLine(EditorGetString(y, 2))
      x = min(tInfo.CurPos, sLineLen+1)
      part1, part3 = "", ""
    end
  end
  -----------------------------------------------------------------------------
  local function update_y (bLineDeleted)
    y = bForward and y+(bLineDeleted and 0 or 1) or y-1
    if fLineInScope(y) then
      if tBlockInfo then
        SetStartBlockParam(y)
      else
        set_sLine(EditorGetString(y, 2))
      end
      x = bForward and 1 or sLineLen+1
      bAllowEmpty = true
    end
  end
  -----------------------------------------------------------------------------
  local update_x = bForward
    and function(fr, to, delta) x = to + (delta or 1) end
    or function(fr, to) x = fr end
  -----------------------------------------------------------------------------
  local function update_info()
    editor.SetTitle("found: " .. nFound)
  end
  local function check_and_update()
    local currclock = os.clock()
    local tm = currclock - _lastclock
    if tm == 0 then tm = 0.01 end
    nOpMax = nOpMax * 0.5 / tm
    if nOpMax > 100 then nOpMax = 100 end
    _lastclock = currclock
    -------------------------------------------------
    if currclock - last_update >= 0.5 then
      update_info()
      if CheckUserBreak(sTitle) then return true end
      last_update = currclock
    end
  end
  _lastclock = os.clock()
  --===========================================================================
  -- ITERATE ON LINES
  --===========================================================================
  while sChoice ~= "cancel" and sChoice ~= "broken" and fLineInScope(y) do
    nLine = nLine + 1
    local bLineDeleted
    ---------------------------------------------------------------------------
    if not (fFilter and fFilter(sLine, nLine)) then
      -------------------------------------------------------------------------
      -- iterate on current line
      -------------------------------------------------------------------------
      local bLineHasMatch
      while bForward and x <= sLineLen+1 or not bForward and x >= 1 do
        nOp = nOp + 1
        if nOp >= nOpMax then -- don't use "==" here (int vs floating point)
          nOp = 0
          if check_and_update() then sChoice = "broken"; break; end
        end
        -----------------------------------------------------------------------
        if bFastCount then
          local _, n = Regex:gsub(sLine:sub(x), "")
          nFound = nFound + n
          break
        end
        -----------------------------------------------------------------------
        local collect, fr, to
        if bForward then
          collect = Regex:ufind(sLine, x)
        else
          collect = find_back(sLine, Regex, x)
        end
        -----------------------------------------------------------------------
        if collect then
          fr, to = collect[1], collect[2]
          bLineHasMatch = true
        elseif bDelNonMatchLine and not bLineHasMatch then
          fr, to = 1, sLineLen
        else
          break
        end
        -----------------------------------------------------------------------
        local function ShowFound (scroll)
          --editor.SetPosition(y, x)
          local p1 = part1:len()
          ScrollToPosition (y, p1+x, fr, to, scroll)
          editor.Select("BTYPE_STREAM", y, p1+fr, to-fr+1, 1)
          editor.Redraw()
          tStartPos = editor.GetInfo()
        end
        -----------------------------------------------------------------------
        if collect then
          if fr==x and to+1==x and not bAllowEmpty then
            if bForward then
              if x > sLineLen then break end
              x = x + 1
              collect = Regex:ufind(sLine, x)
            else
              if x == 1 then break end
              x = x - 1
              collect = find_back(sLine, Regex, x)
            end
            if not collect then break end
            fr, to = collect[1], collect[2]
          end
          -----------------------------------------------------------------------
          nFound = nFound + 1
          bAllowEmpty = false
          -----------------------------------------------------------------------
          if aOp == "search" then
            update_x(fr, to)
            ShowFound()
            return 1, 0
          -----------------------------------------------------------------------
          elseif aOp == "count" then
            update_x(fr, to)
          -----------------------------------------------------------------------
          elseif aOp == "showall" then
            update_x(fr, to)
            if #tItems == 0 or y ~= tItems[#tItems].lineno then
              table.insert(tItems, {lineno=y, text=sLine, fr=fr, to=to})
            end
          end
        end
        -----------------------------------------------------------------------
        if aOp == "replace" then
          local sRepFinal
          if collect then
            collect[2] = sLine:sub(fr, to)
            sRepFinal = fReplace(collect, nFound, nReps, y)
          else
            sRepFinal = true
          end
          if sRepFinal then
            --=================================================================
            local function Replace()
              local bTraceSelection = tBlockInfo
                and (tBlockInfo.BlockType == F.BTYPE_STREAM)
                and (tBlockInfo.EndLine == y) and (tBlockInfo.EndPos ~= -1)
              local sLastRep
              local nAdded, nDeleted = 0, 0

              if sRepFinal == true then
                bLineDeleted = true
                nDeleted = 1
                editor.DeleteString()
              else
                local sStartLine
                local sHead = sLine:sub(1, fr-1)
                for txt, nl in sRepFinal:gmatch("([^\r\n]*)(\r?\n?)") do
                  sLastRep = txt
                  sHead = sHead .. txt
                  if nl == "" then break end
                  if nAdded == 0 then
                    sStartLine = sHead
                    sHead = part1 .. sHead
                    part1 = ""
                  end
                  EditorSetCurString(sHead)
                  editor.SetPosition(nil, sHead:len()+1)
                  editor.InsertString()
                  sHead = ""
                  nAdded = nAdded + 1
                end

                set_sLine(sHead .. sLine:sub(to+1))
                local line = part1 .. sLine .. part3
                bLineDeleted = aParams.bDelEmptyLine and line == ""
                nDeleted = bLineDeleted and 1 or 0
                if bLineDeleted then editor.DeleteString()
                else EditorSetCurString(line)
                end

                if bForward then
                  y = y + nAdded
                  x = sHead:len() + 1
                else
                  if sStartLine then set_sLine(sStartLine) end
                  x = fr
                  editor.SetPosition(y, x)
                end
              end

              if tBlockInfo then
                tBlockInfo.EndLine = tBlockInfo.EndLine + nAdded - nDeleted
                if bTraceSelection then
                  if bLineDeleted then
                    tBlockInfo.EndPos = -1
                  elseif sLastRep then
                    tBlockInfo.EndPos = tBlockInfo.EndPos + sLastRep:len() - (to-fr+1)
                  end
                end
              else
                tInfo.TotalLines = tInfo.TotalLines + nAdded - nDeleted
              end

              if sChoice == "yes" then
                editor.Redraw()
              end
              if sChoice ~= "all" and tBlockInfo then
                EditorSelect(tBlockInfo)
              end
              tStartPos = editor.GetInfo() -- save position
              nReps = nReps + 1
              return bLineDeleted
            end
            --=================================================================
            if sChoice == "all" then
              if Replace() then break end
              editor.SetPosition(y, x)
              tStartPos = editor.GetInfo()
            else
              ShowFound(14/2 + 2)
              sChoice = fChoice(sTitle, sLine:sub(fr, to), sRepFinal)
              if sChoice == "all" then
                editor.UndoRedo("EUR_BEGIN") -- for undoing the bulk replacement in a single step
                bEurBegin = true
              end
              -----------------------------------------------------------------
              if sChoice == "yes" or sChoice == "all" then
                if Replace() then break end
                if sChoice == "yes" then ShowFound() end
              -----------------------------------------------------------------
              elseif sChoice == "no" then
                if collect then update_x(fr, to)
                else break
                end
              -----------------------------------------------------------------
              elseif sChoice == "cancel" then
                break
              -----------------------------------------------------------------
              end
            end
          else -- (if not sRepFinal)
            update_x(fr, to)
          end
        -----------------------------------------------------------------------
        end
      end -- Current Line loop
    end -- Line Filter check
    update_y(bLineDeleted)
  end
  --===========================================================================
  editor.SetPosition(tStartPos)
  if tBlockInfo then
    EditorSelect(tBlockInfo)
  end
  editor.Redraw()
  update_info()
  if aOp == "showall" then
    local newsearch = ShowCollectedLines(
        tItems,
        ("%s [%s]"):format(M.MSearchResults, aParams.sSearchPat),
        bForward,
        tBlockInfo)
    if newsearch then sChoice = "newsearch" end
  elseif aOp == "replace" and bEurBegin then
    editor.UndoRedo("EUR_END")
  end
  return nFound, nReps, sChoice
end

return {
  DoAction = DoAction;
}
