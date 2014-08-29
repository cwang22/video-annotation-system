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
          <h1>Videos</h1>
          <hr>
          <div class="row">
            <div class="col-lg-3">
              <a href="#" class="thumbnail"> <span
                class="ui right green corner label"> <i
                  class="checkmark icon"></i>
              </span> <img src="holder.js/260x260" />
              </a>
            </div>
            <div class="col-lg-3">
              <a href="#" class="thumbnail"><span
                class="ui right blue corner label"> <i
                  class="exclamation icon"></i>
              </span> <img src="holder.js/260x260" /> </a>
            </div>
            <div class="col-lg-3">

              <a href="#" class="thumbnail"><span
                class="ui right red corner label"> <i
                  class="question icon"></i>
              </span> <img src="holder.js/260x260" /> </a>
            </div>
            <div class="col-lg-3">
              <a href="#" class="thumbnail"> <img
                src="holder.js/260x260" />
              </a>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-3">
              <a href="#" class="thumbnail"> <img
                src="holder.js/260x260" />
              </a>
            </div>
            <div class="col-lg-3">
              <a href="#" class="thumbnail"> <img
                src="holder.js/260x260" />
              </a>
            </div>
            <div class="col-lg-3">
              <a href="#" class="thumbnail"> <img
                src="holder.js/260x260" />
              </a>
            </div>
            <div class="col-lg-3">
              <a href="#" class="thumbnail"> <img
                src="holder.js/260x260" />
              </a>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-3">
              <a href="#" class="thumbnail"> <img
                src="holder.js/260x260" />
              </a>
            </div>
            <div class="col-lg-3">
              <a href="#" class="thumbnail"> <img
                src="holder.js/260x260" />
              </a>
            </div>
            <div class="col-lg-3">
              <a href="#" class="thumbnail"> <img
                src="holder.js/260x260" />
              </a>
            </div>
            <div class="col-lg-3">
              <a href="#" class="thumbnail"> <img
                src="holder.js/260x260" />
              </a>
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