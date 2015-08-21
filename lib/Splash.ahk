Splash(info*) {
	if (!info.MaxIndex()) {
		SplashImage, Off
		return
	}
	tmp := IsObject(info[1]) ? info[1] : info
	for c, v in tmp
		txt .= (txt ? "`n" : "") v
	SplashImage,, y50 w645 h150 B1, % info[1].title ? info[1].title:"Please wait...", % txt
}