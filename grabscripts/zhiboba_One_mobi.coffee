window.spGrab = ->
  data =
    capString: $('.live_title').text().trim().split(' ').slice(3).join(' ')
    bestVideoMobi: $('.videoShow').html().trim()
  return data