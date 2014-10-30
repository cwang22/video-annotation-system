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
              var _text = settings.text;
              var _width, _pos, m;
              _pos = (_start / _duration) * 100;
              m = $("<div class=\"segment\" data-id=\""+_id+"\"></div>");
              if(_end == null){
                _width = 0.5;
                m.addClass("object");
                m.attr("data-seconds",_start);
              }else{
                _width = 100 * (_end - _start) / _duration;
              }
              
              if(_text != null){
                m.attr("data-toggle","tooltip");
                m.attr("data-placement","right");
                m.attr("title",_text);
              }
              m.css({"width":_width+'%',"left":_pos+'%'});
              $(this).append(m);

            });

        }

    });

})(jQuery);