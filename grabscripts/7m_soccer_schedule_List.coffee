window.spGrab = ->
	caps = [
		'吉尼斯杯','球会友谊',
		'德甲','西甲',
		'意甲','英超',
		'法甲','欧冠',
		'世界杯','欧洲杯',
		'美洲杯','亚洲杯',
		'亚冠','欧联杯',
		'足总杯','国王杯',
		'联赛杯','意大利杯',
		'德国杯','足协杯',
		'中超','土伦杯',
		'慈善盾杯','解放者杯'
	]
	data = []

	processCap = (capString)->
		if capString is '球会友谊' then capString = '足球友谊赛'
		if capString is '吉尼斯杯' then capString = '国际冠军杯'
		return capString

	$("#fixture_tb>tbody>tr").not("[id]").each ->
		day = $(this).text().split('(')[0]
		$(this).nextUntil("tr:not([id])").each ->
			capString = $('td', this).eq(0).text()
			if _.include caps, capString
				item =
					capString: processCap capString
					status: 0
					time: Date.parseString day + $('td', this).eq(1).text().split(' ')[1], "yyyy年MM月dd日HH:mm"
					teamNameChinese: $('td', this).eq(2).text()
					teamNameChineseForGuest: $('td', this).eq(4).text()
				data.push item

	return data