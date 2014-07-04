// var app = angular.module('pageDataApp', [])
//   .directive('onFinishRender', function ($timeout) {
//     return {
//       restrict: 'A',
//       link: function (scope, element, attr) {
//         if (scope.$last === true) {
//           $timeout(function () {
//               scope.$emit(attr.onFinishRender);
//           });
//         }
//       }
//     };
// });

// app.controller('projectListCtrl', ['$scope', '$http',
//   function ($scope, $http) {
//     $http.get('projects.json').success(function(data) {
//       $scope.projectList = data;
//       $scope.thisProj = data[0];
      
//       $scope.$on('setTinyNav', function(ngRepeatFinishedEvent) {

//         //Switch between tabs - small screen
//         $(".side-nav").on("change", function(e) {
//           e.preventDefault();
//           navSelect($(this).find("select"));
//         });

//         //tinynav 
//         $(function () {
//           $("#nav").tinyNav();
//         });

//       });

//       $scope.$on('setGallery', function(ngRepeatFinishedEvent) {
        
//         //Magnific-Popup
//         $('.gallery').each(function() { // the containers for all your galleries
//           $(this).magnificPopup({
//             delegate: 'a', // the selector for gallery item
//             type: 'image',
//             gallery: {
//               enabled:true
//             }
//           });
//         });
//       });

//       $scope.tabSelect = function(el) {
//         $scope.thisProj = el;
//       };
//     });
//   }]);

// app.controller('contactListCtrl', ['$scope', '$http',
//   function ($scope, $http) {
//     $http.get('contact.json').success(function(data) {
//       $scope.contactList = data;
//     });
//   }]);