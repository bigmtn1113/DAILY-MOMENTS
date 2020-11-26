<%@ page contentType="text/html; charset=UTF-8"%>

<div class="portfolio container">
	
	<div class="section-title">
		<h2>Feed</h2>
		<p>Feed</p>
	</div>

	<div class="row portfolio-container">
		<div class="col-sm-12 portfolio-item filter-app">
			<div>
				<div style="background-color: #1B1B1B;">
					<a href="#"
						style="text-decoration: none; color: white; font-size: 30px;">아이디</a>
				</div>

				<div>
					<div class="container mt-3">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-1.jpg"
							class="img-fluid">
					</div>

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

								<div style="text-align:left; padding-top:10px">좋아요x개</div>
							</div>

					<div
						style="clear: both; height: 70px; background-color: #1B1B1B; border: 1px solid white;">
						<a href="#">아이디</a> : content
					</div>

					<div style="height:20px">
			             <textarea class="invisible-scrollbar" style="float:left; resize:none; width:87%; height:50px; padding:0.8em; -ms-overflow-style:none; scrollbar-width:none;" placeholder="댓글달기... "></textarea>
			             <button class="bx bx-subdirectory-left" style="float:right; background-color:#15BB62; color:white; width:13%; height:50px; font-size:20px;"></button>
		          	</div>
				</div>
			</div>
		</div>

		<div class="col-sm-12 portfolio-item filter-app">
			<div>
				<div style="background-color: #1B1B1B;">
					<a href="#"
						style="text-decoration: none; color: white; font-size: 30px;">아이디</a>
				</div>

				<div>
					<div class="container mt-3">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-2.jpg"
							class="img-fluid">
					</div>

					<div style="height: 40px; margin-bottom:10px">

						<button type="button" style="float:left; border:none; outline:none; background:none;"><img onclick ="change3();" id="img-heart2" src="<%=application.getContextPath()%>/resources/assets/img/need/heart.png"></button>
							<script>
								function change3() {
									var img1 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/heart.png";
									var	img2 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/heart1.png";
									var imgElement = document.getElementById('img-heart2');
									imgElement.src = (imgElement.src == img1) ? img2 : img1;
								}
							</script>
							
						
	              		<button type="button" style="float:right; border:none; outline:none; background:none;"><img onclick ="change4();" id="img-book2" src="<%=application.getContextPath()%>/resources/assets/img/need/book.png"></button>
	              		<script>
							   function change4() {
							   var img3 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/book.png",
							       img4 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/book3.png";
							   var imgElement = document.getElementById('img-book2');
							   imgElement.src = (imgElement.src === img3)? img4 : img3;
							}
						</script> 								

							<div style="text-align:left; padding-top:10px">좋아요x개</div>
					</div>

					<div
						style="clear: both; height: 70px; background-color: #1B1B1B; border: 1px solid white;">
						<a href="#">아이디</a> : content
					</div>

					<div style="height:20px">
			             <textarea class="invisible-scrollbar" style="float:left; resize:none; width:87%; height:50px; padding:0.8em; -ms-overflow-style:none; scrollbar-width:none;" placeholder="댓글달기... "></textarea>
			             <button class="bx bx-subdirectory-left" style="float:right; background-color:#15BB62; color:white; width:13%; height:50px; font-size:20px;"></button>
		          	</div>
				</div>
			</div>
		</div>

		<div class="col-sm-12 portfolio-item filter-app">
			<div>
				<div style="background-color: #1B1B1B;">
					<a href="#"
						style="text-decoration: none; color: white; font-size: 30px;">아이디</a>
				</div>

				<div>
					<div class="container mt-3">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-3.jpg"
							class="img-fluid">
					</div>

							<div style="height: 40px; margin-bottom:10px">
	
							<button type="button" style="float:left; border:none; outline:none; background:none;"><img onclick ="change5();" id="img-heart3" src="<%=application.getContextPath()%>/resources/assets/img/need/heart.png"></button>
								<script>
									function change5() {
										var img1 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/heart.png";
										var	img2 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/heart1.png";
										var imgElement = document.getElementById('img-heart3');
										imgElement.src = (imgElement.src == img1) ? img2 : img1;
									}
								</script>
								
							
		              		<button type="button" style="float:right; border:none; outline:none; background:none;"><img onclick ="change6();" id="img-book3" src="<%=application.getContextPath()%>/resources/assets/img/need/book.png"></button>
		              		<script>
								   function change6() {
								   var img3 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/book.png",
								       img4 = location.protocol + "//" + location.host + "<%=application.getContextPath()%>/resources/assets/img/need/book3.png";
								   var imgElement = document.getElementById('img-book3');
								   imgElement.src = (imgElement.src === img3)? img4 : img3;
								}
							</script> 								

								<div style="text-align:left; padding-top:10px">좋아요x개</div>
							</div>

					<div
						style="clear: both; height: 70px; background-color: #1B1B1B; border: 1px solid white;">
						<a href="#">아이디</a> : content
					</div>

					<div style="height:20px">
			             <textarea class="invisible-scrollbar" style="float:left; resize:none; width:87%; height:50px; padding:0.8em; -ms-overflow-style:none; scrollbar-width:none;" placeholder="댓글달기... "></textarea>
			             <button class="bx bx-subdirectory-left" style="float:right; background-color:#15BB62; color:white; width:13%; height:50px; font-size:20px;"></button>
		          	</div>
				</div>
			</div>
		</div>
	</div>
</div>