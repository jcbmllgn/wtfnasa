angular.module("wtfnasa_app.routes", [])
  .config [
    "$locationProvider"
    ( $locationProvider ) ->
      $locationProvider
        .html5Mode(true)
        .hashPrefix("!")
  ]
