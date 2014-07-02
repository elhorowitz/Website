var app = angular.module('pageDataApp', []);

app.controller('projectListCtrl', ['$scope', '$http',
  function ($scope, $http) {
    $http.get('projects.json').success(function(data) {
      $scope.projectList = data;
      $scope.thisProj = data[0];

      $scope.tabSelect = function(el) {
        $scope.thisProj = el;
      };
    });
  }]);