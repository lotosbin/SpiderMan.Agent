window.spGrab = ->
    data = {}
    title = $('#zbb_path>ul>li').last().text().trim()
    if title.indexOf("全场录像") >= 0
        data.title = title.split(' ').slice(3).join(' ')
    else
        data.title = title
    if $('#v_player a').size()
        data.transferData = $('#v_player a').attr("href")
    else
        data.transferData = $('#v_player').html()
    return data