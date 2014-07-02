/* Controllers */

//angular
var dataController = angular.module('dataController', []);
dataController.controller('dataController', ['$scope', '$http',
  function ($scope, $http) {
    $http.get('projects.json').success(function(data) {
      $scope.projects = data;
    });
}]);