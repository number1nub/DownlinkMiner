FileCount(root, type:="D", recurse:="") {
	cnt:=0
	Loop, Files, %root%, % type (recurse ? "R":"")
		if (!filter || RegExMatch(A_LoopFileName, filter))
			cnt++
	return cnt
}