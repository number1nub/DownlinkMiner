TrayMenu(hideDef:="") {
	scrName := RegExReplace(A_ScriptName,"\.(ahk|exe)$")
	icoUrl := "http://files.wsnhapps.com/" StrReplace(scrName, " ") "/" (ico:=scrName ".ico")
	
	Menu, DefaultAHK, Standard
	Menu, Tray, NoStandard
	
	if (!A_IsCompiled && !hideDef) {
		Menu, Tray, Add
		Menu, Tray, Add, Default AHK Menu, :DefaultAHK
	}
	Menu, Tray, Add,
	Menu, Tray, Add, Reload
	Menu, Tray, Add, Exit
	
	if (A_IsCompiled)
		Menu, Tray, Icon, % A_ScriptFullpath, -159
	else {
		if (!FileExist(ico))
			URLDownloadToFile, %icoUrl%, %ico%
		Menu, Tray, Icon, % FileExist(ico) ? ico : ""
	}
}