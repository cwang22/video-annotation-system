/**
 * 
 */
String.prototype.toHHMMSS = function () {
  var mills = this.match("\\.\\d{3}");
  var sec_num = parseInt(this, 10); // don't forget the second param
  var hours   = Math.floor(sec_num / 3600);
  var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
  var seconds = sec_num - (hours * 3600) - (minutes * 60);

  if (hours   < 10) {hours   = "0"+hours;}
  if (minutes < 10) {minutes = "0"+minutes;}
  if (seconds < 10) {seconds = "0"+seconds;}
  var time    = hours+':'+minutes+':'+seconds+mills;
  return time;
}

String.prototype.toSeconds = function () {
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
$(document).ready(function(){
	
	$("#start-button").click(function(){
		// alert("start");

		startTime = myPlayer.currentTime();
		myPlayer.play();
		$(this).addClass("disabled");
		$("#end-button").removeClass("disabled");	
	});
	
	$("#end-button").click(function(){
		// alert("end");
		endTime = myPlayer.currentTime();
		// alert(startTime + " " + endTime);
		$(this).addClass("disabled");
		$("#start-button").removeClass("disabled");
		$('#result').append('<tr><td><input name="va[][startTime]" value="' + startTime.toFixed(3).toString().toHHMMSS() + '" disabled /></td><td><input name="va[][endTime]" value="' + endTime.toFixed(3).toString().toHHMMSS() + '" disabled /></td><td><button type="button" class="play-button btn btn-xs btn-primary">play</button>&nbsp;<button class="delete-button btn btn-xs btn-danger">delete</button></td></tr>');
		addButtonListener();
	});
	
	$("form").submit(function(){
		$('form').append('<textarea class="hidden" name="json">' + JSON.stringify($("form").serializeJSON()) + '</textarea>');
		return
	});
});

function addButtonListener() {
	$('.delete-button').each(function(){
		// alert("each");
		$(this).click(function(e){
		  e.preventDefault();
			// alert("delete");
			$(this).parent().parent().remove();
		});
	});
	
	$('.play-button').each(function(){
    $(this).click(function(){
      var startAt = $(this).parent().parent().children().children("input[name='va[][startTime]']").val().toSeconds();
      var stopAt  = $(this).parent().parent().children().children("input[name='va[][endTime]']").val().toSeconds();
      myPlayer.currentTime(startAt).play();
      
      var pausePlayer = function(){
        if(Math.abs( myPlayer.currentTime() - stopAt ) < 0.1){
          myPlayer.pause();
          myPlayer.off('timeupdate',pausePlayer);
        }
      };
      
      myPlayer.on('timeupdate',pausePlayer);
      
      });
    });
	
	$("#result tr").each(function(){
	  $(this).hover(function(){
	    console.log("hoveron");
	    var startAt = $(this).children().children("input[name='va[][startTime]']").val().toSeconds();
	    var endAt = $(this).children().children("input[name='va[][endTime]']").val().toSeconds();
	    console.log(startAt + "," + endAt);
	    myPlayer.markers({
	      setting: {
	        forceInitialization:true,
	        markerStyle:{
	          'width':'7px',
	          'border-radius': '0',
	          'background-color': 'white',
	          'opcity': '15%'
	        }
	      },
	      
	      marker_breaks:[[startAt, endAt]],
	      marker_text:["start","end"]
	   });
	  },function(){$(".vjs-marker").remove();});
	});
	
}




