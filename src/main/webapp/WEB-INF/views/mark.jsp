<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ include file="header.jsp"%>


<div id="videowarp">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>${video.title}</h1>
				<h4>18:16 15 Aug 2014</h4>
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="60"
						aria-valuemin="0" aria-valuemax="100" style="width: 50%;">
					</div>
				</div>
				
				<!-- annotation navigation -->
				
				<div class="row">
				<div class="col-lg-4 gray">
				<h4 class="text-center">Watching</h4>
				</div>
				<div class="col-lg-4">
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
					<source src="${video.source}"
						type='video/mp4' />
					<p class="vjs-no-js">
						To view this video please enable JavaScript, and consider
						upgrading to a web browser that <a
							href="http://videojs.com/html5-video-support/" target="_blank">supports
							HTML5 video</a>
					</p>
				</video>
				
				<!--  -->
				<div id="bottom-nav">
				<div class="row">
				<div class="col-lg-2"><button type="button" class="btn btn-primary btn-lg">Start</button></div>
				</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>