window.spGrab = ->
	_this = $('div.col1:first>.block')
	atcul = _this.children('.bar').children('ul')
	item =
		#title: $.trim _this.children('.detail').text()
		content: $.trim _this.children('.content').html()
		#creatDate: new Date _this.children('.content').attr('title') #now faild, wait phantomjs2.0 fix it
		thumbUps: $.trim $('li', atcul).first().text()
		thumbDowns: $.trim $('li', atcul).eq(1).text()
	return item