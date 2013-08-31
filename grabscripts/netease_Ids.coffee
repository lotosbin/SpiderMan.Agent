window.spGrab = ->
    data = []
    $('.tabBox:eq(0)>.tabContents:eq(0) tr').slice(1).each ->
        data.push $(this).children('td').eq(0).children('a').attr('href')
    return data