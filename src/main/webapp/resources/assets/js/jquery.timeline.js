;(function($){
    $.fn.extend({
        timeline: function( options ) {

            this.defaultOptions = {};

            var settings = $.extend({}, this.defaultOptions, options);

            return this.each(function() {

              var m = $("<div class=\"segment\"></div>");
              var _duration = settings.duration;
              var _start = settings.start;
              var _end = settings.end;
              var _width = 100 * (_end - _start) / _duration;
              var _pos = (_start / _duration) * 100;
              m.css({"width":_width+'%',"left":_pos+'%'});
              console.log(m);
              $(this).append(m);

            });

        }

    });

})(jQuery);