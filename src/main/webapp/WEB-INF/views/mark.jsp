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
<link href="<c:url value="/resources/assets/css/videojs.markers.css"/>"
  rel="stylesheet">
</head>
<body>


  <%@ include file="include/header.jsp"%>
  <div id="blue">
    <div class="container">
      <div class="row">
        <h3><span class="text-capitalize">${video.title}</span></h3>
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
            <a class="ui active step"
              href="<c:url value="/video/mark/${video.id}" /> ">Marking</a>
            <a class="ui disabled step">Selecting</a> <a
              class="ui disabled step">Ranking</a>
          </div>
          <!-- video player -->

          <video id="example_video_1" class="video-js vjs-default-skin margin-bottom"
            controls preload="auto" width="1140" height="460"
            poster="http://video-js.zencoder.com/oceans-clip.png"
            data-setup='{"example_option":true}'>
            <source src="${video.source}" type='video/mp4' />
            <p class="vjs-no-js">
              To view this video please enable JavaScript, and consider
              upgrading to a web browser that <a
                href="http://videojs.com/html5-video-support/"
                target="_blank">supports HTML5 video</a>
            </p>
          </video>
          
           <div class="row">
          <div class="col-lg-12 va-segment">
          </div>
          </div>
          

          <!--  -->
          <div id="bottom-nav">
            <div class="row">
              <div class="col-lg-4">
                <button id="start-button" type="button"
                  class="btn btn-theme">Start</button>

                <button id="end-button" type="button"
                  class="btn btn-theme disabled">End</button>

                <button id="prev-button" type="button"
                  class="btn btn-theme">Previous Frame</button>

                <button id="next-button" type="button"
                  class="btn btn-theme">Next Frame</button>
              </div>
              <div class="col-lg-8">
                <form action="<c:url value="/video/mark"/>"
                  method="post">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th class="col-lg-4">Start</th>
                        <th class="col-lg-4">End</th>
                        <th class="col-lg-4"></th>
                      </tr>
                    </thead>
                    <tbody id="result"></tbody>
                    <tfoot>
                      <tr>
                        <td><input id="id" type="hidden" name="id"
                          value="${video.id}" /></td>
                        <td></td>
                        <td><input
                          class="btn btn-theme pull-right"
                          type="submit" value="submit" /></td>
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

  <%@ include file="include/sidebar.jsp"%>
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>

  <script
    src="<c:url value="/resources/assets/js/videojs.markers.js" />"></script>
  <script src="<c:url value="/resources/assets/js/markannotation.js" />"></script>

</body>
</html>