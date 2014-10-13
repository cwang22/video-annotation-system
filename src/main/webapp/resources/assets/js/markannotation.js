/**
 * 
 */
String.prototype.toHHMMSS = function() {
  var mills = this.match("\\.\\d{1,3}");
  var sec_num = parseInt(this, 10); // don't forget the second param
  var hours = Math.floor(sec_num / 3600);
  var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
  var seconds = sec_num - (hours * 3600) - (minutes * 60);

  if (hours < 10) {
    hours = "0" + hours;
  }
  if (minutes < 10) {
    minutes = "0" + minutes;
  }
  if (seconds < 10) {
    seconds = "0" + seconds;
  }
  var time = hours + ':' + minutes + ':' + seconds + mills;
  return time;
}

String.prototype.toSeconds = function() {
  var match = this.match("(\\d{2,}):(\\d{2}):(\\d{2})(\\.\\d{3})");
  var hours = parseInt(match[1]);
  var minutes = parseInt(match[2]);
  var seconds = parseInt(match[3]);
  var mills = match[4];
  var time = (hours * 3600 + minutes * 60 + seconds).toString() + mills;
  return time;
}

myPlayer = videojs("example_video_1");
startTime = 0;
endTime = 0;
haveSetStart = false;
anno.addPlugin('PolygonSelector', { activate: true });

//Player control
$(function(){
  player = videojs("example_video_1");
  player.on("pause",function(){
    $("#start-button").addClass("disabled");
    $("#thumbnail").empty();
    var id = parseInt($("video").attr("data-id"));
    var currentTime = player.currentTime();
    var m = $("<ul class=\"elastislide-list\"></ul>");
    var startTime = currentTime - 0.5;
    var endTime = currentTime + 0.5;
    var startFrame = Math.floor(startTime * 25);
    var endFrame = Math.floor(endTime * 25);
    for(var i = startFrame; i < endFrame; i++){
      var li = $("<li><img src=\"/va/resources/videoframe/"+id+"/"+i+".jpg\" data-frame=\""+i+"\" width=\"150\" height=\"150\" /><span class=\"ui left green corner label hide\"><i class=\"checkmark icon\"></i></span></li>");
      m.append(li);
    }
    $("#thumbnail").append(m);
    $(".elastislide-list").elastislide({
      minItems: 2
    });
    
    $(".elastislide-list img").each(function() {
      $(this).click(function() {
        if ($(this).hasClass("selected")) {
          $(this).removeClass("selected").siblings().addClass("hide");
          if(!haveSetStart){
            $("#start-button").addClass("disabled");
          }else{
            $("#end-button").addClass("disabled");
          }
        } else {
          $(".selected").removeClass("selected").siblings().addClass("hide");
          $(this).addClass("selected").siblings().removeClass("hide");
          if(!haveSetStart){
            $("#start-button").removeClass("disabled");
          }else{
            $("#end-button").removeClass("disabled");
          }
        }
      });
    });
  });
});



$(function(){
  addButtonListener();
  var $form = $("form");
  $form.find(".form-control.time").each(function(){
    $(this).attr("data-seconds",$(this).val());
    $(this).val($(this).val().toHHMMSS());
  });
  
  myPlayer.one("play",function(){
    var $tr = $form.find("tr[data-id]");

    $tr.each(function(){
      var seg_id = parseInt($(this).attr("data-id"));
      var seg_start = parseFloat($(this).find(".start.time").attr("data-seconds"));
      var seg_end = parseFloat($(this).find(".end.time").attr("data-seconds"));
      var seg_duration = myPlayer.duration();
      console.log("called");
      
      $(".timeline").timeline({
        "id":seg_id,
        "duration":myPlayer.duration(),
        "start":seg_start,
        "end":seg_end
      });
    });
    addButtonListener();
  });
});

