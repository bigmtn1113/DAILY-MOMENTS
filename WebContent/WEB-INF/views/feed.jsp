<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="portfolio container">
	
	<div class="section-title">
		<h2>Feed</h2>
		<p>Feed</p>
	</div>

	<div class="row portfolio-container">
		<c:forEach var="board" items="${boards}" varStatus="status">
			<div class="col-sm-12 portfolio-item filter-app">
				<div style="background-color: #1B1B1B;">
					<c:if test="${board.mid == mid}">
						<img class="rounded-circle" style="margin-left: 5px; margin-right: 10px" width="50px" height="50px" src="<%=request.getContextPath()%>/resources/assets/img/need/unnamed.png"/>
						<a href="javascript:Goprofile()"
						   style="text-decoration: none; color: white; font-size: 30px;"
						   id="li-profile">${mid}</a>
						<span style="float: right; margin-top: 15px; margin-right: 15px">
							<fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" />				
						</span>
					</c:if>
					
					<c:if test="${board.mid != mid}">
						<img class="rounded-circle" style="margin-left: 5px; margin-right: 10px" width="50px" height="50px" src="<%=request.getContextPath()%>/resources/assets/img/need/unnamed.png"/>
						<a href="javascript:GoatSign('${board.mid}')"
						   style="text-decoration: none; color: white; font-size: 30px;"
						   id="li-atSign">${board.mid}</a>	
						<span style="float: right; margin-top: 15px; margin-right: 15px">
							<fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" />				
						</span>
					</c:if>
					
				</div>
	
				<div>
					<div class="container mt-3" style="text-align: center">
						<img
							src="<%=request.getContextPath()%>/resources/images/board/${board.bphoto}"
							class="img-fluid">
					</div>
					  	
		          	<textarea
					    class="invisible-scrollbar" 
						style="height: 200px; width: 100%; resize: none; -ms-overflow-style: none; background-color: #1B1B1B; color: white; border: 1px solid white; white-space: pre-line; overflow-y: auto;"
						readonly="readonly">
							${board.bcontent}																																														
					</textarea>
		          	
					<div style="height: 40px; margin-bottom:10px">

						<button type="button" style="float:left; border:none; outline:none; background:none;"><img onclick ="change1();" id="img-heart" src="<%=application.getContextPath()%>/resources/assets/img/need/heart.png"></button>
						<script>
							function change1() {
								var img1 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/heart.png";
								var	img2 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/heart1.png";
								var imgElement = document.getElementById('img-heart');
								imgElement.src = (imgElement.src == img1) ? img2 : img1;
							}
						</script>
						
	              		<button type="button" style="float:right; border:none; outline:none; background:none;"><img onclick ="change2();" id="img-book" src="<%=application.getContextPath()%>/resources/assets/img/need/book.png"></button>
	              		<script>
							   function change2() {
							   var img3 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/book.png",
							       img4 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/book3.png";
							   var imgElement = document.getElementById('img-book');
							   imgElement.src = (imgElement.src === img3)? img4 : img3;
							}
						</script>
						
						<c:set var="index" value="${status.index}"/>
						<div style="text-align:left; padding-top:10px">좋아요 ${likeCnts.get(index)}개</div>
					</div>
					
					<div style="clear: both; height: 70px; background-color: #1B1B1B; border: 1px solid white;">
						<c:forEach var="boardComment" items="${boardCommentsList.get(index)}">
							<a href="#"><c:out value="${boardComment.mid}"/></a> : <c:out value="${boardComment.ccontent}"/><br/>
						</c:forEach>
					</div>
	
					<div style="height:20px">
			             <textarea class="invisible-scrollbar" style="float:left; resize:none; width:87%; height:50px; padding:0.8em; -ms-overflow-style:none; scrollbar-width:none;" placeholder="댓글달기... "></textarea>
			             <button class="bx bx-subdirectory-left" style="float:right; background-color:#15BB62; color:white; width:13%; height:50px; font-size:20px;"></button>
		          	</div>
				</div>
			</div>
		</c:forEach>
		<script type="text/javascript">
			function GoatSign(mid) {
				$.ajax({
					url : "atSign",
					data:{mid:mid},
					method : "POST",
					success : function(data) {
						$("#atSign").html(data);
						$("#li-atSign").attr("href", "#atSign");
						$("#li-atSign").click();
						$("#li-atSign").attr("href", "javascript:GoatSign()");
					}
				});
			}
		</script>
		<script type="text/javascript">
			function Goprofile() {
				$.ajax({
					url : "profile",
					method : "GET",
					success : function(data) {
						$("#profile").html(data);
						$("#li-profile").attr("href", "#profile");
						$("#li-profile").click();
						$("#li-profile").attr("href", "javascript:Goprofile()");
					}
				});
			}
		</script>
	</div>
</div>