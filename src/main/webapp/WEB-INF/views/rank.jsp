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
						aria-valuemin="0" aria-valuemax="100" style="width: 90%;"></div>
				</div>

				<!-- annotation navigation -->

				<div class="row">
					<div class="col-lg-4 gray">
						<h4 class="text-center">Watching</h4>
					</div>
					<div class="col-lg-4 gray">
						<h4 class="text-center">Marking</h4>
					</div>
					<div class="col-lg-4">
						<h4 class="text-center">Ranking</h4>
					</div>
				</div>
				<div id="sortwarp">
					<div class="row">
						<div class="col-lg-12">
							<h1>Rank annotations</h1>
							<ol id="sort" class="list-unstyled">
								<li>
									<div class="jumbotron">
										<div class="row">
											<div class="col-lg-6">
												<p>text descritions bla bla bla</p>
												<p>start: 0.12313</p>
												<p>end: 5.3123</p>
											</div>
											<div class="col-lg-6">
												<img class="img-responsive"
													src="http://video-js.zencoder.com/oceans-clip.png" />
											</div>
										</div>
									</div>
								</li>
								<li>
									<div class="jumbotron">
										<div class="row">
											<div class="col-lg-6">
												<p>text descritions bla bla bla</p>
												<p>start: 0.12313</p>
												<p>end: 5.3123</p>
											</div>
											<div class="col-lg-6">
												<img class="img-responsive"
													src="http://video-js.zencoder.com/oceans-clip.png" />
											</div>
										</div>
									</div>
								</li><li>
									<div class="jumbotron">
										<div class="row">
											<div class="col-lg-6">
												<p>text descritions bla bla bla</p>
												<p>start: 0.12313</p>
												<p>end: 5.3123</p>
											</div>
											<div class="col-lg-6">
												<img class="img-responsive"
													src="http://video-js.zencoder.com/oceans-clip.png" />
											</div>
										</div>
									</div>
								</li><li>
									<div class="jumbotron">
										<div class="row">
											<div class="col-lg-6">
												<p>text descritions bla bla bla</p>
												<p>start: 0.12313</p>
												<p>end: 5.3123</p>
											</div>
											<div class="col-lg-6">
												<img class="img-responsive"
													src="http://video-js.zencoder.com/oceans-clip.png" />
											</div>
										</div>
									</div>
								</li><li>
									<div class="jumbotron">
										<div class="row">
											<div class="col-lg-6">
												<p>text descritions bla bla bla</p>
												<p>start: 0.12313</p>
												<p>end: 5.3123</p>
											</div>
											<div class="col-lg-6">
												<img class="img-responsive"
													src="http://video-js.zencoder.com/oceans-clip.png" />
											</div>
										</div>
									</div>
								</li><li>
									<div class="jumbotron">
										<div class="row">
											<div class="col-lg-6">
												<p>text descritions bla bla bla</p>
												<p>start: 0.12313</p>
												<p>end: 5.3123</p>
											</div>
											<div class="col-lg-6">
												<img class="img-responsive"
													src="http://video-js.zencoder.com/oceans-clip.png" />
											</div>
										</div>
									</div>
								</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="footer.jsp"%>