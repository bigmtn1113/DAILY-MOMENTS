<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="about-me container">

	<div class="section-title">
		<h2>Profile</h2>
		<p>Introduce myself</p>
	</div>

	<div class="row">
		<div class="col-lg-4" data-aos="fade-right">
			<img src="<%=request.getContextPath()%>/displayMemberImg?fileName=${member.mphoto}"
				class="img-fluid" style="width:330px; height:330px;">
		</div>
		<div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">	
			<h3>ID : ${mid}</h3>

			<div class="row" style="margin-top: 10px">
				<div class="col-lg-6">
					<ul>
						<li><i class="icofont-rounded-right"></i><strong>Board: </strong>${memberBcnt}</li>
						<li><i class="icofont-rounded-right"></i><strong>Bookmark: </strong>${memberBMcnt}</li>
						<li><i class="icofont-rounded-right"></i><a style="color:white; font-weight: bold;" href="#" data-toggle="modal" data-target="#myFollower">Follower: ${followerCnt}</a></li>
						<li><i class="icofont-rounded-right"></i><a style="color:white; font-weight: bold;" href="#" data-toggle="modal" data-target="#myFollowing">Following: ${followingCnt}</a></li>
					</ul>
				</div>
			</div>
			<p>
				${member.mintroduce}
			</p>
		</div>
	</div>
</div>

<!-- follower -->
<div class="modal fade" id="myFollower" role="dialog">
	<script>
		$('#myFollower').appendTo("body");
	</script>
	<div class="modal-dialog-centered">
		<div style="height: 100%; width: 100%; color: #18d26e"
			class="modal-dialog">

			<div style="background-color: #1B1B1B" class="modal-content">

				<div class="modal-header">
					<div style="margin-left: 3px" class="row">
						<img class="rounded-circle" style="width: 80px; height: 80px;"
							src="<%=request.getContextPath()%>/displayMemberImg?fileName=${member.mphoto}" />
						<h1
							style="margin-left:15px; margin-top: 8px; -ms-overflow-style: none; white-space: pre-line"
							class="modal-title">My Follower</h1>
					</div>
				</div>

				<a style="padding: 10px; margin-top: 5px">Follower</a>
				<div style="color: blue; overflow-y: scroll; height: 350px"
					class="invisible-scrollbar">
					
					<c:forEach var="followerID" items="${followerIDs}" varStatus="status">
						<div style="padding: 8px">
							<img class="rounded-circle"
								style="width: 60px; height: 60px; padding: 10dp"
								src="<%=request.getContextPath()%>/displayMemberImg?fileName=${followerPhotos[status.index]}" />
							 <a
								style="margin-left: 15px; color: white; font-size: 25px"> ${followerID}</a>
						</div>
					</c:forEach>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn"
						style="background-color: #18d26e; color: white"
						data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
</div>

<!-- following -->
<div class="modal fade" id="myFollowing" role="dialog">
	<script>
		$('#myFollowing').appendTo("body");
	</script>
	<div class="modal-dialog-centered">
		<div style="height: 100%; width: 100%; color: #18d26e"
			class="modal-dialog">

			<div style="background-color: #1B1B1B" class="modal-content">

				<div class="modal-header">
					<div style="margin-left: 3px" class="row">
						<img class="rounded-circle" style="width: 80px; height: 80px;"
							src="<%=request.getContextPath()%>/displayMemberImg?fileName=${member.mphoto}" />
						<h1
							style="margin-left: 15px; margin-top: 8px; -ms-overflow-style: none; white-space: pre-line"
							class="modal-title">My following</h1>
					</div>
				</div>

				<a style="padding: 10px; margin-top: 5px">Following</a>
				<div style="color: blue; overflow-y: scroll; height: 350px"
					class="invisible-scrollbar">
					<c:forEach var="followingID" items="${followingIDs}" varStatus="status">
						<div style="padding: 8px">
							<img class="rounded-circle"
								style="width: 60px; height: 60px; padding: 10dp"
								src="<%=request.getContextPath()%>/displayMemberImg?fileName=${followingPhotos[status.index]}" />
							<a
								style="margin-left: 15px; color: white; font-size: 25px">${followingID}</a>
						</div>
					</c:forEach>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn"
						style="background-color: #18d26e; color: white"
						data-dismiss="modal">Close</button>
				</div>

			</div>
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
					<li id="filter-board" data-filter=".filter-board" class="filter-active">Board</li>
					<!-- <li id="filter-video" data-filter=".filter-video">동영상</li> -->
					<li id="filter-bookmark" data-filter=".filter-bookmark">Bookmark</li>
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
								src="<%=request.getContextPath()%>/displayBoardImg?fileName=${mBAndMBM.bphoto}"
								class="img-fluid" alt="">
							<div class="portfolio-info">
								<div class="portfolio-links">
									<a href="portfolioDetails?bphoto=${mBAndMBM.bphoto}"
										data-gall="portfolioDetailsGallery" data-vbtype="iframe" class="venobox">
										<img src="<%=request.getContextPath()%>/displayBoardImg?fileName=${mBAndMBM.bphoto}">
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