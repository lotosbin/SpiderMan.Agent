window.spGrab = ->
	data = []
	$('div.web_conter').each ->
		item = {}
		item.providerId = $('.web_right', this).attr('action-data')
		item.sourceLink = "http://www.budejie.com" + $('ul.web_sharing a', this).attr('href').split('&')[0]
		#item.BrithDate = new Date $.trim $('.web_time>span', this).text() #now faild, wait phantomjs2.0 fix it

		ThumbUps = parseInt $("#loveNum-#{item.providerId}", this).text()
		ThumbDowns = parseInt $("#noloveNum-#{item.providerId}", this).text()
		item.grade = ThumbUps - ThumbDowns

		item.content = $.trim $("#title-#{item.providerId}", this).html()
		item.images = [
			link: $(".web_pic img", this).attr('src')
		]
		data.push item
	return data