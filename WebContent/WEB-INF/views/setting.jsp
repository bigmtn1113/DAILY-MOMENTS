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
	
		<section id="setting" class="setting section-show">
			<div class="container">
	
				<div class="section-title">
					<h2>setting</h2>
					<p>setting</p>
				</div>
	
				<form action="forms/contact.php" method="post" role="form"
					class="php-email-form mt-4">
					<div class="form-group">
						<input type="text" name="settingName" class="form-control"
							id="settingName" placeholder="Your Name" />
						<div class="validate"></div>
					</div>
					<div class="form-group">
						<input type="text" name="settingId" class="form-control"
							id="settingId" placeholder="Your ID" />
						<div class="validate"></div>
					</div>
					<div class="form-group">
						<textarea name="settingIntroduce" class="form-control"
							id="settingIntroduce" placeholder="Your Introduce"></textarea>
						<div class="validate"></div>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="settingPassword"
							id="settingPassword" placeholder="Your Password" />
						<div class="validate"></div>
					</div>
					<div class="form-group">
						<input type="text" name="settingPhoneNumber" class="form-control"
							id="settingPhoneNumber" placeholder="Your Phone Number" />
						<div class="validate"></div>
					</div>
					<div class="form-group">
						<input type="text" name="settingSex" class="form-control"
							id="settingSex" placeholder="Your Sex" />
						<div class="validate"></div>
					</div>
	
					<div class="text-center">
						<button type="submit">setting</button>
					</div>
				</form>
			</div>
		</section>
		
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