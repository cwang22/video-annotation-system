
<!-- Fixed navbar -->
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse"
        data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span> <span
          class="icon-bar"></span> <span class="icon-bar"></span> <span
          class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/va/">VIDEO ANNOTATION SYSTEM</a>
    </div>
    <div class="navbar-collapse collapse navbar-right">
      <ul class="nav navbar-nav">
        <li><a href="<c:url value="/video/all" />">VIDEO</a></li>
        <li><a href="about.html">MY ANNOTATION</a></li>
        <li><a href="contact.html">ABOUT</a></li>

        <sec:authorize access="isAuthenticated()" var="isAuthenticated">
          <sec:authentication var="user" property="principal" />
          <li class="dropdown"><a href="#" class="dropdown-toggle"
            data-toggle="dropdown"><span class="text-uppercase">${user.username}</span><b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="<c:url value="/profile" />" >PROFILE</a></li>
              <li><a href="<c:url value="/j_spring_security_logout" />">LOG OUT</a></li>
            </ul></li>
        </sec:authorize>
        
        <c:if test="${not isAuthenticated}">
          <li><a href="<c:url value="/login" />">LOGIN</a></li>
        </c:if>
      </ul>
    </div>
    <!--/.nav-collapse -->
  </div>
</div>