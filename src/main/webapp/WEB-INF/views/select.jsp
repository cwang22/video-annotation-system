<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Video Annotation System</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon"
	href="<c:url value="/resources/assets/ico/favicon.ico"/>">
<%@ include file="include/stylesheet.jsp"%>
<link href="<c:url value="/resources/assets/css/slideshow.css"/>"
	rel="stylesheet">

</head>
<body>
	<%@ include file="include/header.jsp"%>
	<div id="videowarp">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="ui three huge steps text-center">
						<div class="ui step">Marking</div>
						<div class="ui active step">Selecting</div>
						<div class="ui disabled step">Ranking</div>
					</div>
					<h1 class="ui huge header">${video.title} - Select Key Frames</h1>
					<i class="time icon"></i>11 Aug 2014
					<hr>
					<section class="ui segment">
						<h2 class="ui header">segment 1</h2>
						<div class="sub header">
							<i class="time icon"></i>0:00 - 0.3021
						</div>
						<hr>
						<div class="slideshow" data-pagination="false" data-auto="0">
							<ul class="ss-carousel">
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
							</ul>
						</div>
					</section>

					<section class="ui segment">
						<h2 class="ui header">segment 2</h2>
						<div class="sub header">
							<i class="time icon"></i>0:00 - 0.3021
						</div>
						<hr>
						<div class="slideshow" data-visible="4" data-pagination="false"
							data-auto="0">
							<ul class="ss-carousel">
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
							</ul>
						</div>
					</section>

					<section class="ui segment">
						<h2 class="ui header">segment 3</h2>
						<div class="sub header">
							<i class="time icon"></i>0:00 - 0.3021
						</div>
						<hr>
						<div class="slideshow" data-visible="4" data-pagination="false"
							data-auto="0">
							<ul class="ss-carousel">
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
								<li class="slide">
									<div>
										<img src="holder.js/240x240" alt="" width="240" height="240" />
									</div>
								</li>
							</ul>
						</div>
					</section>

					<div id="bottom-nav">
						<div class="row">
							<div class="col-lg-2 pull-right">
								<input type="submit" value="sumbit" class="ui blue large button" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- sidebar -->
		<div id="sidebar" class="ui red vertical large sidebar menu">
			<a class="item"> <i class="home large icon"></i> Home
			</a> <a class="item"> <i class="video large icon"></i>All Videos
			</a>
			<div class="item">
				<b>More</b>
			</div>
			<div class="item">
				<a href="#" class="thumbnail"> <img src="holder.js/240x240" />
				</a> <a href="#" class="thumbnail"> <img src="holder.js/240x240" />
				</a><a href="#" class="thumbnail"> <img src="holder.js/240x240" />
				</a>
			</div>
		</div>
		<div id="sidebar-button"
			class="ui black huge launch right attached button">
			<i class="icon video"></i> <span class="text">Videos</span>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
	<%@ include file="include/script.jsp"%>
	<script src="<c:url value="/resources/assets/js/slideshow.js"/>"></script>
	<script type="text/javascript">
		// Create slideshow instances
		$(function(){
			var $slideshow = $('.slideshow').slides();
		});
		


		$(function() {
			$(".slide img").each(function() {
				$(this).click(function() {
					$(this).parent().parent().parent().children().children().children(".selected").remove();
					$(this).parent().append('<span class="ui right green corner label selected"><i class="checkmark icon"></i></span>');
				});
			});
		});
	</script>
</body>
</html>