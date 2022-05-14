-- coding: utf-8

local Shared = ...
local checkarg, utils, yieldcall = Shared.checkarg, Shared.utils, Shared.yieldcall
local Sett = require "far2.settings"
local op = require "opcodes"

local MCODE_F_USERMENU = op.MCODE_F_USERMENU
local MCODE_F_FAR_GETCONFIG = op.MCODE_F_FAR_GETCONFIG
local F=far.Flags
local band,bor = bit.band,bit.bor
local MacroCallFar = Shared.MacroCallFar

local function SetProperties (namespace, proptable)
  local meta = {}
  meta.__index = function(tb,nm)
    local f = proptable[nm]
    if f then return f() end
    if nm == "properties" then return proptable end -- to allow introspection
    error("property not supported: "..tostring(nm), 2)
  end
  setmetatable(namespace, meta)
  return namespace
end
--------------------------------------------------------------------------------

-- "mf" ("macrofunctions") namespace
mf = {
  abs             = function(...) return MacroCallFar( op.MCODE_F_ABS       , ...) end,
--akey            = function(...) return MacroCallFar( op., ...) end,
  asc             = function(...) return MacroCallFar( op.MCODE_F_ASC       , ...) end,
  atoi            = function(...) return MacroCallFar( op.MCODE_F_ATOI      , ...) end,
  chr             = utf8.char,
  clip            = function(...) return MacroCallFar( op.MCODE_F_CLIP      , ...) end,
  date            = function(...) return MacroCallFar( op.MCODE_F_DATE      , ...) end,
  env             = function(...) return MacroCallFar( op.MCODE_F_ENVIRON   , ...) end,
  fattr           = function(...) return MacroCallFar( op.MCODE_F_FATTR     , ...) end,
  fexist          = function(...) return MacroCallFar( op.MCODE_F_FEXIST    , ...) end,
  float           = function(...) return MacroCallFar( op.MCODE_F_FLOAT     , ...) end,
  flock           = function(...) return MacroCallFar( op.MCODE_F_FLOCK     , ...) end,
  fmatch          = function(...) return MacroCallFar( op.MCODE_F_FMATCH    , ...) end,
  fsplit          = function(...) return MacroCallFar( op.MCODE_F_FSPLIT    , ...) end,
  index           = function(...) return MacroCallFar( op.MCODE_F_INDEX     , ...) end,
  int             = function(...) return MacroCallFar( op.MCODE_F_INT       , ...) end,
  itoa            = function(...) return MacroCallFar( op.MCODE_F_ITOA      , ...) end,
  key             = function(...) return MacroCallFar( op.MCODE_F_KEY       , ...) end,
  lcase           = function(...) return MacroCallFar( op.MCODE_F_LCASE     , ...) end,
  len             = function(...) return MacroCallFar( op.MCODE_F_LEN       , ...) end,
  max             = function(...) return MacroCallFar( op.MCODE_F_MAX       , ...) end,
  min             = function(...) return MacroCallFar( op.MCODE_F_MIN       , ...) end,
  mod             = function(...) return MacroCallFar( op.MCODE_F_MOD       , ...) end,
  msgbox          = function(...) return MacroCallFar( op.MCODE_F_MSGBOX    , ...) end,
  prompt          = function(...) return MacroCallFar( op.MCODE_F_PROMPT    , ...) end,
  replace         = function(...) return MacroCallFar( op.MCODE_F_REPLACE   , ...) end,
  rindex          = function(...) return MacroCallFar( op.MCODE_F_RINDEX    , ...) end,
--size2str        = function(...) return MacroCallFar( op.MCODE_F_, ...) end,
  sleep           = function(...) return MacroCallFar( op.MCODE_F_SLEEP     , ...) end,
  string          = function(...) return MacroCallFar( op.MCODE_F_STRING    , ...) end,
--strpad          = function(...) return MacroCallFar( op.MCODE_F_, ...) end,
--strwrap         = function(...) return MacroCallFar( op.MCODE_F_, ...) end,
  substr          = function(...) return MacroCallFar( op.MCODE_F_SUBSTR    , ...) end,
  testfolder      = function(...) return MacroCallFar( op.MCODE_F_TESTFOLDER, ...) end,
  trim            = function(...) return MacroCallFar( op.MCODE_F_TRIM      , ...) end,
  ucase           = function(...) return MacroCallFar( op.MCODE_F_UCASE     , ...) end,
  waitkey         = function(...) return MacroCallFar( op.MCODE_F_WAITKEY   , ...) end,
  xlat            = function(...) return MacroCallFar( op.MCODE_F_XLAT      , ...) end,
}

