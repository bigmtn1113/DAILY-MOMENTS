<%@ page contentType="text/html; charset=UTF-8"%>


<div class="portfolio-details">
	<div class="container">

		<div class="row">
			<div class="col-lg-8">
				<div>
					<a href="#"
						style="text-decoration: none; color: white; font-size: 30px;">아이디</a>
				</div>
				<div class="owl-carousel portfolio-details-carousel">
					<img
						src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-details-1.jpg"
						style='width:100%'>
				</div>
			</div>

			<div class="col-lg-4 portfolio-info">
				<textarea
				    class="invisible-scrollbar" 
					style="height: 80%; width: 100%; resize: none; -ms-overflow-style: none; background-color: #1B1B1B; color: white; border: 1px solid white; white-space: pre-line; overflow-y: auto;"
					readonly="readonly">
								아이디 : 내용<br />
								아이디 : 내용<br />
								아이디 : 내용<br />
								아이디 : 내용<br />
								아이디 : 내용<br />
								아이디 : 내용<br />
								아이디 : 내용<br />
								아이디 : 내용<br />
								아이디 : 내용<br />
								아이디 : 내용<br />
								아이디 : 내용<br />																																																
							</textarea>

				<div style="height: 40px; margin-bottom:5px">

					<button type="button"
						style="float: left; border: none; outline: none; background: none;">
						<img onclick="changeHeartImg();" id="img-heart"
							src="<%=application.getContextPath()%>/resources/assets/img/need/heart.png">
					</button>
					<script>
								function changeHeartImg() {
									var heart = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/heart.png";
									var	selectedHeart = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/selected_heart.png";
									var imgElement = document.getElementById('img-heart');
									imgElement.src = (imgElement.src === heart) ? selectedHeart : heart;
								}
							</script>


					<button type="button"
						style="float: right; border: none; outline: none; background: none;">
						<img onclick="changeBookmarkImg();" id="img-bookmark"
							src="<%=application.getContextPath()%>/resources/assets/img/need/bookmark.png">
					</button>
					<script>
						   function changeBookmarkImg() {
						   var bookmark = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/bookmark.png",
						       selectedBookmark = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/selected_bookmark.png";
						   var imgElement = document.getElementById('img-bookmark');
						   imgElement.src = (imgElement.src === bookmark) ? selectedBookmark:bookmark;
						}
					</script>

					<div style="text-align: left; padding-top: 10px">좋아요x개</div>
				</div>

				<div style="height: 20px">
					<textarea class="invisible-scrollbar"
						style="float: left; resize: none; width: 87%; height: 50px; padding: 0.8em; -ms-overflow-style: none; scrollbar-width: none;"
						placeholder="댓글달기... "></textarea>
					<button class="bx bx-subdirectory-left"
						style="float: right; background-color: #15BB62; color: white; width: 13%; height: 50px; font-size: 20px;"></button>
				</div>
			</div>
		</div>
	</div>
</div>
