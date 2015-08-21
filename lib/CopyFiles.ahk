CopyFiles(files, dest) {
	static ETA, Progress
	
	if (!total:=files.MaxIndex())
		return	
	
	Gui, +AlwaysOnTop -Border +ToolWindow
	Gui, Color, Black, Black
	Gui, Margin, 5, 5
	Gui, Font, s12 cAqua, Segoe UI
	Gui, Add, Text,, Copying %total% files...
	Gui, Add, Progress, y+10 w630 h35 cAqua vProgress Range1-%total% 
	Gui, Add, Text, y+10, ETA:
	Gui, Add, Text, x+5 vETA, 0:00:00
	Gui, Show,, Downlink Miner Progress
	
	if (!FileExist(dest))
		FileCreateDir, %dest%
	
	StartTime := A_TickCount
	err := []
	for c, v in files {
		FileCopy, %v%, %dest%, 1
		if (ErrorLevel)
			err.Push(v)
		
		GuiControl,,Progress, %c%
		time  := A_TickCount-StartTime
		SumX  += c
		SumY  += time
		SumXY += c*time
		SumX2 += c**2
		m   := (c*SumXY-SumX*SumY)/(c*SumX2-SumX**2)
		b   := (SumY-m*SumX)/c
		ETA := (m*total+b)-(m*c+b)
		T   := A_Year
		T += ETA/1000, Seconds
		FormatTime, ETA, %T%, H:mm:ss
		GuiControl,, ETA, %ETA%
	}
	
	GuiClose:
	Gui, Destroy
	return err
}