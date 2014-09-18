<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="au.usyd.va.domain.Video"%>
<%@ page import="au.usyd.va.domain.VideoAnnotation"%>
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
<link href="<c:url value="/resources/assets/css/slideshow.css"/>"
  rel="stylesheet">

</head>
<body>

  <%
    Video video = (Video) request.getAttribute("video");
    long id = video.getId();
    ArrayList<VideoAnnotation> vas = (ArrayList<VideoAnnotation>) request.getAttribute("vas");
  %>
  <%@ include file="include/header.jsp"%>
  <div id="main">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="ui three huge steps text-center">
            <a class="ui step"
              href="<c:url value="/video/mark/${video.id}" /> ">Marking</a>
            <a class="ui active step">Selecting</a> <a
              class="ui disabled step">Ranking</a>
          </div>
          <h1 class="ui huge header">${video.title}-SelectKey
            Frames</h1>
          <i class="time icon"></i>11 Aug 2014
          <hr>


          <%
            int count = 0;
            for(VideoAnnotation va : vas){
              long vaid = va.getId();
              double startTime = va.getStartTime();
              double endTime = va.getEndTime();
              int startFrame = (int) Math.floor(startTime * 24);
              int endFrame = (int) Math.floor(endTime * 24);
              count++;
          %>
          <form method="post" action="<c:url value="/video/select"/>">
          <section class="ui segment">
            <h2 class="ui header">
              segment
              <%=count%>
            </h2>
            <div class="sub header">
              <i class="time icon"></i>
              <span class="time"><%=startTime%></span>
              -
              <span class="time"><%=endTime%></span>
            </div>
            <hr>
            <div class="slideshow" data-pagination="false" data-auto="0">
              <ul class="ss-carousel">
                <%
                  for(int i = startFrame; i< endFrame; i++) {
                    String result = String.format("%04d", i);
                %>
                <li class="slide">
                  <div>
                  
                    <img src="/va/resources/videoframe/v<%=id%>/v<%=id%><%=result%>.jpg"
                      data-frame="<%=i%>" width="240" height="240" />
                      <span class="ui left green corner label hide"><i class="checkmark icon"></i></span>
                  </div>
                </li>
                <%
                  }
                %>

              </ul>
            </div>
            <input type="hidden" name="va[][id]" value="<%=vaid %>"/>
            <input type="hidden" name="va[][keyFrame]" value="" />

            
          </section>
          <%
            }
          %>

          <div id="bottom-nav">
            <div class="row">
              <div class="col-lg-2 pull-right">
                
                  <input type="submit" value="sumbit"
                    class="btn btn-primary btn-lg" />
              </div>
            </div>
          </div>
          <input type="hidden" name="id" value="${video.id}" />
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
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>
  <script src="<c:url value="/resources/assets/js/slideshow.js"/>"></script>
  <script type="text/javascript">
      // Create slideshow instances
      $(function() {
        var $slideshow = $('.slideshow').slides();
      });

      $(function() {
        $(".slide img").each(function() {
          $(this).click(function() {
            if($(this).hasClass("selected")){
              $(this).removeClass("selected");
              $(this).siblings().addClass("hide");
            } else {
              $(this).addClass("selected");
              $(this).siblings().removeClass("hide");
            }
          });
        });

        $("form").submit(function() {
          $(".selected").each(function() {
            
            var input = $(this).parents("section").children('input[name="va[][keyFrame]"]');
            input.val(input.val() == "" ? $(this).attr("data-frame") : input.val() + "," + $(this).attr("data-frame"));
          });
          
          $('form').append('<textarea class="hidden" name="json">' + JSON.stringify($("form").serializeJSON()) + '</textarea>');
        });
      });
    </script>
</body>
</html>