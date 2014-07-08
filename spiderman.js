// Generated by CoffeeScript 1.7.1
var CastTesk, agentName, fs, grabTime, serverUrl, system, webpage, websocket, _onError;

system = require("system");

webpage = require("webpage");

fs = require('fs');

if (system.args.length !== 3) {
  console.log('serverUrl and agentName is necessary!');
  phantom.exit(1);
}

agentName = system.args[1];

serverUrl = system.args[2];

grabTime = {};

_onError = function(msg, trace) {
  var msgStack;
  msgStack = [msg];
  if (trace) {
    trace.forEach(function(t) {
      var _ref;
      return msgStack.push(" -> " + t.file + ": " + t.line + ((_ref = t["function"]) != null ? _ref : " (in function '" + t["function"] + {
        "')": ""
      }));
    });
  }
  return console.log(msgStack.join("\n"));
};

websocket = webpage.create();

websocket.settings.localToRemoteUrlAccessEnabled = true;

websocket.onConsoleMessage = function(info) {
  return console.log("~Websocket: " + info);
};

websocket.onError = _onError;

websocket.onCallback = function(info) {
  var e;
  switch (info.command) {
    case "CastTesk":
      return CastTesk(info.task);
    case "UpdateScript":
      console.log("~UpdateScript: " + info.file);
      try {
        return fs.write("grabscripts/" + info.file, info.content);
      } catch (_error) {
        e = _error;
        return console.log(e);
      }
  }
};

websocket.injectJs('./jquery-2.1.0.min.js');

websocket.injectJs('./jquery.signalR-2.1.0.min.js');

websocket.includeJs(serverUrl + '/signalr/hubs', function() {
  return websocket.evaluate(function(serverUrl, agentName) {
    var taskHub;
    $.support.cors = false;
    $.connection.hub.url = serverUrl + '/signalr';
    taskHub = $.connection.taskHub;
    taskHub.client.castTesk = function(task) {
      if (task && task.url) {
        return window.callPhantom({
          command: "CastTesk",
          task: task
        });
      }
    };
    taskHub.client.updateScript = function(file, content) {
      return window.callPhantom({
        command: "UpdateScript",
        file: file,
        content: content
      });
    };
    return $.connection.hub.start().done(function() {
      $.support.cors = true;
      return taskHub.server.registerAgent(agentName);
    }).fail(function(msg) {
      return console.log('connect fail. ' + msg);
    });
  }, serverUrl, agentName);
});

setInterval(function() {
  var checkTime;
  checkTime = (Date.now() - grabTime) / 1000;
  console.log('----- checkTime: ' + checkTime);
  if (checkTime > 120) {
    grabTime = Date.now();
    console.log('----- Interval grabTime: ' + checkTime);
    return websocket.evaluate(function(serverUrl, agentName) {
      var taskHub;
      taskHub = $.connection.taskHub;
      return $.connection.hub.start().done(function() {
        taskHub.server.registerAgent(agentName);
        return console.log('re-connect done. ');
      }).fail(function(msg) {
        return console.log('connect fail. ' + msg);
      });
    }, serverUrl, agentName);
  }
}, 60000);

CastTesk = function(task) {
  var gbdate, now, pageGrab;
  grabTime = Date.now();
  console.log("~CastTesk: " + JSON.stringify(task));
  pageGrab = webpage.create();
  if (task.isMobile) {
    pageGrab.settings.userAgent = "Mozilla/5.0 (iphone; cpu iphone os 7_0 like mac os x; en-us) applewebkit/537.51.1 (khtml, like gecko) version/7.0 mobile/11a465 safari/9537.53";
  } else {
    pageGrab.settings.userAgent = 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36';
  }
  pageGrab.settings.loadImages = false;
  now = Date.now();
  gbdate = {};
  pageGrab.onConsoleMessage = function(msg) {
    return console.log('~Evaluate: ' + msg);
  };
  pageGrab.onError = function(msg, trace) {
    console.error("~EvaluateError_" + task.source + "_" + task.commandType + ":");
    return _onError(msg, trace);
  };
  pageGrab.onResourceRequested = function(data, request) {
    var result;
    if (/http:\/\/.+?\.css/g.test(data["url"]) || data.headers["Content-Type"] === "text/css") {
      console.log("~BLOCKED CSS: " + data.url);
      request.abort();
      return;
    }
    result = /^https?:\/\/([^\/]+)/.exec(data.url);
    if (result) {
      if (/\.doubleclick\./.test(result[1] || /\.baidustatic\.com$/.test(result[1] || /\.alimama\.cn$/.test(result[1] || /\.google-analytics\.com$/.test(result[1] || /\.baodu\.com$/.test(result[1] || /\.cnzz\.com$/.test(result[1]))))))) {
        console.log("~BLOCKED AD: " + result[1]);
        return request.abort();
      }
    }
  };
  return pageGrab.open(task.url, function(status) {
    if (status !== 'success') {
      task.status = 2;
      task.error = 'Unable to access page';
    } else {
      if (!task.withoutJquery) {
        pageGrab.injectJs('jquery-2.1.0.min.js');
      }
      if (task.withUnderscore) {
        pageGrab.injectJs('underscore-min.js');
      }
      if (task.withDate) {
        pageGrab.injectJs('date.js');
      }
      if (task.isMobile) {
        pageGrab.injectJs("grabscripts/" + task.source + "_" + task.commandType + "_mobi.js");
      } else {
        pageGrab.injectJs("grabscripts/" + task.source + "_" + task.commandType + ".js");
      }
      gbdate = pageGrab.evaluate(function() {
        return spGrab();
      });
      task.spend = (Date.now() - now) / 1000;
      if (!gbdate) {
        task.status = 2;
        task.error = 'gbdate is false';
      } else {
        task.status = 3;
      }
    }
    pageGrab.close();
    return websocket.evaluate(function(serverUrl, task, data) {
      var posturl, taskHub;
      taskHub = $.connection.taskHub;
      taskHub.server.doneTask(task);
      if (task.status !== 2) {
        posturl = serverUrl + "/task/post" + task.articleType + task.commandType;
        if (task.isMobile) {
          posturl += '_mobi';
        }
        return $.post(posturl, {
          taskjson: JSON.stringify(task),
          datajson: JSON.stringify(data)
        });
      }
    }, serverUrl, task, gbdate);
  });
};
