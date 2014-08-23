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
					<h1>${video.title}</h1>
					<h4>18:16 15 Aug 2014</h4>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="60"
							aria-valuemin="0" aria-valuemax="100" style="width: 90%;"></div>
					</div>

					<!-- annotation navigation -->

					<div class="row">
						<div class="col-lg-4 gray">
							<h4 class="text-center">Marking</h4>
						</div>
						<div class="col-lg-4 gray">
							<h4 class="text-center">Selecting</h4>
						</div>
						<div class="col-lg-4">
							<h4 class="text-center">Ranking</h4>
						</div>
					</div>
					<form>
						<div id="sortwarp">
							<div class="row">
								<div class="col-lg-12">
									<h1>Rank annotations</h1>

									<ol id="sort" class="list-unstyled">
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


								</div>
							</div>
							<div id="bottom-nav">
								<div class="row">
									<div class="col-lg-2 pull-right">
										<input type="submit" value="sumbit"
											class="btn btn-lg btn-primary" />
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
</body>
</html>