window.spGrab = ->
	caps = [
		'NBA','CBA','男篮世锦赛','男篮亚锦赛', '男篮世界杯',
		'友谊赛','斯坦杯'
	]
	data = []

	processCap = (capString)->
		if capString is '友谊赛' then capString = '篮球友谊赛'
		if capString is '斯坦杯' then capString = '斯坦科维奇杯'
		return capString

	$("#LiveTable>tbody").slice(1).children("tr:visible[id$='_2']").each ->
		htr = $(this).prev('tr')
		capString = $('.l_lea', htr).text()
		if _.include caps, capString
			capString = processCap capString
			status = 0
			quarter = $('span.l_state', htr).text()
			if quarter then status = 1
			if quarter is "完场" or quarter is "完场(加)"
				quarter = ""
				status = 2

			datetime = Date.parseString $('span.l_times', htr).text(), "MM/ddHH:mm"
			if datetime > new Date()
				datetime.setYear datetime.setYear()-1

			item =
				capString: capString
				status: status
				teamNameChinese: $('td.t_team>a', htr).text()
				teamNameChineseForGuest: $('td.t_team>a', this).text()
				time: datetime
				point: $('td.t_score', htr).text()
				pointForGuest: $('td.t_score', this).text()
				quarter: quarter
			data.push item

	return data