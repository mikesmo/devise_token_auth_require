'use strict'

require.config(
  deps: ['jquery']
  paths:
    jquery: '/assets/jquery/dist/jquery'
    angular: '/assets/angular/angular'
    domReady: '/assets/domReady/domReady'
    'angular-cookies': '/assets/angular-cookies/angular-cookies'
    'ng-token-auth': 'ng-token-auth/dist/ng-token-auth'
  shim:
    angular:
      deps: ['jquery']
      exports: 'angular'
    'angular-cookies':
      deps: ['angular']
    'ng-token-auth':
      deps: ['angular-cookies']
)

require([
    'angular'
    'domReady'
    'ng-token-auth'
    'angular-cookies'
  ],
(angular, domReady) ->
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
  domReady(
    () ->
      angular.bootstrap(document, ['myApp'])
  )
)

