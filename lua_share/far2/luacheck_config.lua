-- Luacheck configuration file
-- luacheck: ignore 631 (line is too long)

local luafar = {
  globals = {
    ["export"] = {
      fields = {
        "ClosePlugin", "Compare", "Configure", "DeleteFiles", "ExitFAR", "GetCustomData",
        "GetFiles", "GetFindData", "GetOpenPluginInfo", "GetPluginInfo",
        "GetVirtualFindData", "MakeDirectory", "OnError", "OpenFilePlugin", "OpenPlugin",
        "ProcessDialogEvent", "ProcessEditorEvent", "ProcessEditorInput", "ProcessEvent",
        "ProcessHostFile", "ProcessKey", "ProcessViewerEvent", "PutFiles", "SetDirectory",
        "SetFindList",
      };
    };
  };

  read_globals = {
    ["far"] = {
      fields = {
        "AdvControl", "CmpName", "Colors", "ConvertPath", "CopyToClipboard",
        "CPluginStartupInfo", "CreateFileFilter", "CreateUserControl", "DefDlgProc", "Dialog",
        "DialogFree", "DialogInit", "DialogRun", "Execute", "ExecuteLibrary",
        "Flags", "ForcedLoadPlugin", "GetCurrentDirectory", "GetDirList",
        "GetFileOwner", "GetMsg", "GetNumberOfLinks", "GetPathRoot", "GetPluginDirList",
        "GetReparsePointInfo", "Guids", "InputBox", "InputRecordToKey", "InputRecordToName",
        "Keys", "KeyToName", "LIsAlpha", "LIsAlphanum", "LIsLower", "LIsUpper",
        "LLowerBuf", "LoadPlugin", "LStricmp", "LStrnicmp", "LuafarVersion",
        "LUpperBuf", "MacroCheck", "MacroGetArea", "MacroGetState", "MacroLoadAll",
        "MacroPost", "MacroSaveAll", "MakeMenuItems", "Menu", "Message",
        "MkLink", "MkTemp", "NameToKey", "PasteFromClipboard", "PluginStartupInfo",
        "ProcessName", "RecursiveSearch", "ReloadDefaultScript", "RestoreScreen", "SaveScreen",
        "SendDlgMessage", "Show", "ShowHelp", "Text",
        "Timer", "TruncPathStr", "TruncStr", "UnloadPlugin", "XLat",

        ["Flags"] = {
          fields = {
            "ACTL_COMMIT", "ACTL_EJECTMEDIA", "ACTL_GETARRAYCOLOR", "ACTL_GETCOLOR", "ACTL_GETCONFIRMATIONS",
            "ACTL_GETCURSORPOS", "ACTL_GETDESCSETTINGS", "ACTL_GETDIALOGSETTINGS", "ACTL_GETFARHWND", "ACTL_GETFARRECT",
            "ACTL_GETFARVERSION", "ACTL_GETINTERFACESETTINGS", "ACTL_GETPANELSETTINGS", "ACTL_GETPLUGINMAXREADDATA", "ACTL_GETSHORTWINDOWINFO",
            "ACTL_GETSYSTEMSETTINGS", "ACTL_GETSYSWORDDIV", "ACTL_GETWINDOWCOUNT", "ACTL_GETWINDOWINFO", "ACTL_KEYMACRO",
            "ACTL_POSTKEYSEQUENCE", "ACTL_PROGRESSNOTIFY", "ACTL_QUIT", "ACTL_REDRAWALL", "ACTL_SETARRAYCOLOR",
            "ACTL_SETCURRENTWINDOW", "ACTL_SETCURSORPOS", "ACTL_SETPROGRESSSTATE", "ACTL_SETPROGRESSVALUE", "ACTL_SYNCHRO",
            "ACTL_WAITKEY", "BACKGROUND_BLUE", "BACKGROUND_GREEN", "BACKGROUND_INTENSITY", "BACKGROUND_RED",
            "BS_B_H1V1", "BS_B_H1V2", "BS_B_H2V1", "BS_B_H2V2", "BS_C_H1V1",
            "BS_C_H1V2", "BS_C_H2V1", "BS_C_H2V2", "BS_H1", "BS_H2",
            "BS_LB_H1V1", "BS_LB_H1V2", "BS_LB_H2V1", "BS_LB_H2V2", "BS_L_H1V1",
            "BS_L_H1V2", "BS_L_H2V1", "BS_L_H2V2", "BS_LT_H1V1", "BS_LT_H1V2",
            "BS_LT_H2V1", "BS_LT_H2V2", "BS_RB_H1V1", "BS_RB_H1V2", "BS_RB_H2V1",
            "BS_RB_H2V2", "BS_R_H1V1", "BS_R_H1V2", "BS_R_H2V1", "BS_R_H2V2",
            "BS_RT_H1V1", "BS_RT_H1V2", "BS_RT_H2V1", "BS_RT_H2V2", "BSTATE_3STATE",
            "BSTATE_CHECKED", "BSTATE_TOGGLE", "BSTATE_UNCHECKED", "BS_T_H1V1", "BS_T_H1V2",
            "BS_T_H2V1", "BS_T_H2V2", "BS_V1", "BS_V2", "BS_X_B0",
            "BS_X_B1", "BS_X_B2", "BS_X_DB", "BS_X_DC", "BS_X_DD",
            "BS_X_DE", "BS_X_DF", "BTYPE_COLUMN", "BTYPE_NONE", "BTYPE_STREAM",
            "CAPSLOCK_ON", "CBET_KEY", "CBET_MOUSE", "COL_CLOCK", "COL_COMMANDLINE",
            "COL_COMMANDLINEPREFIX", "COL_COMMANDLINESELECTED", "COL_COMMANDLINEUSERSCREEN", "COL_DIALOGBOX", "COL_DIALOGBOXTITLE",
            "COL_DIALOGBUTTON", "COL_DIALOGCOMBOARROWS", "COL_DIALOGCOMBOARROWSDISABLED", "COL_DIALOGCOMBOARROWSSELECTED", "COL_DIALOGCOMBOBOX",
            "COL_DIALOGCOMBODISABLED", "COL_DIALOGCOMBOGRAY", "COL_DIALOGCOMBOHIGHLIGHT", "COL_DIALOGCOMBOSCROLLBAR", "COL_DIALOGCOMBOSELECTEDGRAYTEXT",
            "COL_DIALOGCOMBOSELECTEDHIGHLIGHT", "COL_DIALOGCOMBOSELECTEDTEXT", "COL_DIALOGCOMBOTEXT", "COL_DIALOGCOMBOTITLE", "COL_DIALOGDEFAULTBUTTON",
            "COL_DIALOGDISABLED", "COL_DIALOGEDIT", "COL_DIALOGEDITDISABLED", "COL_DIALOGEDITSELECTED", "COL_DIALOGEDITUNCHANGED",
            "COL_DIALOGHIGHLIGHTBOXTITLE", "COL_DIALOGHIGHLIGHTBUTTON", "COL_DIALOGHIGHLIGHTDEFAULTBUTTON", "COL_DIALOGHIGHLIGHTSELECTEDBUTTON", "COL_DIALOGHIGHLIGHTSELECTEDDEFAULTBUTTON",
            "COL_DIALOGHIGHLIGHTTEXT", "COL_DIALOGLISTARROWS", "COL_DIALOGLISTARROWSDISABLED", "COL_DIALOGLISTARROWSSELECTED", "COL_DIALOGLISTBOX",
            "COL_DIALOGLISTDISABLED", "COL_DIALOGLISTGRAY", "COL_DIALOGLISTHIGHLIGHT", "COL_DIALOGLISTSCROLLBAR", "COL_DIALOGLISTSELECTEDGRAYTEXT",
            "COL_DIALOGLISTSELECTEDHIGHLIGHT", "COL_DIALOGLISTSELECTEDTEXT", "COL_DIALOGLISTTEXT", "COL_DIALOGLISTTITLE", "COL_DIALOGSELECTEDBUTTON",
            "COL_DIALOGSELECTEDDEFAULTBUTTON", "COL_DIALOGTEXT", "COL_EDITORCLOCK", "COL_EDITORSCROLLBAR", "COL_EDITORSELECTEDTEXT",
            "COL_EDITORSTATUS", "COL_EDITORTEXT", "COL_HELPBOX", "COL_HELPBOXTITLE", "COL_HELPHIGHLIGHTTEXT",
            "COL_HELPSCROLLBAR", "COL_HELPSELECTEDTOPIC", "COL_HELPTEXT", "COL_HELPTOPIC", "COL_HMENUHIGHLIGHT",
            "COL_HMENUSELECTEDHIGHLIGHT", "COL_HMENUSELECTEDTEXT", "COL_HMENUTEXT", "COL_KEYBARBACKGROUND", "COL_KEYBARNUM",
            "COL_KEYBARTEXT", "COL_LASTPALETTECOLOR", "COL_MENUARROWS", "COL_MENUARROWSDISABLED", "COL_MENUARROWSSELECTED",
            "COL_MENUBOX", "COL_MENUDISABLEDTEXT", "COL_MENUGRAYTEXT", "COL_MENUHIGHLIGHT", "COL_MENUSCROLLBAR",
            "COL_MENUSELECTEDGRAYTEXT", "COL_MENUSELECTEDHIGHLIGHT", "COL_MENUSELECTEDTEXT", "COL_MENUTEXT", "COL_MENUTITLE",
            "COL_PANELBOX", "COL_PANELCOLUMNTITLE", "COL_PANELCURSOR", "COL_PANELDRAGTEXT", "COL_PANELHIGHLIGHTTEXT",
            "COL_PANELINFOTEXT", "COL_PANELSCREENSNUMBER", "COL_PANELSCROLLBAR", "COL_PANELSELECTEDCURSOR", "COL_PANELSELECTEDINFO",
            "COL_PANELSELECTEDTEXT", "COL_PANELSELECTEDTITLE", "COL_PANELTEXT", "COL_PANELTITLE", "COL_PANELTOTALINFO",
            "COL_RESERVED0", "COL_VIEWERARROWS", "COL_VIEWERCLOCK", "COL_VIEWERSCROLLBAR", "COL_VIEWERSELECTEDTEXT",
            "COL_VIEWERSTATUS", "COL_VIEWERTEXT", "COL_WARNDIALOGBOX", "COL_WARNDIALOGBOXTITLE", "COL_WARNDIALOGBUTTON",
            "COL_WARNDIALOGCOMBOARROWS", "COL_WARNDIALOGCOMBOARROWSDISABLED", "COL_WARNDIALOGCOMBOARROWSSELECTED", "COL_WARNDIALOGCOMBOBOX", "COL_WARNDIALOGCOMBODISABLED",
            "COL_WARNDIALOGCOMBOGRAY", "COL_WARNDIALOGCOMBOHIGHLIGHT", "COL_WARNDIALOGCOMBOSCROLLBAR", "COL_WARNDIALOGCOMBOSELECTEDGRAYTEXT", "COL_WARNDIALOGCOMBOSELECTEDHIGHLIGHT",
            "COL_WARNDIALOGCOMBOSELECTEDTEXT", "COL_WARNDIALOGCOMBOTEXT", "COL_WARNDIALOGCOMBOTITLE", "COL_WARNDIALOGDEFAULTBUTTON", "COL_WARNDIALOGDISABLED",
            "COL_WARNDIALOGEDIT", "COL_WARNDIALOGEDITDISABLED", "COL_WARNDIALOGEDITSELECTED", "COL_WARNDIALOGEDITUNCHANGED", "COL_WARNDIALOGHIGHLIGHTBOXTITLE",
            "COL_WARNDIALOGHIGHLIGHTBUTTON", "COL_WARNDIALOGHIGHLIGHTDEFAULTBUTTON", "COL_WARNDIALOGHIGHLIGHTSELECTEDBUTTON", "COL_WARNDIALOGHIGHLIGHTSELECTEDDEFAULTBUTTON", "COL_WARNDIALOGHIGHLIGHTTEXT",
            "COL_WARNDIALOGLISTARROWS", "COL_WARNDIALOGLISTARROWSDISABLED", "COL_WARNDIALOGLISTARROWSSELECTED", "COL_WARNDIALOGLISTBOX", "COL_WARNDIALOGLISTDISABLED",
            "COL_WARNDIALOGLISTGRAY", "COL_WARNDIALOGLISTHIGHLIGHT", "COL_WARNDIALOGLISTSCROLLBAR", "COL_WARNDIALOGLISTSELECTEDGRAYTEXT", "COL_WARNDIALOGLISTSELECTEDHIGHLIGHT",
            "COL_WARNDIALOGLISTSELECTEDTEXT", "COL_WARNDIALOGLISTTEXT", "COL_WARNDIALOGLISTTITLE", "COL_WARNDIALOGSELECTEDBUTTON", "COL_WARNDIALOGSELECTEDDEFAULTBUTTON",
            "COL_WARNDIALOGTEXT", "CP_AUTODETECT", "CPM_FULL", "CPM_NATIVE", "CPM_REAL",
            "CTRL_BREAK_EVENT", "CTRL_C_EVENT", "CTRL_CLOSE_EVENT", "CTRL_LOGOFF_EVENT", "CTRL_SHUTDOWN_EVENT",
            "DE_DEFDLGPROCINIT", "DE_DLGPROCEND", "DE_DLGPROCINIT", "DI_BUTTON", "DI_CHECKBOX",
            "DI_COMBOBOX", "DI_DOUBLEBOX", "DI_EDIT", "DIF_3STATE", "DIF_BOXCOLOR",
            "DIF_BTNNOCLOSE", "DIF_CENTERGROUP", "DIF_CENTERTEXT", "DIF_COLORMASK", "DIF_DISABLE",
            "DIF_DROPDOWNLIST", "DIF_EDITEXPAND", "DIF_EDITOR", "DIF_EDITPATH", "DIF_GROUP",
            "DIF_HIDDEN", "DIF_HISTORY", "DI_FIXEDIT", "DIF_LEFTTEXT", "DIF_LISTAUTOHIGHLIGHT",
            "DIF_LISTNOAMPERSAND", "DIF_LISTNOBOX", "DIF_LISTNOCLOSE", "DIF_LISTWRAPMODE", "DIF_MANUALADDHISTORY",
            "DIF_MASKEDIT", "DIF_MOVESELECT", "DIF_NOAUTOCOMPLETE", "DIF_NOBRACKETS", "DIF_NOFOCUS",
            "DIF_NONE", "DIF_READONLY", "DIF_SELECTONENTRY", "DIF_SEPARATOR", "DIF_SEPARATOR2",
            "DIF_SETCOLOR", "DIF_SETSHIELD", "DIF_SHOWAMPERSAND", "DIF_USELASTHISTORY", "DI_LISTBOX",
            "DI_PSWEDIT", "DI_RADIOBUTTON", "DI_SINGLEBOX", "DI_TEXT", "DI_USERCONTROL",
            "DI_VTEXT", "DM_ADDHISTORY", "DM_CLOSE", "DM_EDITUNCHANGEDFLAG", "DM_ENABLE",
            "DM_ENABLEREDRAW", "DM_FIRST", "DM_GETCHECK", "DM_GETCOLOR", "DM_GETCOMBOBOXEVENT",
            "DM_GETCONSTTEXTPTR", "DM_GETCURSORPOS", "DM_GETCURSORSIZE", "DM_GETDIALOGINFO", "DM_GETDLGDATA",
            "DM_GETDLGITEM", "DM_GETDLGITEMSHORT", "DM_GETDLGRECT", "DM_GETDROPDOWNOPENED", "DM_GETEDITPOSITION",
            "DM_GETFOCUS", "DM_GETITEMDATA", "DM_GETITEMPOSITION", "DM_GETSELECTION", "DM_GETTEXT",
            "DM_GETTEXTLENGTH", "DM_GETTEXTPTR", "DM_KEY", "DM_LISTADD", "DM_LISTADDSTR",
            "DM_LISTDELETE", "DM_LISTFINDSTRING", "DM_LISTGETCURPOS", "DM_LISTGETDATA", "DM_LISTGETDATASIZE",
            "DM_LISTGETITEM", "DM_LISTGETTITLES", "DM_LISTINFO", "DM_LISTINSERT", "DM_LISTSET",
            "DM_LISTSETCURPOS", "DM_LISTSETDATA", "DM_LISTSETMOUSEREACTION", "DM_LISTSETTITLES", "DM_LISTSORT",
            "DM_LISTUPDATE", "DM_MOVEDIALOG", "DM_REDRAW", "DM_RESIZEDIALOG", "DM_SET3STATE",
            "DM_SETCHECK", "DM_SETCOLOR", "DM_SETCOMBOBOXEVENT", "DM_SETCURSORPOS", "DM_SETCURSORSIZE",
            "DM_SETDLGDATA", "DM_SETDLGITEM", "DM_SETDLGITEMSHORT", "DM_SETDROPDOWNOPENED", "DM_SETEDITPOSITION",
            "DM_SETFOCUS", "DM_SETHISTORY", "DM_SETITEMDATA", "DM_SETITEMPOSITION", "DM_SETMAXTEXTLENGTH",
            "DM_SETMOUSEEVENTNOTIFY", "DM_SETREDRAW", "DM_SETSELECTION", "DM_SETTEXT", "DM_SETTEXTLENGTH",
            "DM_SETTEXTPTR", "DM_SHOWDIALOG", "DM_SHOWITEM", "DM_USER", "DN_BTNCLICK",
            "DN_CLOSE", "DN_CTLCOLORDIALOG", "DN_CTLCOLORDLGITEM", "DN_CTLCOLORDLGLIST", "DN_DRAGGED",
            "DN_DRAWDIALOG", "DN_DRAWDIALOGDONE", "DN_DRAWDLGITEM", "DN_EDITCHANGE", "DN_ENTERIDLE",
            "DN_FIRST", "DN_GETDIALOGINFO", "DN_GOTFOCUS", "DN_HELP", "DN_HOTKEY",
            "DN_INITDIALOG", "DN_KEY", "DN_KILLFOCUS", "DN_LISTCHANGE", "DN_LISTHOTKEY",
            "DN_MOUSECLICK", "DN_MOUSEEVENT", "DN_RESIZECONSOLE", "DOUBLE_CLICK", "ECF_TAB1",
            "ECSTATE_LOCKED", "ECSTATE_MODIFIED", "ECSTATE_SAVED", "ECTL_ADDCOLOR", "ECTL_ADDSTACKBOOKMARK",
            "ECTL_CLEARSTACKBOOKMARKS", "ECTL_DELETEBLOCK", "ECTL_DELETECHAR", "ECTL_DELETESTACKBOOKMARK", "ECTL_DELETESTRING",
            "ECTL_EXPANDTABS", "ECTL_GETBOOKMARKS", "ECTL_GETCOLOR", "ECTL_GETFILENAME", "ECTL_GETINFO",
            "ECTL_GETSTACKBOOKMARKS", "ECTL_GETSTRING", "ECTL_INSERTSTRING", "ECTL_INSERTTEXT", "ECTL_NEXTSTACKBOOKMARK",
            "ECTL_PREVSTACKBOOKMARK", "ECTL_PROCESSINPUT", "ECTL_PROCESSKEY", "ECTL_QUIT", "ECTL_READINPUT",
            "ECTL_REALTOTAB", "ECTL_REDRAW", "ECTL_SAVEFILE", "ECTL_SELECT", "ECTL_SETKEYBAR",
            "ECTL_SETPARAM", "ECTL_SETPOSITION", "ECTL_SETSTRING", "ECTL_SETTITLE", "ECTL_TABTOREAL",
            "ECTL_TURNOFFMARKINGBLOCK", "ECTL_UNDOREDO", "EEC_LOADING_INTERRUPTED", "EE_CLOSE", "EEC_MODIFIED",
            "EEC_NOT_MODIFIED", "EEC_OPEN_ERROR", "EE_GOTFOCUS", "EE_KILLFOCUS", "EE_READ",
            "EE_REDRAW", "EEREDRAW_ALL", "EEREDRAW_CHANGE", "EEREDRAW_LINE", "EE_SAVE",
            "EF_CREATENEW", "EF_DELETEONCLOSE", "EF_DELETEONLYFILEONCLOSE", "EF_DISABLEHISTORY", "EF_ENABLE_F6",
            "EF_HIDEOUT", "EF_IMMEDIATERETURN", "EF_NOCMDPRINT", "EF_NONMODAL", "EF_NOTIFY",
            "EF_NOWAIT", "EF_SUDO", "EJECT_LOAD_MEDIA", "EJECT_NO_MESSAGE", "ENABLE_ECHO_INPUT",
            "ENABLE_LINE_INPUT", "ENABLE_MOUSE_INPUT", "ENABLE_PROCESSED_INPUT", "ENABLE_PROCESSED_OUTPUT", "ENABLE_WINDOW_INPUT",
            "ENABLE_WRAP_AT_EOL_OUTPUT", "ENHANCED_KEY", "EOPT_AUTODETECTCODEPAGE", "EOPT_AUTOINDENT", "EOPT_BOM",
            "EOPT_CURSORBEYONDEOL", "EOPT_DELREMOVESBLOCKS", "EOPT_EXPANDALLTABS", "EOPT_EXPANDONLYNEWTABS", "EOPT_PERSISTENTBLOCKS",
            "EOPT_SAVEFILEPOSITION", "EOPT_SHOWWHITESPACE", "ESPT_AUTOINDENT", "ESPT_CHARCODEBASE", "ESPT_CODEPAGE",
            "ESPT_CURSORBEYONDEOL", "ESPT_EXPANDTABS", "ESPT_GETWORDDIV", "ESPT_LOCKMODE", "ESPT_SAVEFILEPOSITION",
            "ESPT_SETBOM", "ESPT_SETWORDDIV", "ESPT_SHOWWHITESPACE", "ESPT_TABSIZE", "EUR_BEGIN",
            "EUR_END", "EUR_REDO", "EUR_UNDO", "EXPAND_ALLTABS", "EXPAND_NEWTABS",
            "EXPAND_NOTABS", "FARMACRO_KEY_EVENT", "FARMANAGERVERSION", "FARMANAGERVERSION_MAJOR", "FARMANAGERVERSION_MINOR",
            "FCLR_REDRAW", "FCS_CLEARHISTORYLIST", "FCS_COPYOVERWRITE", "FCS_DELETE", "FCS_DELETENONEMPTYFOLDERS",
            "FCS_DISCONNECTNETWORKDRIVE", "FCS_DRAGANDDROP", "FCS_EXIT", "FCS_INTERRUPTOPERATION", "FCS_MOVEOVERWRITE",
            "FCS_OVERWRITEDELETEROFILES", "FCS_RELOADEDITEDFILE", "FCTL_BEGINSELECTION", "FCTL_CHECKPANELSEXIST", "FCTL_CLEARSELECTION",
            "FCTL_CLOSEPLUGIN", "FCTL_ENDSELECTION", "FCTL_GETCMDLINE", "FCTL_GETCMDLINEPOS", "FCTL_GETCMDLINESELECTEDTEXT",
            "FCTL_GETCMDLINESELECTION", "FCTL_GETCOLUMNTYPES", "FCTL_GETCOLUMNWIDTHS", "FCTL_GETCURRENTPANELITEM", "FCTL_GETPANELDIR",
            "FCTL_GETPANELFORMAT", "FCTL_GETPANELHOSTFILE", "FCTL_GETPANELINFO", "FCTL_GETPANELITEM", "FCTL_GETPANELPLUGINHANDLE",
            "FCTL_GETSELECTEDPANELITEM", "FCTL_GETUSERSCREEN", "FCTL_INSERTCMDLINE", "FCTL_ISACTIVEPANEL", "FCTL_REDRAWPANEL",
            "FCTL_SETCASESENSITIVESORT", "FCTL_SETCMDLINE", "FCTL_SETCMDLINEPOS", "FCTL_SETCMDLINESELECTION", "FCTL_SETDIRECTORIESFIRST",
            "FCTL_SETNUMERICSORT", "FCTL_SETPANELDIR", "FCTL_SETPANELLOCATION", "FCTL_SETSELECTION", "FCTL_SETSORTMODE",
            "FCTL_SETSORTORDER", "FCTL_SETUSERSCREEN", "FCTL_SETVIEWMODE", "FCTL_UPDATEPANEL", "FDIS_AUTOCOMPLETEININPUTLINES",
            "FDIS_BSDELETEUNCHANGEDTEXT", "FDIS_DELREMOVESBLOCKS", "FDIS_HISTORYINDIALOGEDITCONTROLS", "FDIS_MOUSECLICKOUTSIDECLOSESDIALOG", "FDIS_PERSISTENTBLOCKSINEDITCONTROLS",
            "FDLG_KEEPCONSOLETITLE", "FDLG_NODRAWPANEL", "FDLG_NODRAWSHADOW", "FDLG_REGULARIDLE", "FDLG_SMALLDIALOG",
            "FDLG_WARNING", "FDS_SETHIDDEN", "FDS_UPDATEALWAYS", "FDS_UPDATEIFDISPLAYED", "FDS_UPDATEREADONLY",
            "FE_BREAK", "FE_CHANGEVIEWMODE", "FE_CLOSE", "FE_COMMAND", "FE_GOTFOCUS",
            "FE_IDLE", "FE_KILLFOCUS", "FE_REDRAW", "FFCTL_CREATEFILEFILTER", "FFCTL_FREEFILEFILTER",
            "FFCTL_ISFILEINFILTER", "FFCTL_OPENFILTERSMENU", "FFCTL_STARTINGTOFILTER", "FFT_COPY", "FFT_CUSTOM",
            "FFT_FINDFILE", "FFT_PANEL", "FFT_SELECT", "FHELP_CUSTOMFILE", "FHELP_CUSTOMPATH",
            "FHELP_FARHELP", "FHELP_NOSHOWERROR", "FHELP_SELFHELP", "FHELP_USECONTENTS", "FIB_BUTTONS",
            "FIB_EDITPATH", "FIB_ENABLEEMPTY", "FIB_EXPANDENV", "FIB_NOAMPERSAND", "FIB_NOUSELASTHISTORY",
            "FIB_PASSWORD", "FIS_ALWAYSSHOWMENUBAR", "FIS_CLOCKINPANELS", "FIS_CLOCKINVIEWERANDEDITOR", "FIS_MOUSE",
            "FIS_SHOWCOPYINGTIMEINFO", "FIS_SHOWKEYBAR", "FIS_SHOWTOTALCOPYPROGRESSINDICATOR", "FIS_SHOWTOTALDELPROGRESSINDICATOR", "FIS_USECTRLPGUPTOCHANGEDRIVE",
            "FLINK_DONOTUPDATEPANEL", "FLINK_HARDLINK", "FLINK_JUNCTION", "FLINK_SHOWERRMSG", "FLINK_SYMLINK",
            "FLINK_SYMLINKDIR", "FLINK_SYMLINKFILE", "FLINK_VOLMOUNT", "FMENU_AUTOHIGHLIGHT", "FMENU_CHANGECONSOLETITLE",
            "FMENU_REVERSEAUTOHIGHLIGHT", "FMENU_SHOWAMPERSAND", "FMENU_USEEXT", "FMENU_WRAPMODE", "FMSG_ALLINONE",
            "FMSG_ERRORTYPE", "FMSG_KEEPBACKGROUND", "FMSG_LEFTALIGN", "FMSG_MB_ABORTRETRYIGNORE", "FMSG_MB_OK",
            "FMSG_MB_OKCANCEL", "FMSG_MB_RETRYCANCEL", "FMSG_MB_YESNO", "FMSG_MB_YESNOCANCEL", "FMSG_WARNING",
            "FOCUS_EVENT", "FOREGROUND_BLUE", "FOREGROUND_GREEN", "FOREGROUND_INTENSITY", "FOREGROUND_RED",
            "FPS_ALLOWREVERSESORTMODES", "FPS_AUTOCHANGEFOLDER", "FPS_HIGHLIGHTFILES", "FPS_SELECTFOLDERS", "FPS_SHOWBACKGROUNDSCREENSNUMBER",
            "FPS_SHOWCOLUMNTITLES", "FPS_SHOWFILESTOTALINFORMATION", "FPS_SHOWFREESIZE", "FPS_SHOWHIDDENANDSYSTEMFILES", "FPS_SHOWSCROLLBAR",
            "FPS_SHOWSORTMODELETTER", "FPS_SHOWSTATUSLINE", "FROM_LEFT_1ST_BUTTON_PRESSED", "FROM_LEFT_2ND_BUTTON_PRESSED", "FROM_LEFT_3RD_BUTTON_PRESSED",
            "FROM_LEFT_4TH_BUTTON_PRESSED", "FRS_RECUR", "FRS_RETUPDIR", "FRS_SCANSYMLINK", "FSS_AUTOSAVESETUP",
            "FSS_DELETETORECYCLEBIN", "FSS_RESERVED", "FSS_SAVECOMMANDSHISTORY", "FSS_SAVEFOLDERSHISTORY", "FSS_SAVEVIEWANDEDITHISTORY",
            "FSS_SCANSYMLINK", "FSS_USEWINDOWSREGISTEREDTYPES", "FSS_WRITETHROUGH", "KEY_ADD", "KEY_ALT",
            "KEY_ALT0", "KEY_ALT1", "KEY_ALT2", "KEY_ALT3", "KEY_ALT4",
            "KEY_ALT5", "KEY_ALT6", "KEY_ALT7", "KEY_ALT8", "KEY_ALT9",
            "KEY_ALTA", "KEY_ALTADD", "KEY_ALTAPPS", "KEY_ALTB", "KEY_ALT_BASE",
            "KEY_ALTBS", "KEY_ALTC", "KEY_ALTCOMMA", "KEY_ALTD", "KEY_ALTDECIMAL",
            "KEY_ALTDEL", "KEY_ALTDOT", "KEY_ALTDOWN", "KEY_ALTE", "KEY_ALTEND",
            "KEY_ALTF", "KEY_ALTF1", "KEY_ALTF10", "KEY_ALTF11", "KEY_ALTF12",
            "KEY_ALTF2", "KEY_ALTF3", "KEY_ALTF4", "KEY_ALTF5", "KEY_ALTF6",
            "KEY_ALTF7", "KEY_ALTF8", "KEY_ALTF9", "KEY_ALTG", "KEY_ALTH",
            "KEY_ALTHOME", "KEY_ALTI", "KEY_ALTINS", "KEY_ALTJ", "KEY_ALTK",
            "KEY_ALTL", "KEY_ALTLEFT", "KEY_ALTM", "KEY_ALTMULTIPLY", "KEY_ALTN",
            "KEY_ALTNUMDEL", "KEY_ALTO", "KEY_ALTP", "KEY_ALTPGDN", "KEY_ALTPGUP",
            "KEY_ALTQ", "KEY_ALTR", "KEY_ALTRIGHT", "KEY_ALTS", "KEY_ALTSHIFT",
            "KEY_ALTSHIFT0", "KEY_ALTSHIFT1", "KEY_ALTSHIFT2", "KEY_ALTSHIFT3", "KEY_ALTSHIFT4",
            "KEY_ALTSHIFT5", "KEY_ALTSHIFT6", "KEY_ALTSHIFT7", "KEY_ALTSHIFT8", "KEY_ALTSHIFT9",
            "KEY_ALTSHIFTA", "KEY_ALTSHIFTAPPS", "KEY_ALTSHIFTB", "KEY_ALTSHIFTBACKBRACKET", "KEY_ALTSHIFT_BASE",
            "KEY_ALTSHIFTBRACKET", "KEY_ALTSHIFTC", "KEY_ALTSHIFTD", "KEY_ALTSHIFTDECIMAL", "KEY_ALTSHIFTDEL",
            "KEY_ALTSHIFTDOWN", "KEY_ALTSHIFTE", "KEY_ALTSHIFTEND", "KEY_ALTSHIFTENTER", "KEY_ALTSHIFTF",
            "KEY_ALTSHIFTF1", "KEY_ALTSHIFTF10", "KEY_ALTSHIFTF11", "KEY_ALTSHIFTF12", "KEY_ALTSHIFTF2",
            "KEY_ALTSHIFTF3", "KEY_ALTSHIFTF4", "KEY_ALTSHIFTF5", "KEY_ALTSHIFTF6", "KEY_ALTSHIFTF7",
            "KEY_ALTSHIFTF8", "KEY_ALTSHIFTF9", "KEY_ALTSHIFTG", "KEY_ALTSHIFTH", "KEY_ALTSHIFTHOME",
            "KEY_ALTSHIFTI", "KEY_ALTSHIFTINS", "KEY_ALTSHIFTJ", "KEY_ALTSHIFTK", "KEY_ALTSHIFTL",
            "KEY_ALTSHIFTLEFT", "KEY_ALTSHIFTM", "KEY_ALTSHIFTN", "KEY_ALTSHIFTNUMDEL", "KEY_ALTSHIFTNUMENTER",
            "KEY_ALTSHIFTNUMPAD0", "KEY_ALTSHIFTNUMPAD1", "KEY_ALTSHIFTNUMPAD2", "KEY_ALTSHIFTNUMPAD3", "KEY_ALTSHIFTNUMPAD4",
            "KEY_ALTSHIFTNUMPAD5", "KEY_ALTSHIFTNUMPAD6", "KEY_ALTSHIFTNUMPAD7", "KEY_ALTSHIFTNUMPAD8", "KEY_ALTSHIFTNUMPAD9",
            "KEY_ALTSHIFTO", "KEY_ALTSHIFTP", "KEY_ALTSHIFTPGDN", "KEY_ALTSHIFTPGUP", "KEY_ALTSHIFTQ",
            "KEY_ALTSHIFTR", "KEY_ALTSHIFTRIGHT", "KEY_ALTSHIFTS", "KEY_ALTSHIFTT", "KEY_ALTSHIFTU",
            "KEY_ALTSHIFTUP", "KEY_ALTSHIFTV", "KEY_ALTSHIFTW", "KEY_ALTSHIFTX", "KEY_ALTSHIFTY",
            "KEY_ALTSHIFTZ", "KEY_ALTSUBTRACT", "KEY_ALTT", "KEY_ALTU", "KEY_ALTUP",
            "KEY_ALTV", "KEY_ALTW", "KEY_ALTX", "KEY_ALTY", "KEY_ALTZ",
            "KEY_APPS", "KEY_BACKBRACKET", "KEY_BACKSLASH", "KEY_BRACKET", "KEY_BREAK",
            "KEY_BS", "KEY_CAPSLOCK", "KEY_CLEAR", "KEY_COLON", "KEY_COMMA",
            "KEY_CONSOLE_BUFFER_RESIZE", "KEY_CTRL", "KEY_CTRL0", "KEY_CTRL1", "KEY_CTRL2",
            "KEY_CTRL3", "KEY_CTRL4", "KEY_CTRL5", "KEY_CTRL6", "KEY_CTRL7",
            "KEY_CTRL8", "KEY_CTRL9", "KEY_CTRLA", "KEY_CTRLADD", "KEY_CTRLALT",
            "KEY_CTRLALT0", "KEY_CTRLALT1", "KEY_CTRLALT2", "KEY_CTRLALT3", "KEY_CTRLALT4",
            "KEY_CTRLALT5", "KEY_CTRLALT6", "KEY_CTRLALT7", "KEY_CTRLALT8", "KEY_CTRLALT9",
            "KEY_CTRLALTA", "KEY_CTRLALTAPPS", "KEY_CTRLALTB", "KEY_CTRLALTBACKBRACKET", "KEY_CTRLALTBRACKET",
            "KEY_CTRLALTC", "KEY_CTRLALTCLEAR", "KEY_CTRLALTD", "KEY_CTRLALTDOWN", "KEY_CTRLALTE",
            "KEY_CTRLALTEND", "KEY_CTRLALTENTER", "KEY_CTRLALTF", "KEY_CTRLALTF1", "KEY_CTRLALTF10",
            "KEY_CTRLALTF11", "KEY_CTRLALTF12", "KEY_CTRLALTF2", "KEY_CTRLALTF3", "KEY_CTRLALTF4",
            "KEY_CTRLALTF5", "KEY_CTRLALTF6", "KEY_CTRLALTF7", "KEY_CTRLALTF8", "KEY_CTRLALTF9",
            "KEY_CTRLALTG", "KEY_CTRLALTH", "KEY_CTRLALTHOME", "KEY_CTRLALTI", "KEY_CTRLALTINS",
            "KEY_CTRLALTJ", "KEY_CTRLALTK", "KEY_CTRLALTL", "KEY_CTRLALTLEFT", "KEY_CTRLALTM",
            "KEY_CTRLALTN", "KEY_CTRLALTNUMENTER", "KEY_CTRLALTNUMPAD0", "KEY_CTRLALTNUMPAD1", "KEY_CTRLALTNUMPAD2",
            "KEY_CTRLALTNUMPAD3", "KEY_CTRLALTNUMPAD4", "KEY_CTRLALTNUMPAD5", "KEY_CTRLALTNUMPAD6", "KEY_CTRLALTNUMPAD7",
            "KEY_CTRLALTNUMPAD8", "KEY_CTRLALTNUMPAD9", "KEY_CTRLALTO", "KEY_CTRLALTP", "KEY_CTRLALTPGDN",
            "KEY_CTRLALTPGUP", "KEY_CTRLALTQ", "KEY_CTRLALTR", "KEY_CTRLALTRIGHT", "KEY_CTRLALTS",
            "KEY_CTRLALTSHIFTPRESS", "KEY_CTRLALTSHIFTRELEASE", "KEY_CTRLALTT", "KEY_CTRLALTU", "KEY_CTRLALTUP",
            "KEY_CTRLALTV", "KEY_CTRLALTW", "KEY_CTRLALTX", "KEY_CTRLALTY", "KEY_CTRLALTZ",
            "KEY_CTRLAPPS", "KEY_CTRLB", "KEY_CTRLBACKBRACKET", "KEY_CTRLBACKSLASH", "KEY_CTRLBRACKET",
            "KEY_CTRLBS", "KEY_CTRLC", "KEY_CTRLCLEAR", "KEY_CTRLCOMMA", "KEY_CTRLD",
            "KEY_CTRLDECIMAL", "KEY_CTRLDEL", "KEY_CTRLDOT", "KEY_CTRLDOWN", "KEY_CTRLE",
            "KEY_CTRLEND", "KEY_CTRLENTER", "KEY_CTRLF", "KEY_CTRLF1", "KEY_CTRLF10",
            "KEY_CTRLF11", "KEY_CTRLF12", "KEY_CTRLF2", "KEY_CTRLF3", "KEY_CTRLF4",
            "KEY_CTRLF5", "KEY_CTRLF6", "KEY_CTRLF7", "KEY_CTRLF8", "KEY_CTRLF9",
            "KEY_CTRLG", "KEY_CTRLH", "KEY_CTRLHOME", "KEY_CTRLI", "KEY_CTRLINS",
            "KEY_CTRLJ", "KEY_CTRLK", "KEY_CTRLL", "KEY_CTRLLEFT", "KEY_CTRLM",
            "KEY_CTRLMASK", "KEY_CTRLMULTIPLY", "KEY_CTRLN", "KEY_CTRLNUMDEL", "KEY_CTRLNUMENTER",
            "KEY_CTRLNUMPAD0", "KEY_CTRLNUMPAD1", "KEY_CTRLNUMPAD2", "KEY_CTRLNUMPAD3", "KEY_CTRLNUMPAD4",
            "KEY_CTRLNUMPAD5", "KEY_CTRLNUMPAD6", "KEY_CTRLNUMPAD7", "KEY_CTRLNUMPAD8", "KEY_CTRLNUMPAD9",
            "KEY_CTRLO", "KEY_CTRLP", "KEY_CTRLPGDN", "KEY_CTRLPGUP", "KEY_CTRLQ",
            "KEY_CTRLQUOTE", "KEY_CTRLR", "KEY_CTRLRIGHT", "KEY_CTRLS", "KEY_CTRLSHIFT",
            "KEY_CTRLSHIFT0", "KEY_CTRLSHIFT1", "KEY_CTRLSHIFT2", "KEY_CTRLSHIFT3", "KEY_CTRLSHIFT4",
            "KEY_CTRLSHIFT5", "KEY_CTRLSHIFT6", "KEY_CTRLSHIFT7", "KEY_CTRLSHIFT8", "KEY_CTRLSHIFT9",
            "KEY_CTRLSHIFTA", "KEY_CTRLSHIFTADD", "KEY_CTRLSHIFTAPPS", "KEY_CTRLSHIFTB", "KEY_CTRLSHIFTBACKBRACKET",
            "KEY_CTRLSHIFTBACKSLASH", "KEY_CTRLSHIFTBRACKET", "KEY_CTRLSHIFTBS", "KEY_CTRLSHIFTC", "KEY_CTRLSHIFTCLEAR",
            "KEY_CTRLSHIFTD", "KEY_CTRLSHIFTDECIMAL", "KEY_CTRLSHIFTDEL", "KEY_CTRLSHIFTDOT", "KEY_CTRLSHIFTDOWN",
            "KEY_CTRLSHIFTE", "KEY_CTRLSHIFTEND", "KEY_CTRLSHIFTENTER", "KEY_CTRLSHIFTF", "KEY_CTRLSHIFTF1",
            "KEY_CTRLSHIFTF10", "KEY_CTRLSHIFTF11", "KEY_CTRLSHIFTF12", "KEY_CTRLSHIFTF2", "KEY_CTRLSHIFTF3",
            "KEY_CTRLSHIFTF4", "KEY_CTRLSHIFTF5", "KEY_CTRLSHIFTF6", "KEY_CTRLSHIFTF7", "KEY_CTRLSHIFTF8",
            "KEY_CTRLSHIFTF9", "KEY_CTRLSHIFTG", "KEY_CTRLSHIFTH", "KEY_CTRLSHIFTHOME", "KEY_CTRLSHIFTI",
            "KEY_CTRLSHIFTINS", "KEY_CTRLSHIFTJ", "KEY_CTRLSHIFTK", "KEY_CTRLSHIFTL", "KEY_CTRLSHIFTLEFT",
            "KEY_CTRLSHIFTM", "KEY_CTRLSHIFTN", "KEY_CTRLSHIFTNUMDEL", "KEY_CTRLSHIFTNUMENTER", "KEY_CTRLSHIFTNUMPAD0",
            "KEY_CTRLSHIFTNUMPAD1", "KEY_CTRLSHIFTNUMPAD2", "KEY_CTRLSHIFTNUMPAD3", "KEY_CTRLSHIFTNUMPAD4", "KEY_CTRLSHIFTNUMPAD5",
            "KEY_CTRLSHIFTNUMPAD6", "KEY_CTRLSHIFTNUMPAD7", "KEY_CTRLSHIFTNUMPAD8", "KEY_CTRLSHIFTNUMPAD9", "KEY_CTRLSHIFTO",
            "KEY_CTRLSHIFTP", "KEY_CTRLSHIFTPGDN", "KEY_CTRLSHIFTPGUP", "KEY_CTRLSHIFTQ", "KEY_CTRLSHIFTR",
            "KEY_CTRLSHIFTRIGHT", "KEY_CTRLSHIFTS", "KEY_CTRLSHIFTSLASH", "KEY_CTRLSHIFTSPACE", "KEY_CTRLSHIFTSUBTRACT",
            "KEY_CTRLSHIFTT", "KEY_CTRLSHIFTTAB", "KEY_CTRLSHIFTU", "KEY_CTRLSHIFTUP", "KEY_CTRLSHIFTV",
            "KEY_CTRLSHIFTW", "KEY_CTRLSHIFTX", "KEY_CTRLSHIFTY", "KEY_CTRLSHIFTZ", "KEY_CTRLSLASH",
            "KEY_CTRLSPACE", "KEY_CTRLSUBTRACT", "KEY_CTRLT", "KEY_CTRLTAB", "KEY_CTRLU",
            "KEY_CTRLUP", "KEY_CTRLV", "KEY_CTRLW", "KEY_CTRLX", "KEY_CTRLY",
            "KEY_CTRLZ", "KEY_DECIMAL", "KEY_DEL", "KEY_DIVIDE", "KEY_DOT",
            "KEY_DOWN", "KEY_END", "KEY_END_FKEY", "KEY_END_SKEY", "KEY_ENTER",
            "KEY_ESC", "KEY_EVENT", "KEY_F1", "KEY_F10", "KEY_F11",
            "KEY_F12", "KEY_F13", "KEY_F14", "KEY_F15", "KEY_F16",
            "KEY_F17", "KEY_F18", "KEY_F19", "KEY_F2", "KEY_F20",
            "KEY_F21", "KEY_F22", "KEY_F23", "KEY_F24", "KEY_F3",
            "KEY_F4", "KEY_F5", "KEY_F6", "KEY_F7", "KEY_F8",
            "KEY_F9", "KEY_FKEY_BEGIN", "KEY_GOTFOCUS", "KEY_HOME", "KEY_IDLE",
            "KEY_INS", "KEY_KILLFOCUS", "KEY_LAST_BASE", "KEY_LEFT", "KEY_LWIN",
            "KEY_MASKF", "KEY_MSLCLICK", "KEY_MSM1CLICK", "KEY_MSM2CLICK", "KEY_MSM3CLICK",
            "KEY_MSRCLICK", "KEY_MSWHEEL_DOWN", "KEY_MSWHEEL_LEFT", "KEY_MSWHEEL_RIGHT", "KEY_MSWHEEL_UP",
            "KEY_MULTIPLY", "KEY_NONE", "KEY_NUMDEL", "KEY_NUMENTER", "KEY_NUMLOCK",
            "KEY_NUMPAD0", "KEY_NUMPAD1", "KEY_NUMPAD2", "KEY_NUMPAD3", "KEY_NUMPAD4",
            "KEY_NUMPAD5", "KEY_NUMPAD6", "KEY_NUMPAD7", "KEY_NUMPAD8", "KEY_NUMPAD9",
            "KEY_PAUSE", "KEY_PGDN", "KEY_PGUP", "KEY_PRNTSCRN", "KEY_QUOTE",
            "KEY_RALT", "KEY_RCTRL", "KEY_RCTRL0", "KEY_RCTRL1", "KEY_RCTRL2",
            "KEY_RCTRL3", "KEY_RCTRL4", "KEY_RCTRL5", "KEY_RCTRL6", "KEY_RCTRL7",
            "KEY_RCTRL8", "KEY_RCTRL9", "KEY_RCTRLSHIFT0", "KEY_RCTRLSHIFT1", "KEY_RCTRLSHIFT2",
            "KEY_RCTRLSHIFT3", "KEY_RCTRLSHIFT4", "KEY_RCTRLSHIFT5", "KEY_RCTRLSHIFT6", "KEY_RCTRLSHIFT7",
            "KEY_RCTRLSHIFT8", "KEY_RCTRLSHIFT9", "KEY_RIGHT", "KEY_RWIN", "KEY_SCROLLLOCK",
            "KEY_SEMICOLON", "KEY_SHIFT", "KEY_SHIFTADD", "KEY_SHIFTAPPS", "KEY_SHIFTBS",
            "KEY_SHIFTDECIMAL", "KEY_SHIFTDEL", "KEY_SHIFTDOWN", "KEY_SHIFTEND", "KEY_SHIFTENTER",
            "KEY_SHIFTF1", "KEY_SHIFTF10", "KEY_SHIFTF11", "KEY_SHIFTF12", "KEY_SHIFTF2",
            "KEY_SHIFTF3", "KEY_SHIFTF4", "KEY_SHIFTF5", "KEY_SHIFTF6", "KEY_SHIFTF7",
            "KEY_SHIFTF8", "KEY_SHIFTF9", "KEY_SHIFTHOME", "KEY_SHIFTINS", "KEY_SHIFTLEFT",
            "KEY_SHIFTNUMDEL", "KEY_SHIFTNUMENTER", "KEY_SHIFTNUMPAD0", "KEY_SHIFTNUMPAD1", "KEY_SHIFTNUMPAD2",
            "KEY_SHIFTNUMPAD3", "KEY_SHIFTNUMPAD4", "KEY_SHIFTNUMPAD5", "KEY_SHIFTNUMPAD6", "KEY_SHIFTNUMPAD7",
            "KEY_SHIFTNUMPAD8", "KEY_SHIFTNUMPAD9", "KEY_SHIFTPGDN", "KEY_SHIFTPGUP", "KEY_SHIFTRIGHT",
            "KEY_SHIFTSPACE", "KEY_SHIFTSUBTRACT", "KEY_SHIFTTAB", "KEY_SHIFTUP", "KEY_SLASH",
            "KEY_SPACE", "KEY_STANDBY", "KEY_SUBTRACT", "KEY_TAB", "KEY_UP",
            "KEY_VK_0xFF_BEGIN", "KEY_VK_0xFF_END", "KSFLAGS_DISABLEOUTPUT", "KSFLAGS_NOSENDKEYSTOPLUGINS", "KSFLAGS_SILENTCHECK",
            "LEFT_ALT_PRESSED", "LEFT_CTRL_PRESSED", "LIF_CHECKED", "LIF_DELETEUSERDATA", "LIF_DISABLE",
            "LIF_GRAYED", "LIF_HIDDEN", "LIFIND_EXACTMATCH", "LIF_SELECTED", "LIF_SEPARATOR",
            "LINFO_AUTOHIGHLIGHT", "LINFO_REVERSEHIGHLIGHT", "LINFO_SHOWAMPERSAND", "LINFO_SHOWNOBOX", "LINFO_WRAPMODE",
            "LMRT_ALWAYS", "LMRT_NEVER", "LMRT_ONLYFOCUS", "MACROAREA_AUTOCOMPLETION", "MACROAREA_DIALOG",
            "MACROAREA_DISKS", "MACROAREA_EDITOR", "MACROAREA_FINDFOLDER", "MACROAREA_HELP", "MACROAREA_INFOPANEL",
            "MACROAREA_MAINMENU", "MACROAREA_MENU", "MACROAREA_OTHER", "MACROAREA_QVIEWPANEL", "MACROAREA_SEARCH",
            "MACROAREA_SHELL", "MACROAREA_TREEPANEL", "MACROAREA_USERMENU", "MACROAREA_VIEWER", "MACROSTATE_EXECUTING",
            "MACROSTATE_EXECUTING_COMMON", "MACROSTATE_NOMACRO", "MACROSTATE_RECORDING", "MACROSTATE_RECORDING_COMMON", "MCMD_CHECKMACRO",
            "MCMD_GETAREA", "MCMD_GETSTATE", "MCMD_LOADALL", "MCMD_POSTMACROSTRING", "MCMD_SAVEALL",
            "MENU_EVENT", "MIF_CHECKED", "MIF_DISABLE", "MIF_GRAYED", "MIF_HIDDEN",
            "MIF_NONE", "MIF_SELECTED", "MIF_SEPARATOR", "MOUSE_EVENT", "MOUSE_MOVED",
            "MOUSE_WHEELED", "MPEC_BAD_CONTROL_CHAR", "MPEC_BAD_HEX_CONTROL_CHAR", "MPEC_CONTINUE_OTL", "MPEC_EXPECTED_TOKEN",
            "MPEC_EXPR_EXPECTED", "MPEC_FUNC_PARAM", "MPEC_INTPARSERERROR", "MPEC_NOT_EXPECTED_ELSE", "MPEC_NOT_EXPECTED_END",
            "MPEC_SUCCESS", "MPEC_UNEXPECTED_EOS", "MPEC_UNRECOGNIZED_FUNCTION", "MPEC_UNRECOGNIZED_KEYWORD", "MPEC_VAR_EXPECTED",
            "MPEC_ZEROLENGTHMACRO", "NUMLOCK_ON", "OPEN_ANALYSE", "OPEN_COMMANDLINE", "OPEN_DIALOG",
            "OPEN_DISKMENU", "OPEN_EDITOR", "OPEN_FILEPANEL", "OPEN_FINDLIST", "OPEN_FROMMACRO",
            "OPEN_FROMMACRO_MASK", "OPEN_FROMMACROSTRING", "OPEN_FROM_MASK", "OPEN_PLUGINSMENU", "OPEN_SHORTCUT",
            "OPEN_VIEWER", "OPIF_ADDDOTS", "OPIF_COMPAREFATTIME", "OPIF_EXTERNALDELETE", "OPIF_EXTERNALGET",
            "OPIF_EXTERNALMKDIR", "OPIF_EXTERNALPUT", "OPIF_RAWSELECTION", "OPIF_REALNAMES", "OPIF_SHOWNAMESONLY",
            "OPIF_SHOWPRESERVECASE", "OPIF_SHOWRIGHTALIGNNAMES", "OPIF_USEATTRHIGHLIGHTING", "OPIF_USECRC32", "OPIF_USEFILTER",
            "OPIF_USEHIGHLIGHTING", "OPIF_USESORTGROUPS", "OPM_COMMANDS", "OPM_DESCR", "OPM_EDIT",
            "OPM_FIND", "OPM_PGDN", "OPM_QUICKVIEW", "OPM_SILENT", "OPM_TOPLEVEL",
            "OPM_VIEW", "PANEL_ACTIVE", "PANEL_NONE", "PANEL_PASSIVE", "PCTL_CACHEFORGET",
            "PCTL_FORCEDLOADPLUGIN", "PCTL_LOADPLUGIN", "PCTL_UNLOADPLUGIN", "PF_DIALOG", "PF_DISABLEPANELS",
            "PF_EDITOR", "PF_FULLCMDLINE", "PFLAGS_CASESENSITIVESORT", "PFLAGS_DIRECTORIESFIRST", "PFLAGS_HIGHLIGHT",
            "PFLAGS_NUMERICSORT", "PFLAGS_PANELLEFT", "PFLAGS_REALNAMES", "PFLAGS_REVERSESORTORDER", "PFLAGS_SELECTEDFIRST",
            "PFLAGS_SHOWHIDDEN", "PFLAGS_USECRC32", "PFLAGS_USESORTGROUPS", "PF_PRELOAD", "PF_PREOPEN",
            "PF_VIEWER", "PGS_ERROR", "PGS_INDETERMINATE", "PGS_NOPROGRESS", "PGS_NORMAL",
            "PGS_PAUSED", "PKF_ALT", "PKF_CONTROL", "PKF_PREPROCESS", "PKF_SHIFT",
            "PLT_PATH", "PN_CMPNAME", "PN_CMPNAMELIST", "PN_GENERATENAME", "PN_SKIPPATH",
            "PPIF_PROCESSDESCR", "PPIF_SELECTED", "PPIF_USERDATA", "PTYPE_FILEPANEL", "PTYPE_INFOPANEL",
            "PTYPE_QVIEWPANEL", "PTYPE_TREEPANEL", "RECTL_BRACKETSCOUNT", "RECTL_COMPILE", "RECTL_CREATE",
            "RECTL_FREE", "RECTL_MATCHEX", "RECTL_OPTIMIZE", "RECTL_SEARCHEX", "RIGHT_ALT_PRESSED",
            "RIGHT_CTRL_PRESSED", "RIGHTMOST_BUTTON_PRESSED", "SCROLLLOCK_ON", "SE_COMMONSYNCHRO", "SHIFT_PRESSED",
            "SM_ATIME", "SM_CHTIME", "SM_COMPRESSEDSIZE", "SM_CTIME", "SM_DEFAULT",
            "SM_DESCR", "SM_EXT", "SM_FULLNAME", "SM_MTIME", "SM_NAME",
            "SM_NUMLINKS", "SM_OWNER", "SM_SIZE", "SM_UNSORTED", "VCTL_GETINFO",
            "VCTL_QUIT", "VCTL_REDRAW", "VCTL_SELECT", "VCTL_SETKEYBAR", "VCTL_SETMODE",
            "VCTL_SETPOSITION", "VE_CLOSE", "VE_GOTFOCUS", "VE_KILLFOCUS", "VE_READ",
            "VF_DELETEONCLOSE", "VF_DELETEONLYFILEONCLOSE", "VF_DISABLEHISTORY", "VF_ENABLE_F6", "VF_IMMEDIATERETURN",
            "VF_NONMODAL", "VOPT_AUTODETECTCODEPAGE", "VOPT_SAVEFILEPOSITION", "VSMFL_REDRAW", "VSMT_HEX",
            "VSMT_WORDWRAP", "VSMT_WRAP", "VSP_NOREDRAW", "VSP_NORETNEWPOS", "VSP_PERCENT",
            "VSP_RELATIVE", "WINDOW_BUFFER_SIZE_EVENT", "WTYPE_DIALOG", "WTYPE_EDITOR", "WTYPE_HELP",
            "WTYPE_PANELS", "WTYPE_VIEWER", "WTYPE_VMENU", "XLAT_CONVERTALLCMDLINE", "XLAT_SWITCHKEYBBEEP",
            "XLAT_SWITCHKEYBLAYOUT", "XLAT_USEKEYBLAYOUTNAME",
          }
        },

        ["Guids"] = {
          fields = {
            "CopyFilesId", "CopyOverwriteId", "CopyReadOnlyId", "FileAttrDlgId",
            "FileOpenCreateId", "FileSaveAsId", "FindFileId", "HardSymLinkId",
            "MakeFolderId", "MoveFilesId",
         }
        },

        ["ReloadDefaultScript"] = {
          read_only=false
        };
      };
    };

    ["actl"] = {
      fields = {
        "Commit", "EjectMedia", "GetArrayColor", "GetColor", "GetConfirmations",
        "GetCursorPos", "GetDescSettings", "GetDialogSettings", "GetFarHwnd", "GetFarRect",
        "GetFarVersion", "GetInterfaceSettings", "GetPanelSettings", "GetPluginMaxReadData", "GetShortWindowInfo",
        "GetSystemSettings", "GetSysWordDiv", "GetWindowCount", "GetWindowInfo", "KeyMacro",
        "PostKeySequence", "ProgressNotify", "Quit", "RedrawAll", "SetArrayColor",
        "SetCurrentWindow", "SetCursorPos", "SetProgressState", "SetProgressValue", "Synchro",
        "WaitKey",
      };
    };

    ["panel"] = {
      fields = {
        "CheckPanelsExist", "ClearSelection", "ClosePlugin", "GetCmdLine",
        "GetCmdLinePos", "GetCmdLineSelection", "GetColumnTypes", "GetColumnWidths",
        "GetCurrentPanelItem", "GetPanelDirectory", "GetPanelFormat", "GetPanelHostFile",
        "GetPanelInfo", "GetPanelItem", "GetSelectedPanelItem", "GetUserScreen",
        "InsertCmdLine", "IsActivePanel", "RedrawPanel", "SetCaseSensitiveSort",
        "SetCmdLine", "SetCmdLinePos", "SetCmdLineSelection", "SetNumericSort",
        "SetPanelDirectory", "SetSelection", "SetSortMode", "SetSortOrder", "SetUserScreen",
        "SetViewMode", "UpdatePanel",
      };
    };

    ["bit"] = {
      fields = {
        "arshift", "band", "bnot", "bor", "bswap", "bxor", "lshift", "rol", "ror",
        "rshift", "tobit", "tohex",
      };
    };

    ["editor"] = {
      fields = {
        "AddColor", "AddStackBookmark", "ClearStackBookmarks", "DeleteBlock",
        "DeleteChar", "DeleteStackBookmark", "DeleteString", "Editor", "ExpandTabs",
        "GetBookmarks", "GetColor", "GetFileName", "GetInfo", "GetSelection",
        "GetStackBookmarks", "GetString", "InsertString", "InsertText",
        "NextStackBookmark", "PrevStackBookmark", "ProcessInput", "ProcessKey", "Quit",
        "ReadInput", "RealToTab", "Redraw", "SaveFile", "Select", "SetKeyBar", "SetParam",
        "SetPosition", "SetString", "SetTitle", "TabToReal", "TurnOffMarkingBlock",
        "UndoRedo",
      };
    };

    ["regex"] = {
      fields = {
        "find", "gmatch", "gsub", "match", "new",
      };
    };

    ["viewer"] = {
      fields = {
        "GetInfo", "Quit", "Redraw", "Select", "SetKeyBar", "SetMode", "SetPosition",
        "Viewer",
      };
    };

    ["win"] = {
      fields = {
        "CompareString", "CreateDir", "DeleteFile", "DeleteRegKey", "EnumSystemCodePages",
        "ExtractKey", "FileTimeToSystemTime", "GetACP", "GetConsoleScreenBufferInfo",
        "GetCPInfo", "GetCurrentDir", "GetDriveType", "GetEnv", "GetFileAttr", "GetFileInfo",
        "GetOEMCP", "GetRegKey", "GetSystemTimeAsFileTime", "GetVirtualKeys", "MoveFile",
        "MultiByteToWideChar", "OemToUtf8", "RemoveDir", "RenameFile", "SetCurrentDir",
        "SetEnv", "SetRegKey", "Sleep", "SystemTimeToFileTime", "Utf16ToUtf8", "Utf8ToOem",
        "Utf8ToUtf16", "Uuid", "wcscmp",
      };
    };

    ["utf8"] = {
      fields = {
        "byte", "char", "charpattern", "charpos", "codepoint", "codes", "dump",
        "escape", "find", "fold", "format", "gmatch", "gsub", "insert", "len", "lower",
        "match", "ncasecmp", "next", "offset", "remove", "rep", "reverse", "sub", "title",
        "upper", "utf8valid", "width", "widthindex",
      };
    };
  };
}

local lf4ed = {
  read_globals = {
    "AddCommand", "AddToMenu", "AddUserFile", "AutoInstall", "AddEvent",
  };
  globals = {
    "lf4ed", "_Plugin",
  };
}

return {
  luafar = luafar;
  lf4ed = lf4ed;
}
