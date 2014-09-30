angular.module( "wtfnasa_app.facts", [] )
  .controller "LandingPageController", ( $http, $scope ) ->
    $http.get('assets/wtfnasa_facts.json')
      .then (res) ->
        $scope.facts = res.data;