mf.iif = function(Expr, res1, res2)
  if Expr and Expr~=0 and Expr~="" then return res1 else return res2 end
end

mf.usermenu = function(mode, filename)
  if Shared.OnlyEditorViewerUsed then return end -- mantis #2986 (crash)
  if mode and type(mode)~="number" then return end
  mode = mode or 0
  local sync_call = band(mode,0x100) ~= 0
  mode = band(mode,0xFF)
  if mode==0 or mode==1 then
    if sync_call then MacroCallFar(MCODE_F_USERMENU, mode==1)
    else yieldcall(F.MPRT_USERMENU, mode==1)
    end
  elseif (mode==2 or mode==3) and type(filename)=="string" then
    if mode==3 then
      if not filename:find("^/") then
        filename = win.GetEnv("HOME").."/.config/far2l/Menus/"..filename
      end
    end
    if sync_call then MacroCallFar(MCODE_F_USERMENU, filename)
    else yieldcall(F.MPRT_USERMENU, filename)
    end
  end
end

mf.GetMacroCopy = utils.GetMacroCopy
--------------------------------------------------------------------------------

Object = {
  CheckHotkey = function(...) return MacroCallFar(op.MCODE_F_MENU_CHECKHOTKEY, ...) end,
  GetHotkey   = function(...) return MacroCallFar(op.MCODE_F_MENU_GETHOTKEY, ...) end,
}

SetProperties(Object, {
  Bof        = function() return MacroCallFar(op.MCODE_C_BOF       ) end,
  CurPos     = function() return MacroCallFar(op.MCODE_V_CURPOS    ) end,
  Empty      = function() return MacroCallFar(op.MCODE_C_EMPTY     ) end,
  Eof        = function() return MacroCallFar(op.MCODE_C_EOF       ) end,
  Height     = function() return MacroCallFar(op.MCODE_V_HEIGHT    ) end,
  ItemCount  = function() return MacroCallFar(op.MCODE_V_ITEMCOUNT ) end,
  Selected   = function() return MacroCallFar(op.MCODE_C_SELECTED  ) end,
  Title      = function() return MacroCallFar(op.MCODE_V_TITLE     ) end,
  Width      = function() return MacroCallFar(op.MCODE_V_WIDTH     ) end,
})
--------------------------------------------------------------------------------

local prop_Area = {
  Current    = function() return utils.GetTrueAreaName(MacroCallFar(op.MCODE_V_MACRO_AREA)) end,
  Other      = function() return MacroCallFar(0)==0  end,
  Shell      = function() return MacroCallFar(0)==1  end,
  Viewer     = function() return MacroCallFar(0)==2  end,
  Editor     = function() return MacroCallFar(0)==3  end,
  Dialog     = function() return MacroCallFar(0)==4  end,
  Search     = function() return MacroCallFar(0)==5  end,
  Disks      = function() return MacroCallFar(0)==6  end,
  MainMenu   = function() return MacroCallFar(0)==7  end,
  Menu       = function() return MacroCallFar(0)==8  end,
  Help       = function() return MacroCallFar(0)==9  end,
  Info       = function() return MacroCallFar(0)==10 end,
  QView      = function() return MacroCallFar(0)==11 end,
  Tree       = function() return MacroCallFar(0)==12 end,
  FindFolder = function() return MacroCallFar(0)==13 end,
  UserMenu   = function() return MacroCallFar(0)==14 end,
  AutoCompletion = function()  return MacroCallFar(0)==15 end,
}

