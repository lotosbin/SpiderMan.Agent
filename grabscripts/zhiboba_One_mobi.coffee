window.spGrab = ->
    data = {}
    if $('.videoShow a').size()
        data.transferData = $('.videoShow a').attr("href")
    else
        data.transferData = $('.videoShow').html().trim()
    return data