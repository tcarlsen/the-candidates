.config ($routeProvider) ->
  $routeProvider
    .when "/partier",
      templateUrl: "parties.html"
      controller: "PartyController"
    .when "/kandidater",
      templateUrl: "candidates.html"
      controller: "CandidateController"
    .when "/ritzau",
      templateUrl: "ritzau.html"
      controller: "RitzauController"
    .otherwise "/partier"
