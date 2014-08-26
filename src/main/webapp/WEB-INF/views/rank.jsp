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
						<a class="ui step" href="<c:url value="/video/mark/${video.id}" />" >Marking</a>
						<a class="ui step" href="<c:url value="/video/select/${video.id}" />" >Selecting</a>
						<a class="ui active step">Ranking</a>
					</div>
					<h1 class="ui huge header">${video.title} - Rank Segments</h1>
					<i class="time icon"></i>11 Aug 2014
					<hr>
					<form>
						<div id="sortwarp">
							<div class="row">
								<div class="col-lg-12">
									<ol id="sort" class="ui list-unstyled">
										<li class="ui segment">
											<div class="row">
												<div class="col-lg-6">
													<h2 class="ui header">segment 1</h2>
													<div class="sub header">
														<i class="time icon"></i>0:00 - 0.3021
													</div>
													<p>some text description could go here</p>
												</div>
												<div class="col-lg-6">
													<img src="holder.js/400x200" />
												</div>
											</div>
										</li>
									</ol>

									<!-- <ol id="sort" class="list-unstyled">
										<li>
											<div class="jumbotron">
												<div class="row">
													<div class="col-lg-6">
														<p>text descritions bla bla bla</p>
														<p>start: 0.12313</p>
														<p>end: 5.3123</p>
													</div>
													<div class="col-lg-6">
														<img class="img-responsive"
															src="http://video-js.zencoder.com/oceans-clip.png" />
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="jumbotron">
												<div class="row">
													<div class="col-lg-6">
														<p>text descritions bla bla bla</p>
														<p>start: 0.12313</p>
														<p>end: 5.3123</p>
													</div>
													<div class="col-lg-6">
														<img class="img-responsive"
															src="http://video-js.zencoder.com/oceans-clip.png" />
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="jumbotron">
												<div class="row">
													<div class="col-lg-6">
														<p>text descritions bla bla bla</p>
														<p>start: 0.12313</p>
														<p>end: 5.3123</p>
													</div>
													<div class="col-lg-6">
														<img class="img-responsive"
															src="http://video-js.zencoder.com/oceans-clip.png" />
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="jumbotron">
												<div class="row">
													<div class="col-lg-6">
														<p>text descritions bla bla bla</p>
														<p>start: 0.12313</p>
														<p>end: 5.3123</p>
													</div>
													<div class="col-lg-6">
														<img class="img-responsive"
															src="http://video-js.zencoder.com/oceans-clip.png" />
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="jumbotron">
												<div class="row">
													<div class="col-lg-6">
														<p>text descritions bla bla bla</p>
														<p>start: 0.12313</p>
														<p>end: 5.3123</p>
													</div>
													<div class="col-lg-6">
														<img class="img-responsive"
															src="http://video-js.zencoder.com/oceans-clip.png" />
													</div>
												</div>
											</div>
										</li>
										<li>
											<div class="jumbotron">
												<div class="row">
													<div class="col-lg-6">
														<p>text descritions bla bla bla</p>
														<p>start: 0.12313</p>
														<p>end: 5.3123</p>
													</div>
													<div class="col-lg-6">
														<img class="img-responsive"
															src="http://video-js.zencoder.com/oceans-clip.png" />
													</div>
												</div>
											</div>
										</li>
									</ol>
 -->

								</div>
							</div>
							<div id="bottom-nav">
								<div class="row">
									<div class="col-lg-2 pull-right">
										<input type="submit" value="sumbit"
											class="ui blue large button" />
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="include/footer.jsp"%>
	<%@ include file="include/script.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#sort").dragsort({
				dragSelector : "li",
				dragEnd : function() {
				},
				dragBetween : false,
				placeHolderTemplate : "<li></li>"
			});
		});
	</script>
</body>
</html>