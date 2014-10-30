<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
  uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link href="<c:url value="/resources/assets/css/sb-admin-2.css"/>"
  rel="stylesheet">
</head>
<body>
  <%@ include file="include/header.jsp"%>
  <div id="blue">
    <div class="container">
      <div class="row">
        <h3>
          <span class="text-capitalize">Annotations</span>
        </h3>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <div id="main" class="container">
    <div class="row">
      <div class="col-lg-3 col-md-6">
        <div class="panel panel-green">
          <div class="panel-heading">
            <div class="row">
              <div class="col-xs-3">
                <i class="fa fa-file-video-o fa-5x"></i>
              </div>
              <div class="col-xs-9 text-right">
                <div class="huge">${annotationCount}</div>
                <div>Segments</div>
              </div>
            </div>
          </div>
          <a href="<c:url value="bhl"/>">
            <div class="panel-footer">
              <span class="pull-left">export</span> <span
                class="pull-right"><i
                class="fa fa-arrow-circle-right"></i></span>
              <div class="clearfix"></div>
            </div>
          </a>
        </div>
      </div>
      <div class="col-lg-3 col-md-6">
        <div class="panel panel-primary">
          <div class="panel-heading">
            <div class="row">
              <div class="col-xs-3">
                <i class="fa fa-file-image-o fa-5x"></i>
              </div>
              <div class="col-xs-9 text-right">
                <div class="huge">${objectCount}</div>
                <div>Objects</div>
              </div>
            </div>
          </div>
          <a href="<c:url value="/updatesteam"/>">
            <div class="panel-footer">
              <span class="pull-left">export</span> <span
                class="pull-right"><i
                class="fa fa-arrow-circle-right"></i></span>
              <div class="clearfix"></div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>
</body>
</html>