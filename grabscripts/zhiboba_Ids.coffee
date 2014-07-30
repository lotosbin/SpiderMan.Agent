window.spGrab = ->
    caps = [
        'NBA','CBA','国际冠军杯','天下足球',
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
        '篮球友谊赛',
        '足球友谊赛',
        '世界杯热身赛',
        '网球','乒乓球',
        '慈善盾杯','解放者杯'
    ]
    data = []
    $('#gamesAreas>.gamesArea').each ->
        day = new Date().getFullYear() + '年' + $('.title', this).text().trim().split(' ')[0]
        $('.game', this).each ->
            _capArray = $(this).children('span.linepre').text().trim().split(/\s+/)
            if _.include caps, _capArray[1]
                link = ""
                $(this).children('a').each ->
                    if $(this).text().trim() is "视频集锦"
                        link = $(this).attr('href')
                        return false
                if link
                    _time = $(this).clone().children().remove().end().text().trim()
                    _datetime = Date.parseString day + _time, "yyyy年M月d日HH:mm"

                    item =
                        time: _datetime
                        capString: _capArray[1]
                        title: _capArray.slice(2).join(' ')
                        transferData: link

                    data.push item

    return data