<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">

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
		<header id="header" class="header-tops">
			<div class="container">
				<h1><a href="index">FaceGram</a></h1>
				<h2>I'm a passionate <span>graphic designer</span> from New York</h2>
		
				<nav class="nav-menu d-none d-lg-block">
					<ul>
						<li class="active"><a href="index">Home</a></li>
						<li><a href="login">Login</a></li>
						<li><a href="join">Join</a></li>
						<li><a href="feed">Feed</a></li>
						<li><a href="at-sign">At-sign</a></li>
						<li><a href="tag">Tag</a></li>
						<li><a href="#">Notification</a></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">My Page</a>
							<div class="dropdown-menu" style="opacity:0.5;">
								<a class="dropdown-item" style="color: #0000ff;" href="profile">Profile</a>
								<a class="dropdown-item" style="color: #0000ff;" href="setting">Setting</a>
								<a class="dropdown-item" style="color: #0000ff;" href="logout">Logout</a>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</header>
	
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/personal-free-resume-bootstrap-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	
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