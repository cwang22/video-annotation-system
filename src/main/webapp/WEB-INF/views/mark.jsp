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

</head>
<body>


	<%@ include file="include/header.jsp"%>
	<div id="videowarp">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="ui three huge steps text-center">
						<a class="ui active step" href="<c:url value="/video/mark/${video.id}" /> ">Marking</a>
						<a class="ui disabled step">Selecting</a>
						<a class="ui disabled step">Ranking</a>
					</div>
					<h1 class="ui huge header">${video.title}</h1>
					<i class="time icon"></i>11 Aug 2014<i class="time icon"></i>11 Aug
					2014
					<hr>

					<!-- video player -->

					<video id="example_video_1" class="video-js vjs-default-skin"
						controls preload="auto" width="1140" height="460"
						poster="http://video-js.zencoder.com/oceans-clip.png"
						data-setup='{"example_option":true}'>
						<source src="${video.source}" type='video/mp4' />
						<p class="vjs-no-js">
							To view this video please enable JavaScript, and consider
							upgrading to a web browser that <a
								href="http://videojs.com/html5-video-support/" target="_blank">supports
								HTML5 video</a>
						</p>
					</video>

					<!--  -->
					<div id="bottom-nav">
						<div class="row">
							<div class="col-lg-2">
								<button id="start-button" type="button"
									class="btn btn-primary btn-lg">Start</button>
							</div>
							<div class="col-lg-2">
								<button id="end-button" type="button"
									class="btn btn-primary btn-lg disabled">End</button>
							</div>
							<div class="col-lg-8">
								<form action="<c:url value="/video/mark"/>" method="post">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>Start</th>
												<th>End</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="result"></tbody>
										<tfoot>
											<tr>
												<td><input id="id" type="hidden" name="id" value="${video.id}" /></td>
												<td></td>
												<td><input class="btn btn-xs btn-success" type="submit"
													value="submit" /></td>
											</tr>
										</tfoot>
									</table>
								</form>
							</div>
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
	<%@ include file="include/footer.jsp"%>
	<%@ include file="include/script.jsp"%>
	<script src="<c:url value="/resources/assets/js/jquery.serializejson.min.js" />"></script>
	<script src="<c:url value="/resources/assets/js/markannotation.js" />"></script>

</body>
</html>