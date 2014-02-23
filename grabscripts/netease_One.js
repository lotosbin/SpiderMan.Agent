// Generated by CoffeeScript 1.7.1
window.spGrab = function() {
  var item;
  item = {};
  item.providerId = window.location.href;
  item.sourceLink = window.location.href;
  item.title = $('#h1title').text();
  item.grade = parseInt($("span.js-tiecount").eq(0).text());
  if ($.trim($('#endText').text())) {
    item.content = $.trim($('#endText').html());
  }
  item.images = [];
  $('ul.nph_list_thumb>li').each(function() {
    return item.images.push({
      link: $(this).children('i[title="img"]').text(),
      smallLink: $(this).children('i[title="timg"]').text(),
      title: $(this).children('h2').text(),
      describe: $(this).children('p').text()
    });
  });
  return item;
};
