.controller "RitzauController", ($scope, $rootScope, $http, $timeout, tracker) ->
  candidates = null

  $rootScope.order = "name"
  $rootScope.reverse = false

  watch = $scope.$watch "header", (data) ->
    if data
      $rootScope.headline = data.ritzau.headline
      $rootScope.paragraph = data.ritzau.paragraph

      watch()

  addCandidates = (offset) ->
    $scope.candidates = candidates.splice(offset, 50)

    offset += 50

    if offset < candidates.length
      $timeout ->
        addCandidates(offset)
      , 5

  $http.get "#{apiUrl}/storkreds/kandidater"
    .success (data) ->
      candidates = data

      addCandidates(0)

    .error (data, status, headers, config) ->
      return

  tracker.track()
