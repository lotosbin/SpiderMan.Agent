window.spGrab = ->
	data = []
	$('div.WB_feed_type').each ->
		item = {}
		item.providerId = $(this).attr('mid')
		uid = $('.WB_name', this).attr('usercard').match(/\d+/g)[0]
		item.sourceLink = "http://www.weibo.com/#{uid}/#{$(this).attr('midext')}"
		#item.BrithDate = new Date $('.WB_time', this).text() #now faild, wait phantomjs2.0 fix it
		item.grade = parseInt $(".hot_plus1list", this).find('em').eq(0).text()

		item.content = "<b>" + $('.WB_name', this).text() + "</b>：" + $('.WB_text', this).html()
		media_expand = $('.WB_media_expand', this)

		$('.bigcursor', this).eq(0).click()
		choose_box = $('ul.choose_box', media_expand)
		if choose_box
			$('a', choose_box).each ->
				item.content += "<img src='http://ww3.sinaimg.cn/bmiddle/"+$(this).attr('action-data').substring(4) + ".jpg' alt />"
		else
			item.content += $('.smallcursor', media_expand).html()

		video_play = $('span.video_play', this)
		if video_play
			video_play.click()
			item.content += $('.feed_list_media_bigvideoDiv', media_expand)

		data.push item
	return data