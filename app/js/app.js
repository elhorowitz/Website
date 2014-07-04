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

      $scope.$on('setTinyNav', function(ngRepeatFinishedEvent) {

        //tinynav 
        $(function () {
          $("#nav").tinyNav();
        });

      });

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




;(function ($) {
  $(function () {
    'use strict';
    
    var self = {},
      setMediaQuery,
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

    //Function for Media Queries
    setMediaQuery = function (el) {
      //Only show one image if for mobile
      if (el) {
        $(".gallery").append("<p class=\"directions\">Click for more pictures</p>");
        $(".gallery").each(function() {
          $(this).find("a:not(:first)").addClass("hidden");
        });
      } else {
        $(".gallery").children("p").remove();
        $(".thumbnail").removeClass("hidden");   
      } 
    };



    self.initialize = function () {

      //Switch between tabs - small screen
      $(".side-nav").on("change", function(e) {
        e.preventDefault();
        navSelect($(this).find("select"));
      });

      //detect media-queries
      setMediaQuery(Modernizr.mq('(max-width: 41.75em)'));
      $(window).resize(function() {
        setMediaQuery(Modernizr.mq('(max-width: 41.75em)'));
      });
      
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