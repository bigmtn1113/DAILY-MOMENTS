<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="about-me container">

	<div class="section-title">
		<h2>Profile</h2>
		<p>Introduce</p>
	</div>

	<div class="row">
		<div class="col-lg-4" data-aos="fade-right">
			<img src="<%=request.getContextPath()%>/resources/images/member/${member.mphoto}"
				class="img-fluid" style="width:330px; height:330px;">
		</div>
		<div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
			<h3 style="display: inline; margin-right: 10px">ID : ${member.mid}</h3>
			<c:forEach var="followingMember" items="${followingMembers}">
				<c:if test="${followingMember == member.mid}">
					<c:set var="isFollowingMember" value="true"/>
				</c:if>
			</c:forEach>
			<c:if test="${isFollowingMember == true}">
					<button type="button" class="btn btn-info btn-sm" id="button-follow" onclick="follow('false', '${mid}', '${member.mid}')" style="background-color:#bbb">언팔로우</button>
			</c:if>
			<c:if test="${isFollowingMember != true}">
					<button type="button" class="btn btn-info btn-sm" id="button-follow" onclick="follow('true', '${mid}', '${member.mid}')">팔로우</button>
			</c:if>
			<script>
				var followerCnt = ${followerCnt};
				
				function follow(isFollowing, follower, following) {
					if (isFollowing === "true") {
						++followerCnt;
						
						$.ajax({
							url: "follow",
							method: "GET",
							data: {follower: follower, following: following},
							success: function(data) {
								if (data.result == "success") {
									$("#button-follow").html("언팔로우");
									$("#button-follow").attr("style", "background-color:#bbb");
									$("#button-follow").attr("onclick", "follow('false', '${mid}', '${member.mid}', '${followerCnt}')");
									
									$("#li-followerCnt").html("<i class=\"icofont-rounded-right\"></i><a style=\"color:white; font-weight: bold;\" href=\"#\" data-toggle=\"modal\" data-target=\"#atSignFollower\">팔로워 : " + followerCnt + "</a>");
								}
							}
						});
					} else if (isFollowing === "false") {
						--followerCnt;
						
						$.ajax({
							url: "unFollow",
							method: "GET",
							data: {follower: follower, following: following},
							success: function(data) {
								if (data.result == "success") {
									$("#button-follow").html("팔로우");
									$("#button-follow").removeAttr("style");
									$("#button-follow").attr("onclick", "follow('true', '${mid}', '${member.mid}', '${followerCnt}')");
									
									$("#li-followerCnt").html("<i class=\"icofont-rounded-right\"></i><a style=\"color:white; font-weight: bold;\" href=\"#\" data-toggle=\"modal\" data-target=\"#atSignFollower\">팔로워 : " + followerCnt + "</a>");
								}
							}
						});
					}
				}
			</script>
			<div class="row">
				<div class="col-lg-6">
					<ul>
						<li><i class="icofont-rounded-right"></i> <strong>게시물:</strong> ${memberBcnt}</li>
						<li id="li-followerCnt"><i class="icofont-rounded-right"></i><a style="color:white; font-weight: bold;" href="#" data-toggle="modal" data-target="#atSignFollower">팔로워 : ${followerCnt}</a></li>
						<li><i class="icofont-rounded-right"></i><a style="color:white; font-weight: bold;" href="#" data-toggle="modal" data-target="#atSignFollowing">팔로잉 : ${followingCnt}</a></li>
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
<div class="modal fade" id="atSignFollower" role="dialog">
	<script>
		$('#atSignFollower').appendTo("body");
	</script>
	<div class="modal-dialog-centered">
		<div style="height: 100%; width: 100%; color: #18d26e"
			class="modal-dialog">

			<div style="background-color: #1B1B1B" class="modal-content">

				<div class="modal-header">
					<div style="margin-left: 3px" class="row">
						<img class="rounded-circle" style="width: 80px; height: 80px;"
							src="<%=request.getContextPath()%>/resources/images/member/${member.mphoto}" />
						<h1
							style="margin-left:15px; margin-top: 8px; -ms-overflow-style: none; white-space: pre-line"
							class="modal-title"><c:out value="${member.mid} Follower"></c:out></h1>
					</div>
				</div>

				<a style="padding: 10px; margin-top: 5px">Follower</a>
				<div style="color: blue; overflow-y: scroll; height: 350px"
					class="invisible-scrollbar">
					
					<c:forEach var="followerID" items="${followerIDs}" varStatus="status">
						<div style="padding: 8px">
							<img class="rounded-circle"
								style="width: 60px; height: 60px; padding: 10dp"
								src="<%=request.getContextPath()%>/resources/images/member/${followerPhotos[status.index]}" />
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
<div class="modal fade" id="atSignFollowing" role="dialog">
	<script>
		$('#atSignFollowing').appendTo("body");
	</script>
	<div class="modal-dialog-centered">
		<div style="height: 100%; width: 100%; color: #18d26e"
			class="modal-dialog">

			<div style="background-color: #1B1B1B" class="modal-content">

				<div class="modal-header">
					<div style="margin-left: 3px" class="row">
						<img class="rounded-circle" style="width: 80px; height: 80px;"
							src="<%=request.getContextPath()%>/resources/images/member/${member.mphoto}" />
						<h1
							style="margin-left: 15px; margin-top: 8px; -ms-overflow-style: none; white-space: pre-line"
							class="modal-title"><c:out value="${member.mid} Following"></c:out></h1>
					</div>
				</div>

				<a style="padding: 10px; margin-top: 5px">Following</a>
				<div style="color: blue; overflow-y: scroll; height: 350px"
					class="invisible-scrollbar">
					<c:forEach var="followingID" items="${followingIDs}" varStatus="status">
						<div style="padding: 8px">
							<img class="rounded-circle"
								style="width: 60px; height: 60px; padding: 10dp"
								src="<%=request.getContextPath()%>/resources/images/member/${followingPhotos[status.index]}" />
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
			<p>Board</p>
		</div>

		<div class="row portfolio-container">
		
			<c:forEach var="memberBphoto" items="${memberBphotos}">
				<div class="col-lg-4 col-md-6 portfolio-item filter-app">
					<div class="portfolio-wrap">
						<img
							src="<%=request.getContextPath()%>/resources/images/board/${memberBphoto}"
							class="img-fluid">
						
						<div class="portfolio-info">
							<h4>App 1</h4>
							<p>App</p>
							<div class="portfolio-links">
								<a
									href="<%=request.getContextPath()%>/resources/images/board/${memberBphoto}"
									data-gall="portfolioGallery" class="venobox" title="App 1"><i
									class="bx bx-plus"></i>
								</a>
								<a
								    id="li-portfolioDetails" href="javascript:portfolioDetails()"
									data-gall="portfolioDetailsGallery" data-vbtype="iframe"
									class="venobox" title="Portfolio Details"><i
									class="bx bx-link"></i>
								</a>
								<script type="text/javascript">
									function portfolioDetails() {
										$.ajax({
											url : "portfolioDetails",
											method : "GET",
											success : function(data) {
												$("#atSign").html(data);
												$("#li-portfolioDetails").attr("href", "#atSign");
												$("#li-portfolioDetails").click();
												$("#li-portfolioDetails").attr("href", "javascript:portfolioDetails()");
											}
										});
									}
								</script>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
</div>