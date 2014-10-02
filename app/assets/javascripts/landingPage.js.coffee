angular.module( "wtfnasa_app.home", [ "wtfnasa_app.api", "LocalStorageModule" ] )
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
    "$API"
    "$filter"
    "localStorageService"
    "$state"
    "$stateParams"
    ( $http, $scope, $API, $filter, localStorageService, $state, $stateParams ) ->

      $scope.factHistory = []
      localStorageService.bind($scope, 'factHistory', $scope.factHistory)

      $API.cacheQuery().$promise.then (data) ->
        $scope.facts = data

        if parseInt( $stateParams.id ) > 0
          # wtfnasa.com/:id:
          $scope.fact = $filter('getById')( $scope.facts, $stateParams.id )

          if $scope.fact is null
            # If you go to wtfnasa.com/23478927489023740
            # there is no fact with that id, change the url back to wtfnasa.com
            # then show a random fact
            $scope.randomFact()

        else
          # I'm updating the path here to handle the case where someone types in wtfnasa.com/0
          $scope.randomFact()

      $scope.randomFact = (current_fact_id, vote) ->
        $scope.fact = $scope.facts[Math.floor(Math.random() * $scope.facts.length)];

        $state.go( 'home', id: $scope.fact.id )

        $scope.factHistory.push( $scope.fact )

      $scope.vote = ( up_or_down_vote ) ->
        $API.save( { action: up_or_down_vote }, { id: $scope.fact.id } )
        $scope.randomFact()
    ]
