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

myPlayer = videojs("example_video_1");
startTime = 0;
endTimer = 0;
$(document).ready(function(){
	
	$("#start-button").click(function(){
		//alert("start");

		startTime = myPlayer.currentTime().toFixed(3).toString();
		myPlayer.play();
		$(this).addClass("disabled");
		$("#end-button").removeClass("disabled");	
	});
	
	$("#end-button").click(function(){
		//alert("end");
		endTime = myPlayer.currentTime().toFixed(3).toString();
		//alert(startTime + " " + endTime);
		$(this).addClass("disabled");
		$("#start-button").removeClass("disabled");
		$('#result').append('<tr><td><input name="va[][startTime]" value="' + startTime.toHHMMSS() + '" disabled /></td><td><input name="va[][endTime]" value="' + endTime.toHHMMSS() + '" disabled /></td><td><button class="delete-button btn btn-xs btn-danger">delete</button></td></tr>');
		addDeleteButtonListener();
	});
	
	$("form").submit(function(){
		$('form').append('<textarea class="hidden" name="json">' + JSON.stringify($("form").serializeJSON()) + '</textarea>');
		return
	});
});

function addDeleteButtonListener() {
	$('.delete-button').each(function(){
		//alert("each");
		$(this).click(function(){
			//alert("delete");
			$(this).parent().parent().remove();
		});
	});
}





