GetRootDir(dir:="") {
	if (!dir) {
		Gui +OwnDialogs
		FileSelectFolder, dir, *Q:\TestData\Tools, 4, Select root folder to analyze
		if (ErrorLevel || !dir)
			ExitApp
	}
	return RegExReplace(dir, "\\$")
}