local prop_APanel = {
  Bof         = function() return MacroCallFar(op.MCODE_C_APANEL_BOF         ) end,
  ColumnCount = function() return MacroCallFar(op.MCODE_V_APANEL_COLUMNCOUNT ) end,
  CurPos      = function() return MacroCallFar(op.MCODE_V_APANEL_CURPOS      ) end,
  Current     = function() return MacroCallFar(op.MCODE_V_APANEL_CURRENT     ) end,
  DriveType   = function() return MacroCallFar(op.MCODE_V_APANEL_DRIVETYPE   ) end,
  Empty       = function() return MacroCallFar(op.MCODE_C_APANEL_ISEMPTY     ) end,
  Eof         = function() return MacroCallFar(op.MCODE_C_APANEL_EOF         ) end,
  FilePanel   = function() return MacroCallFar(op.MCODE_C_APANEL_FILEPANEL   ) end,
  Filter      = function() return MacroCallFar(op.MCODE_C_APANEL_FILTER      ) end,
  Folder      = function() return MacroCallFar(op.MCODE_C_APANEL_FOLDER      ) end,
  Format      = function() return MacroCallFar(op.MCODE_V_APANEL_FORMAT      ) end,
  Height      = function() return MacroCallFar(op.MCODE_V_APANEL_HEIGHT      ) end,
  HostFile    = function() return MacroCallFar(op.MCODE_V_APANEL_HOSTFILE    ) end,
  ItemCount   = function() return MacroCallFar(op.MCODE_V_APANEL_ITEMCOUNT   ) end,
  Left        = function() return MacroCallFar(op.MCODE_C_APANEL_LEFT        ) end,
  OPIFlags    = function() return MacroCallFar(op.MCODE_V_APANEL_OPIFLAGS    ) end,
  Path        = function() return MacroCallFar(op.MCODE_V_APANEL_PATH        ) end,
  Path0       = function() return MacroCallFar(op.MCODE_V_APANEL_PATH0       ) end,
  Plugin      = function() return MacroCallFar(op.MCODE_C_APANEL_PLUGIN      ) end,
  Prefix      = function() return MacroCallFar(op.MCODE_V_APANEL_PREFIX      ) end,
  Root        = function() return MacroCallFar(op.MCODE_C_APANEL_ROOT        ) end,
  SelCount    = function() return MacroCallFar(op.MCODE_V_APANEL_SELCOUNT    ) end,
  Selected    = function() return MacroCallFar(op.MCODE_C_APANEL_SELECTED    ) end,
  Type        = function() return MacroCallFar(op.MCODE_V_APANEL_TYPE        ) end,
  UNCPath     = function() return MacroCallFar(op.MCODE_V_APANEL_UNCPATH     ) end,
  Visible     = function() return MacroCallFar(op.MCODE_C_APANEL_VISIBLE     ) end,
  Width       = function() return MacroCallFar(op.MCODE_V_APANEL_WIDTH       ) end,
}

local prop_PPanel = {
  Bof         = function() return MacroCallFar(op.MCODE_C_PPANEL_BOF         ) end,
  ColumnCount = function() return MacroCallFar(op.MCODE_V_PPANEL_COLUMNCOUNT ) end,
  CurPos      = function() return MacroCallFar(op.MCODE_V_PPANEL_CURPOS      ) end,
  Current     = function() return MacroCallFar(op.MCODE_V_PPANEL_CURRENT     ) end,
  DriveType   = function() return MacroCallFar(op.MCODE_V_PPANEL_DRIVETYPE   ) end,
  Empty       = function() return MacroCallFar(op.MCODE_C_PPANEL_ISEMPTY     ) end,
  Eof         = function() return MacroCallFar(op.MCODE_C_PPANEL_EOF         ) end,
  FilePanel   = function() return MacroCallFar(op.MCODE_C_PPANEL_FILEPANEL   ) end,
  Filter      = function() return MacroCallFar(op.MCODE_C_PPANEL_FILTER      ) end,
  Folder      = function() return MacroCallFar(op.MCODE_C_PPANEL_FOLDER      ) end,
  Format      = function() return MacroCallFar(op.MCODE_V_PPANEL_FORMAT      ) end,
  Height      = function() return MacroCallFar(op.MCODE_V_PPANEL_HEIGHT      ) end,
  HostFile    = function() return MacroCallFar(op.MCODE_V_PPANEL_HOSTFILE    ) end,
  ItemCount   = function() return MacroCallFar(op.MCODE_V_PPANEL_ITEMCOUNT   ) end,
  Left        = function() return MacroCallFar(op.MCODE_C_PPANEL_LEFT        ) end,
  OPIFlags    = function() return MacroCallFar(op.MCODE_V_PPANEL_OPIFLAGS    ) end,
  Path        = function() return MacroCallFar(op.MCODE_V_PPANEL_PATH        ) end,
  Path0       = function() return MacroCallFar(op.MCODE_V_PPANEL_PATH0       ) end,
  Plugin      = function() return MacroCallFar(op.MCODE_C_PPANEL_PLUGIN      ) end,
  Prefix      = function() return MacroCallFar(op.MCODE_V_PPANEL_PREFIX      ) end,
  Root        = function() return MacroCallFar(op.MCODE_C_PPANEL_ROOT        ) end,
  SelCount    = function() return MacroCallFar(op.MCODE_V_PPANEL_SELCOUNT    ) end,
  Selected    = function() return MacroCallFar(op.MCODE_C_PPANEL_SELECTED    ) end,
  Type        = function() return MacroCallFar(op.MCODE_V_PPANEL_TYPE        ) end,
  UNCPath     = function() return MacroCallFar(op.MCODE_V_PPANEL_UNCPATH     ) end,
  Visible     = function() return MacroCallFar(op.MCODE_C_PPANEL_VISIBLE     ) end,
  Width       = function() return MacroCallFar(op.MCODE_V_PPANEL_WIDTH       ) end,
}

