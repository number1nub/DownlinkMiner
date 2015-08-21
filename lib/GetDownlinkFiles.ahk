GetDownlinkFiles(root) {
	ret:={files:[], dups:[]}, fNames:=[]
	
	Loop, Files, %root%, DR
	{
		Loop, Files, %A_LoopFileFullPath%\*_JOB*_dwnlnk.csv, FR
		{
			if (!ObjHasKey(fNames, A_LoopFileName)) {
				ret.files.Push(A_LoopFileFullPath)
				fNames[A_LoopFileName] := A_LoopFileFullPath
			}
			else
				ret.dups.Push(A_LoopFileFullPath "`n(" fNames[A_LoopFileName] ")")
		}
	}
	return ret
}