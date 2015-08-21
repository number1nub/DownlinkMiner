#NoEnv
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

TrayMenu()
rootDir  := GetRootDir(%true%)

Splash("Searching for downlink files.")
fileList := GetDownlinkFiles(rootDir "\RSS*")
Splash()
m("Found " fileList.MaxIndex() " files.")

ExitApp


#Include lib\m.ahk
#Include lib\FileCount.ahk
#Include 
#Include lib\GetRootDir.ahk
#Include lib\Average.ahk
#Include lib\Exit.ahk
#Include lib\Reload.ahk
#Include lib\TrayMenu.ahk
#Include 
#Include 