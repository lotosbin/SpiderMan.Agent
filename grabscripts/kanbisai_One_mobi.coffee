window.spGrab = ->
    item =
        KanbisaiLink: window.location.href
    embed = $('#liveingArea').html().trim()
    if embed
        item.bestVideoMobi = embed
    return item