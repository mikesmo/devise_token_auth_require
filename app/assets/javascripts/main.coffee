app = angular.module('myApp', ['ng-token-auth'])

app.config(($authProvider) ->
  $authProvider.configure(
    apiUrl: 'http://0.0.0.0:3000'
  )
)

app.controller('HomeController', ($scope, $auth) ->
  $scope.message = 'Hello world'

  $scope.handleRegBtnClick = () ->
    $auth.submitRegistration($scope.registrationForm)
)