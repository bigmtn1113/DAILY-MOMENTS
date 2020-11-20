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
<link
	href="<%=request.getContextPath()%>/resources/assets/img/favicon.png"
	rel="icon">
<link
	href="<%=request.getContextPath()%>/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/icofont/icofont.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/resources/assets/vendor/venobox/venobox.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="<%=request.getContextPath()%>/resources/assets/css/style.css"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<header id="header" class="header-tops">
		<div class="container">
			<h1>
				<a href="index">FaceGram</a>
			</h1>
			<h2>
				I'm a passionate <span>graphic designer</span> from New York
			</h2>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li><input class="form-control search" type="text"
						placeholder="search.." />
					</li>
					
					<li>
						<a href="javascript:fun1()">At-sign</a>
						<script type="text/javascript">
							function fun1() {
								$.ajax({
									url : "at-sign",
									method : "GET",
									success : function(data) {
										$("#fun1_result").html(data);
									}
								});
							}
						</script>
					</li>
					
					<li>
						<a href="javascript:fun2()">Feed</a>
						<script type="text/javascript">
							function fun2() {
								$.ajax({
									url : "feed",
									method : "GET",
									success : function(data) {
										$("#fun2_result").html(data);
									}
								});
							}
						</script>
					</li>
					
					<li>
						<a href="javascript:fun3()">Join</a>
						<script type="text/javascript">
							function fun3() {
								$.ajax({
									url : "join",
									method : "POST",
									success : function(data) {
										$("#fun3_result").html(data);
									}
								});
							}
						</script>
					</li>
					
					<li class="active"><a href="index">Home</a></li>
					<li>
						<a href="javascript:fun4()">Login</a>
						<script type="text/javascript">
							function fun4() {
								$.ajax({
									url : "login",
									method : "POST",
									success : function(data) {
										$("#fun4_result").html(data);
									}
								});
							}
						</script>
					</li>
					
					<li>
						<a href="javascript:fun7()">tag</a>
						<script type="text/javascript">
							function fun7() {
								$.ajax({
									url : "tag",
									method : "GET",
									success : function(data) {
										$("#fun7_result").html(data);
									}
								});
							}
						</script>
					</li>
					
					<li><a href="#">Notification</a></li>
					
					<li class="dropdown" id="test"><a class="dropdown-toggle"
						href="#" data-toggle="dropdown">My Page</a>
						<div class="dropdown-menu" style="opacity: 0.5;">
						
							<a class="dropdown-item" style="color: #0000ff;" href="javascript:fun5()">Profile</a>
							<script type="text/javascript">
								function fun5() {
									$.ajax({
										url : "profile",
										method : "GET",
										success : function(data) {
											$("#fun5_result").html(data);
										}
									});
								}
							</script>
							
							<a class="dropdown-item" style="color: #0000ff;" href="javascript:fun6()">Setting</a>
							<script type="text/javascript">
								function fun6() {
									$.ajax({
										url : "setting",
										method : "POST",
										success : function(data) {
											$("#fun6_result").html(data);
										}
									});
								}
							</script>
							
							<a class="dropdown-item" style="color: #0000ff;" href="logout">Logout</a>
						</div>
					</li>
				</ul>
			</nav>
		</div>
	</header>
	
	<div id="fun1_result"></div>
	<div id="fun2_result"></div>
	<div id="fun3_result"></div>
	<div id="fun4_result"></div>
	<div id="fun5_result"></div>
	<div id="fun6_result"></div>
	<div id="fun7_result"></div>

	<!-- Vendor JS Files -->
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/php-email-form/validate.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/counterup/counterup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/assets/vendor/venobox/venobox.min.js"></script>

	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/resources/assets/js/main.js"></script>
</body>

</html>