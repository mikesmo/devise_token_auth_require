app = angular.module('myApp', ['ng-token-auth'])

app.config(($authProvider) ->
  $authProvider.configure(
    apiUrl: 'http://0.0.0.0:3000'
  )
)

app.controller('HomeController', ($scope, $auth) ->
  $scope.message = 'Hello world'

  $scope.$on('auth:validation-success', (ev, user) ->
    alert("Welcome, "+user.email+". Your account has been verified.")
  )

  $scope.handleRegBtnClick = () ->
    $auth.submitRegistration($scope.registrationForm)

  $scope.handleLoginBtnClick = () ->
    $auth.submitLogin($scope.loginForm)
      .then((resp) ->
        alert('success')
    ).catch(resp) ->
      alert('error')

  $scope.handleSignOutBtnClick = () ->
    $auth.signOut()
)