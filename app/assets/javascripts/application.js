/**
 *= require vendor/fastclick/lib/fastclick.js
 *= require vendor/angular/angular.js
 *= require vendor/angular-sanitize/angular-sanitize.js
 *= require vendor/angular-ui-router/release/angular-ui-router.js
 *
 * Get all the Angular templates
 * (https://github.com/pitr/angular-rails-templates)
 *= require angular-rails-templates
 *= require_tree ../templates
 */

'use strict';

angular.module('attendance', ['ngSanitize', 'ui.router', 'templates'])
  .config(['$stateProvider', function ($stateProvider) {
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'home.html',
        controller: 'HomeCtrl'
      })
      .state('classroom-period', {
        url: '/classroom-period/:id',
        templateUrl: 'classroom-period.html',
        controller: 'ClassroomPeriodCtrl'
      })
      .state('student', {
        url: '/student/:id',
        templateUrl: 'student.html',
        controller: 'StudentCtrl'
      });
  }])
  .config(['$urlRouterProvider', function ($urlRouterProvider) {
    $urlRouterProvider
      .otherwise('/');
  }]);

angular.module('attendance')
  .controller('HomeCtrl', ['$scope', '$http', function ($scope, $http) {
    $scope.message = 'Hello';
  }]);

angular.module('attendance')
  .controller('ClassroomPeriodCtrl', function ($scope) {
    $scope.message = 'Hello';
  });

angular.module('attendance')
  .controller('StudentCtrl', ['$scope', function ($scope) {

  }]);