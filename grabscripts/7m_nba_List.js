// Generated by CoffeeScript 1.7.1
window.spGrab = function() {
  var caps, data, processCap;
  caps = ['NBA', 'CBA', '男篮世锦赛', '男篮亚锦赛', '友谊赛', '斯坦杯'];
  data = [];
  processCap = function(capString) {
    if (capString === '友谊赛') {
      capString = '篮球友谊赛';
    }
    if (capString === '斯坦杯') {
      capString = '斯坦科维奇杯';
    }
    return capString;
  };
  $("#LiveTable>tbody").slice(1).children("tr:visible[id$='_2']").each(function() {
    var capString, datetime, htr, item, quarter, status;
    htr = $(this).prev('tr');
    capString = $('.l_lea', htr).text();
    if (_.include(caps, capString)) {
      capString = processCap(capString);
      status = 0;
      quarter = $('span.l_state', htr).text();
      if (quarter) {
        status = 1;
      }
      if (quarter === "完场" || quarter === "完场(加)") {
        quarter = "";
        status = 2;
      }
      datetime = Date.parseString($('span.l_times', htr).text(), "MM/ddHH:mm");
      if (datetime > new Date()) {
        datetime.setYear(datetime.setYear() - 1);
      }
      item = {
        capString: capString,
        status: status,
        teamNameChinese: $('td.t_team>a', htr).text(),
        teamNameChineseForGuest: $('td.t_team>a', this).text(),
        time: datetime,
        point: $('td.t_score', htr).text(),
        pointForGuest: $('td.t_score', this).text(),
        quarter: quarter
      };
      return data.push(item);
    }
  });
  return data;
};
