// Generated by CoffeeScript 1.6.3
exports.DisplayNowDate = function() {
  var dd, hour, minute, mm, seconds, time, yyyy;
  time = new Date();
  yyyy = time.getFullYear();
  mm = time.getMonth() + 1;
  dd = time.getDate();
  hour = time.getHours();
  minute = time.getMinutes();
  seconds = time.getSeconds();
  return yyyy + '-' + mm + '-' + dd + ' ' + hour + ':' + minute + ':' + seconds;
};
