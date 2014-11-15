app = angular.module('myApp', ['ng-token-auth'])
app.controller('HomeController', ($scope) ->
  $scope.message = 'Hello world'
)