.controller "RitzauController", ($scope, $rootScope, $http, $timeout, tracker) ->
  candidates = null
  offset = 0

  $rootScope.order = "name"
  $rootScope.reverse = false
  $scope.candidates = []

  watch = $scope.$watch "header", (data) ->
    if data
      $rootScope.headline = data.ritzau.headline
      $rootScope.paragraph = data.ritzau.paragraph

      watch()

  addCandidates = (offset) ->
    $scope.candidates = $scope.candidates.concat candidates.slice(offset, (offset + 50))

    if offset < candidates.length
      offset += 50

      $timeout ->
        addCandidates(offset)
      , 5

  $http.get "#{apiUrl}/storkreds/kandidater"
    .success (data) ->
      candidates = data

      addCandidates(offset)
    .error (data, status, headers, config) ->
      return

  tracker.track()
