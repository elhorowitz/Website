
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
