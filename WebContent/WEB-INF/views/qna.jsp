<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="qna" class="about-me container">
	
	<div class="section-title">
		<h2>Q&A</h2>
		<p>Q&A  - May I help you ?</p>
	</div>
		
		
	<div class="input-form container">
	
		<div class="sector">
			<h5>Q&A 작성</h5>
		</div>	
	
		<form action="setting" method="post" role="form" class="php-email-form mt-4">
		
			<div class="form-group">
				<input type="text" name="btitle" class="form-control" id="btitle" placeholder="Title"/>
				<span id="btitleError" ></span>
			</div>
			
			<div class="form-group">
				<textarea name="bcontent" class="form-control" id="bcontent" placeholder="Content"></textarea>
				<span id="bcontentError"></span>
			</div>
	
			<!-- 2번 기능 : 글쓰기 버튼 누르면 글쓰는 양식(qnaBoardWriteForm.jsp) 불러오기 -->
			<div class="writeATag" style="text-align: center;">
				<a class="btn btn-info btn-center" href="javascript:boardWrite()">글쓰기</a>
			</div>
			
			<script type="text/javascript">
				function boardWrite() {
					var btitle = $("#btitle").val().trim();  //var는 int string 그런 거 그냥 다 받음. 만능 타입.
					if(btitle == "") { $("#btitleError").text("필수"); }
					else { $("#btitleError").text(""); }
					
					var bcontent = $("#bcontent").val().trim();
					if(bcontent == "") { $("#bcontentError").text("필수"); }
					else { $("#bcontentError").text(""); }
					
					if(btitle == "" || bcontent == "") {
						return;	
					} 
					
					$.ajax({
						url:"qnaWrite",
						method:"post",
						data: {btitle:btitle, bcontent:bcontent},
						success:function(data) {
							$("#qnaList").html(data);
						}
					});
				}
			</script>		
		
		</form>
	</div>

	<div class="input-form container">
		
		<div class="sector">
			<h5>Q&A 게시판</h5>
		</div>	
					
			<div>	
				<form id="qnaList" class="php-email-form mt-4">			
					<table style="color:#636568; width:100%; border-collapse: separate; border-spacing: 5px;">
						<tr style="height: 30px; background-color: white">
							<th  style="width:50px; background-color: #262626;">번호</th>
							<th  style="width:200px; background-color: #262626;">제목</th>
							<th  style="width:100px; background-color: #262626;">글쓴이</th>
							<th  style="width:100px; background-color: #262626;">날짜</th>
						</tr>
						
						<c:forEach var="board" items="${list}">
								<tr>
								<td>${board.bno}</td>
								<td><a href="javascript:boardDetail(${board.bno})">${board.btitle}</a></td>
								<td>${board.mid}</td>
								<%-- <td><img class="rounded-circle" width="50px" height="50px" src="photodownload?fileName=${board.mphoto}"/></td> --%>
								<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
									
				
					<div class="pageNo">
						<tr style="text-align: center;">
							<td colspan="4" style="text-align: center;">
								<a class="btn btn-info btn-sm" href="javascript:boardList(1)">처음</a>
								
								<c:if test="${pager.groupNo > 1}">
									<a class="btn btn-outline-info btn-sm" href="javascript:boardList(${pager.startPageNo-1})">이전</a> <!-- 페이지 에서 '이전' 누르면 그 그룹 바로 전 페이지그룹으로 간다 ex)12345탭 페이지 -> 678910탭 페이지 ... 이렇게 됨 -->
								</c:if>
								
								<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo == i}">
										<a class="btn btn-danger btn-sm" href="javascript:boardList(${i})">${i}</a>
									</c:if>
									
									<c:if test="${pager.pageNo != i}">
										<a class="btn btn-outline-success btn-sm" href="javascript:boardList(${i})">${i}</a>
									</c:if>
								</c:forEach>
								
								<c:if test="${pager.groupNo < pager.totalGroupNo}">
									<a class="btn btn-outline-info btn-sm" href="javascript:boardList(${pager.endPageNo+1})">다음</a>
								</c:if>
								
								<a class="btn btn-outline-primary btn-sm" href="javascript:boardList(${pager.totalPageNo})">맨끝</a>
							</td>
						</tr>
						
						<div id="board_result" style="margin-top:30px"></div>
						
					</div>
					
					</table>
				
				</form>
				
				
				<script type="text/javascript">
					function boardDetail(bno) {
						$.ajax({
							url:"boardDetail",
							data: {bno:bno},
							success:function(data) {
								$("#board_result").html(data);
							}
						});
					}
				</script>
			
			</div>

	</div>
