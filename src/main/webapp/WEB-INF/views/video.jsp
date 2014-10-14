<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
  uri="http://www.springframework.org/security/tags"%>
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
        <h3><span class="glyphicon glyphicon-film"></span> Videos</h3>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>

  <%@ include file="include/header.jsp"%>
  <div id="main">
    <div class="container">
      <div class="row">
        <c:forEach items="${newvideos}" var="nvideo" varStatus="status">
          <div class="col-lg-3">
            <a class="thumbnail"
              href="<c:url value="video/mark/${nvideo.id}" />"> <img
              src="/va/resources/videoframe/${nvideo.id}/100.jpg" />
            </a>
          </div>
        </c:forEach>
        <c:forEach items="${startedvideos}" var="svideo"
          varStatus="status">
          <div class="col-lg-3">
            <a class="thumbnail" href="<c:url value="video/mark/${svideo.id}" />">
              <span class="ui left blue corner label">
                <i class="exclamation icon"></i>
              </span>
              <img src="/va/resources/videoframe/${svideo.id}/100.jpg" />
            </a>
          </div>
        </c:forEach>
        <c:forEach items="${finishedvideos}" var="fvideo"
          varStatus="status">
          <div class="col-lg-3">
            <div>
            <a class="thumbnail"
              href="<c:url value="video/mark/${fvideo.id}" />"> <span
              class="ui left green corner label"> <i
                class="checkmark icon"></i>
            </span><img src="/va/resources/videoframe/${fvideo.id}/100.jpg" />
            </a>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>

</body>
</html>