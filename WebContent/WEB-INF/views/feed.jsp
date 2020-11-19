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
	
		<section id="portfolio" class="portfolio section-show">
			<div class="container">
				<div class="row portfolio-container">
				
					<div class="col portfolio-item filter-app">
						<div>
							<div style="background-color:#1B1B1B;"><a href="#" style="text-decoration:none; color:white; font-size:30px;">아이디</a></div>
							
							<div>
								<div class="container mt-3">
									<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-1.jpg" class="img-fluid">
								</div>
								
								<div>
									<button type="button" class="btn btn-default btn-xs" style="float:left"><img src="<%=request.getContextPath()%>/resources/assets/img/need/heart.png"></button>
									<button type="button" class="btn btn-default btn-xs" style="float:right"><img src="<%=request.getContextPath()%>/resources/assets/img/need/book.png"></button>
									<br/>
									좋아요x개
								</div>
								
								<div style="clear:both; height:70px; background-color:#1B1B1B; border:1px solid white;">
									<a href="#">아이디</a> : content
								</div>
								
								<div style="border:1px solid white">
									<textarea  style="width:88%; height:50px; padding: 0.8em "  placeholder="댓글달기..."></textarea>
									<button class="btn btn-info btn-sm" style="float:right; width:12%; height:50px">입력</button>
								</div>
							</div>
						</div>
					</div>
	
					<div class="col portfolio-item filter-app">
						<div>
							<div style="background-color:#1B1B1B;"><a href="#" style="text-decoration:none; color:white; font-size:30px;">아이디</a></div>
							
							<div>
								<div class="container mt-3">
									<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-2.jpg" class="img-fluid">
								</div>
								
								<div>
									<button type="button" class="btn btn-default btn-xs" style="float:left"><img src="<%=request.getContextPath()%>/resources/assets/img/need/heart.png"></button>								
									<button type="button" class="btn btn-default btn-xs" style="float:right"><img src="<%=request.getContextPath()%>/resources/assets/img/need/book.png"></button>
									<br/>
									좋아요x개
								</div>
								
								<div style="clear:both; height:70px; background-color:#1B1B1B; border:1px solid white;">
									<a href="#">아이디</a> : content
								</div>
								
								<div style="border:1px solid white">
									<textarea  style="width:88%; height:50px; padding: 0.8em" placeholder="댓글달기..."></textarea>
									<button class="btn btn-info btn-sm" style="float:right; width:12%; height:50px">입력</button>
								</div>
							</div>
						</div>
					</div>
	
					<div class="col portfolio-item filter-app">
						<div>
							<div style="background-color:#1B1B1B;"><a href="#" style="text-decoration:none; color:white; font-size:30px;">아이디</a></div>
							
							<div>
								<div class="container mt-3">
									<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-3.jpg" class="img-fluid">
								</div>
								
								<div>
									<button type="button" class="btn btn-default btn-xs" style="float:left"><img src="<%=request.getContextPath()%>/resources/assets/img/need/heart.png"></button>
									<button type="button" class="btn btn-default btn-xs" style="float:right"><img src="<%=request.getContextPath()%>/resources/assets/img/need/book.png"></button>
									<br/>
									좋아요x개
								</div>
								
								<div style="clear:both; height:70px; background-color:#1B1B1B; border:1px solid white;">
									<a href="#">아이디</a> : content
								</div>
								
								<div style="border:1px solid white">
									<textarea  style="width:88%; height:50px; padding: 0.8em" placeholder="댓글달기..."></textarea>
									<button class="btn btn-info btn-sm" style="float:right; width:12%; height:50px">입력</button>
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