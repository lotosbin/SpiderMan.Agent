window.spGrab = ->
    data =
      capString: $('.live_title').text().trim().split(' ').slice(3).join(' ')
      bestVideoMobi: $('#myMovie>a').attr('href')
    return data