local prop_CmdLine = {
  Bof       = function() return MacroCallFar(op.MCODE_C_CMDLINE_BOF       ) end,
  Empty     = function() return MacroCallFar(op.MCODE_C_CMDLINE_EMPTY     ) end,
  Eof       = function() return MacroCallFar(op.MCODE_C_CMDLINE_EOF       ) end,
  Selected  = function() return MacroCallFar(op.MCODE_C_CMDLINE_SELECTED  ) end,
  CurPos    = function() return MacroCallFar(op.MCODE_V_CMDLINE_CURPOS    ) end,
  ItemCount = function() return MacroCallFar(op.MCODE_V_CMDLINE_ITEMCOUNT ) end,
  Value     = function() return MacroCallFar(op.MCODE_V_CMDLINE_VALUE     ) end,
  Result    = function() return Shared.CmdLineResult end,
}

local prop_Drv = {
  ShowMode = function() return MacroCallFar(op.MCODE_V_DRVSHOWMODE ) end,
  ShowPos  = function() return MacroCallFar(op.MCODE_V_DRVSHOWPOS  ) end,
}

local prop_Help = {
  FileName = function() return MacroCallFar(op.MCODE_V_HELPFILENAME ) end,
  SelTopic = function() return MacroCallFar(op.MCODE_V_HELPSELTOPIC ) end,
  Topic    = function() return MacroCallFar(op.MCODE_V_HELPTOPIC    ) end,
}

local prop_Mouse = {
  X             = function() return MacroCallFar(op.MCODE_C_MSX             ) end,
  Y             = function() return MacroCallFar(op.MCODE_C_MSY             ) end,
  Button        = function() return MacroCallFar(op.MCODE_C_MSBUTTON        ) end,
  CtrlState     = function() return MacroCallFar(op.MCODE_C_MSCTRLSTATE     ) end,
  EventFlags    = function() return MacroCallFar(op.MCODE_C_MSEVENTFLAGS    ) end,
  LastCtrlState = function() return MacroCallFar(op.MCODE_C_MSLASTCTRLSTATE ) end,
}

local prop_Viewer = {
  FileName = function() return MacroCallFar(op.MCODE_V_VIEWERFILENAME) end,
  State    = function() return MacroCallFar(op.MCODE_V_VIEWERSTATE)    end,
}
--------------------------------------------------------------------------------

Dlg = {
  GetValue = function(...) return MacroCallFar(op.MCODE_F_DLG_GETVALUE, ...) end,
--SetFocus = function(...) return MacroCallFar(0x80C57, ...) end,
}

SetProperties(Dlg, {
  CurPos     = function() return MacroCallFar(op.MCODE_V_DLGCURPOS) end,
  Id         = function() return MacroCallFar(op.MCODE_V_DLGINFOID) end,
--Owner      = function() return MacroCallFar(0x80838) end,
  ItemCount  = function() return MacroCallFar(op.MCODE_V_DLGITEMCOUNT) end,
  ItemType   = function() return MacroCallFar(op.MCODE_V_DLGITEMTYPE) end,
--PrevPos    = function() return MacroCallFar(0x80836) end,
})
--------------------------------------------------------------------------------

