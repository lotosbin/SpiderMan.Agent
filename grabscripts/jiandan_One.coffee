window.spGrab = ->
    item = {}
    item.providerId = window.location.pathname
    item.sourceLink = window.location.href
    #item.BrithDate = new Date $.trim $('.web_time>span', this).text() #now faild, wait phantomjs2.0 fix it

    item.title = $('h1>a').text()
    item.grade = parseInt $("span.comment-big>a").text()

    item.content = ""
    contentTags = $('.time_s').nextUntil('.break')
    $('img[src^="http://tankr.net/"]', contentTags).remove()
    contentTags.each ->
        item.content += $(this).clone().wrap('<div />').parent().html()

    return item