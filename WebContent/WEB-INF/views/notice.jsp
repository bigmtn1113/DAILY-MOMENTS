<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div id="notice" class="about-me container">
	<div   class="section-title">
		<h2>Notice</h2>
		<p>Notice</p>
	</div>
	<div class="input-form container">
		<div class="sector">
			<h5>Q&A Bulletin Board</h5>
		</div>	
		<div >	
			<form id="noticeList" class="php-email-form mt-4">	<!-- qnaList 불러올 때 이 밑에 있는거 대체해서 이 자리에 넣는 거임. 이 아래 양식에 넣는 게 아니라, 대체하는 것! -->		
				<table  style="color:#636568; width:100%; border-collapse: separate; border-spacing: 5px;">
					<tr style="height: 30px; background-color: white;" align="center">
						<th style="width:00px; background-color: #262626; padding-left: 0px;  padding-bottom: 10px; padding-top: 10px;">No.</th>
						<th style="width:00px; background-color: #262626; padding-left: 0px;  padding-bottom: 10px; padding-top: 10px;">Title</th>
						<th style="width:00px; background-color: #262626; padding-left: 0px;  padding-bottom: 10px; padding-top: 10px;">ID</th>
						<th style="width:00px; background-color: #262626; padding-left: 0px;  padding-bottom: 10px; padding-top: 10px;">Date</th>
					</tr>
	
					<c:forEach var="board" items="${list}">
						<tr align="center">
							<td style="background-color: #262626; padding-left: 0px;  padding-bottom: 10px; padding-top: 10px;">${board.bno}</td>
							<td style="background-color: #262626; padding-left: 0px;  padding-bottom: 10px; padding-top: 10px;"><a href="javascript:noticeDetail(${board.bno})">${board.btitle}</a></td>
							<td style="background-color: #262626; padding-left: 0px;  padding-bottom: 10px; padding-top: 10px;">${board.mid}</td>
							<%-- <td><img class="rounded-circle" width="50px" height="50px" src="photodownload?fileName=${board.mphoto}"/></td> --%>
							<td style="background-color: #262626; padding-left: 0px;  padding-bottom: 10px; padding-top: 10px;"><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>

					<script type="text/javascript">
						function noticeDetail(bno) {
							$.ajax({
								url:"noticeDetail",
								data:{bno:bno},
								success: function(data) {
									$("#noticeList").html(data);
								}
							});
						}
					</script>


					
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<!-- <div class="pageNo">
						<tr style="text-align: center;"> -->
					<%-- <c:if test="${mid != adminnnnnnnnnnnnnnnnnnnnnnnn}"> --%>  <%-- ${}는 자바스크립트에서 값을 문자열로 반환함. ex) var val = 123 이라면 "123"으로 바꿔줌 --%>
						<tr>	
							<td>
								<br style="padding-top: 30px;">
								<a class="btn" style="background: #18d26e; color: white; text-align: center;" href="javascript:noticeWrite()">Write</a>
							</td>	
						</tr>
					<%-- </c:if> --%>	
				</sec:authorize>	
					
					
					
					<script type="text/javascript">
						function noticeWrite(){
							$.ajax({
								url:"noticeWrite",
								method:"GET",
								success:function(data) {
									$("#noticeList").html(data);
								}
							});
						}
					</script>
					
					
					
					
				
					<tr>
						<td colspan="4" style="text-align: center;">
						<br>
							<a class="btn btn-outline-primary btn-sm" href="javascript:noticeList(1)">First Page</a>
							
							<c:if test="${pager.groupNo > 1}">
								<a class="btn btn-outline-info btn-sm" href="javascript:noticeList(${pager.startPageNo-1})">Prev</a> <!-- 페이지 에서 '이전' 누르면 그 그룹 바로 전 페이지그룹으로 간다 ex)12345탭 페이지 -> 678910탭 페이지 ... 이렇게 됨 -->
							</c:if>
							
							<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
								<c:if test="${pager.pageNo == i}">
									<a class="btn btn-danger btn-sm" href="javascript:noticeList(${i})">${i}</a>
								</c:if>
								
								<c:if test="${pager.pageNo != i}">
									<a class="btn btn-outline-success btn-sm" href="javascript:noticeList(${i})">${i}</a>
								</c:if>
							</c:forEach>
							
							<c:if test="${pager.groupNo < pager.totalGroupNo}">
								<a class="btn btn-outline-info btn-sm" href="javascript:noticeList(${pager.endPageNo+1})">Next</a>
							</c:if>
							
							<a class="btn btn-outline-primary btn-sm" href="javascript:noticeList(${pager.totalPageNo})">Last Page</a>
						</td>
					</tr>
					<!-- </tr> -->
					<!-- <div id="board_result" style="margin-top:30px"></div> -->
					<!-- </div> -->
					
				</table>
			</form>
				
			
			<script type="text/javascript">
				function noticeList(pageNo) {
					if(!pageNo) {
						pageNo = 1;
					}
					$.ajax({
						url:"noticeList",
						method:"get",
						data:{pageNo:pageNo},
						success: function(data) {
							$("#noticeList").html(data);
						}
					});
				}
			</script>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
				
				
				
			<!--   <script type="text/javascript">
				function qnaDetail(bno) {
					$.ajax({
						url:"qnaDetail",
						data: {bno:bno},
						success:function(data) {
							$("#qnaList").html(data);
						}
					});
				}
			</script> -->				
					
					
				
				
				
		
			
		</div>
	</div>
</div>





