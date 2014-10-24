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
</head>
<body>


  <%@ include file="include/header.jsp"%>
  <div id="blue">
    <div class="container">
      <div class="row">
        <h3>
          <span class="text-capitalize">${video.title}</span>
        </h3>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <div id="main">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="ui three huge steps text-center margin-bottom">
            <a class="ui step"
              href="<c:url value="/video/mark/${video.id}" />">Marking</a>
            <a class="ui step"
              href="<c:url value="/video/select/${video.id}" />">Selecting</a>
            <a class="ui active step">Ranking</a>
          </div>

          <form method="post" action='<c:url value="/video/rank" />'>
            <div id="sortwarp">
              <div class="row">
                <div class="col-lg-12">
                  <ol id="sort" class="ui list-unstyled">

                    <c:forEach items="${frames}" var="frame"
                      varStatus="status">
                      <li id="${frame.id}" class="ui segment">
                        <div class="row">
                          <div class="col-lg-6">
                            <h2 class="ui header">
                              KeyFrame
                              <c:out value="${status.count}" />
                            </h2>
                            <div class="sub header">
                              <i class="time icon"></i>
                              <c:out value="${frame.sequence}" />
                            </div>
                            <p>some text description could go here</p>
                          </div>
                          <div class="col-lg-6">
                            <img src="<c:url value='/resources/videoframe/${video.id}/${frame.sequence}.jpg' />" />
                          </div>
                        </div>
                      </li>
                    </c:forEach>
                  </ol>
                </div>
              </div>
              <div id="bottom-nav">
                <div class="row">
                  <div class="col-lg-2 pull-right">
                    <input type="submit" value="sumbit"
                      class="btn btn-primary btn-lg" /> <input
                      type="hidden" name="order" value="" /> <input
                      type="hidden" name="id"
                      value="<c:url value='${video.id}'  />" />
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <%@ include file="include/sidebar.jsp"%>
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>
  <script type="text/javascript">
      $(document).ready(function() {
        $("#sort").dragsort({
          dragSelector: "li",
          dragEnd: function() {
          },
          dragBetween: false,
          placeHolderTemplate: "<li></li>"
        });

        $('form').submit(function() {
          var serialString = "";
          $('#sort li').each(function(i, element) {
            serialString += (i > 0 ? "," : "") + $(element).attr("id");
          });
          $('input[name="order"]').val(serialString);
          return;
        });
      });
    </script>
</body>
</html>