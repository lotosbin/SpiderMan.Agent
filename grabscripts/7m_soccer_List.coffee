# http://bf2.7m.cn/default_gb.aspx?view=simplify
# Drop, 无法解决跨域iframe加载问题
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

	$("#live_Table>tbody>tr:visible[id^='date']").each ->
		day = $(this).text().split('(')[0]
		$(this).nextUntil("tr[id^='date'], #gameover").filter(":visible").each ->
			capString = $('td', this).eq(1).text()
			if _.include caps, capString
				capString = processCap capString

				quarter = $('td.state', this).text()
				quarter = quarter.replace '上', '上半场'
				quarter = quarter.replace '下', '下半场'
				quarter = quarter.replace '中', '中场休息'

				item =
					capString: capString
					status: 1
					teamNameChinese: $('td.home>a', this).text()
					teamNameChineseForGuest: $('td.away>a', this).text()
					time: Date.parseString day + $('td.time', this).text(), "yyyy年MM月dd日HH:mm"
					point: $('td.score span', this).eq(0).text()
					pointForGuest: $('td.score span', this).eq(1).text()
					quarter: quarter
				data.push item

	$("#live_Table>tbody>tr#gameover").nextAll("tr:visible").each ->
		capString = $('td', this).eq(1).text()
		if _.include caps, capString
			capString = processCap capString

			datetime = new Date();
			time = Date.parseString day + $('td.time', this).text(), "HH:mm"
			datetime.setHours time.getHours()
			datetime.setMinutes time.getMinutes()
			if datetime > new Date()
				datetime.setDate datetime.getDate()-1

			item =
				capString: capString
				status: 2
				teamNameChinese: $('td.home>a', this).text()
				teamNameChineseForGuest: $('td.away>a', this).text()
				time: datetime
				point: $('td.score span', this).eq(0).text()
				pointForGuest: $('td.score span', this).eq(1).text()
				quarter: ""

			if item.teamNameChinese is "阿尔梅利亚" then item.teamNameChinese = "阿尔梅里亚"
			if item.teamNameChineseForGuest is "阿尔梅利亚" then item.teamNameChineseForGuest = "阿尔梅里亚"
			if item.teamNameChinese is "艾尔切" then item.teamNameChinese = "埃尔切"
			if item.teamNameChineseForGuest is "艾尔切" then item.teamNameChineseForGuest = "埃尔切"
			if item.teamNameChinese is "曼彻斯特联" then item.teamNameChinese = "曼联"
			if item.teamNameChineseForGuest is "曼彻斯特联" then item.teamNameChineseForGuest = "曼联"

			data.push item

	return data