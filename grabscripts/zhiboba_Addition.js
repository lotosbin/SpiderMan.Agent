// Generated by CoffeeScript 1.7.1
window.spGrab = function() {
  var data, title;
  title = ['[新浪全场集锦]', '[优酷全场集锦]', '[腾讯全场集锦]'];
  data = [];
  $('.content a').each(function() {
    var href, text;
    text = $(this).text();
    href = $(this).attr('href');
    if (text.indexOf("全场录像") >= 0) {
      data.push(href);
      return;
    }
    return $(title).each(function() {
      if (text.indexOf(this) >= 0) {
        data.push(href);
        return false;
      }
    });
  });
  return data;
};
