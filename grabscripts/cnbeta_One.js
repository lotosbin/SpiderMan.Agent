// Generated by CoffeeScript 1.9.2
window.spGrab = function() {
  var item, section;
  item = {};
  item.providerId = window.location.pathname;
  item.sourceLink = window.location.href;
  item.title = $('#news_title').text();
  item.grade = parseInt($("#view_num").text());
  item.content = "";
  section = $('section.article_content');
  item.content = section.children('div.introduction').html() + section.children('div.content').html();
  return item;
};