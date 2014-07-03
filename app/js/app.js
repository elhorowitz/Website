;(function ($) {
  $(function () {
    'use strict';
    
    var self = {},
      setMediaQuery
    ;

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

      return self;
    };

    self.initialize();
    
  });

})(jQuery);