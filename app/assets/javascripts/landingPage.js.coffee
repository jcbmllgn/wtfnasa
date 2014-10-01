angular.module( "wtfnasa_app.facts", [ "wtfnasa_app.api" ] )
  .filter "getById",[ ->
    "input"
    "id"
    (input, id) ->
      i = 0
      len = input.length
      while i < len
        return input[i]  if +input[i].id is +id
        i++
      null
  ]
  .controller "LandingPageController", [
    "$http"
    "$scope"
    "$location"
    "$API"
    "$filter"
    ( $http, $scope, $location, $API, $filter ) ->

      $API.query().$promise.then (data) ->
        $scope.facts = data

        id = parseInt( $location.$$url.replace(/\D/g,'') )
        if id > 0
          # wtfnasa.com/:id:
          $scope.fact = $filter('getById')($scope.facts, id)

          if $scope.fact is null
            # If you go to wtfnasa.com/23478927489023740
            # there is no fact with that id, change the url back to wtfnasa.com
            # then show a random fact
            $scope.randomFact()

        else
          # I'm updating the path here to handle the case where someone types in wtfnasa.com/0
          $scope.randomFact()

      $scope.randomFact = (current_fact_id, vote) ->
        debugger
        $scope.fact = $scope.facts[Math.floor(Math.random() * $scope.facts.length)];
        $location.path("/#{$scope.fact.id}")

      $scope.vote = ( up_or_down_vote ) ->
        $API.save( { action: up_or_down_vote }, id: $scope.fact.id )
        $scope.randomFact()
    ]
