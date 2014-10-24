<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <div class="col-lg-offset2 himg margin-bottom">
          <img src="<c:url value="/resources/assets/img/browser.jpg"/>" />
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
          <i class="fa fa-pencil"></i>
          <h4>Marking</h4>
          <p>Marking videos to indicate what is the most important 
          segments and objects in a video.</p>
        </div>
        <div class="col-md-4">
          <i class="fa fa-check"></i>
          <h4>Selecting</h4>
          <p>Selecting from segments you have just marked to indicate what are important frames.</p>
        </div>
        <div class="col-md-4">
          <i class="fa fa-trophy"></i>
          <h4>Ranking</h4>
          <p>Ranking key frames to indicate the importance compare with other frames.</p>

        </div>
      </div>
    </div><!-- /container -->
  </div><!-- /service -->
  <!-- *****************************************************************************************************************
	 TESTIMONIALS
	 ***************************************************************************************************************** -->
  <div id="twrap">
    <div class="container centered">
      <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
          <i class="fa fa-comment-o"></i>
          <h2 class="white">get started right now</h2>
          <p>simple 15 seconds to complete register form to start your tour at Video Annotation System.
           </p><p>Get started now to create your own video dataset</p>
            <a class="btn btn-lg btn-default" href="/va/register">Register
                </a>
              <button type="submit" class="btn btn-lg btn-default">Sign
                in</button>
        </div>
      </div><!-- /row -->
    </div><!-- /container -->
  </div><!--/twrap -->
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>

</body>
</html>