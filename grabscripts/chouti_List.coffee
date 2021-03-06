window.spGrab = ->
	data = []
	$('#content-list>.item').each ->
		content = $(this).children(".news-content")
		item = {}
		atag = $('a.show-content', content)
		item.providerId = content.attr("id").match(/\d+/g)[0]

		objectIdPattern = /^http.+/g
		if objectIdPattern.test atag.attr('href')
			item.sourceLink = atag.attr('href')
		else
			item.sourceLink = "http://dig.chouti.com" + atag.attr('href')

		item.grade = parseInt $("a.digg-a", this).children("b").text()

		item.content = $.trim atag.text()
		imgsrc = $(this).children(".news-pic").children("img").attr("original").replace("=C60x60", "")
		item.content += "<br/><img src=\"http://gptstatic.com/chouti" + imgsrc.replace(/^[a-zA-Z]+:\/\/[^/]+/g, "") + "\" alt />"

		item.localImages = []
		item.localImages.push imgsrc

		data.push item
	return data