.controller "CandidateController", ($scope, $rootScope, $http) ->
  $rootScope.order = 'name'
  $rootScope.reverse = false

  $http.get "#{apiUrl}/kandidater"
    .success (data) ->
      $scope.candidates = data
    .error (data, status, headers, config) ->
      return
