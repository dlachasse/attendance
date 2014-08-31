/**
 *= require vendor/fastclick.js
 *= require vendor/angular.min.js
 *= require vendor/angular-sanitize.min.js
 *= require vendor/angular-ui-router.min.js
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
      .state('classroom-periods', {
        url: '/classroom-periods',
        templateUrl: 'classroom-periods.html',
        controller: 'ClassroomPeriodsCtrl'
      })
      .state('classroom-period', {
        url: '/classroom-period/:id',
        templateUrl: 'classroom-period.html',
        controller: 'ClassroomPeriodCtrl'
      })
      .state('users', {
        url: '/users',
        templateUrl: 'users.html',
        controller: 'UsersCtrl'
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
  .controller('ClassroomPeriodsCtrl', function ($scope, $http) {
    $http.get('/api/classroom_periods')
      .then(function (data) {
        $scope.periods = data.data;
      });
  });

angular.module('attendance')
  .controller('ClassroomPeriodCtrl', function ($scope) {
    $scope.message = 'Hello';
  });

angular.module('attendance')
  .controller('UsersCtrl', function ($scope, $http) {
    $http.get('/api/users')
      .then(function (data) {
        var users = data.data.sort(function (a, b) {
          if (a.last_name > b.last_name) {
            return 1;
          } else if (a.last_name < b.last_name) {
            return -1;
          }
           return 0;
        });

        $scope.users = users;
      });
  });

angular.module('attendance')
  .controller('StudentCtrl', function ($scope, $stateParams, $http) {
    // Get student records
    var studentId = $stateParams.id;

    if (typeof studentId !== 'undefined') {
      $http.get('/api/users/' + studentId)
        .then(function (data) {
          $scope.user = data.data;
        });
      $http.get('/api/users/' + studentId + '/classroom_periods')
        .then(function (data) {
          var courses = data.data.sort(function (a, b) {
            if (a.course_id > b.course_id) {
              return 1;
            } else if (a.course_id < b.course_id) {
              return -1;
            }
            return 0;
          })

          $scope.courses = courses;
        });
    }

  });