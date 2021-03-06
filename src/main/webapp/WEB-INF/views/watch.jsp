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

  <div id="main">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h1>${video.title}</h1>
          <h4>18:16 15 Aug 2014</h4>
          <div class="progress">
            <div class="progress-bar" role="progressbar"
              aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
              style="width: 20%;"></div>
          </div>

          <!-- annotation navigation -->

          <div class="row">
            <div class="col-lg-4">
              <h4 class="text-center">Watching</h4>
            </div>
            <div class="col-lg-4 gray">
              <h4 class="text-center">Marking</h4>
            </div>
            <div class="col-lg-4 gray">
              <h4 class="text-center">Ranking</h4>
            </div>
          </div>

          <!-- video player -->

          <video id="example_video_1" class="video-js vjs-default-skin"
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

          <!--  -->
          <div id="bottom-nav">
            <div class="row">
              <div class="col-lg-2 pull-right">
                <a href="<c:url value="/video/mark/${video.id}" /> "><button
                    type="button" class="btn btn-primary btn-lg">Start
                    Marking</button></a>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>

  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>
</body>
</html>