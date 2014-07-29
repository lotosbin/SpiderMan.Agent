window.spGrab = ->
	data = []
	body = JSON.parse(document.body.innerHTML)[1]
	body.forEach (el, index)->
		matchs = el[Object.keys(el)[0]]
		matchs.forEach (el, index)->
			cateName = "basket"
			switch el.cateId
				when "1" then cateName = "football"
				when "2" then cateName = "basket" # kanbisai.com 除了足球以外的项目都属于basket.htm页面

			status = 0
			switch el.period
				when "比赛前" then status = 0
				when "比赛中" then status = 1
				when "已结束" then status = 2

			item =
				kanbisaiLink: "http://sports.qq.com/kbsweb/#{cateName}.htm?matchId=#{el.matchId}&competitionId=#{el.competitionId}"
				capString: el.competitionName #后台根据cap判断matchType
				status: status
				teamNameChinese: el.homeName
				teamNameChineseForGuest: el.awayName
				time: el.startTime
				point: el.homeGoal
				pointForGuest: el.awayGoal
				quarter: el.quarter
				quarterTime: el.quarterTime

			data.push item

	return data