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

	processTeamName = (teamName)->
		if teamName is '巴黎圣日尔曼' then teamName = '巴黎圣日耳曼'
		return teamName

	monthDiff = (d1, d2)->
	    months = (d2.getFullYear() - d1.getFullYear()) * 12
	    months -= d1.getMonth() + 1
	    months += d2.getMonth()
	    if d2.getDate() >= d1.getDate()
	        months++
	    return months <= 0 ? 0 : months

	fixLostYesrDate = (datetime)-> # http://stackoverflow.com/a/22491538/346701
		if monthDiff(datetime, new Date()) > 1
			datetime.setYear datetime.setYear()+1
		else if monthDiff(new Date(), datetime) > 1
			datetime.setYear datetime.setYear()-1
		return datetime

	$("#pagebody>table td.bh").each ->
		capString = $(this).text()
		if _.include caps, capString
			capString = processCap capString
			line1 = $(this).parent('tr')
			line2 = line1.next('tr')

			quarter = $('td.bf', line2).text()
			quarter = quarter.replace '往绩', ''
			quarter = quarter.replace '上', '上半场'
			quarter = quarter.replace '下', '下半场'
			quarter = quarter.replace '中', '中场休息'

			status = 1
			if quarter is '未开始'
				status = 0
			else if quarter is '完'
				status = 2

			datetime = Date.parseString $('td.tim', line1).text(), "MM-dd"
			time = Date.parseString $('td.tim', line2).text(), "HH:mm"
			datetime.setHours time.getHours()
			datetime.setMinutes time.getMinutes()
			datetime = fixLostYesrDate datetime

			team = $('div.sco>a, div.win>a', line1).clone().children().remove().end().text()
			team = team.replace '（中）', ''
			team = processTeamName team
			teamGuest = $('div.sco>a, div.win>a', line2).clone().children().remove().end().text()
			teamGuest = teamGuest.replace '（中）', ''
			teamGuest = processTeamName teamGuest

			point = $('div.sco>a>span, div.win>a>span', line1).text()
			if point then point = point.split('(')[0]
			pointGuest = $('div.sco>a>span, div.win>a>span', line2).text()
			if pointGuest then pointGuest = pointGuest.split('(')[0]

			item =
				capString: capString
				status: status
				teamNameChinese: team
				teamNameChineseForGuest: teamGuest
				time: datetime
				point: point
				pointForGuest: pointGuest
				quarter: quarter
			data.push item

	#console.log "scfy:" + $(".scfy a").size()
	return data