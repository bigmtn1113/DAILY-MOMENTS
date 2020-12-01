<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<div class="about-me container">
	<div class="section-title">
		<h2>Notification</h2>
		<p>Notification</p>
	</div>
	
	<div class="row portfolio-container">
		<c:forEach var="board" items="${boards}" varStatus="status">
			<div class="col-sm-12 portfolio-item filter-app">
			
				<c:set var="index" value="${status.index}"/>
				<div style="background-color: #1B1B1B; height:85%; padding:15px">
					<div class="row">
						<c:if test="${board.mid != mid}">
							<a class="col-sm-1.5" href="<%=request.getContextPath()%>/resources/images/member/${board.mphoto}">
								<img class="rounded-circle" style="margin-top:25px;margin-left: 25px; margin-right: 10px; float: left" width="90px" height="90px" src="<%=request.getContextPath()%>/resources/images/member/${board.mphoto}"/>
							</a>
							<a class="col-sm-1.5" href="javascript:goAtSign('${board.mid}')"
							   style="margin-left:25px;margin-top:40px;text-decoration: none;  font-size: 30px;"
							   id="li-atSign">${board.mid}</a>
							<span style="margin-top:14px; margin-left:-85px">
								<fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" />				
							</span>
							<span style="padding-left: 20px;margin-top:40px; width:62%; text-align:center;">
								xxx님이 스토리를 추가했습니다. 사라지기 전에 놓치지 말고 확인 해보세요.
							</span>
								<img 
									src="<%=request.getContextPath()%>/resources/images/board/${board.bphoto}"
									style="margin-top:14px;height:110px; width:130px; margin-left: 25px">
						</c:if>
					</div>
				</div>
				<br/><br/>
			</div>

		</c:forEach>
		<script type="text/javascript">
			function goProfile() {
				$.ajax({
					url : "profile",
					method : "GET",
					success : function(data) {
						$("#profile").html(data);
						$("#li-profile").attr("href", "#profile");
						$("#li-profile").click();
						$("#li-profile").attr("href", "javascript:goProfile()");
					}
				});
			}
		</script>
		<script type="text/javascript">
			function goAtSign(mid) {
				$.ajax({
					url : "atSign",
					data:{mid:mid},
					method : "POST",
					success : function(data) {
						$("#atSign").html(data);
						$("#li-atSign").attr("href", "#atSign");
						$("#li-atSign").click();
						$("#li-atSign").attr("href", "javascript:goAtSign('${board.mid}')");
					}
				});
			}
		</script>
	</div>
</div>


		
