window.spGrab = ->
  data =
    capString: $('.live_title').text().trim().split(' ').slice(3).join(' ')
    bestVideoMobi: $('.videoShow').html()
  console.log "zhiboba addition mobi: "+$('.videoShow').html()
  return data