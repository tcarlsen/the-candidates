.directive "theCandidates", ($filter, $location, $rootScope, $http) ->
  restrict: "A"
  templateUrl: "the-candidates.html"
  link: (scope, element, attrs) ->
    socket = io "http://hosting-docker-fv15-ws-1802147016.eu-west-1.elb.amazonaws.com"
    allowPopup = true

    scope.location = $location.$$path.replace "/", ""

    $rootScope.$on "$locationChangeSuccess", ->
      scope.location = $location.$$path.replace "/", ""

    scope.changeView = (location) ->
      $location.path location
      scope.location = location

    $rootScope.changeOrder = (order) ->
      if $rootScope.order is order
        $rootScope.reverse =! $rootScope.reverse
      else
        $rootScope.order = order
        $rootScope.reverse = false

    $rootScope.refresh = ->
      document.location.reload(true)

    $rootScope.terminate = ->
      $rootScope.showPopup = false

      allowPopup = false

    $http.get "#{apiUrl}/header"
      .success (data) ->
        $rootScope.header = data
        $rootScope.updated = data.last_update.replace(" ", "T")
        $rootScope.stats = data.stats
      .error (data, status, headers, config) ->
        return

    socket.on "data_updated", ->
      if allowPopup
        $rootScope.$apply -> $rootScope.showPopup = true
