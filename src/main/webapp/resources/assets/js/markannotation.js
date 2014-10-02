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
endTimer = 0;

$(function(){
  $("form").find("input[name^='vas']").each(function(){
    $(this).attr("data-seconds",$(this).val());
    $(this).val($(this).val().toHHMMSS());
  });
});

$(document).ready(
 function(){
  $("#start-button").click(function() {
    startTime = myPlayer.currentTime();
    myPlayer.play();
    $(this).addClass("disabled");
    $("#end-button").removeClass("disabled");
  });
  
  $("#end-button").click(
    function() {
      endTime = myPlayer.currentTime();
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
        + '<input name="vas['+i+'].startTime" class="form-control" data-seconds="'
        + startTime.toFixed(3)
        + '" value="'
        + startTime.toFixed(3).toString().toHHMMSS()
        + '" disabled /><div class="input-group-btn-vertical"><button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button><button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button></div></div></td><td><div class="input-group spinner"><input name="vas['+i+'].endTime" class="form-control"  data-seconds="'
        + endTime.toFixed(3)
        + '" value="'
        + endTime.toFixed(3).toString().toHHMMSS()
        + '" disabled /><div class="input-group-btn-vertical"><button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button><button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button></div></div></td><td><button type="button" class="play-button btn btn-primary">play</button>&nbsp;<button class="delete-button btn btn-danger">delete</button></td></tr>');

      $(".timeline").timeline({
        "duration":myPlayer.duration(),
        "start":startTime,
        "end":endTime
      });

      addButtonListener();
    });

    $("form").submit(function(){
      $(this).find('input[name^="va"]').removeAttr('disabled').each(function() {
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
  $('.delete-button').each(function() {
    // alert("each");
    $(this).click(function(e) {
      e.preventDefault();
      // alert("delete");
      $(this).parent().parent().remove();
    });
  });

  $('.play-button').each(function() {
    $(this).click(function() {
      var startAt = $(this).parent().parent().children().children("input[name='vas[][startTime]']").val().toSeconds();
      var stopAt = $(this).parent().parent().children().children("input[name='vas[][endTime]']").val().toSeconds();
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
    $(this).mousedown(function() {
      var button = $(this);
      intervalReturn = setInterval(function() {
        var input = button.parents(".spinner").children("input");
        var seconds = parseFloat(input.attr("data-seconds"));
        console.log("seconds:" + seconds);
        seconds += 0.04;
        console.log("seconds:" + seconds);
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

  $("#result tr").each(function() {
    $(this).hover(function() {
      var startAt = $(this).children().children().children("input[name='va[][startTime]']").val().toSeconds();
      var endAt = $(this).children().children().children("input[name='va[][endTime]']").val().toSeconds();
      console.log(startAt + "," + endAt);
      myPlayer.markers({
        setting: {
          forceInitialization: true,
          markerStyle: {
            'width': '7px',
            'border-radius': '0',
            'background-color': 'white',
            'opcity': '15%'
          }
        },

        marker_breaks: [[startAt, endAt]],
        marker_text: ["start", "end"]
      });
    }, function() {
      $(".vjs-marker").remove();
    });
  });
}

function addSegment(startTime,endTime){


}