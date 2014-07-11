window.spGrab = ->
    data = {}
    data.capString = $('#zbb_path>ul>li').last().text().trim().split(' ').slice(3).join(' ')
    if data.capString.match /腾讯/
      `for(var s = +new Date(); s + 2000 > +new Date();){}`
    data.bestVideo = $('#v_player').html()
    return data