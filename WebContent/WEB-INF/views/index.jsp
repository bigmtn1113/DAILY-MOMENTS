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
				<a href="">FaceGram</a>
			</h1>
			<h2>
				I'm a passionate <span>graphic designer</span> from New York
			</h2>

			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li><input class="form-control search" type="text"
						placeholder="search.." />
					</li>
					
					<li class="active"><a href="#header">Home</a></li>
					
					<li>
						<a id="fun1_resultA" href="javascript:fun1()">At-sign</a>
						<script type="text/javascript">
							function fun1() {
								$.ajax({
									url : "at-sign",
									method : "GET",
									success : function(data) {
										$("#fun1_result").html(data);
			          					$("#fun1_resultA").attr("href", "#fun1_result");
			          					$("#fun1_resultA").click();
			          					$("#fun1_resultA").attr("href", "javascript:fun1()");
									}
								});
							}
						</script>
					</li>
					
					<li>
						<a id="fun2_resultA" href="javascript:fun2()">Feed</a>
						<script type="text/javascript">
							function fun2() {
								$.ajax({
									url : "feed",
									method : "GET",
									success : function(data) {
										$("#fun2_result").html(data);
										$("#fun2_resultA").attr("href", "#fun2_result");
			          					$("#fun2_resultA").click();
			          					$("#fun2_resultA").attr("href", "javascript:fun2()");
									}
								});
							}
						</script>
					</li>
					
					<li>
						<a id="fun3_resultA" href="javascript:fun3()">Join</a>
						<script type="text/javascript">
							function fun3() {
								$.ajax({
									url : "join",
									method : "POST",
									success : function(data) {
										$("#fun3_result").html(data);
										$("#fun3_resultA").attr("href", "#fun3_result");
			          					$("#fun3_resultA").click();
			          					$("#fun3_resultA").attr("href", "javascript:fun3()");
									}
								});
							}
						</script>
					</li>
					
					<li>
						<a id="fun4_resultA" href="javascript:fun4()">Login</a>
						<script type="text/javascript">
							function fun4() {
								$.ajax({
									url : "login",
									method : "POST",
									success : function(data) {
										$("#fun4_result").html(data);
										$("#fun4_resultA").attr("href", "#fun4_result");
			          					$("#fun4_resultA").click();
			          					$("#fun4_resultA").attr("href", "javascript:fun4()");
									}
								});
							}
						</script>
					</li>
					
					<li>
						<a id="fun7_resultA" href="javascript:fun7()">tag</a>
						<script type="text/javascript">
							function fun7() {
								$.ajax({
									url : "tag",
									method : "GET",
									success : function(data) {
										$("#fun7_result").html(data);
										$("#fun7_resultA").attr("href", "#fun7_result");
			          					$("#fun7_resultA").click();
			          					$("#fun7_resultA").attr("href", "javascript:fun7()");
									}
								});
							}
						</script>
					</li>
					
					<li><a href="#">Notification</a></li>
					
					<li class="dropdown" id="test"><a class="dropdown-toggle"
						href="#" data-toggle="dropdown">My Page</a>
						<div class="dropdown-menu" style="opacity: 0.5;">
						
							<a id="fun5_resultA" class="dropdown-item" style="color: #0000ff;" href="javascript:fun5()">Profile</a>
							<script type="text/javascript">
								function fun5() {
									$.ajax({
										url : "profile",
										method : "GET",
										success : function(data) {
											$("#fun5_result").html(data);
											$("#fun5_resultA").attr("href", "#fun5_result");
				          					$("#fun5_resultA").click();
				          					$("#fun5_resultA").attr("href", "javascript:fun5()");
										}
									});
								}
							</script>
							
							<a id="fun6_resultA" class="dropdown-item" style="color: #0000ff;" href="javascript:fun6()">Setting</a>
							<script type="text/javascript">
								function fun6() {
									$.ajax({
										url : "setting",
										method : "POST",
										success : function(data) {
											$("#fun6_result").html(data);
											$("#fun6_resultA").attr("href", "#fun6_result");
				          					$("#fun6_resultA").click();
				          					$("#fun6_resultA").attr("href", "javascript:fun6()");
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
	
	<section id="fun1_result"></section>
	<section id="fun2_result"></section>
	<section class="input-form" id="fun3_result"></section>
	<section class="input-form" id="fun4_result"></section>
	<section id="fun5_result"></section>
	<section class="input-form" id="fun6_result"></section>
	<section id="fun7_result"></section>

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