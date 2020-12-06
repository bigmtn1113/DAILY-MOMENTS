<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="about-me container">
	<div class="section-title">
		<h2>Tag</h2>
		<p>Tag</p>
	</div>
	
	<div class="row">
		<div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">	
			<h3>#${searchedTag}</h3>
			<div class="row" style="margin-top: 10px">
				<div class="col-lg-6">
					<ul><li><i class="icofont-rounded-right"></i> <strong>Board:</strong> ${tagBoardCnt}</li></ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="portfolio container">
	<div class="row portfolio-container">
	
		<c:forEach var="tagBoardPhoto" items="${tagBoardPhotos}">
			<div class="col-lg-4 col-md-6 portfolio-item filter-app">
				<div class="portfolio-wrap">
					<img src="<%=request.getContextPath()%>/resources/images/board/${tagBoardPhoto}"
						class="img-fluid">
					
					<div class="portfolio-info">
						<div class="portfolio-links">
							<a href="portfolioDetails?bphoto=${tagBoardPhoto}"
								data-gall="portfolioDetailsGallery" data-vbtype="iframe" class="venobox">
								<img src="<%=request.getContextPath()%>/resources/images/board/${tagBoardPhoto}">
							</a>
							<script>
								$(function(){
									$('.venobox').venobox({});
								});
							</script>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>
</div>