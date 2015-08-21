#NoEnv
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

TrayMenu()
rootDir := GetRootDir(%true%)

Splash("Searching for downlink files.")
fileList := GetDownlinkFiles(rootDir "\RSS*")
Splash()

/*
	for c, v in fileList.dups
		dupList .= (dupList ? "`n" : "") v
	m("Found " fileList.files.MaxIndex() " files.`n`nDuplicates:`n`n" dupList)
*/

if (m("Found " fileList.files.MaxIndex() " files.","","Copy files to 'Downlink Files' folder?","btn:yn","ico:?") = "YES") {
	errors := CopyFiles(fileList.files, rootDir "\Downlink Files")
	if (errors.MaxIndex()) {
		for c, v in errors
			errList .= (errList ? "`n" : "") v
		if (FileExist(logFile:=rootDir "\Downlink Files\Errors.log"))
			FileDelete, %logFile%
		FileAppend, % "Errors occurred while trying to copy:`n`n`n" errList, %logFile%
	}
	m("Done with " (errors.MaxIndex() ? errors.MaxIndex() : "0") " errors.","", errors.MaxIndex() ? "An error log has been created:`n" logFile : "", "ico:i")
}

ExitApp


#Include lib\Average.ahk
#Include lib\CopyFiles.ahk
#Include lib\Exit.ahk
#Include lib\FileCount.ahk
#Include lib\GetDownlinkFiles.ahk
#Include lib\GetRootDir.ahk
#Include lib\m.ahk
#Include lib\Reload.ahk
#Include lib\Splash.ahk
#Include lib\TrayMenu.ahk