// Generated by CoffeeScript 1.6.3
window.spGrab = function() {
  var data;
  data = [];
  $('div.web_conter').each(function() {
    var ThumbDowns, ThumbUps, item;
    item = {};
    item.providerId = $('.web_right', this).attr('action-data');
    item.sourceLink = "http://www.budejie.com" + $('ul.web_sharing a', this).attr('href').split('&')[0];
    ThumbUps = parseInt($("#loveNum-" + item.providerId, this).text());
    ThumbDowns = parseInt($("#noloveNum-" + item.providerId, this).text());
    item.grade = ThumbUps - ThumbDowns;
    item.content = $.trim($("#title-" + item.providerId).html() + "<br />" + $("<div>").append($("#pic-" + item.providerId).clone()).html());
    return data.push(item);
  });
  return data;
};
