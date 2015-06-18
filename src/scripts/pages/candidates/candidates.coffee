.controller "CandidateController", ($scope, $rootScope, $http, tracker) ->
  $rootScope.order = 'name'
  $rootScope.reverse = false

  watch = $scope.$watch "header", (data) ->
    if data
      $rootScope.headline = data.trafik.headline
      $rootScope.paragraph = data.trafik.paragraph

      watch()

  $http.get "#{apiUrl}/kandidater"
    .success (data) ->
      $scope.candidates = data
    .error (data, status, headers, config) ->
      return

  tracker.track()
