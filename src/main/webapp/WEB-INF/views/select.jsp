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
						<a class="ui step"
							href="<c:url value="/video/mark/${video.id}" /> ">Marking</a> <a
							class="ui active step">Selecting</a> <a class="ui disabled step">Ranking</a>
					</div>
					<h1 class="ui huge header">${video.title}-Select Key Frames</h1>
					<i class="time icon"></i>11 Aug 2014
					<hr>

					<c:forEach items="${vas}" var="vas" varStatus="status">

						<section class="ui segment">
							<h2 class="ui header">
								segment
								<c:out value="${status.count}" />
							</h2>
							<div class="sub header">
								<i class="time icon"></i>
								<c:out value="${vas.starttime}" />
								-
								<c:out value="${vas.endtime}" />
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
					</c:forEach>

					<div id="bottom-nav">
						<div class="row">
							<div class="col-lg-2 pull-right">
								<form>
									<input type="submit" value="sumbit"
										class="btn btn-primary btn-lg" />
								</form>
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
		$(function() {
			var $slideshow = $('.slideshow').slides();
		});

		$(function() {
			$(".slide img")
					.each(
							function() {
								$(this)
										.click(
												function() {
													$(this)
															.parent()
															.parent()
															.parent()
															.children()
															.children()
															.children(
																	".selected")
															.remove();
													$(this)
															.parent()
															.append(
																	'<span class="ui right green corner label selected"><i class="checkmark icon"></i></span>');
												});
							});

			$("form").submit(function() {
				alert("hi");
				$(".selected").parent().children("img").each(function() {
					alert($(this).attr("src"));
				});
				return true;
			});
		});
	</script>
</body>
</html>