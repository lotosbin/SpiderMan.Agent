window.spGrab = ->
    item = {}
    item.providerId = window.location.href
    item.sourceLink = window.location.href
    #item.BrithDate = new Date $.trim $('.web_time>span', this).text() #now faild, wait phantomjs2.0 fix it

    item.title = $('#h1title').text()
    item.grade = parseInt $("span.js-tiecount").eq(0).text()

    item.content = $('#endText').html()
    item.images = []
    $('ul.nph_list_thumb>li').each ->
        item.images.push
            link: $(this).children('i[title="img"]').text()
            smallLink: $(this).children('i[title="timg"]').text()
            title: $(this).children('h2').text()
            describe: $(this).children('p').text()

    return item