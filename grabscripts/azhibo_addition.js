// Generated by CoffeeScript 1.7.1
window.spGrab = function() {
  var caps, data;
  caps = ['NBA', 'CBA', '男篮世锦赛', '男篮亚锦赛', '德甲', '西甲', '意甲', '英超', '法甲', '欧冠', '世界杯', '欧洲杯', '美洲杯', '亚洲杯', '亚冠', '欧联杯', '足总杯', '国王杯', '联赛杯', '意大利杯', '德国杯', '足协杯', '中超'];
  data = [];
  $('#contentCanvas>.box:not(".tiny-box")').slice(0, 3).each(function() {
    var day;
    day = new Date().getFullYear() + '年' + $(this).children('.title').text().trim().split(' ')[0];
    return $('li', this).each(function() {
      var item, links, liveTag, liveVideos, time;
      if (_.include(caps, $('a:first', this).text())) {
        links = $(this).children('a[target="_blank"]');
        liveTag = links.map(function(i, el) {
          return $(el).text();
        }).get();
        liveVideos = liveTag.map(function(el, i) {
          return {
            Name: el,
            Url: ""
          };
        });
        time = Date.parseString(day + $('span.time ', this).text(), "yyyy年M月d日HH:mm");
        time.setHours(time.getHours() - time.getTimezoneOffset() / 60);
        item = {
          time: time,
          capString: $('a:first', this).text(),
          title: $('a:eq(1)', this).text(),
          liveVideos: liveVideos
        };
        if (links.filter(':contains("文字直播")').size()) {
          item.liveText = "http://www.azhibo.com" + links.filter(':contains("文字直播")').attr('href');
        }
        return data.push(item);
      }
    });
  });
  return data;
};
