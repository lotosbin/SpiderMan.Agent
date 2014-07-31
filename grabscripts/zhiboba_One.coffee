window.spGrab = ->
    data = {}
    if $('#v_player a').size()
        data.transferData = $('#v_player a').attr("href")
    else if $('#v_player iframe').size()
        data.transferData = $('#v_player iframe').attr("src")
    else
        data.transferData = $('#v_player').html()

    if data.transferData.indexOf('载入中') > 0
        data.transferData = showUrls[0].showUrl
    return data

# window.checkReady = ->
#     $('#v_player').html().indexOf('载入中') > 0