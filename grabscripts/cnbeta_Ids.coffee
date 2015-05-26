window.spGrab = ->
    data = []
    $('#allnews_all>div.items_area>div.item').not(".cooperation").each ->
        data.push $(this).attr('id').replace('J_allItem_', '')
    return data
