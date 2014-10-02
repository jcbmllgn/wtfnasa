angular.module("pillpack_app.routes", [ "ui.router" ])
  .config ($stateProvider, $urlRouterProvider, $locationProvider) ->
    $locationProvider
      .html5Mode(true)
      .hashPrefix("!")

    $urlRouterProvider.otherwise "/dashboard"



angular.module("wtfnasa_app.routes", [ "ui.router" ])
  .config [
    "$locationProvider"
    "$stateProvider"
    "$urlRouterProvider"
    ( $locationProvider, $stateProvider, $urlRouterProvider ) ->
      $locationProvider
        .html5Mode(true)
        .hashPrefix("!")

      $urlRouterProvider.otherwise("/");

      $stateProvider
        .state "home",
          url: "/"
          templateUrl: "home.html"

        .state "all_facts",
          url: "/facts"
          templateUrl: "all_facts.html"
  ]