</div>





































<div class="about-me container">

	<div class="section-title">
		<h2>Q&A 담당자</h2>
		<p>Q&A 담당자 - 줄리아</p>
	</div>
	
	<div class="row">
		<div class="col-lg-4" data-aos="fade-right">
			<img src="<%=request.getContextPath()%>/resources/assets/img/me.jpg"
				class="img-fluid" alt="">
		</div>
		<div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
			<br /> <br /> <br />
			<h3 style="display: inline">Q&A Supreme Manager - 줄리아</h3>
			<button class="btn btn-info btn-sm" onclick="">팔로우</button>
			<div class="row">
				<div class="col-lg-6">
					<ul>
						<li></li>
						<li><i class="icofont-rounded-right"></i> <strong>경력:</strong> 송파초등학교 졸업 / 송파중학교 중퇴</li>
						<li><i class="icofont-rounded-right"></i> <strong>팔로워:</strong> 7</li>
						<li><i class="icofont-rounded-right"></i> <strong>팔로잉:</strong> 100k</li>
					</ul>
				</div>
			</div>
			<p>
				안녕하세요<br /> Q&A 수프림 매니저 제니퍼 입니다.<br /> 질문하세요.<br />
			</p>
		</div>
	</div>
</div>
















































































<div class="portfolio" id="protfolio">
	<div class="container">
		<div class="section-title">
			<h2>Portfolio</h2>
			<p>줄리아의 작업들</p>
		</div>

		<div class="row">
			<div class="col-lg-12 d-flex justify-content-center">
				<ul id="portfolio-flters">
					<li data-filter=".filter-app">게시물</li>
					<li data-filter=".filter-card">동영상</li>
					<li data-filter=".filter-web">북마크</li>
				</ul>
			</div>
		</div>

		<div class="row portfolio-container">

			<div class="col-lg-4 col-md-6 portfolio-item filter-app">
				<div class="portfolio-wrap">
					<img
						src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-1.jpg"
						class="img-fluid">
					
					<div class="portfolio-info">
						<h4>App 1</h4>
						<p>App</p>
						<div class="portfolio-links">
							<a
								href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-1.jpg"
								data-gall="portfolioGallery" class="venobox" title="App 1"><i
								class="bx bx-plus"></i>
							</a>
							<a
							    id="li-portfoliodetail" href="javascript:portfoliodetail()"
								data-gall="portfolioDetailsGallery" data-vbtype="iframe"
								class="venobox" title="Portfolio Details"><i
								class="bx bx-link"></i>
							</a>
							<script type="text/javascript">
								function portfoliodetail() {
									$.ajax({
										url : "portfoliodetail",
										method : "GET",
										success : function(data) {
											$("#at-sign").html(data);
											$("#li-portfoliodetail").attr("href", "#at-sign");
											$("#li-portfoliodetail").click();
											$("#li-portfoliodetail").attr("href", "javascript:portfoliodetail()");
										}
									});
								}
							</script>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-web">
				<div class="portfolio-wrap">
					<img
						src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-2.jpg"
						class="img-fluid" alt="">
					<div class="portfolio-info">
						<h4>Web 3</h4>
						<p>Web</p>
						<div class="portfolio-links">
							<a
								href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-2.jpg"
								data-gall="portfolioGallery" class="venobox" title="Web 3"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details"
								data-gall="portfolioDetailsGallery" data-vbtype="iframe"
								class="venobox" title="Portfolio Details"><i
								class="bx bx-link"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-app">
				<div class="portfolio-wrap">
					<img
						src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-3.jpg"
						class="img-fluid" alt="">
					<div class="portfolio-info">
						<h4>App 2</h4>
						<p>App</p>
						<div class="portfolio-links">
							<a
								href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-3.jpg"
								data-gall="portfolioGallery" class="venobox" title="App 2"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details"
								data-gall="portfolioDetailsGallery" data-vbtype="iframe"
								class="venobox" title="Portfolio Details"><i
								class="bx bx-link"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-card">
				<div class="portfolio-wrap">
					<img
						src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-4.jpg"
						class="img-fluid" alt="">
					<div class="portfolio-info">
						<h4>Card 2</h4>
						<p>Card</p>
						<div class="portfolio-links">
							<a
								href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-4.jpg"
								data-gall="portfolioGallery" class="venobox" title="Card 2"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details"
								data-gall="portfolioDetailsGallery" data-vbtype="iframe"
								class="venobox" title="Portfolio Details"><i
								class="bx bx-link"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-web">
				<div class="portfolio-wrap">
					<img
						src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-5.jpg"
						class="img-fluid" alt="">
					<div class="portfolio-info">
						<h4>Web 2</h4>
						<p>Web</p>
						<div class="portfolio-links">
							<a
								href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-5.jpg"
								data-gall="portfolioGallery" class="venobox" title="Web 2"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details"
								data-gall="portfolioDetailsGallery" data-vbtype="iframe"
								class="venobox" title="Portfolio Details"><i
								class="bx bx-link"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-app">
				<div class="portfolio-wrap">
					<img
						src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-6.jpg"
						class="img-fluid" alt="">
					<div class="portfolio-info">
						<h4>App 3</h4>
						<p>App</p>
						<div class="portfolio-links">
							<a
								href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-6.jpg"
								data-gall="portfolioGallery" class="venobox" title="App 3"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details"
								data-gall="portfolioDetailsGallery" data-vbtype="iframe"
								class="venobox" title="Portfolio Details"><i
								class="bx bx-link"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-card">
				<div class="portfolio-wrap">
					<img
						src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-7.jpg"
						class="img-fluid" alt="">
					<div class="portfolio-info">
						<h4>Card 1</h4>
						<p>Card</p>
						<div class="portfolio-links">
							<a
								href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-7.jpg"
								data-gall="portfolioGallery" class="venobox" title="Card 1"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details"
								data-gall="portfolioDetailsGallery" data-vbtype="iframe"
								class="venobox" title="Portfolio Details"><i
								class="bx bx-link"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-card">
				<div class="portfolio-wrap">
					<img
						src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-8.jpg"
						class="img-fluid" alt="">
					<div class="portfolio-info">
						<h4>Card 3</h4>
						<p>Card</p>
						<div class="portfolio-links">
							<a
								href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-8.jpg"
								data-gall="portfolioGallery" class="venobox" title="Card 3"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details"
								data-gall="portfolioDetailsGallery" data-vbtype="iframe"
								class="venobox" title="Portfolio Details"><i
								class="bx bx-link"></i></a>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6 portfolio-item filter-web">
				<div class="portfolio-wrap">
					<img
						src="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-9.jpg"
						class="img-fluid" alt="">
					<div class="portfolio-info">
						<h4>Web 3</h4>
						<p>Web</p>
						<div class="portfolio-links">
							<a
								href="<%=request.getContextPath()%>/resources/assets/img/portfolio/portfolio-9.jpg"
								data-gall="portfolioGallery" class="venobox" title="Web 3"><i
								class="bx bx-plus"></i></a> <a href="portfolio-details"
								data-gall="portfolioDetailsGallery" data-vbtype="iframe"
								class="venobox" title="Portfolio Details"><i
								class="bx bx-link"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		
		
		
		
		
		
		
		
		
		
