// Generated by CoffeeScript 1.7.1
window.spGrab = function() {
  var data;
  data = [];
  $('.content a').last().remove();
  $('.content a').each(function() {
    return data.push($(this).attr('href'));
  });
  return data;
};