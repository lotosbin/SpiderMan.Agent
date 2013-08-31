window.spGrab = ->
    data = []
    $('.post>ul>li').slice(0,9).each ->
        replycount = parseInt $('small:eq(1)>span', this).text()
        if replycount < 20 then return
        data.push $(this).children('a').attr('href').replace('http://jandan.net', '')
    return data