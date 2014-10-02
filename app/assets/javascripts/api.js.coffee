angular.module("wtfnasa_app.api", ["ngResource"])
  .factory "$API", [
    "$resource"
    ( $resource ) ->
      $resource "/api/facts/:id/:action", {
        # defaults: go_here
        }, {
          cache:
            method: "GET"
            cache: true
          cacheQuery:
            method: "GET"
            isArray: true
            cache: true
        }
  ]


