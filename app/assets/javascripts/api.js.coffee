angular.module("wtfnasa_app.api", ["ngResource"])

  .factory "$API", ( $resource ) ->
    $resource "/api/facts/:id/:action"