$(document).ready(
 function(){
  $("#start-button").click(function() {
    var frame = parseInt($(".selected").attr("data-frame"));
    startTime = (frame / 25).toFixed(3);
    $(this).addClass("disabled");
    haveSetStart = true;
  });
  
  $("#end-button").click(
    function() {
      var frame = parseInt($(".selected").attr("data-frame"));
      endTime = (frame / 25).toFixed(3);
      $(this).addClass("disabled");
      $("#start-button").removeClass("disabled");
      
      var i;
      
      if($("#result").has("tr").length == 0){
        i = 0;
      }else{
        i = parseInt($("#result tr:last-child").attr("data-id")) + 1;
      }
      
      $('#result').append(
          '<tr data-id="'+i+'"><td><div class="input-group spinner">'
        + '<input name="vas['+i+'].startTime" class="form-control start time" data-seconds="'
        + startTime
        + '" value="'
        + startTime.toString().toHHMMSS()
        + '" disabled /><div class="input-group-btn-vertical"><button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button><button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button></div></div></td><td><div class="input-group spinner"><input name="vas['+i+'].endTime" class="form-control end time"  data-seconds="'
        + endTime
        + '" value="'
        + endTime.toString().toHHMMSS()
        + '" disabled /><div class="input-group-btn-vertical"><button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button><button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button></div></div></td><td><input type="text" name="vas['+i+'].description" class="form-control"></td><td><button type="button" class="play-button btn btn-primary">play</button>&nbsp;<button type="button" class="delete-button btn btn-danger">delete</button></td></tr>');

      $(".timeline").timeline({
        "id":i,
        "duration":myPlayer.duration(),
        "start":startTime,
        "end":endTime
      });

      addButtonListener();
      haveSetStart = false;
    });
  
    $("#object-button").click(function(){
      var video = document.getElementById("example_video_1_html5_api");
      var canvas = document.getElementById("c");
      var context = canvas.getContext("2d");
      var cw = canvas.width;
      var ch = canvas.height;
      context.drawImage(video,0,0,cw,ch);

      var url = canvas.toDataURL();
      var m = $("<img id=\"anno-object\"/>");
      m.attr("src",url);
      $("#thumbnail").empty().append(m);
      anno.makeAnnotatable(document.getElementById('anno-object'));
    });
    
    anno.addHandler('onAnnotationCreated', function(annotation) {
      //console.log(JSON.stringify(annotation));
      var videoid = parseInt($("video").attr("data-id"));
      var video = {"id":videoid,"title":null,"source":null,"duration":null};
      var text = annotation.text;
      var time = myPlayer.currentTime();
      var points = annotation.shapes[0].geometry.points;
      

      /**
       * long id;
  String text;
  double time;
  List<Point> points;
       */
      var obj = annotation;
      var ajaxdata = {"id":0,
              "video":video,
              "user":null,
              "text":text,
              "time":time,
              "points":points};
      //var testjson = {"id":0,"video":null,"user":{"username":"1","password":"1","enabled":true,"accountNonExpired":true,"accountNonLocked":true,"credentialsNonExpired":true,"name":"1","institution":"1","authorities":[{"authority":"ROLE_ADMIN"}]},"text":null,"time":1.254,"points":[{"x":0.1512,"y":0.5123},{"x":0.4512,"y":0.7123}]};
      console.log(JSON.stringify(ajaxdata));
      $.ajax({
        'Accept': 'application/json',
        'url': "/va/objects/",
        'type': "POST",
        'contentType': "application/json;charset=UTF-8",
        'dataType': 'json',
        'data': JSON.stringify(ajaxdata)
      });

    });

    $("form").submit(function(){
      $(this).find(".form-control.time").removeAttr('disabled').each(function() {
        $(this).val($(this).attr('data-seconds'));
      });
      //$('form').append('<textarea class="hidden" name="json">' + JSON.stringify($("form").serializeJSON()) + '</textarea>');
    });

    $("#prev-button").click(function() {
      myPlayer.currentTime(myPlayer.currentTime() - 0.04);
    });

    $("#next-button").click(function() {
      myPlayer.currentTime(myPlayer.currentTime() + 0.04);
    });
    
    myPlayer.on("timeupdate", function(){
      $(".vjs-current-time-display span:first")[0].nextSibling.data = myPlayer.currentTime().toString().toHHMMSS()
      $(".vjs-duration-display span:first")[0].nextSibling.data = myPlayer.duration().toString().toHHMMSS();
    });
  });




