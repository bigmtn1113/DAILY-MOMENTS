<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:forEach begin='${startBoardNo}' end='${endBoardNo}' var="board"
	items="${boards}" varStatus="status">
	<div class="col-sm-12 portfolio-item"
		style="border-radius: 10px; width: 100%; height: auto; border: 2px solid white; margin-bottom: 80px;">

		<c:set var="index" value="${status.index}" />
		<c:set var="isLikeboard" value="false" />
		<c:set var="isBookmarkboard" value="false" />

		<c:forEach var="blike" items="${blikes}">
			<c:if test="${blike.bno == board.bno}">
				<c:set var="isLikeboard" value="true" />
			</c:if>
		</c:forEach>

		<c:forEach var="bookmark" items="${bookmarks}">
			<c:if test="${bookmark.bno == board.bno}">
				<c:set var="isBookmarkboard" value="true" />
			</c:if>
		</c:forEach>

		<div style="background-color: #1B1B1B; margin-top: 30px;">
			<a href="<%=request.getContextPath()%>/resources/images/member/${board.mphoto}" data-gall="portfolioDetailsGallery" class="venobox vbox-item">
				<img class="rounded-circle" style="margin-left: 5px; margin-right: 10px" width="50px" height="50px" src="<%=request.getContextPath()%>/resources/images/member/${board.mphoto}"/>
			</a>
			<script>
				$(function(){
					$('.venobox').venobox({	
						
					});
				});
			</script>
			<c:if test="${board.mid == mid}">
				<a href="javascript:profile()" style="text-decoration: none; color: white; font-size: 30px;" id="li-profile">${mid}</a>
			</c:if>
			<c:if test="${board.mid != mid}">
				<a href="javascript:atSign('${board.mid}')" style="text-decoration: none; color: white; font-size: 30px;" id="li-atSign">${board.mid}</a>
			</c:if>
			
			<c:if test="${board.mid == mid}">
				<button class="btn" style="float: right; margin-top: 8px; margin-right: 8px; background: #18d26e; color: #fff;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    :
				</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="javascript:updateBoard('${board.bno}', '${board.bphoto}', '${board.bcontent}')">Modify</a>
					<a class="dropdown-item" href="javascript:deleteBoard('${board.bno}', '${board.bphoto}')">Delete</a>
				</div>
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
				
				<div style="text-align:left; padding-top:10px" id="heartCount_${board.bno}">Like ${likeCnts.get(index)}</div>
			</div>

          	<div
          		id="midcontentcomment_${board.bno}"
			    class="invisible-scrollbar" 
				style="height: 250px; width: 100%; resize: none; -ms-overflow-style: none; background-color: #1B1B1B; clear: both;
				color: white; overflow-y: auto;">
				<div style="padding-left:30px; padding-right:30px; padding-top:15px;">
					 <div style="white-space:pre-line;">${board.bcontent}</div>
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
	             <textarea class="invisible-scrollbar" id="content_${board.bno}" style="float:left; resize:none; width:87%; height:50px; padding:0.8em; -ms-overflow-style:none; scrollbar-width:none;" placeholder="Write Comment... "></textarea>
	             <button id="${board.bno}" class="bx bx-subdirectory-left" onclick="commentWrite('${board.bno}','${mid}')" style="float:right; background-color:#18d26e; color:white; width:13%; height:50px; font-size:20px;"></button>
          	</div>
		</div>
	</div>
</c:forEach>