// Generated by CoffeeScript 1.7.1
window.spGrab = function() {
  var embed, item;
  item = {
    KanbisaiLink: window.location.href
  };
  embed = $('#liveingArea').html().trim();
  if (embed) {
    item.bestVideo = embed;
  }
  return item;
};
