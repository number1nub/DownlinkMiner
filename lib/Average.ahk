Average(info*) {
	sum := 0
	if (IsObject(info[1])) {
		for c, v in info[1]
			sum += v
		return (sum // info[1].MaxIndex())
	}
	for c, v in info
		sum += v
	return (sum // info.MaxIndex())
}