window.spGrab = ->
	data = []
	body = JSON.parse(document.body.innerHTML)[1]
	body.forEach (el, index)->
		matchs = el[Object.keys(el)[0]]
		matchs.forEach (el, index)->
			cateName = "basket"
			switch el.cateId
				when "1" then cateName = "football"
				when "2" then cateName = "basket" #kanbisai.com这里有bug，除了足球以外的项目都属于basket.htm页面
			status = 0
			switch el.period
				when "比赛前" then status = 0
				when "比赛中" then status = 1
				when "已结束" then status = 2
			time = Date.parseString el.startTime, "yyyy-MM-dd HH:mm:ss"
			time.setHours time.getHours() - time.getTimezoneOffset() / 60 #json.js convert by UTC http://goo.gl/4vCdV3
			if el.competitionName.match /CBA/
				el.competitionName = "CBA"
			else if el.competitionName.match /男篮/
				el.competitionName = "篮球友谊赛"
			else if el.competitionName.match /热身赛/
				el.competitionName = "足球友谊赛"
			else if el.competitionName.match /邀请赛/
				el.competitionName = "足球友谊赛"
			item =
				kanbisaiLink: "http://sports.qq.com/kbsweb/#{cateName}.htm?matchId=#{el.matchId}&competitionId=#{el.competitionId}"
				kanbisaiJson: "http://sportswebapi.qq.com/match/view?competitionId=#{el.competitionId}&matchId=#{el.matchId}"
				capString: el.competitionName #后台根据cap判断matchType
				status: status
				teamNameChinese: el.homeName
				teamNameChineseForGuest: el.awayName
				time: time
				point: el.homeGoal
				pointForGuest: el.awayGoal
				quarter: el.quarter
				quarterTime: el.quarterTime

			data.push item
	return data