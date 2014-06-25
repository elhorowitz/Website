;(function ($) {
  $(function () {
    'use strict';
    
    var self = {},
      tabSelect,
      navSelect
    ;

    //Function to switch between tabs - big screen
    tabSelect = function (el) {
      var project = el.attr("id") + "-story";
      $("#" + project).siblings().addClass("hidden");
      $("#" + project).removeClass("hidden");

      el.closest("li").addClass("selected");
      el.closest("li").siblings().removeClass("selected");

    };

    //Function to switch between tabs - small screen
    navSelect = function (el) {
      var project = el.val() + "-story";
      $("#" + project).siblings().addClass("hidden");
      $("#" + project).removeClass("hidden");

    };


    self.initialize = function () {

      //tinynav 
      $(function () {
        $("#nav").tinyNav();
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

      //Switch between tabs - large screen
      $(".nav-item-wrapper").on("click", function(e) {
        e.preventDefault();
        tabSelect($(this));
      });

      //Switch between tabs - small screen
      $(".side-nav").on("change", function(e) {
        e.preventDefault();
        navSelect($(this).find("select"));
      });


      return self;
    };

    self.initialize();
    
  });

})(jQuery);