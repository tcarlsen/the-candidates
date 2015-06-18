.service "tracker", ($location) ->
  track: ->
    host = $location.$$host

    if host isnt "localhost"
      appId = "valgtekandidater"
      appPath = $location.$$path
      host = "politiko"

      ga("send", "pageview", "#{host}-#{appId}/##{appPath}")
