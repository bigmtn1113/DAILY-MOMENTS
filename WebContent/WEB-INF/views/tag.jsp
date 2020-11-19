<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>FaceGram</title>
		<meta content="" name="description">
		<meta content="" name="keywords">
		
		<!-- Favicons -->
		<link href="<%=request.getContextPath()%>/resources/assets/img/favicon.png" rel="icon">
		<link href="<%=request.getContextPath()%>/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
		
		<!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
		
		<!-- Vendor CSS Files -->
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/resources/assets/vendor/venobox/venobox.css" rel="stylesheet">
		
		<!-- Template Main CSS File -->
		<link href="<%=request.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp"/>
	
		<section id="tag" class="tag section-show">
			<div class="portfolio" id="protfolio">
				<div class="container">
					<div class="section-title">
						<p># 검색 내용</p>
						<i class="icofont-rounded-right"></i> <strong>게시물 :</strong> 게시물 숫자
					</div>
		
					<div class="row">
						<div class="col-lg-12 d-flex justify-content-center">
							<ul id="portfolio-flters">
		
							</ul>
						</div>
					</div>
		
					<div class="row portfolio-container">
		
						<div class="col-lg-4 col-md-6 portfolio-item filter-app">
							<div class="portfolio-wrap">
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-1.jpg" class="img-fluid"
									alt="">
								<div class="portfolio-info">
									<h4>App 1</h4>
									<p>App</p>
									<div class="portfolio-links">
										<a href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-1.jpg"
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
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-2.jpg" class="img-fluid"
									alt="">
								<div class="portfolio-info">
									<h4>Web 3</h4>
									<p>Web</p>
									<div class="portfolio-links">
										<a href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-2.jpg"
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
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-3.jpg" class="img-fluid"
									alt="">
								<div class="portfolio-info">
									<h4>App 2</h4>
									<p>App</p>
									<div class="portfolio-links">
										<a href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-3.jpg"
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
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-4.jpg" class="img-fluid"
									alt="">
								<div class="portfolio-info">
									<h4>Card 2</h4>
									<p>Card</p>
									<div class="portfolio-links">
										<a href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-4.jpg"
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
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-5.jpg" class="img-fluid"
									alt="">
								<div class="portfolio-info">
									<h4>Web 2</h4>
									<p>Web</p>
									<div class="portfolio-links">
										<a href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-5.jpg"
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
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-6.jpg" class="img-fluid"
									alt="">
								<div class="portfolio-info">
									<h4>App 3</h4>
									<p>App</p>
									<div class="portfolio-links">
										<a href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-6.jpg"
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
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-7.jpg" class="img-fluid"
									alt="">
								<div class="portfolio-info">
									<h4>Card 1</h4>
									<p>Card</p>
									<div class="portfolio-links">
										<a href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-7.jpg"
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
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-8.jpg" class="img-fluid"
									alt="">
								<div class="portfolio-info">
									<h4>Card 3</h4>
									<p>Card</p>
									<div class="portfolio-links">
										<a href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-8.jpg"
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
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-9.jpg" class="img-fluid"
									alt="">
								<div class="portfolio-info">
									<h4>Web 3</h4>
									<p>Web</p>
									<div class="portfolio-links">
										<a href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-9.jpg"
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
		
		<!-- Vendor JS Files -->
		<script src="<%=request.getContextPath()%>/resources/assets/vendor/jquery/jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/vendor/php-email-form/validate.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/vendor/counterup/counterup.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/assets/vendor/venobox/venobox.min.js"></script>
	
		<!-- Template Main JS File -->
		<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
	</body>
</html>