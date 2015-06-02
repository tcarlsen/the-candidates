.controller "RitzauController", ($scope, $rootScope, $http) ->
  $rootScope.order = "name"
  $rootScope.reverse = false
  $rootScope.description = "På denne side kan du se, hvor mange personlige stemmer alle landets folketingskandidater har fået. Der tages forbehold for evt. yderligere fintællinger"

  $http.get "#{apiUrl}/storkreds/kandidater"
    .success (data) ->
      $scope.candidates = data
    .error (data, status, headers, config) ->
      return
