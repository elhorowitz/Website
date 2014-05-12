;(function ($) {
  $(function () {
    'use strict';
    
    var self = {},
      expandIt,
      collapseIt
    ;

    expandIt = function (el) {
      var topic = el.attr('class').split(/\s+/)[1];
      var target = "." + topic + ".big";
      $(target).toggleClass('expanded');
    };

    collapseIt = function (el) {
      
    };

    self.initialize = function () {
        
      $('.resume').on('click', function (e) {
        e.preventDefault();
        expandIt($(this));
      });

      $('.portfolio').on('click', function (e) {
        e.preventDefault();
        expandIt($(this));
      });

      $('.close').on('click', function (e) {
        e.preventDefault();
        collapseIt($(this));
      });

      return self;
    };

    self.initialize();
    
  });

})(jQuery);