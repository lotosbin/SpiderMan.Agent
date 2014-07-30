window.spGrab = ->
    title = ['[新浪全场集锦]','[优酷全场集锦]', '[腾讯全场集锦]']
    data = []
    # $('.content a').last().remove()

    $('.content a').each ->
        text = $(this).text()
        href = $(this).attr('href')
        if text.indexOf("全场录像") >= 0
            data.push href
            return
        $(title).each ->
            if text.indexOf(this) >= 0
                data.push href
                return false

    return data