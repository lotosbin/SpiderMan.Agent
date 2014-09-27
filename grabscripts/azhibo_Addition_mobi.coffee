window.spGrab = ->
    caps = [
        'NBA','CBA', 'F1', '高尔夫',
        '男篮世锦赛', '天下足球', '斯坦科维奇杯',
        '男篮亚锦赛', '男篮世界杯', '吉尼斯国际冠军杯',
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
        '篮球友谊赛',
        '足球友谊赛',
        '世界杯热身赛',
        '网球','乒乓球',
        '慈善盾杯','解放者杯'
    ]
    data = []

    processCap = (capString)->
        if capString is '吉尼斯国际冠军杯' then capString = '国际冠军杯'
        return capString

    $('#match-container>.box').slice(1, 4).each ->
        day = new Date().getFullYear() + '年' + $(this).children('.title').text().trim().split(' ')[0]
        $('li.match', this).each ->
            capString = $('a.league', this).text()
            if _.include caps, capString
                capString = processCap capString
                links = $(this).children('a.channel')
                liveTag = links.map (i, el)->
                    return $(el).text()
                .get() #get string, otherwise be jquery-obj http://goo.gl/bvhXb
                #liveVideos = _.intersection live, liveTag  #转移到server端的工作
                liveVideos = liveTag.map (el, i)->
                    return {
                        Name: el
                        Url: ""
                    }

                time = Date.parseString day + $('span.time ', this).text(), "yyyy年M月d日HH:mm"
                # time.setHours time.getHours() - time.getTimezoneOffset() / 60 #json.js convert by UTC http://goo.gl/4vCdV3

                item =
                    time: time
                    capString: capString
                    title: $('a.match-name', this).text()
                    liveVideosForMobile: liveVideos

                if links.filter(':contains("文字直播")').size()
                    item.liveTextForMobile = links.filter(':contains("文字直播")').attr('href')

                if item.teamNameChinese is "格拉纳达CF" then item.teamNameChinese = "格兰纳达"
                if item.teamNameChineseForGuest is "格拉纳达CF" then item.teamNameChineseForGuest = "格兰纳达"

                data.push item

    return data