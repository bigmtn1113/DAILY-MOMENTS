<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section id="at-sign" class="at-sign">
	<div class="about-me container">

		<div class="section-title">
			<h2>Profile</h2>
			<p>Introduce myself</p>
		</div>

		<div class="row">
			<div class="col-lg-4" data-aos="fade-right">
				<img src="<%=request.getContextPath()%>/resources/assets/img/me.jpg"
					class="img-fluid" alt="">
			</div>
			<div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
				<br /> <br /> <br />
				<h3 style="display: inline">ID : gyoung2655</h3>
				<button class="btn btn-info btn-sm" onclick="">팔로우</button>
				<div class="row">
					<div class="col-lg-6">
						<ul>
							<li></li>
							<li><i class="icofont-rounded-right"></i> <strong>게시물:</strong>
								게시물 숫자</li>
							<li><i class="icofont-rounded-right"></i> <strong>팔로워:</strong>
								팔로워 숫자</li>
							<li><i class="icofont-rounded-right"></i> <strong>팔로잉:</strong>
								팔로잉 숫자</li>
						</ul>
					</div>
				</div>
				<p>
					test<br /> test<br /> test<br />
				</p>
			</div>
		</div>
	</div>
	<div class="portfolio" id="protfolio">
		<div class="container">
			<div class="section-title">
				<h2>Portfolio</h2>
				<p>내 작업들</p>
			</div>

			<div class="row">
				<div class="col-lg-12 d-flex justify-content-center">
					<ul id="portfolio-flters">
						<li data-filter=".filter-app">게시물</li>
						<li data-filter=".filter-card">동영상</li>
						<li data-filter=".filter-web">북마크</li>
					</ul>
				</div>
			</div>

			<div class="row portfolio-container">

				<div class="col-lg-4 col-md-6 portfolio-item filter-app">
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-1.jpg"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>App 1</h4>
							<p>App</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-1.jpg"
									data-gall="portfolioGallery" class="venobox" title="App 1"><i
									class="bx bx-plus"></i></a> <a href="portfolio-details.jsp"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-web">
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-2.jpg"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Web 3</h4>
							<p>Web</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-2.jpg"
									data-gall="portfolioGallery" class="venobox" title="Web 3"><i
									class="bx bx-plus"></i></a> <a href="portfolio-details.jsp"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-app">
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-3.jpg"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>App 2</h4>
							<p>App</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-3.jpg"
									data-gall="portfolioGallery" class="venobox" title="App 2"><i
									class="bx bx-plus"></i></a> <a href="portfolio-details.jsp"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-card">
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-4.jpg"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Card 2</h4>
							<p>Card</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-4.jpg"
									data-gall="portfolioGallery" class="venobox" title="Card 2"><i
									class="bx bx-plus"></i></a> <a href="portfolio-details.jsp"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-web">
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-5.jpg"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Web 2</h4>
							<p>Web</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-5.jpg"
									data-gall="portfolioGallery" class="venobox" title="Web 2"><i
									class="bx bx-plus"></i></a> <a href="portfolio-details.jsp"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-app">
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-6.jpg"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>App 3</h4>
							<p>App</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-6.jpg"
									data-gall="portfolioGallery" class="venobox" title="App 3"><i
									class="bx bx-plus"></i></a> <a href="portfolio-details.jsp"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-card">
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-7.jpg"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Card 1</h4>
							<p>Card</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-7.jpg"
									data-gall="portfolioGallery" class="venobox" title="Card 1"><i
									class="bx bx-plus"></i></a> <a href="portfolio-details.jsp"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-card">
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-8.jpg"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Card 3</h4>
							<p>Card</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-8.jpg"
									data-gall="portfolioGallery" class="venobox" title="Card 3"><i
									class="bx bx-plus"></i></a> <a href="portfolio-details.jsp"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 portfolio-item filter-web">
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-9.jpg"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>Web 3</h4>
							<p>Web</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-9.jpg"
									data-gall="portfolioGallery" class="venobox" title="Web 3"><i
									class="bx bx-plus"></i></a> <a href="portfolio-details.jsp"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>