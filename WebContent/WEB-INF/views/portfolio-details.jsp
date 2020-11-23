<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta content="width=device-width, initial-scale=1.0" name="viewport">
		
		<title>Portfolio Details - Personal Bootstrap Template</title>
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
		<main id="main">
			<div class="portfolio-details">
				<div class="container">
	
					<div class="row">
						<div class="col-lg-8">
							<div>
								<a href="#" style="text-decoration: none; color: white; font-size: 30px;">아이디</a>
							</div>
							<div class="owl-carousel portfolio-details-carousel">
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-details-1.jpg" class="img-fluid" alt="">
							</div>
						</div>
	
						<div class="col-lg-4 portfolio-info">
							<textarea style="height: 80%; width: 100%; resize: none; -ms-overflow-style: none; background-color: #1B1B1B; color: white; border: 1px solid white; white-space: pre-line; overflow-y: auto;" readonly="readonly">
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>																																																
							</textarea>
							
							<div style="height: 40px">
	
								<script>
									function change1() {
									var img1 = "http://<%=request.getLocalAddr()%>:8080<%=request.getContextPath()%>/<%=request.getContextPath()%>/resources/assets/img/need/heart.png",
										img2 = "http://<%=request.getLocalAddr()%>:8080<%=request.getContextPath()%>/<%=request.getContextPath()%>/resources/assets/img/need/heart1.png";
									var imgElement = document.getElementById('test1');
										imgElement.src = (imgElement.src === img1) ? img2 : img1;
									}
								</script>
								
								<img src="http://<%=request.getLocalAddr()%>:8080<%=request.getContextPath()%>/<%=request.getContextPath()%>/resources/assets/img/need/heart.png" id="test1" onclick="change1();" style="float: left" />
								
								<button type="button" class="btn btn-default btn-xs" style="float: right">
									<img src="<%=request.getContextPath()%>/resources/assets/img/need/book.png">
								</button>
								<br/> 좋아요x개
							</div>
	
							<div style="height: 20px">
								<textarea class="invisible-scrollbar" style="float: left; resize: none; width: 87%; height: 50px; padding: 0.8em; -ms-overflow-style: none; scrollbar-width: none;" placeholder="댓글달기... "></textarea>
								<button class="bx bx-subdirectory-left" style="float: right; background-color: #15BB62; color: white; width: 13%; height: 50px; font-size: 20px;"></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	
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