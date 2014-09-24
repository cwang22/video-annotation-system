<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
        <h3><span class="text-capitalize">Login</span></h3>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <div id="main" class="container">
    <div class="row">
      <div class="col-lg-6 col-lg-offset3">
        <c:if test="${not empty param.error}">

          <div class="alert alert-danger alert-dismissible"
            role="alert">
            <strong>Error</strong> - Login failed
          </div>
        </c:if>
        <form name="f" class="form-horizontal" role="form"
          action="<c:url value="/j_spring_security_check" />"
          method="post">
          <div class="form-group">
            <label for="j_username" class="col-sm-2 control-label">Username</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="j_username"
                name="j_username" placeholder="username">
            </div>
          </div>
          <div class="form-group">
            <label for="j_password" class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
              <input type="password" class="form-control"
                id="j_password" name="j_password" placeholder="Password">
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <div class="checkbox">
                <label> <input type="checkbox"
                  id="_spring_security_remember_me"
                  name="_spring_security_remember_me"> Remember
                  me
                </label>
              </div>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
            <a class="btn btn-default" href="<c:url value="/register" />">Register
                </a>
              <button type="submit" class="btn btn-theme">Sign
                in</button>
            </div>
          </div>
        </form>
      </div>
    </div>

  </div>
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>

</body>
</html>