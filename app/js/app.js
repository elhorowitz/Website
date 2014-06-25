;(function ($) {
  $(function () {
    'use strict';
    
    var self = {},
      tabSelect,
      navSelect,
      setProject,
      setMediaQuery
    ;

    //Function to set header project description
    setProject = function (el) {
      var title = $("#" + el + " .title").html();
      var tag = $("#" + el + " .tag").html();
      var date = $("#" + el + " .date").html();

      $(".portfolio .sample .title").text(title);
      $(".portfolio .sample .tag").text(tag);
      $(".portfolio .sample .date").text(date);
    };

    //Function to switch between tabs - big screen
    tabSelect = function (el) {
      var project = el.attr("id") + "-story";

      $("#" + project).siblings().addClass("hidden");
      $("#" + project).removeClass("hidden");

      el.closest("li").addClass("selected");
      el.closest("li").siblings().removeClass("selected");

      setProject(project);
    };

    //Function to switch between tabs - small screen
    navSelect = function (el) {
      var project = el.val() + "-story";
      $("#" + project).siblings().addClass("hidden");
      $("#" + project).removeClass("hidden");

      setProject(project);
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

      //tinynav 
      $(function () {
        $("#nav").tinyNav();
      });

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