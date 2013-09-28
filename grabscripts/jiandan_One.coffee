window.spGrab = ->
    item = {}
    item.providerId = window.location.pathname
    item.sourceLink = window.location.href
    #item.BrithDate = new Date $.trim $('.web_time>span', this).text() #now faild, wait phantomjs2.0 fix it

    item.title = $('h1:eq(1)>a').text()
    item.grade = parseInt $("span.comment-big>a").text()

    contentTags = $('.time_s').nextUntil('.break')
    item.localImages = []
    $('img[src^="http://tankr.net/"]', contentTags).each ->
        item.localImages.push $(this).attr('src')
        $(this).attr "src", "http://gptstatic.com/jiandan/" + $(this).attr('src').replace('http://tankr.net/', '')

    item.content = ""
    contentTags.each ->
        item.content += $(this).clone().wrap('<div />').parent().html()

    return item