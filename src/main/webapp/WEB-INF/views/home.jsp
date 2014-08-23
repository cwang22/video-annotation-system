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

	<!-- *****************************************************************************************************************
	 HEADERWRAP
	 ***************************************************************************************************************** -->
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<h3>watch smarter</h3>
					<h1>Video Annotation System</h1>
					<h5>Easy 3 Steps to mark Annotations</h5>
					<h5>to change the way interact with video</h5>
				</div>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /headerwrap -->

	<!-- *****************************************************************************************************************
	 SERVICE LOGOS
	 ***************************************************************************************************************** -->
	<div id="service">
		<div class="container">
			<div class="row centered">
				<div class="col-md-4">
					<i class="fa fa-heart-o"></i>
					<h4>Watching</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book.</p>
				</div>
				<div class="col-md-4">
					<i class="fa fa-comment-o"></i>
					<h4>Marking</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book.</p>
				</div>
				<div class="col-md-4">
					<i class="fa fa-trophy"></i>
					<h4>Ranking</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book.</p>

				</div>
			</div>
		</div>
		<! --/container -->
	</div>
	<! --/service -->
	<!-- *****************************************************************************************************************
	 TESTIMONIALS
	 ***************************************************************************************************************** -->
	<div id="twrap">
		<div class="container centered">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<i class="fa fa-comment-o"></i>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's standard
						dummy text ever since the 1500s, when an unknown printer took a
						galley of type and scrambled it to make a type specimen book. It
						has survived not only five centuries, but also the leap into
						electronic typesetting, remaining essentially unchanged.</p>
					<h4>
						<br />Marcel Newman
					</h4>
					<p>WEB DESIGNER - BLACKTIE.CO</p>
				</div>
			</div>
			<! --/row -->
		</div>
		<! --/container -->
	</div>
	<! --/twrap -->

	<!-- *****************************************************************************************************************
	 OUR CLIENTS
	 ***************************************************************************************************************** -->
	<div id="cwrap">
		<div class="container">
			<div class="row centered">
				<h3>OUR CLIENTS</h3>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<img src="resources/assets/img/clients/client01.png"
						class="img-responsive">
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<img src="resources/assets/img/clients/client02.png"
						class="img-responsive">
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<img src="resources/assets/img/clients/client03.png"
						class="img-responsive">
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<img src="resources/assets/img/clients/client04.png"
						class="img-responsive">
				</div>
			</div>
			<! --/row -->
		</div>
		<! --/container -->
	</div>
	<! --/cwrap -->
	<%@ include file="include/footer.jsp"%>
	<%@ include file="include/script.jsp"%>

</body>
</html>