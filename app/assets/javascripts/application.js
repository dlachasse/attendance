/**
 *= require vendor/fastclick.js
 *= require vendor/angular.js
 *= require vendor/angular-sanitize.js
 *= require vendor/angular-ui-router.js
 *
 * Get all the Angular templates
 * (https://github.com/pitr/angular-rails-templates)
 *= require angular-rails-templates
 *= require_tree ../templates
 *
 * Load Boostrap's JavaScripts
 *= require jquery
 *= require bootstrap-sprockets
 *
 * FitVids
 *=require vendor/jquery.fitvids.js
 */

'use strict';

// Fitvids
$('.video').fitVids();

window.addEventListener('load', function() {
  FastClick.attach(document.body);
}, false);

angular.module('attendance', ['ngSanitize', 'ui.router', 'templates'])
  .config(['$stateProvider', function ($stateProvider) {
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'home.html',
        controller: 'HomeCtrl'
      })
      .state('class', {
        abstract: true,
        url: '/class',
        template: '<ui-view />'
      })
      .state('class.list', {
        url: '',
        templateUrl: 'class-list.html',
        controller: 'ClassListCtrl'
      })
      .state('class.detail', {
        url: '/:id',
        templateUrl: 'class-detail.html',
        controller: 'ClassDetailCtrl'
      })
      .state('users', {
        abstract: true,
        url: '/users',
        template: '<ui-view />'
      })
      .state('users.list', {
        url: '',
        templateUrl: 'users.html',
        controller: 'UsersCtrl'
      })
      .state('users.detail', {
        url: '/:id',
        templateUrl: 'user-detail.html',
        controller: 'UserDetailCtrl'
      })
      .state('attendance', {
        url: '/attendance',
        templateUrl: 'new-attendance.html',
        controller: 'NewAttendanceCtrl'
      })
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
  .controller('ClassListCtrl', ['$scope', '$http', function ($scope, $http) {
    $http.get('/api/classroom_periods')
      .then(function (data) {
        $scope.periods = data.data;
      });
  }]);

angular.module('attendance')
  .controller('ClassDetailCtrl', ['$scope', '$stateParams', '$http', function ($scope, $stateParams, $http) {
    $scope.message = 'Hello';

    var id = $stateParams.id;

    if (typeof id !== 'undefined') {
      $http.get('/api/classroom_period/' + id)
        .then(function (data) {
          console.log(data.data);

          $scope.course = data.data;
        });
    }
  }]);

angular.module('attendance')
  .controller('UsersCtrl', ['$scope', '$http', function ($scope, $http) {
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
  }]);

angular.module('attendance')
  .controller('UserDetailCtrl', ['$scope', '$stateParams', '$http', function ($scope, $stateParams, $http) {
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
  }]);

angular.module('attendance')
  .controller('NewAttendanceCtrl', ['$scope', '$http', function ($scope, $http) {
    $scope.attendancesDate = 'Today';

    $http.get('/api/attendance')
      .then(function (data) {
        $scope.attendances = data.data;
        console.log(data.data);
      });
  }]);