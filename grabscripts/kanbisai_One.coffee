window.spGrab = ->
    item =
        kanbisaiJson: window.location.href
    body = JSON.parse(document.body.innerHTML)[1]
    if body.videoNews
        item.kanbisaiVid = body.videoNews[0].vid
    return item