Editor = {
--DelLine  = function(...) return MacroCallFar(0x80C60, ...) end,
  GetStr   = function(n)   return editor.GetString(n,2) or "" end,
--InsStr   = function(...) return MacroCallFar(0x80C62, ...) end,
  Pos      = function(...) return MacroCallFar(op.MCODE_F_EDITOR_POS, ...) end,
  Sel      = function(...) return MacroCallFar(op.MCODE_F_EDITOR_SEL, ...) end,
  Set      = function(...) return MacroCallFar(op.MCODE_F_EDITOR_SET, ...) end,
--SetStr   = function(...) return MacroCallFar(0x80C63, ...) end,
  SetTitle = function(...) return MacroCallFar(op.MCODE_F_EDITOR_SETTITLE, ...) end,
  Undo     = function(...) return MacroCallFar(op.MCODE_F_EDITOR_UNDO, ...) end,
}

SetProperties(Editor, {
  CurLine  = function() return MacroCallFar(op.MCODE_V_EDITORCURLINE) end,
  CurPos   = function() return MacroCallFar(op.MCODE_V_EDITORCURPOS) end,
  FileName = function() return MacroCallFar(op.MCODE_V_EDITORFILENAME) end,
  Lines    = function() return MacroCallFar(op.MCODE_V_EDITORLINES) end,
  RealPos  = function() return MacroCallFar(op.MCODE_V_EDITORREALPOS) end,
  SelValue = function() return MacroCallFar(op.MCODE_V_EDITORSELVALUE) end,
  State    = function() return MacroCallFar(op.MCODE_V_EDITORSTATE) end,
  Value    = function() return editor.GetString(nil,2) or "" end,
})
--------------------------------------------------------------------------------

Menu = {
--Filter     = function(...) return MacroCallFar(0x80C55, ...) end,
--FilterStr  = function(...) return MacroCallFar(0x80C56, ...) end,
  GetValue   = function(...) return MacroCallFar(op.MCODE_F_MENU_GETVALUE, ...) end,
  ItemStatus = function(...) return MacroCallFar(op.MCODE_F_MENU_ITEMSTATUS, ...) end,
  Select     = function(...) return MacroCallFar(op.MCODE_F_MENU_SELECT, ...) end,
--Show       = function(...) return MacroCallFar(0x80C1C, ...) end,
}

SetProperties(Menu, {
--Id         = function() return MacroCallFar(0x80844) end,
  Value      = function() return MacroCallFar(op.MCODE_V_MENU_VALUE) end,
})
--------------------------------------------------------------------------------

Far = {
--Cfg_Get        = function(...) return MacroCallFar(0x80C58, ...) end,
  DisableHistory = function(...) return Shared.keymacro.DisableHistory(...) end,
  KbdLayout      = function(...) return MacroCallFar(op.MCODE_F_KBDLAYOUT, ...) end,
--KeyBar_Show    = function(...) return MacroCallFar(0x80C4B, ...) end,
  Window_Scroll  = function(...) return MacroCallFar(op.MCODE_F_WINDOW_SCROLL, ...) end,
}

function Far.GetConfig (keyname)
  checkarg(keyname, 1, "string")
  local key, name = keyname:match("^(.+)%.([^.]+)$")
  if not key then
    error("invalid format of arg. #1", 2)
  end
  local tp,val = MacroCallFar(MCODE_F_FAR_GETCONFIG, key, name)
  if not tp then
    error("cannot get setting '"..keyname.."'", 2)
  end
  tp = ({"boolean","3-state","integer","string"})[tp]
  if tp == "3-state" then
    if val==0 or val==1 then val=(val==1) else val="other" end
  end
  return val,tp
end

SetProperties(Far, {
  FullScreen     = function() return MacroCallFar(op.MCODE_C_FULLSCREENMODE) end,
  Height         = function() return MacroCallFar(op.MCODE_V_FAR_HEIGHT) end,
  IsUserAdmin    = function() return MacroCallFar(op.MCODE_C_ISUSERADMIN) end,
  PID            = function() return MacroCallFar(op.MCODE_V_FAR_PID) end,
  Title          = function() return MacroCallFar(op.MCODE_V_FAR_TITLE) end,
  UpTime         = function() return MacroCallFar(op.MCODE_V_FAR_UPTIME) end,
  Width          = function() return MacroCallFar(op.MCODE_V_FAR_WIDTH) end,
})
--------------------------------------------------------------------------------

