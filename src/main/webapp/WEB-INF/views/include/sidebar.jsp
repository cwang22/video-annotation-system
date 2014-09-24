
<!-- sidebar -->
<nav id="sidebar" class="ui red vertical large sidebar menu">
  <a class="item" href="<c:url value="/home" />"><i
    class="home large icon"></i> Home</a> <a class="item"
    href="<c:url value="/video/all" />"><i class="video large icon"></i>
    All Videos
  </a>
  <div class="item">
    <b>More</b>
  </div>
  <div class="item">

    <c:forEach items="${newvideos}" var="nvideo" varStatus="status">
        <a class="thumbnail" href="<c:url value="video/mark/${nvideo.id}" />">
          <img src="/va/resources/videoframe/v${nvideo.id}/v10100.jpg" />
        </a>
    </c:forEach>
  </div>
</nav>
<div id="sidebar-button" class="ui black huge launch right attached button">
  <i class="icon video"></i> <span class="text">Videos</span>
</div>