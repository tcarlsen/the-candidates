.controller "PartyController", ($scope, $rootScope, $http, $timeout, tracker) ->
  parties = null
  offset = 0

  $rootScope.order = 'name'
  $rootScope.reverse = false
  $scope.parties = []

  watch = $scope.$watch "header", (data) ->
    if data
      $rootScope.headline = data.trafik.headline
      $rootScope.paragraph = data.trafik.paragraph

      watch()

  addParties = (offset) ->
    $scope.parties = $scope.parties.concat parties.slice(offset, (offset + 1))

    if offset < parties.length
      offset += 1

      $timeout ->
        addParties(offset)
      , 5

  $http.get "#{apiUrl}/partier"
    .success (data) ->
      parties = data

      addParties(offset)
    .error (data, status, headers, config) ->
      return

  tracker.track()
