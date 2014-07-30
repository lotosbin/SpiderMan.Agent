window.spGrab = ->
    item =
        KanbisaiLink: window.location.href
    if $('#liveingArea video').size()
        embed = $('#liveingArea').html().trim()
        item.bestVideoMobi = embed
    return item