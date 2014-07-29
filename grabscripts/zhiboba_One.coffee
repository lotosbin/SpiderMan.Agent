window.spGrab = ->
  data = {}
  data.capString = $('#zbb_path>ul>li').last().text().trim().split(' ').slice(3).join(' ')
  data.bestVideo = $('#v_player>a').attr("href")
  return data