<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
  uri="http://www.springframework.org/security/tags"%>
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
<link rel="shortcut icon"
  href="<c:url value="/resources/assets/ico/favicon.ico"/>">
<%@ include file="include/stylesheet.jsp"%>
</head>
<body>

  <div id="blue">
    <div class="container">
      <div class="row">
        <h3><span class="glyphicon glyphicon-user"></span> Profile</h3>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <%@ include file="include/header.jsp"%>
  <div id="main" class="container">
        <div class="row">
      <div class="col-lg-6 col-lg-offset-3">
        <c:url value="/profile" var="action" />
        <form:form modelAttribute="user" method="POST"
          action="${action}" cssClass="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label">Email</label>
            <div class="col-sm-10">
              <form:input path="username" cssClass="form-control"
                placeholder="Email" disabled="true"/>
            </div>
          </div>
          <div id="password-group" class="form-group hidden">
            <label class="col-sm-2 control-label">Password</label>
            <div class="col-sm-10">
              <form:password path="password" cssClass="form-control"
                placeholder="Password" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">Name</label>
            <div class="col-sm-10">
              <form:input path="name" cssClass="form-control"
                placeholder="Name" disabled="true"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">Institution</label>
            <div class="col-sm-10">
              <form:input path="institution" cssClass="form-control"
                placeholder="Institution" disabled="true"/>
            </div>
          </div>

          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
            
              <button type="submit" id="save" class="btn btn-success hidden pull-right">Save</button>
              <a href="<c:url value="/profile" />" style="margin-right:5px;" id="cancel" class="btn btn-default hidden pull-right">Cancel</a>
              <button type="button" id="edit" style="margin-right:5px;" class="btn btn-default pull-right">Edit</button>
            </div>
          </div>

        </form:form>
      </div>
    </div>
  </div>
  <%@ include file="include/footer.jsp"%>
  <%@ include file="include/script.jsp"%>
  <script type="text/javascript">
  $(function(){
    $("#edit").click(function(){
      $(".hidden").transition('fade');
      $(this).transition('slide down');
      $("input[disabled]").removeAttr("disabled");
    });
  });
  </script>
</body>
</html>