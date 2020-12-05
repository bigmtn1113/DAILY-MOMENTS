<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
			<div class="portfolio-details container">
				<div class="row">
					<div class="col-lg-8">
					
					<c:set var="index" value="${status.index}"/>
					<c:set var="isLikeboard" value="false"/>
					<c:set var="isBookmarkboard" value="false"/>
					
					<c:forEach var="blike" items="${blikes}">
						<c:if test="${blike.bno == board.bno}">
							<c:set var="isLikeboard" value="true"/>
						</c:if>
					</c:forEach>
					
					<c:forEach var="bookmark" items="${bookmarks}">
						<c:if test="${bookmark.bno == board.bno}">
							<c:set var="isBookmarkboard" value="true"/>
						</c:if>
					</c:forEach>
					
						<div style="background-color: #1B1B1B;">	
							<img class="rounded-circle" style="margin-left: 5px; margin-right: 10px" width="50px" height="50px" src="<%=request.getContextPath()%>/resources/images/member/${mphoto}"/>
							
							<c:if test="${board.mid == mid}">
								<a href="javascript:goProfile()" style="text-decoration: none; color: white; font-size: 30px;" id="li-profile">${mid}</a>
							</c:if>
							<c:if test="${board.mid != mid}">
								<a href="javascript:goAtSign('${board.mid}')" style="text-decoration: none; color: white; font-size: 30px;" id="li-atSign">${board.mid}</a>
							</c:if>
							
							<span style="float: right; margin-top: 15px; margin-right: 15px">
								<fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" />				
							</span>
						</div>
						<div class="container" style="text-align: center">
							<img
								src="<%=request.getContextPath()%>/resources/images/board/${board.bphoto}"
								class="img-fluid">
						</div>
					</div>

					<div class="col-lg-4 portfolio-info">
						<div
			          		id="midcontentcomment_${board.bno}"
						    class="invisible-scrollbar" 
							style="height: 200px; width: 100%; resize: none; -ms-overflow-style: none; background-color: #1B1B1B; clear: both;
							color: white; overflow-y: auto;">
							<div style="padding-left:30px; padding-right:30px; padding-top:15px;">
								 <div style="white-space:pre;">${board.bcontent}</div>
							</div>
							
							<hr	style="height:1px; background: linear-gradient(to right, gray, lightgray, gray); width:95%">
							
							<div style="padding-left:30px; padding-right:30px; padding-bottom:15px;" id="commentlist_${board.bno}">
								<c:forEach var="boardComment" items="${boardCommentsList.get(index)}">
									<div style="padding-bottom:5px;">
										<a href="#"><c:out value="${boardComment.mid}"/></a> : <c:out value="${boardComment.ccontent}"/><br/>
									</div>
								</c:forEach>
							</div>
						</div>

						<div style="height: 40px; margin-bottom:10px">

							<button type="button" style="float:left; border:none; outline:none; background:none;">
								<c:if test="${isLikeboard == true}">
									<img onclick ="ClickHeart('${board.bno}','${mid}');" id="img-heart_${board.bno}" src="<%=application.getContextPath()%>/resources/assets/img/need/selected_heart.png">
								</c:if>
								<c:if test="${isLikeboard == false}">
									<img onclick ="ClickHeart('${board.bno}','${mid}');" id="img-heart_${board.bno}" src="<%=application.getContextPath()%>/resources/assets/img/need/heart.png">
								</c:if>
							</button>
							
							<c:if test="${board.mid != mid}">
			              		<button type="button" style="float:right; border:none; outline:none; background:none;">
			              			<c:if test="${isBookmarkboard == true}">
			              				<img onclick ="ClickBookmark('${board.bno}','${mid}');" id="img-bookmark_${board.bno}" src="<%=application.getContextPath()%>/resources/assets/img/need/selected_bookmark.png">
			              			</c:if>
			              			<c:if test="${isBookmarkboard == false}">
			              				<img onclick ="ClickBookmark('${board.bno}','${mid}');" id="img-bookmark_${board.bno}" src="<%=application.getContextPath()%>/resources/assets/img/need/bookmark.png">
			              			</c:if>
			              		</button>
		              		</c:if>
							
							<div style="text-align:left; padding-top:10px" id="heartCount_${board.bno}">좋아요 ${likeCnts.get(index)}개</div>
						</div>

						<div style="height:20px; margin-bottom:70px;">
				             <textarea class="invisible-scrollbar" id="content_${board.bno}" style="float:left; resize:none; width:87%; height:50px; padding:0.8em; -ms-overflow-style:none; scrollbar-width:none;" placeholder="댓글달기... "></textarea>
				             <button id="${board.bno}" class="bx bx-subdirectory-left" onclick="commentWrite('${board.bno}','${mid}')" style="float:right; background-color:#18d26e; color:white; width:13%; height:50px; font-size:20px;"></button>
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
		
		<script type="text/javascript">
			function goProfile() {
				$.ajax({
					url : "profile",
					method : "GET",
					success : function(data) {
						$("#profile").html(data);
						$("#li-profile").attr("href", "#profile");
						$("#li-profile").click();
						$("#li-profile").attr("href", "javascript:goProfile()");
					}
				});
			}
		</script>
		<script type="text/javascript">
			function goAtSign(mid) {
				$.ajax({
					url : "atSign",
					data:{mid:mid},
					method : "POST",
					success : function(data) {
						$("#atSign").html(data);
						$("#li-atSign").attr("href", "#atSign");
						$("#li-atSign").click();
						$("#li-atSign").attr("href", "javascript:goAtSign('${board.mid}')");
					}
				});
			}
		</script>
		<script type="text/javascript">
			function commentWrite(bno, mid) {
				var comment = $("#content_" + bno).val();
				$.ajax({
					url : "commentWrite",
					data:{ccomment:comment, bno:bno, mid:mid},
					method : "POST",
					success : function(data) {
						$("#commentlist_"+bno).html(data);
						$("#content_"+bno).val("");
						$("#midcontentcomment_"+bno).scrollTop($("#midcontentcomment_"+bno)[0].scrollHeight);
					}
				});
			}
		</script>
		<script type="text/javascript">
			function ClickHeart(bno, mid) {
				var heart = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/heart.png";
				var	selectedHeart = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/selected_heart.png";
				
				if(document.getElementById('img-heart_'+bno).src==heart){ // 빈 하트일 때
					$.ajax({
						url : "LikeClick",
						data : {bno:bno, mid:mid},
						method : "POST",
						success : function(data){
							if(data.result=="success"){
								$("#img-heart_"+bno).attr("src","<%=application.getContextPath()%>/resources/assets/img/need/selected_heart.png");
								$("#heartCount_"+bno).html("좋아요 "+data.likeCntsClick+"개");
							}
						}
					});
				}
				else{ // 선택된 하트일 때
					$.ajax({
						url : "DisLikeClick",
						data : {bno:bno, mid:mid},
						method : "POST",
						success : function(data){
							if(data.result=="success"){
								$("#img-heart_"+bno).attr("src","<%=application.getContextPath()%>/resources/assets/img/need/heart.png");
								$("#heartCount_"+bno).html("좋아요 "+data.likeCntsClick+"개");
							}
						}
					});
				}
			}
		</script>
		<script>
			function ClickBookmark(bno, mid) {
				var bookmark = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/bookmark.png";
				var selectedBookmark = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/selected_bookmark.png";
				if(document.getElementById('img-bookmark_'+bno).src==bookmark){ // 빈 북마크일 때
					$.ajax({
						url : "BookmarkClick",
						data : {bno:bno, mid:mid},
						method : "POST",
						success : function(data){
							if(data.result=="success"){
								$("#img-bookmark_"+bno).attr("src","<%=application.getContextPath()%>/resources/assets/img/need/selected_bookmark.png");
							}
						}
					});
				}
				else{ //선택된 북마크일 때
					$.ajax({
						url : "DisBookmarkClick", 
						data : {bno:bno, mid:mid},
						method : "POST",
						success : function(data){
							if(data.result=="success"){
								$("#img-bookmark_"+bno).attr("src","<%=application.getContextPath()%>/resources/assets/img/need/bookmark.png");
							}
						}
					});
				}
			}
		</script>
	</body>
</html>
