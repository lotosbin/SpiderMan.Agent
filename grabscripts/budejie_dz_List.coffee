window.spGrab = ->
	data = []
	$('div.web_conter').each ->
		item = {}
		item.providerId = $('.web_right', this).attr('action-data')

		ThumbUps = parseInt $("#loveNum-#{item.providerId}", this).text()
		ThumbDowns = parseInt $("#noloveNum-#{item.providerId}", this).text()
		item.grade = ThumbUps - ThumbDowns
		if item.grade < 1000 then return

		item.sourceLink = "http://www.budejie.com" + $('ul.web_sharing a', this).attr('href').split('&')[0]
		#item.BrithDate = new Date $.trim $('.web_time>span', this).text() #now faild, wait phantomjs2.0 fix it

		item.content = $.trim $("#title-#{item.providerId}", this).html()
		data.push item
	return data