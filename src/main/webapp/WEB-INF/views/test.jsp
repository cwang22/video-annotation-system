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
<!-- Bootstrap core CSS -->
<link
  href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
  rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<c:url value="/resources/assets/css/style.css" />"
  rel="stylesheet">
<link href="<c:url value="/resources/assets/css/font-awesome.min.css"/>"
  rel="stylesheet">
<link href="<c:url value="/resources/assets/css/custom.css"/>"
  rel="stylesheet">
<link href="<c:url value="/resources/assets/css/semantic.min.css"/>"
  rel="stylesheet">
<!-- Video.js -->
<link href="//vjs.zencdn.net/4.7/video-js.css" rel="stylesheet">
<script src="//vjs.zencdn.net/4.7/video.js"></script>
<link href="<c:url value="/resources/assets/css/slideshow.css"/>"
  rel="stylesheet">

</head>
<body>


  <div class="slideshow" data-visible="4" data-pagination="false">
    <ul class="carousel">
      <li class="slide"><img
        src="http://placebox.es/110/110/d97ef2/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/50ac3d/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/d97ef2/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/50ac3d/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/d97ef2/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/50ac3d/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
      <li class="slide"><img
        src="http://placebox.es/110/110/0a77bb/f5f5f5" alt=""
        width="110" height="110" /></li>
    </ul>
  </div>

  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="<c:url value="/resources/assets/js/slideshow.js"/>"></script>
  <script type="text/javascript">
      // Create slideshow instances
      var $slideshow = $('.slideshow').slides();

      api = $slideshow.data('slides');
      api.stop();

      $(function() {
        $(".slide img").each(function() {
          $(this).click(function() {
            $(this).parent().parent().parent().children().children().children(".selected").remove();
            $(this).parent().append('<span class="ui right green corner label selected"><i class="checkmark icon"></i></span>');
          });
        });
      });
    </script>
</body>
</html>