function addButtonListener() {
  $(".delete-button").each(function() {
    $(this).click(function(e) {
      var result = confirm("Click OK to delete selected segment");
      var $tr = $(this).closest("tr");
      var id = $tr.attr("data-id");
      var $segment = $('.timeline .segment[data-id="'+id+'"]');
      if(result){
        if($tr.find("input[type=\"hidden\"]").length == 0){
          $tr.remove();
          $segment.remove();
        }else{
          console.log("called");
          var id = $tr.find("input[type=\"hidden\"]").val();
          $.ajax({
            type: "DELETE",
            url: "/va/annotation/"+id
          }).done(function(){
            $tr.remove();
            $segment.remove();
          });
        }
      }
    });
  });

  $(".play-button").each(function() {
    $(this).click(function() {
      var startAt = $(this).closest("tr").find(".start.time").attr("data-seconds");
      var stopAt = $(this).closest("tr").find(".end.time").attr("data-seconds");
      myPlayer.currentTime(startAt).play();

      var pausePlayer = function() {
        if (Math.abs(myPlayer.currentTime() - stopAt) < 0.1) {
          myPlayer.pause();
          myPlayer.off('timeupdate', pausePlayer);
        }
      };

      myPlayer.on('timeupdate', pausePlayer);

    });
  });

  $(".spinner .btn:first-of-type").each(function() {
    var intervalReturn;
    $(this).click(function(){
      var input = $(this).parents(".spinner").children("input");
      var seconds = parseFloat(input.attr("data-seconds"));
      seconds += 0.04;
      input.attr("data-seconds", seconds)
      input.val(seconds.toString().toHHMMSS());
    });
    $(this).mousedown(function() {
      var button = $(this);
      intervalReturn = setInterval(function() {
        var input = button.parents(".spinner").children("input");
        var seconds = parseFloat(input.attr("data-seconds"));
        seconds += 0.04;
        input.attr("data-seconds", seconds)
        input.val(seconds.toString().toHHMMSS());
      }, 100);
    });

    $(this).mouseup(function() {
      clearInterval(intervalReturn);
    });

  });

  $(".spinner .btn:last-of-type").each(function() {
    var intervalReturn;
    $(this).click(function(){
      var input = $(this).parents(".spinner").children("input");
      var seconds = parseFloat(input.attr("data-seconds"));
      seconds -= 0.04;
      input.attr("data-seconds", seconds)
      input.val(seconds.toString().toHHMMSS());
    });
    $(this).mousedown(function() {
      var button = $(this);
      intervalReturn = setInterval(function() {
        var input = button.parents(".spinner").children("input");
        var seconds = parseFloat(input.attr("data-seconds"));
        console.log("seconds:" + seconds);
        seconds -= 0.04;
        console.log("seconds:" + seconds);
        input.attr("data-seconds", seconds)
        input.val(seconds.toString().toHHMMSS());
      }, 100);
    });

    $(this).mouseup(function() {
      clearInterval(intervalReturn);
    });

  });
/*
  $("#result tr").each(function(){
    var id = $(this).val("data-id");
    var $segment = $('.timeline .segment[data-id="'+id+'"]');
    console.log($segment);
    $(this).hover(function(){
      $segment.css("background-color","#fff");
    },function(){
      $segment.css("background-color","#00b3fe");
    });
  });*/
    
}