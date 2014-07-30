window.spGrab = ->
    data = {}
    title = $('.live_title').text().trim()
    if title.indexOf("全场录像") >= 0
        data.title = title.split(' ').slice(3).join(' ')
    else
        data.title = title
    if $('.videoShow a').size()
        data.transferData = $('.videoShow a').attr("href")
    else
        data.transferData = $('.videoShow').html().trim()
    return data