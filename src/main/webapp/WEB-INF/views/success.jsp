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
<div id="blue">
    <div class="container">
      <div class="row">
        <h3><span class="text-capitalize">Success</span></h3>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <%@ include file="include/header.jsp"%>
  <div id="main">
    <div class="container">
      <div class="row">
        <c:forEach items="${videos}" var="video" varStatus="status">
          <div class="col-lg-3">
            <a class="thumbnail"
              href="<c:url value="video/mark/${video.id}" />"> <img
              src="/va/resources/videoframe/${video.id}/100.jpg" />
            </a>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>

</body>
</html>