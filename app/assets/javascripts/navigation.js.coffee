angular.module( "wtfnasa_app.navigation", [ "ui.router" ] )
  .controller "NavigationController", ( $scope, $state ) ->
    $scope.state = $state

