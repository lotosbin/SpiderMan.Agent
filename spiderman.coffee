system = require "system"
webpage = require "webpage"
fs = require 'fs'
if system.args.length isnt 3
  console.log 'serverUrl and agentName is necessary!'
  phantom.exit 1
agentName = system.args[1]
serverUrl = system.args[2]
grabTime = {}

_onError = (msg, trace) ->
  msgStack = [msg]
  if trace
    trace.forEach (t)->
      msgStack.push " -> " + t.file + ": " + t.line + (t.function ? " (in function '" + t.function + "')" : "")
  console.log msgStack.join("\n")

websocket = webpage.create()
websocket.settings.localToRemoteUrlAccessEnabled = true
websocket.onConsoleMessage = (info) -> console.log "~Websocket: " + info
websocket.onError = _onError
websocket.onCallback = (info) ->
  switch info.command
    when "CastTesk"
      CastTesk info.task
    when "UpdateScript"
      console.log "~UpdateScript: " + info.file
      try
        fs.write "grabscripts/"+info.file, info.content
      catch e
        console.log e

websocket.injectJs './jquery-2.1.0.min.js'
#1.2.1+ 版本castTesk不触发，未知原因，不浪费时间在这里 https://github.com/SignalR/SignalR/issues/2904
websocket.injectJs './jquery.signalR-2.0.2.min.js'
websocket.includeJs serverUrl + '/signalr/hubs', ->
  websocket.evaluate (serverUrl, agentName)->
    #应该是webkit执行localfile时的issus，因为问题不明显也不被重视 http://goo.gl/S34e2n
    #hub.start()链接过一次以后重新start()链接不需要确保cors == flase
    $.support.cors = false
    $.connection.hub.url = serverUrl + '/signalr'
    taskHub = $.connection.taskHub
    taskHub.client.castTesk = (task) ->
      if task && task.url
        window.callPhantom
          command: "CastTesk"
          task: task
    taskHub.client.updateScript = (file, content) ->
      window.callPhantom
        command: "UpdateScript"
        file: file
        content: content
    # $.connection.hub.logging = true
    $.connection.hub.start().done ->
      #console.log taskHub.connection.id
      $.support.cors = true #如果不设置，$.post serverUrl 会失效，因为$.post不会自动使用jsonp请求
      taskHub.server.registerAgent agentName
    .fail (msg)->
      console.log 'connect fail. ' + msg
  , serverUrl, agentName

setInterval ->
  checkTime = (Date.now() - grabTime)/1000
  console.log '----- checkTime: ' + checkTime
  if checkTime > 120 # 2min
    grabTime = Date.now()
    console.log '----- Interval grabTime: ' + checkTime
    # fs.write "TimeOutError_" + Date.now() + '.error', checkTime
    websocket.evaluate (serverUrl, agentName)->
      taskHub = $.connection.taskHub
      $.connection.hub.start().done ->
        taskHub.server.registerAgent agentName
        console.log 're-connect done. '
      .fail (msg)->
        console.log 'connect fail. ' + msg
    , serverUrl, agentName
, 60000 # 1min

CastTesk = (task)->
  grabTime = Date.now()
  console.log "~CastTesk: " + JSON.stringify task
  pageGrab = webpage.create()
  if task.userAgent
    pageGrab.settings.userAgent = task.userAgent
  else
    pageGrab.settings.userAgent = 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36'
  pageGrab.settings.loadImages = false
  now = Date.now()
  gbdate = {}

  pageGrab.onConsoleMessage = (msg) ->
    console.log '~Evaluate: ' + msg
  pageGrab.onError = (msg, trace) ->
    console.error "~EvaluateError_#{task.source}_#{task.commandType}:"
    _onError msg, trace
  pageGrab.onResourceRequested = (data, request) ->
    if (/http:\/\/.+?\.css/g).test(data["url"]) or data.headers["Content-Type"] is "text/css" #http://goo.gl/3P8ltr
      console.log "~BLOCKED CSS: " + data.url
      request.abort()
      return
    result = /^https?:\/\/([^\/]+)/.exec data.url #adblock http://goo.gl/8Cn9ZE
    if result
      if /\.doubleclick\./.test result[1] or #pretty format http://goo.gl/A9Gv3n
      /\.baidustatic\.com$/.test result[1] or
      /\.alimama\.cn$/.test result[1] or
      /\.google-analytics\.com$/.test result[1] or
      /\.baodu\.com$/.test result[1] or
      /\.cnzz\.com$/.test result[1]
        console.log "~BLOCKED AD: " + result[1]
        request.abort()
  # pageGrab.onResourceReceived = (data, request) ->
    # if task.commandType == "Response"
    #   gbdate = JSON.stringify data

  pageGrab.open task.url, (status) -> #encodeURI(task.url)
    if status isnt 'success'
      task.status = 2 #Fail
      task.error = 'Unable to access page'
    # else if task.commandType == "Response"
    #     task.status = 3 #Done
    else
      if not task.withoutJquery
        pageGrab.injectJs 'jquery-2.1.0.min.js'
      if task.withUnderscore
        pageGrab.injectJs 'underscore-min.js'
      if task.withDate
        pageGrab.injectJs 'date.js'
      pageGrab.injectJs "grabscripts/#{task.source}_#{task.commandType}.js"
      gbdate = pageGrab.evaluate ->
        return spGrab()
      task.spend = (Date.now() - now)/1000
      if not gbdate
        task.status = 2 #Fail
        task.error = 'gbdate is false'
      else
        task.status = 3 #Done
    pageGrab.close()

    websocket.evaluate (serverUrl, task, data)->
      taskHub = $.connection.taskHub
      taskHub.server.doneTask task
      if task.status != 2 #not Fail
        $.post serverUrl + "/task/post" + task.articleType + task.commandType,
          taskjson: JSON.stringify task
          datajson: JSON.stringify data
        #console.log "websocket data" + JSON.stringify data
    , serverUrl, task, gbdate