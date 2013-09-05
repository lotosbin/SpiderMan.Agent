// Generated by CoffeeScript 1.6.2
window.spGrab = function() {
  var data;

  data = [];
  $('div.col1:first>.block').each(function() {
    var ThumbDowns, ThumbUps, atcul, item, thumb, _this;

    _this = $(this);
    item = {};
    item.sourceLink = "http://www.qiushibaike.com" + _this.children('.detail>a').attr('href');
    item.providerId = _this.attr('id').match(/\d+/g)[0];
    atcul = $('.bar', this).children('ul');
    ThumbUps = parseInt($('li', atcul).first().text());
    ThumbDowns = parseInt($('li', atcul).eq(1).text());
    item.grade = ThumbUps - ThumbDowns;
    thumb = $.trim(_this.children('.thumb').html());
    if (thumb) {
      item.content = $.trim(_this.children('.content').html() + "<br />" + thumb);
    } else {
      item.content = $.trim(_this.children('.content').html());
    }
    return data.push(item);
  });
  return data;
};
