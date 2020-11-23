<%@ page contentType="text/html; charset=UTF-8"%>

			<div class="portfolio-details">
				<div class="container">
	
					<div class="row">
						<div class="col-lg-8">
							<div>
								<a href="#" style="text-decoration: none; color: white; font-size: 30px;">아이디</a>
							</div>
							<div class="owl-carousel portfolio-details-carousel">
								<img src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-details-1.jpg" class="img-fluid" alt="">
							</div>
						</div>
	
						<div class="col-lg-4 portfolio-info">
							<textarea style="height: 80%; width: 100%; resize: none; -ms-overflow-style: none; background-color: #1B1B1B; color: white; border: 1px solid white; white-space: pre-line; overflow-y: auto;" readonly="readonly">
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>
								아이디 : 내용<br/>																																																
							</textarea>
							
							<div style="height: 40px">
	
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

								<div style="text-align:left; padding-top:10px">좋아요x개</div>
							</div>
	
							<div style="height: 20px">
								<textarea class="invisible-scrollbar" style="float: left; resize: none; width: 87%; height: 50px; padding: 0.8em; -ms-overflow-style: none; scrollbar-width: none;" placeholder="댓글달기... "></textarea>
								<button class="bx bx-subdirectory-left" style="float: right; background-color: #15BB62; color: white; width: 13%; height: 50px; font-size: 20px;"></button>
							</div>
						</div>
					</div>
				</div>
			</div>
