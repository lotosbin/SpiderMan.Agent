window.spGrab = ->
	item =
		KanbisaiLink: window.location.href
	embed = $('#liveingArea').html().trim()
	if embed
		item.bestVideos = embed
	console.log "bestVideos: "+item.bestVideos
	return item