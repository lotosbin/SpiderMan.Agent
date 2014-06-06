window.spGrab = ->
    caps = [
        'NBA',
        'CBA',
        '男篮世锦赛',
        '男篮亚锦赛',
        '德甲','西甲',
        '意甲','英超',
        '法甲','欧冠',
        '世界杯','欧洲杯',
        '美洲杯','亚洲杯',
        '亚冠','欧联杯',
        '足总杯','国王杯',
        '联赛杯','意大利杯',
        '德国杯','足协杯',
        '中超','土伦杯',
        '网球',
        '篮球友谊赛',
        '足球友谊赛',
        '世界杯热身赛',
        '乒乓球'
    ]
    data = []
    $('#match-container>.box').slice(1, 4).each ->
        day = new Date().getFullYear() + '年' + $(this).children('.title').text().trim().split(' ')[0]
        $('li.match', this).each ->
            if _.include caps, $('a.league', this).text()
                links = $(this).children('a.channel')
                liveTag = links.map (i, el)->
                    return $(el).text()
                .get()
                #liveVideos = _.intersection live, liveTag  #转移到server端的工作
                liveVideos = liveTag.map (el, i)->
                    return {
                        Name: el
                        Url: ""
                    }

                time = Date.parseString day + $('span.time ', this).text(), "yyyy年M月d日HH:mm"
                time.setHours time.getHours() - time.getTimezoneOffset() / 60 #json.js convert by UTC http://goo.gl/4vCdV3

                _capString = $('a.league', this).text()
                if _capString is '世界杯热身赛' then _capString = '足球友谊赛'

                item =
                    time: time
                    capString: _capString
                    title: $('a.match-name', this).text()
                    liveVideosForMobile: liveVideos

                if links.filter(':contains("文字直播")').size()
                    item.liveTextForMobile = links.filter(':contains("文字直播")').attr('href')
                data.push item

    return data