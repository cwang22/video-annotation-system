<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <div id="main">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="ui three huge steps text-center">
            <a class="ui step"
              href="<c:url value="/video/mark/${video.id}" />">Marking</a>
            <a class="ui step"
              href="<c:url value="/video/select/${video.id}" />">Selecting</a>
            <a class="ui active step">Ranking</a>
          </div>
          <h1 class="ui huge header">${video.title}-RankSegments</h1>
          <i class="time icon"></i>11 Aug 2014
          <hr>
          <form method="post" action='<c:url value="/video/rank" />'>
            <div id="sortwarp">
              <div class="row">
                <div class="col-lg-12">
                  <ol id="sort" class="ui list-unstyled">

                    <c:forEach items="${vas}" var="va"
                      varStatus="status">
                      <li id="${va.id}" class="ui segment">
                        <div class="row">
                          <div class="col-lg-6">
                            <h2 class="ui header">
                              segment
                              <c:out value="${status.count}" />
                            </h2>
                            <div class="sub header">
                              <i class="time icon"></i>
                             <span class="time"><c:out value="${va.starttime}" /></span>
                              -
                              <span class="time"><c:out value="${va.endtime}" /></span>
                            </div>
                            <p>some text description could go here</p>
                          </div>
                          <div class="col-lg-6">
                            <img
                              src="<c:url value='/resources/videoframe/v${video.id}/v${video.id}' /><fmt:formatNumber type="number" 
            pattern = "0000" value="${va.keyFrame}" />.jpg" />
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
                      type="hidden" name="order" value="" />
                      <input type="hidden" name="id" value="<c:url value='${video.id}'  />" />
                  </div>
                </div>
              </div>
            </div>
          </form>
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



  </div>

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