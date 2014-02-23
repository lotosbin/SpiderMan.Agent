system = require "system"
webpage = require "webpage"
if system.args.length isnt 3
  console.log 'serverUrl and agentName is necessary!'
  phantom.exit 1
agentName = system.args[1]
serverUrl = system.args[2]

websocket = webpage.create()
websocket.settings.localToRemoteUrlAccessEnabled = true
websocket.onConsoleMessage = (info) -> console.log "~Websocket: " + info
websocket.onCallback = (info) ->
  switch info.command
    when "CastTesk"
      CastTesk info.task
websocket.injectJs './jquery-2.1.0.min.js'
websocket.injectJs './jquery.signalR-2.0.2.min.js'
websocket.includeJs serverUrl + '/signalr/hubs', ->
  websocket.evaluate (serverUrl, agentName)->
    $.support.cors = false #todo: don't understand now
    $.connection.hub.url = serverUrl + '/signalr'
    taskHub = $.connection.taskHub
    $.connection.hub.start().done ->
      $.support.cors = true
      #console.log taskHub.connection.id
      taskHub.server.registerAgent agentName
    taskHub.client.castTesk = (task) ->
      castTesk =
        command: "CastTesk"
        task: task
      window.callPhantom castTesk
  , serverUrl, agentName

CastTesk = (task)->
  console.log "~CastTesk: " + JSON.stringify task
  pageGrab = webpage.create()
  pageGrab.settings.userAgent = 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36'
  pageGrab.settings.loadImages = false
  now = Date.now()
  gbdate = {}

  pageGrab.onConsoleMessage = (msg) ->
    console.log '~Evaluate: ' + msg
  pageGrab.onError = (msg, trace) ->
    msgStack = [msg]
    if trace
      trace.forEach (t)->
        msgStack.push " -> " + t.file + ": " + t.line + (t.function ? " (in function '" + t.function + "')" : "")
    console.log '~EvaluateError_#{task.source}_#{task.commandType}: ' + msgStack.join("\n")
  pageGrab.onResourceReceived = (res) ->
    if task.commandType == "Response"
      gbdate = JSON.stringify res

  pageGrab.open task.url, (status) -> #encodeURI(task.url)
    if status isnt 'success'
      task.status = 2 #Fail
      task.error = 'Unable to access page'
    else
      if task.commandType == "Response"
        task.status = 3 #Done
      else
        if not task.withoutJquery
          pageGrab.injectJs 'jquery-2.1.0.min.js'
        if task.withUnderscore
          pageGrab.injectJs 'underscore-min.js'
        pageGrab.injectJs "grabscripts/#{task.source}_#{task.commandType}.js"
        gbdate = pageGrab.evaluate ->
          return spGrab()
        pageGrab.close()
        task.spend = (Date.now() - now)/1000
        if not gbdate
          task.status = 2 #Fail
          task.error = 'gbdate is false'
        else
          task.status = 3 #Done

    websocket.evaluate (serverUrl, task, data)->
      taskHub = $.connection.taskHub
      taskHub.server.doneTask task
      if task.status != 2 #not Fail
        #console.log "data:" + JSON.stringify data
        $.post serverUrl + "/task/post" + task.articleType + task.commandType,
          taskjson: JSON.stringify task
          datajson: JSON.stringify data
    , serverUrl, task, gbdate