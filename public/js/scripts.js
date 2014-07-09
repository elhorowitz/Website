/* App Module */

var phonecatApp = angular.module('phonecatApp', [
  // 'ngRoute',
  // 'phonecatAnimations',
  'phonecatControllers'
  // 'phonecatFilters',
  // 'phonecatServices'
]);

// phonecatApp.config(['$routeProvider',
//   function($routeProvider) {
//     $routeProvider.
//       when('/phones', {
//         templateUrl: 'partials/phone-list.html',
//         controller: 'PhoneListCtrl'
//       }).
//       when('/phones/:phoneId', {
//         templateUrl: 'partials/phone-detail.html',
//         controller: 'PhoneDetailCtrl'
//       }).
//       otherwise({
//         redirectTo: '/phones'
//       });
//   }]);
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

;(function ($) {
  $(function () {
    'use strict';
    
    var self = {},
      navSelect
    ;

    //Function to switch between tabs - small screen
    navSelect = function (el) { 
      var projectID = el.val();
      angular.forEach($scope.projectList, function(project) {
        if (project.id == projectID) {
          $scope.tabSelect(project);
          console.log($scope.thisProj);
        }
      });
    };

    self.initialize = function () {
      
      //Smooth Scroll code developed by Chris Coyier and Devin Sturgeon  
      $('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') || location.hostname == this.hostname) {
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html,body').animate({ 
              scrollTop: target.offset().top
            }, 1000);

            return false;
          }
        }
      });

      return self;
    };

    self.initialize();
    
  });

})(jQuery);

var app = angular.module('pageDataApp', [])
  .directive('onFinishRender', function ($timeout) {
    return {
      restrict: 'A',
      link: function (scope, element, attr) {
        if (scope.$last === true) {
          $timeout(function () {
              scope.$emit(attr.onFinishRender);
          });
        }
      }
    };
});

app.controller('projectListCtrl', ['$scope', '$http',
  function ($scope, $http) {
    $http.get('projects.json').success(function(data) {
      $scope.projectList = data;
      $scope.thisProj = data[0];

      $scope.tabSelect = function(el) {
        $scope.thisProj = el;
      };

      $scope.selected = true;

      $scope.$on('setGallery', function(ngRepeatFinishedEvent) {

        //Magnific-Popup
        $('.gallery').each(function() { // the containers for all your galleries
          $(this).magnificPopup({
            delegate: 'a', // the selector for gallery item
            type: 'image',
            gallery: {
              enabled:true
            }
          });
        });
      });
      
    });
  }]);

app.controller('contactListCtrl', ['$scope', '$http',
  function ($scope, $http) {
    $http.get('contact.json').success(function(data) {
      $scope.contactList = data;
    });
  }]);

app.controller('storyCtrl', ['$scope', '$http',
  function ($scope, $http) {
    $http.get('story.json').success(function(data) {
      $scope.paragraphList = data;
    });
  }]);