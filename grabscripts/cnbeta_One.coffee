window.spGrab = ->
    item = {}
    item.providerId = window.location.pathname
    item.sourceLink = window.location.href
    #item.BrithDate = new Date $.trim $('.web_time>span', this).text() #now faild, wait phantomjs2.0 fix it

    item.title = $('#news_title').text()
    item.grade = parseInt $("#view_num").text()

    # contentTags = $('.time_s').nextUntil('.break')
    # item.localImages = []
    # $('img[src^="http://tankr.net/"]', contentTags).each ->
    #     item.localImages.push $(this).attr('src')
    #     $(this).attr "src", "http://gptstatic.com/jiandan" + $(this).attr('src').replace(/^[a-zA-Z]+:\/\/[^/]+/g, '')

    item.content = ""
    # contentTags.each ->
    section = $('section.article_content')
    item.content = section.children('div.introduction').html() +  section.children('div.content').html()

    return item
