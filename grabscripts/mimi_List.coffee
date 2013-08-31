window.spGrab = ->
	data = []
	$('div.contentBox').each ->
		item = {}
		atag = $('li.con_comments', this).children('a')
		item.providerId = atag.attr('href').match(/\d+/g)[0]
		item.sourceLink = "http://www.mimi.com" + atag.attr('href')
		#item.BrithDate = new Date $(this).attr('title') #now faild, wait phantomjs2.0 fix it

		ThumbUps = parseInt $("li.con_like", this).text()
		ThumbDowns = parseInt $("li.con_unlike", this).text()
		item.grade = ThumbUps - ThumbDowns

		item.content = $(this).children("p").html()
		data.push item
	return data