// Generated by CoffeeScript 1.7.1
window.spGrab = function() {
  var body, data;
  data = [];
  body = JSON.parse(document.body.innerHTML)[1];
  body.forEach(function(el,  index) {
    var matchs;
    matchs = el[Object.keys(el)[0]];
    return matchs.forEach(function(el,  index) {
      var cateName, item, status, time;
      cateName = "basket";
      switch (el.cateId) {
        case "1":
          cateName = "football";
          break;
        case "2":
          cateName = "basket";
      }
      status = 0;
      switch (el.period) {
        case "比赛前":
          status = 0;
          break;
        case "比赛中":
          status = 1;
          break;
        case "已结束":
          status = 2;
      }
      time = Date.parseString(el.startTime, "yyyy-MM-dd HH:mm:ss");
      time.setHours(time.getHours() - time.getTimezoneOffset() / 60);
      if (el.competitionName.match(/CBA/)) {
        el.competitionName = "CBA";
      } else if (el.competitionName.match(/男篮/)) {
        el.competitionName = "篮球友谊赛";
      } else if (el.competitionName.match(/热身赛/ || el.competitionName.match(/邀请赛/))) {
        el.competitionName = "足球友谊赛";
      }
      item = {
        kanbisaiLink: "http://sports.qq.com/kbsweb/" + cateName + ".htm?matchId=" + el.matchId + "&competitionId=" + el.competitionId,
        capString: el.competitionName,
        status: status,
        teamNameChinese: el.homeName,
        teamNameChineseForGuest: el.awayName,
        time: time,
        point: el.homeGoal,
        pointForGuest: el.awayGoal,
        quarter: el.quarter,
        quarterTime: el.quarterTime
      };
      return data.push(item);
    });
  });
  return data;
};
