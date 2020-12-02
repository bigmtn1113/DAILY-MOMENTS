<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="portfolio container">
	
	<div class="section-title" style="margin-bottom:40px;">
		<h2>Feed</h2>
		<p>Feed</p>
	</div>
	
	<div class="row portfolio-container">
		<c:forEach var="board" items="${boards}" varStatus="status">
			<div class="col-sm-12 portfolio-item filter-app"
				 style="border-radius:10px;width:auto;height:auto;border:2px solid white;margin-bottom:80px;">
				
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
				
				<div style="background-color: #1B1B1B; margin-top:30px;">	
					<a href="<%=request.getContextPath()%>/resources/images/member/${board.mphoto}">
						<img class="rounded-circle" style="margin-left: 5px; margin-right: 10px" width="50px" height="50px" src="<%=request.getContextPath()%>/resources/images/member/${board.mphoto}"/>
					</a>
					
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
	
				<div>
					<div class="container mt-3" style="text-align: center">
						<img
							src="<%=request.getContextPath()%>/resources/images/board/${board.bphoto}"
							class="img-fluid">
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
						
	              		<button type="button" style="float:right; border:none; outline:none; background:none;">
	              			<c:if test="${isBookmarkboard == true}">
	              				<img onclick ="ClickBookmark('${board.bno}','${mid}');" id="img-bookmark_${board.bno}" src="<%=application.getContextPath()%>/resources/assets/img/need/selected_bookmark.png">
	              			</c:if>
	              			<c:if test="${isBookmarkboard == false}">
	              				<img onclick ="ClickBookmark('${board.bno}','${mid}');" id="img-bookmark_${board.bno}" src="<%=application.getContextPath()%>/resources/assets/img/need/bookmark.png">
	              			</c:if>
	              		</button>
						
						<div style="text-align:left; padding-top:10px" id="heartCount_${board.bno}">좋아요 ${likeCnts.get(index)}개</div>
					</div>

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
					<div style="height:20px; margin-bottom:70px;">
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
	</div>
</div>