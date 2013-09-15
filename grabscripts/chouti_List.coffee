window.spGrab = ->
	data = []
	$('#content-list>.item').each ->
		content = $(this).children(".news-content")
		item = {}
		atag = $('a.show-content', content)
		item.providerId = content.attr("id").match(/\d+/g)[0]
		item.sourceLink = "http://dig.chouti.com/link/" + item.providerId

		item.grade = parseInt $("a.digg-a", this).children("b").text()

		item.content = atag.text()
		imgsrc = $(this).children(".news-pic").children("img").attr("src").replace("=C60x60", "")
		item.content += "<br/><img src='" + imgsrc + "' alt />"

		data.push item
	return data