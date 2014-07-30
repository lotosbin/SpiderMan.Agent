window.spGrab = ->
    item =
        KanbisaiLink: window.location.href
    if $('#liveingArea embed').size()
        embed = $('#liveingArea').html().trim()
        item.bestVideo = embed
    return item