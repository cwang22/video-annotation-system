;(function($){
    $.fn.extend({
        timeline: function( options ) {

            this.defaultOptions = {};

            var settings = $.extend({}, this.defaultOptions, options);

            return this.each(function() {
              var _duration = settings.duration;
              var _start = settings.start;
              var _end = settings.end;
              var _id = settings.id;
              var _width, _pos, m;
              _pos = (_start / _duration) * 100;
              console.log(_end == null);
              m = $("<div class=\"segment\" data-id=\""+_id+"\"></div>");
              if(_end == null){
                _width = 0.5;
                m.addClass("object");
              }else{
                _width = 100 * (_end - _start) / _duration;
              }
              m.css({"width":_width+'%',"left":_pos+'%'});
              $(this).append(m);

            });

        }

    });

})(jQuery);