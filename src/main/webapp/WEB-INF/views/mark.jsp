<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="shortcut icon" href="<c:url value="/resources/assets/ico/favicon.ico"/>">
<%@ include file="include/stylesheet.jsp"%>
<link href="<c:url value="/resources/assets/css/jquery.timeline.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/elastislide.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/assets/css/annotorious.css"/>" rel="stylesheet"> 
</head>
<body>
  <%@ include file="include/header.jsp"%>
  <div id="blue">
    <div class="container">
      <div class="row">
        <h3>
          <span class="text-capitalize">${video.title}</span>
        </h3>
      </div><!-- /row -->
    </div><!-- /container -->
  </div>
  <div id="main">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="ui three huge steps text-center margin-bottom">
            <a class="ui active step" href="<c:url value="/video/mark/${video.id}" /> ">Marking</a>
            <a class="ui disabled step">Selecting</a>
            <a class="ui disabled step">Ranking</a>
          </div>
          
          <!-- video player -->
          <video id="example_video_1" class="video-js vjs-default-skin" controls preload="auto" width="1140" height="460" data-setup='{"example_option":true}' data-id="${video.id}">
            <source src="<c:url value="/resources/videos/${video.source}" />" type='video/mp4' />
            <p class="vjs-no-js">
              To view this video please enable JavaScript, and consider upgrading to a web browser that 
              <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
            </p>
          </video>
          <div id="thumbnail"></div>
          <canvas id="c" width="1140" height="460" class="hidden"></canvas>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="btn-group pull-right">
            <button id="start-button" type="button" class="btn btn-theme disabled">Start</button>
            <button id="end-button" type="button" class="btn btn-theme disabled">End</button>
            <button id="object-button" type="button" class="btn btn-theme"  data-toggle="modal" data-target="#object">Object</button>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="timeline"></div>
        </div>
      </div>

      <div id="bottom-nav">
        <div class="row">
          <div class="col-lg-12">
            <c:url value="/video/mark" var="action"/>
            <form:form modelAttribute="markform" method="POST" action="${action}">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th class="col-lg-3" colspan="2">Start</th>
                    <th class="col-lg-3" colspan="2">End</th>
                    <th class="col-lg-3">Description</th>
                    <th class="col-lg-3"></th>
                  </tr>
                </thead>
                <tbody id="result">
                <c:forEach items="${markform.vas}" var="vas" varStatus="i">          
                <tr data-id="${i.index}">
                  <td style="width:7%"><img width="60" class="start time" /></td>
                  <td>
                    <div class="input-group spinner">
                      <form:input path="vas[${i.index}].startTime" class="form-control start time" disabled="true" />
                      <div class="input-group-btn-vertical">
                        <button class="btn btn-default" type="button">
                          <i class="fa fa-caret-up"></i>
                        </button>
                        <button class="btn btn-default" type="button">
                          <i class="fa fa-caret-down"></i>
                        </button>
                      </div>
                    </div>
                  </td>
                  <td style="width:7%"><img src="" class="end time" width="60" /></td>
                  <td>
                    <div class="input-group spinner">
                      <form:input path="vas[${i.index}].endTime" class="form-control end time" disabled="true" />
                      <div class="input-group-btn-vertical">
                        <button class="btn btn-default" type="button">
                          <i class="fa fa-caret-up"></i>
                        </button>
                        <button class="btn btn-default" type="button">
                          <i class="fa fa-caret-down"></i>
                        </button>
                      </div>
                    </div>
                  </td>
                  <td>
                    <form:input path="vas[${i.index}].description" class="form-control" />
                  </td>
                  <td>
                  <button type="button" class="play-button btn btn-primary">play</button>&nbsp;<button type="button" class="delete-button btn btn-danger">delete</button><form:hidden path="vas[${i.index}].id"/></td>
                </tr>  
                </c:forEach>
                </tbody>
                <tfoot>
                  <tr>
                    <td><input id="id" type="hidden" name="id" value="${video.id}" /></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                      <input class="btn btn-theme pull-right" type="submit" value="submit" />
                    </td>
                  </tr>
                </tfoot>
              </table>
            </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <%@ include file="include/sidebar.jsp"%>
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>
  <script src="<c:url value="/resources/assets/js/jquery.timeline.js" />"></script>
  <script src="<c:url value="/resources/assets/js/modernizr.custom.17475.js" />"></script>
  <script src="<c:url value="/resources/assets/js/jquerypp.custom.js" />"></script>
  <script src="<c:url value="/resources/assets/js/jquery.elastislide.js" />"></script>
  <script src="<c:url value="/resources/assets/js/annotorious.min.js" />"></script>
  <script src="<c:url value="/resources/assets/js/polygon_selector.js" />"></script>
  <script src="<c:url value="/resources/assets/js/markannotation.js" />"></script>

</body>
</html>