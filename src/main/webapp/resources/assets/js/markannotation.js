/**
 * 
 */


myPlayer = videojs("example_video_1");
startTime = 0;
endTimer = 0;
$(document).ready(function(){
	
	$("#start-button").click(function(){
		//alert("start");

		startTime = myPlayer.currentTime();
		myPlayer.play();
		$(this).addClass("disabled");
		$("#end-button").removeClass("disabled");	
	});
	
	$("#end-button").click(function(){
		//alert("end");
		endTime = myPlayer.currentTime();
		//alert(startTime + " " + endTime);
		$(this).addClass("disabled");
		$("#start-button").removeClass("disabled");
		$('#result').append('<tr><td><input name="va[][startTime]" value="' + startTime + '" /></td><td><input name="va[][endTime]" value="' + endTime + '"/></td><td><button class="delete-button btn btn-xs btn-danger">delete</button></td></tr>');
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





