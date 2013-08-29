window.spGrab = ->
	data = []
	$('div.col1:first>.block').each ->
		_this = $(this)
		atcul = _this.children('.bar').children('ul')

		item = {}
		item.providerId = _this.attr('id').match(/\d+/g)[0]
		#item.BrithDate = new Date _this.children('.content').attr('title') #now faild, wait phantomjs2.0 fix it

		ThumbUps = parseInt $('li', atcul).first().text()
		ThumbDowns = parseInt $('li', atcul).eq(1).text()
		item.grade = ThumbUps - ThumbDowns

		thumb = $.trim _this.children('.thumb').html()
		if thumb
			item.Content = $.trim _this.children('.content').html() + "<br />" + thumb
		else
			item.Content = $.trim _this.children('.content').html()
		data.push item
	return data