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
			
				<c:set var="index" value="${status.index}"/>
				<div style="background-color: #1B1B1B;">	
					<c:if test="${board.mid == mid}">																																																	
						<a href="<%=request.getContextPath()%>/resources/images/member/${memberPhotos.get(index)}">
							<img class="rounded-circle" style="margin-left: 5px; margin-right: 10px" width="50px" height="50px" src="<%=request.getContextPath()%>/resources/images/member/${memberPhotos.get(index)}"/>
						</a>
						<a href="javascript:goProfile()"
						   style="text-decoration: none; color: white; font-size: 30px;"
						   id="li-profile">${mid}</a>
						<span style="float: right; margin-top: 15px; margin-right: 15px">
							<fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" />				
						</span>
					</c:if>
					
					<c:if test="${board.mid != mid}">
						<a href="<%=request.getContextPath()%>/resources/images/member/${board.mphoto}">
							<img class="rounded-circle" style="margin-left: 5px; margin-right: 10px" width="50px" height="50px" src="<%=request.getContextPath()%>/resources/images/member/${board.mphoto}"/>
						</a>
						<a href="javascript:goAtSign('${board.mid}')"
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

					<div style="height: 40px; margin-bottom:10px">

						<button type="button" style="float:left; border:none; outline:none; background:none;"><img onclick ="changeHeartImg();" id="img-heart" src="<%=application.getContextPath()%>/resources/assets/img/need/heart.png"></button>
						
	              		<button type="button" style="float:right; border:none; outline:none; background:none;"><img onclick ="changeBookmarkImg();" id="img-bookmark" src="<%=application.getContextPath()%>/resources/assets/img/need/bookmark.png"></button>
						
						<div style="text-align:left; padding-top:10px">좋아요 ${likeCnts.get(index)}개</div>
					</div>

		          	<div
		          		id="midcontentcomment_${board.bno}"
					    class="invisible-scrollbar" 
						style="height: 200px; width: 100%; resize: none; -ms-overflow-style: none; background-color: #1B1B1B; clear: both;
						color: white; overflow-y: auto;">
						<div style="padding-left:30px; padding-right:30px; padding-top:15px">
							<a href="javascript:goAtSign('${board.mid}')" style="text-decoration: none; color: white; padding-top:2px"
							id="li-atSign">${board.mid}</a> ${board.bcontent}
						</div>
						
						<hr	style="height:1px; background: linear-gradient(to right, gray, lightgray, gray); width:95%">
						
						<div style="padding-left:30px; padding-right:30px;" id="commentlist_${board.bno}">
							<c:forEach var="boardComment" items="${boardCommentsList.get(index)}">
								<a href="#"><c:out value="${boardComment.mid}"/></a> : <c:out value="${boardComment.ccontent}"/><br/> 
							</c:forEach>
						</div>
					</div>
					<div style="height:20px">
			             <textarea class="invisible-scrollbar" id="content_${board.bno}" style="float:left; resize:none; width:87%; height:50px; padding:0.8em; -ms-overflow-style:none; scrollbar-width:none;" placeholder="댓글달기... "></textarea>
			             <button id="${board.bno}" class="bx bx-subdirectory-left" onclick="commentWrite('${board.bno}','${mid}')" style="float:right; background-color:#18d26e; color:white; width:13%; height:50px; font-size:20px;"></button>
		          	</div>
		          	
				</div>
			</div>
		</c:forEach>
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
						$("#commentlist_"+bno).html(data)
						$("#content_"+bno).val("");
						$("#midcontentcomment_"+bno).scrollTop($("#midcontentcomment_"+bno)[0].scrollHeight);
					}
				});
			}
		</script>
		<script>
			function changeHeartImg() {
				var heart = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/heart.png";
				var	selectedHeart = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/selected_heart.png";
				var imgElement = document.getElementById('img-heart');
				imgElement.src = (imgElement.src === heart) ? selectedHeart : heart;
			}
		</script>
		<script>
			function changeBookmarkImg() {
				var bookmark = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/bookmark.png",
					selectedBookmark = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/selected_bookmark.png";
				var imgElement = document.getElementById('img-bookmark');
					imgElement.src = (imgElement.src === bookmark)? selectedBookmark : bookmark;
			}
		</script>
	</div>
</div>