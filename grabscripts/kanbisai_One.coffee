window.spGrab = ->
    item =
        KanbisaiLink: window.location.href
    embed = $('#liveingArea').html().trim()
    if embed
        item.bestVideo = embed
    return item