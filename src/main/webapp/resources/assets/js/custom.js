$('.ui.sidebar').sidebar();
$('.ui.launch.button').click(function() {
	$('#sidebar').sidebar('toggle');
});

String.prototype.toHHMMSS = function () {
  var mills = this.match("\\.\\d{1,3}");
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

$("span.time").each(function(){
  $(this).text($(this).text().toHHMMSS());
});