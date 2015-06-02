.controller "PartyController", ($scope, $rootScope, $http) ->
  $rootScope.order = 'name'
  $rootScope.reverse = false

  $http.get "#{apiUrl}/partier"
    .success (data) ->
      $scope.parties = data
    .error (data, status, headers, config) ->
      return
