<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
  uri="http://www.springframework.org/security/tags"%>
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
<link rel="shortcut icon" href="<c:url value="/resources/assets/ico/favicon.ico"/>">
<%@ include file="include/stylesheet.jsp"%>
<link href="<c:url value="/resources/assets/css/elastislide.css"/>" rel="stylesheet">
</head>
<body>

  <%
    Video video = (Video) request.getAttribute("video");
      long id = video.getId();
      ArrayList<VideoAnnotation> vas = (ArrayList<VideoAnnotation>) request.getAttribute("vas");
  %>
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
              href="<c:url value="/video/mark/${video.id}" /> ">Marking</a>
            <a class="ui active step">Selecting</a> <a
              class="ui disabled step">Ranking</a>
          </div>
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
                <i class="time icon"></i> <span class="time"><%=startTime%></span>
                - <span class="time"><%=endTime%></span>
              </div>
              <hr>
                <ul class="elastislide-list">
                  <%
                    for(int i = startFrame; i< endFrame; i++) {
                                  String result = String.format("%04d", i);
                  %>
                  <li>
                      <img src="/va/resources/videoframe/v<%=id%>/v<%=id%><%=result%>.jpg" data-frame="<%=i%>" width="240" height="240" />
                      <span class="ui left green corner label hide"><i
                        class="checkmark icon"></i></span>
                  </li>
                  <%
                    }
                  %>
                </ul>
              <input type="hidden" name="va[][id]" value="<%=vaid%>" />
              <input type="hidden" name="va[][keyFrame]" value="" />


            </section>
            <%
              }
            %>

            <div id="bottom-nav">
              <div class="row">
                <div class="col-lg-12">

                  <input type="submit" value="sumbit"
                    class="btn btn-theme btn-lg pull-right" />
                </div>
              </div>
            </div>
            <input type="hidden" name="id" value="${video.id}" />
          </form>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="include/sidebar.jsp"%>
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>
  <script src="<c:url value="/resources/assets/js/modernizr.custom.17475.js" />"></script>
  <script src="<c:url value="/resources/assets/js/jquerypp.custom.js" />"></script>
  <script src="<c:url value="/resources/assets/js/jquery.elastislide.js" />"></script>
  <script type="text/javascript">
      
      
      $(function() {
        $('.elastislide-list').each(function(){
          $(this).elastislide({
            minItems: 2
          });
        });
        
        $(".elastislide-list img").each(function() {
          $(this).click(function() {
            if ($(this).hasClass("selected")) {
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