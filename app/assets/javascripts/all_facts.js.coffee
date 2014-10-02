angular.module( "wtfnasa_app.facts", [ "wtfnasa_app.api" ] )
  .controller "AllFactsController", [
    "$scope"
    "$API"
    ( $scope, $API ) ->
      $API.cacheQuery().$promise.then (data) ->
        $scope.facts = data
  ]