BM = {
  Add   = function(...) return MacroCallFar(op.MCODE_F_BM_ADD, ...) end,
  Back  = function(...) return MacroCallFar(op.MCODE_F_BM_BACK, ...) end,
  Clear = function(...) return MacroCallFar(op.MCODE_F_BM_CLEAR, ...) end,
  Del   = function(...) return MacroCallFar(op.MCODE_F_BM_DEL, ...) end,
  Get   = function(...) return MacroCallFar(op.MCODE_F_BM_GET, ...) end,
  Goto  = function(...) return MacroCallFar(op.MCODE_F_BM_GOTO, ...) end,
  Next  = function(...) return MacroCallFar(op.MCODE_F_BM_NEXT, ...) end,
  Pop   = function(...) return MacroCallFar(op.MCODE_F_BM_POP, ...) end,
  Prev  = function(...) return MacroCallFar(op.MCODE_F_BM_PREV, ...) end,
  Push  = function(...) return MacroCallFar(op.MCODE_F_BM_PUSH, ...) end,
  Stat  = function(...) return MacroCallFar(op.MCODE_F_BM_STAT, ...) end,
}
--------------------------------------------------------------------------------

Plugin = {
  Call    = function(...) return yieldcall(F.MPRT_PLUGINCALL,    ...) end,
  Command = function(...) return yieldcall(F.MPRT_PLUGINCOMMAND, ...) end,
  Config  = function(...) return yieldcall(F.MPRT_PLUGINCONFIG,  ...) end,
  Menu    = function(...) return yieldcall(F.MPRT_PLUGINMENU,    ...) end,

--Exist   = function(...) return MacroCallFar(0x80C54, ...) end,
--Load    = function(...) return MacroCallFar(0x80C51, ...) end,
--Unload  = function(...) return MacroCallFar(0x80C53, ...) end,

  SyncCall = function(...)
    local v = Shared.keymacro.CallPlugin(Shared.pack(...), false)
    if type(v)=="userdata" then return Shared.FarMacroCallToLua(v) else return v end
  end
}
--------------------------------------------------------------------------------

local function SetPath(whatpanel,path,filename)
  local function IsAbsolutePath(path) return path:lower()==far.ConvertPath(path):lower() end
  whatpanel=(whatpanel==0 or not whatpanel) and 1 or 0
  local current=panel.GetPanelDirectory(nil,whatpanel) or {}
  current.Name=path
  local result=panel.SetPanelDirectory(nil,whatpanel,IsAbsolutePath(path) and path or current)
  if result and type(filename)=='string' then
    local info=panel.GetPanelInfo(nil,whatpanel)
    if info then
      filename=filename:lower()
      for ii=1,info.ItemsNumber do
        local item=panel.GetPanelItem(nil,whatpanel,ii)
        if not item then break end
        if filename==item.FileName:lower() then
          panel.RedrawPanel(nil,whatpanel,{TopPanelItem=1,CurrentItem=ii})
          break
        end
      end
    end
  end
  return result
end

Panel = {
  FAttr     = function(...) return MacroCallFar(op.MCODE_F_PANEL_FATTR, ...) end,
  FExist    = function(...) return MacroCallFar(op.MCODE_F_PANEL_FEXIST, ...) end,
  Item      = function(a,b,c)
    local r = MacroCallFar(op.MCODE_F_PANELITEM,a,b,c)
    if c==8 and r==0 then r=false end -- 8:Selected; boolean property
    return r
  end,
  Select    = function(...) return MacroCallFar(op.MCODE_F_PANEL_SELECT, ...) end,
  SetPath   = function(...) return MacroCallFar(op.MCODE_F_PANEL_SETPATH, ...) end,
  --SetPath = function(...)
  --  local status,res=pcall(SetPath,...)
  --  if status then return res end
  --  return false
  --end,
  SetPos    = function(...) return MacroCallFar(op.MCODE_F_PANEL_SETPOS, ...) end,
  SetPosIdx = function(...) return MacroCallFar(op.MCODE_F_PANEL_SETPOSIDX, ...) end,
}
--------------------------------------------------------------------------------

