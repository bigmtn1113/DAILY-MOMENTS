<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div id="qna" class="about-me mobileList">
	
	<div class="input-form container">
	
		<div class="section-title">
			<h2>Q&A</h2>
			<p>Q&A - May I help you ?</p>
		</div>
		<br>
		
		<div class="sector">
			<h5>Q&A Write Form</h5>
		</div>	
	
		<form action="setting" method="post" role="form" class="php-email-form mt-4">
		
			<div class="form-group">
				<input type="text" name="btitleQna" class="form-control" id="btitleQna" placeholder="Title"/>
				<span style="color: orange" id="btitleErrorQna" ></span>
			</div>
			
			<div class="form-group">
				<textarea style="height: 150px;" name="bcontentQna" class="form-control" id="bcontentQna" placeholder="Content"></textarea>
				<span style="color: orange" id="bcontentErrorQna"></span>
			</div>
	
			<div style="text-align: center;">
				<a class="btn btn-center" style="background: #18d26e; color: white" href="javascript:boardWrite()">Write</a>
			</div>
			
			<script type="text/javascript">
				function boardWrite() {
					var btitle = $("#btitleQna").val().trim();  //var는 int, string 등 타입 그냥 다 받음. 만능 타입. / #btitle 은 btitle 찾아라! 는 뜻. 여기선 위로 가서 찾겠지. form태그 밑 div그룹 내 id가 btitle이니까 거기로 간다.
					if(btitle == "") { $("#btitleErrorQna").text("Title란을 공백으로 작성하실 수 없습니다."); }
					else { $("#btitleErrorQna").text(""); }
					
					var bcontent = $("#bcontentQna").val().trim();
					if(bcontent == "") { $("#bcontentErrorQna").text("Content란을 공백으로 작성하실 수 없습니다."); }
					else { $("#bcontentErrorQna").text(""); }
					
					if(btitle == "" || bcontent == "") {
						return;	
					} 
					
					$.ajax({
						url:"qnaWrite",
						method:"post",
						data: {btitle:btitle, bcontent:bcontent},
						success:function(data) {
							$("#qnaList").html(data);
							$("#btitleQna").val("");
							$("#bcontentQna").val("");
						}
					});
				}
			</script>		
		
		</form>
	</div>

	<div class="input-form container mobileList">
		
		<div class="sector">
			<h5>Q&A Bulletin Board</h5>
		</div>	
					
			<div>	
				<form id="qnaList" class="php-email-form mt-4">	<!-- qnaList 불러올 때 이 밑에 있는거 대체해서 이 자리에 넣는 거임. 이 아래 양식에 넣는 게 아니라, 대체하는 것! -->		
					<table style="color:#636568; width:100%; border-collapse: separate; border-spacing: 5px;">
						<tr style="height:30px; background-color: white;" align="center" >
							<th style="background-color: #262626; padding-bottom: 10px; padding-top: 10px;">No.</th>
							<th style="background-color: #262626; padding-bottom: 10px; padding-top: 10px;">Title</th>
							<th class="mobileCase" style="background-color: #262626; padding-bottom: 10px; padding-top: 10px;">ID</th>
							<th class="mobileCase" style="background-color: #262626; padding-bottom: 10px; padding-top: 10px;">Date</th>
						</tr>
						
						<c:forEach var="board" items="${list}"> <!-- var= 는 변수 임의로 넣으면 되고, list 부분은 컨트롤러에서 받는 것. 어떻게 구분하냐? qna.jsp 올 때 클릭했지? 그 때 이 페이지 불러오면서 컨트롤러에서 list 정의했음. 그거 쓴다. -->
							<tr align="center">
								<td style="background-color: #262626; padding-bottom: 10px; padding-top: 10px;">${board.bno}</td>
								<td style="background-color: #262626; padding-bottom: 10px; padding-top: 10px;"><a href="javascript:qnaDetail(${board.bno})">${board.btitle}</a></td>
								<td class="mobileCase" style="background-color: #262626; padding-bottom: 10px; padding-top: 10px;">${board.mid}</td>
								<%-- <td><img class="rounded-circle" width="50px" height="50px" src="photodownload?fileName=${board.mphoto}"/></td> --%>
								<td class="mobileCase" style="background-color: #262626; padding-bottom: 10px; padding-top: 10px;"><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
									
				
					<!-- <div class="pageNo">
						<tr style="text-align: center;"> -->
						<tr>
							<td colspan="4" style="text-align: center;">
							<br>
								<a class="btn btn-outline-primary btn-sm mobileCase" href="javascript:qnaList(1)">First</a>
								
								<c:if test="${pager.groupNo > 1}">
									<a class="btn btn-outline-info btn-sm" href="javascript:qnaList(${pager.startPageNo-1})">Prev</a> <!-- 페이지 에서 '이전' 누르면 그 그룹 바로 전 페이지그룹으로 간다 ex)12345탭 페이지 -> 678910탭 페이지 ... 이렇게 됨 -->
								</c:if>
								
								<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
									<c:if test="${pager.pageNo == i}">
										<a class="btn btn-danger btn-sm" href="javascript:qnaList(${i})">${i}</a>
									</c:if>
									
									<c:if test="${pager.pageNo != i}">
										<a class="btn btn-outline-success btn-sm" href="javascript:qnaList(${i})">${i}</a>
									</c:if>
								</c:forEach>
								
								<c:if test="${pager.groupNo < pager.totalGroupNo}">
									<a class="btn btn-outline-info btn-sm" href="javascript:qnaList(${pager.endPageNo+1})">Next</a>
								</c:if>
								
								<a class="btn btn-outline-primary btn-sm mobileCase" href="javascript:qnaList(${pager.totalPageNo})">Last</a>
							</td>
						</tr>
						<!-- </tr> -->
						
						<!-- <div id="board_result" style="margin-top:30px"></div> -->
						
					<!-- </div> -->
					
					</table>
				
				</form>
				
				
				
				
				
				<script type="text/javascript">
					function qnaList(pageNo) {
						if(!pageNo) {
							pageNo = 1;
						}
						$.ajax({
							url:"qnaList",
							data: {pageNo:pageNo},
							success:function(data){
								$("#qnaList").html(data);
							}
						});
					}
				</script>
				
				
				
				
				
				<script type="text/javascript">
					function qnaDetail(bno) {
						$.ajax({
							url:"qnaDetail",
							data: {bno:bno},
							success:function(data) {
								$("#qnaList").html(data);
							}
						});
					}
				</script>				
					
					
				
				
				
		
			
			</div>

	</div>
</div>



















































































<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------- -->


<%-- <div class="about-me container">

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
</div> --%>
















































































<%-- <div class="portfolio" id="protfolio">
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
</div> --%>
		
		
		
		
		
		
		
		
		
		
