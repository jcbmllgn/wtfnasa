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
        .state "all_facts",
          url: "/facts"
          templateUrl: "view_all_facts.html"

        .state "home",
          # home has to come after all_facts otherwise going to /facts will redirect to /
          url: "/{id}"
          templateUrl: "home.html"

  ]
