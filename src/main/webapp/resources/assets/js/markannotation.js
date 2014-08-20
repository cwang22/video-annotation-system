/**
 * 
 */
$(document).ready(function(){
	$("#sort").dragsort({ dragSelector: "li", dragEnd: function() { }, dragBetween: false, placeHolderTemplate: "<li></li>" });
});

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
		$('#result').append('<tr><td><input name="time[][start]" value="' + startTime + '" /></td><td><input name="time[][end]" value="' + endTime + '"/></td><td><button class="delete-button btn btn-xs btn-danger">delete</button></td></tr>');
		addDeleteButtonListener();
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





