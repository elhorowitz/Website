/* Controllers */

//angular
var phonecatApp = angular.module('phonecatApp', []);

phonecatApp.controller('PhoneListCtrl', function ($scope, $http) {
  $http.get('projects.json').success(function(data) {

    $scope.projects = data;
  }).error(function(){
    console.log("oh no!");
  });

  $scope.orderProp = 'age';
});