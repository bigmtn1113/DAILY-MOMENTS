<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
						<c:if test="${mid != null}">
							<li><input class="form-control search" type="text" placeholder="search.." /></li>
						</c:if>
						
						<li class="active"><a href="#header">Home</a></li>
						
						<c:if test="${mid == null}">
							<li><a id="li-loginForm" href="javascript:loginForm()">Login</a>
								<script type="text/javascript">
									function loginForm() {
										$.ajax({
											url : "loginForm",
											method : "GET",
											success : function(data) {
												$("#loginForm").html(data);
												$("#li-loginForm").attr("href", "#loginForm");
												$("#li-loginForm").click();
												$("#li-loginForm").attr("href", "javascript:loginForm()");
											}
										});
									}
								</script>
							</li>
							
							<li><a id="li-join" href="javascript:join()">Join</a>
								<script type="text/javascript">
									function join() {
										$.ajax({
											url : "join",
											method : "GET",
											success : function(data) {
												$("#join").html(data);
												$("#li-join").attr("href", "#join");
												$("#li-join").click();
												$("#li-join").attr("href", "javascript:join()");
											}
										});
									}
								</script>
							</li>
						</c:if>
	
						<c:if test="${mid != null}">
							<li><a id="li-atSign" href="javascript:atSign(${mid})">At-Sign</a>
								<script type="text/javascript">
									function atSign(mid) {
										$.ajax({
											url : "atSign",
											method : "GET",
											data: {mid: mid},
											success : function(data) {
												$("#atSign").html(data);
												$("#li-atSign").attr("href", "#atSign");
												$("#li-atSign").click();
												$("#li-atSign").attr("href", "javascript:atSign(${mid})");
											}
										});
									}
								</script>
							</li>
		
							<li><a id="li-feed" href="javascript:feed()">Feed</a>
								<script type="text/javascript">
									function feed() {
										$.ajax({
											url : "feed",
											method : "GET",
											success : function(data) {
												$("#feed").html(data);
												$("#li-feed").attr("href", "#feed");
												$("#li-feed").click();
												$("#li-feed").attr("href", "javascript:feed()");
											}
										});
									}
								</script>
							</li>
		
							<li><a id="li-tag" href="javascript:tag()">Tag</a>
								<script type="text/javascript">
									function tag() {
										$.ajax({
											url : "tag",
											method : "GET",
											success : function(data) {
												$("#tag").html(data);
												$("#li-tag").attr("href", "#tag");
												$("#li-tag").click();
												$("#li-tag").attr("href", "javascript:tag()");
											}
										});
									}
								</script>
							</li>
							
							<li><a id="li-write" href="javascript:write()">Write</a>
								<script type="text/javascript">
									function write() {
										$.ajax({
											url : "write",
											method : "GET",
											success : function(data) {
												$("#write").html(data);
												$("#li-write").attr("href", "#write");
												$("#li-write").click();
												$("#li-write").attr("href", "javascript:write()");
											}
										});
									}
								</script>
							</li>
		
							<li><a href="#">Notification</a></li>
		
							<li class="dropdown" id="test"><a class="dropdown-toggle" href="#" data-toggle="dropdown">My Page</a>
								<div class="dropdown-menu" style="opacity: 0.5;">
		
									<a id="li-profile" class="dropdown-item" style="color: #0000ff;" href="javascript:profile()">Profile</a>
									<script type="text/javascript">
										function profile() {
											$.ajax({
												url : "profile",
												method : "GET",
												success : function(data) {
													$("#profile").html(data);
													$("#li-profile").attr("href", "#profile");
													$("#li-profile").click();
													$("#li-profile").attr("href", "javascript:profile()");
												}
											});
										}
									</script>
		
									<a id="li-setting" class="dropdown-item" style="color: #0000ff;" href="javascript:setting()">Setting</a>
									<script type="text/javascript">
										function setting() {
											$.ajax({
												url : "setting",
												method : "GET",
												success : function(data) {
													$("#setting").html(data);
													$("#li-setting").attr("href", "#setting");
													$("#li-setting").click();
													$("#li-setting").attr("href", "javascript:setting()");
												}
											});
										}
									</script>
		
									<a class="dropdown-item" style="color: #0000ff;" href="logout">Logout</a>
								</div>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</header>
	
		<section id="loginForm"></section>
		<section id="join"></section>
		<section id="atSign"></section>
		<section id="feed"></section>
		<section id="tag"></section>
		<section id="write"></section>
		<section id="profile"></section>
		<section id="setting"></section>
	
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