Area    = SetProperties({}, prop_Area)
APanel  = SetProperties({}, prop_APanel)
PPanel  = SetProperties({}, prop_PPanel)
CmdLine = SetProperties({}, prop_CmdLine)
Drv     = SetProperties({}, prop_Drv)
Help    = SetProperties({}, prop_Help)
Mouse   = SetProperties({}, prop_Mouse)
Viewer  = SetProperties({}, prop_Viewer)
--------------------------------------------------------------------------------

local EVAL_SUCCESS       =  0
local EVAL_SYNTAXERROR   = 11
local EVAL_BADARGS       = -1
local EVAL_MACRONOTFOUND = -2  -- макрос не найден среди загруженных макросов
local EVAL_MACROCANCELED = -3  -- было выведено меню выбора макроса, и пользователь его отменил
local EVAL_RUNTIMEERROR  = -4  -- макрос был прерван в результате ошибки времени исполнения

local function Eval_GetData (str) -- Получение данных макроса для Eval(S,2).
  local Mode=far.MacroGetArea()
  local UseCommon=false
  str = str:match("^%s*(.-)%s*$")

  local strArea,strKey = str:match("^(.-)/(.+)$")
  if strArea then
    if strArea ~= "." then -- вариант "./Key" не подразумевает поиск в макрообласти Common
      Mode=utils.GetAreaCode(strArea)
      if Mode==nil then return end
    end
  else
    strKey=str
    UseCommon=true
  end

  return Mode, strKey, UseCommon
end

local function Eval_FixReturn (ok, ...)
  return ok and EVAL_SUCCESS or EVAL_RUNTIMEERROR, ...
end

-- @param mode:
--   0=Выполнить макропоследовательность str
--   1=Проверить макропоследовательность str и вернуть код ошибки компиляции
--   2=Выполнить макрос, назначенный на сочетание клавиш str
--   3=Проверить макропоследовательность str и вернуть строку-сообщение с ошибкой компиляции
function mf.eval (str, mode, lang)
  if type(str) ~= "string" then return EVAL_BADARGS end
  mode = mode or 0
  if not (mode==0 or mode==1 or mode==2 or mode==3) then return EVAL_BADARGS end
  lang = lang or "lua"
  if not (lang=="lua" or lang=="moonscript") then return EVAL_BADARGS end

  if mode == 2 then
    local area,key,usecommon = Eval_GetData(str)
    if not area then return EVAL_MACRONOTFOUND end

    local macro = utils.GetMacro(area,key,usecommon,false)
    if not macro then return EVAL_MACRONOTFOUND end
    if not macro.index then return EVAL_MACROCANCELED end

    return Eval_FixReturn(yieldcall("eval", macro, key))
  end

  local ok, env = pcall(getfenv, 3)
  local chunk, params = Shared.loadmacro(lang, str, ok and env)
  if chunk then
    if mode==1 then return EVAL_SUCCESS end
    if mode==3 then return "" end
    if params then chunk(params())
    else chunk()
    end
    return EVAL_SUCCESS
  else
    local msg = params
    if mode==0 then Shared.ErrMsg(msg) end
    return mode==3 and msg or EVAL_SYNTAXERROR
  end
end
--------------------------------------------------------------------------------

mf.serialize = Sett.serialize
mf.deserialize = Sett.deserialize
mf.mdelete = Sett.mdelete
mf.msave = Sett.msave
mf.mload = Sett.mload

function mf.printconsole(...)
  local narg = select("#", ...)
  panel.GetUserScreen()
  for i=1,narg do
    win.WriteConsole(select(i, ...), i<narg and "\t" or "")
  end
  panel.SetUserScreen()
end
--------------------------------------------------------------------------------

_G.band, _G.bnot, _G.bor, _G.bxor, _G.lshift, _G.rshift =
  bit.band, bit.bnot, bit.bor, bit.bxor, bit.lshift, bit.rshift

_G.eval, _G.msgbox, _G.prompt = mf.eval, mf.msgbox, mf.prompt

mf.Keys, mf.exit, mf.print = _G.Keys, _G.exit, _G.print
--------------------------------------------------------------------------------
