window.spGrab = ->
    data = []
    $('.content a').last().remove()
    $('.content a').each ->
        data.push $(this).attr('href')
    return data