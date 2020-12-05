<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="about-me container">

	<div class="section-title">
		<h2>Profile</h2>
		<p>Introduce myself</p>
	</div>

	<div class="row">
		<div class="col-lg-4" data-aos="fade-right">
			<img src="<%=request.getContextPath()%>/resources/images/member/${member.mphoto}"
				class="img-fluid" style="width:340px; height:340px;">
		</div>
		<div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">	
			<h3>ID : ${mid}</h3>
			<div class="row">
				<div class="col-lg-6">
					<ul>
						<li><i class="icofont-rounded-right"></i> <strong>게시물:</strong> ${memberBcnt}</li>
						<li><i class="icofont-rounded-right"></i> <strong>북마크:</strong> ${memberBMcnt}</li>
						<li><i class="icofont-rounded-right"></i> <strong>팔로워:</strong> ${followerCnt}</li>
						<li><i class="icofont-rounded-right"></i> <strong>팔로잉:</strong> ${followingCnt}</li>
					</ul>
				</div>
			</div>
			<p>
				${member.mintroduce}
			</p>
		</div>
	</div>
</div>
<div class="portfolio" id="protfolio">
	<div class="container">
		<div class="section-title">
			<h2>Board</h2>
			<p>My Board</p>
		</div>

		<div class="row">
			<div class="col-lg-12 d-flex justify-content-center">
				<ul id="portfolio-flters">
					<li id="filter-board" data-filter=".filter-board" class="filter-active">게시물</li>
					<!-- <li id="filter-video" data-filter=".filter-video">동영상</li> -->
					<li id="filter-bookmark" data-filter=".filter-bookmark">북마크</li>
				</ul>
			</div>
		</div>
		
		<div class="row portfolio-container">
		
			<c:forEach var="mBAndMBM" items="${mBAndMBMs}">
				<c:if test="${mBAndMBM.mid == mid}">
					<div class="col-lg-4 col-md-6 portfolio-item filter-board">
				</c:if>
				<c:if test="${mBAndMBM.mid != mid}">
					<div class="col-lg-4 col-md-6 portfolio-item filter-bookmark">
				</c:if>
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/images/board/${mBAndMBM.bphoto}"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>App 1</h4>
							<p>App</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/images/board/${mBAndMBM.bphoto}"
									data-gall="portfolioGallery" class="venobox" title="App 1"><i
									class="bx bx-plus"></i></a> <a href="portfolio-details.jsp"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
		<script type="text/javascript">	
			var portfolioIsotope = null;
			
			$(function(){
				portfolioIsotope = $('.portfolio-container').isotope({
					itemSelector: '.portfolio-item',
					layoutMode: 'fitRows'
				});
				
				$('#portfolio-flters li').on('click', function() {
					$("#portfolio-flters li").removeClass('filter-active');
					$(this).addClass('filter-active');
		      
					portfolioIsotope.isotope({
						filter: $(this).data('filter')
					});
				});

				setTimeout(function() {
					$("#filter-board").click();
				}, 100);
	
			});
		</script>
	</div>
</div>