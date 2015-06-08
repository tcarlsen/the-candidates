.controller "RitzauController", ($scope, $rootScope, $http) ->
  $rootScope.order = "name"
  $rootScope.reverse = false

  watch = $scope.$watch "header", (data) ->
    if data
      $rootScope.headline = data.ritzau.headline
      $rootScope.paragraph = data.ritzau.paragraph

      watch()

  $http.get "#{apiUrl}/storkreds/kandidater"
    .success (data) ->
      $scope.candidates = data
    .error (data, status, headers, config) ->
      return
