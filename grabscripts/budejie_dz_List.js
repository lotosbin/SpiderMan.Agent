// Generated by CoffeeScript 1.7.1
window.spGrab = function() {
  var data;
  data = [];
  $('div.web_conter').each(function() {
    var ThumbDowns, ThumbUps, item;
    item = {};
    item.providerId = $('.web_right', this).attr('action-data');
    ThumbUps = parseInt($("#loveNum-" + item.providerId, this).text());
    ThumbDowns = parseInt($("#noloveNum-" + item.providerId, this).text());
    item.grade = ThumbUps - ThumbDowns;
    if (item.grade < 1000) {
      return;
    }
    item.sourceLink = "http://www.budejie.com" + $('ul.web_sharing a', this).attr('href').split('&')[0];
    item.content = $.trim($("#title-" + item.providerId, this).html());
    return data.push(item);
  });
  return data;
};
