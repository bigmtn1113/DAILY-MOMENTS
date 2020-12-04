<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div>
	<div>
		<div>
			
			<div>
				<%-- <td><img class="rounded-circle" width="70px" height="70px" src="photodownload?fileName=${noticeBoard.mphoto}"/></td> --%>
				<td>사진자리</td>
			</div>
			
			<br/>
			
			<span>번호 :</span> 
			<span>${noticeBoard.bno}</span> <br/>
			
			<span>제목 :</span> 
			<span>${noticeBoard.btitle}</span> <br/>
			
			<span>글쓴이 :</span> 
			<span>${noticeBoard.mid}</span> <br/>
			
			<span class="title">날짜 :</span> 
			<span><fmt:formatDate value="${noticeBoard.bdate}" pattern="yyyy-MM-dd HH.mm.ss"/></span> <br/>
		</div>
		
		<br/>
		
		<div>
			<span class="title">내용 :</span> <br/>
			<textarea style="width:100%" readonly>${noticeBoard.bcontent}</textarea>
		</div>
		
		<br/>
		
		<c:if test="${mid == noticeBoard.mid}">
		
			<a class="btn btn-danger btn-sm" href="javascript:noticeDetailDelete(${noticeBoard.bno})">삭제</a>
			<script type="text/javascript">
				function noticeDetailDelete(bno) {
					$.ajax({
						url:"noticeDetailDelete",
						data:{bno:bno},
						method:"post",
						success:function(data) {
							if(data.result == "success") {
								noticeList();
							}
						}
					});
				}
			</script>	
			
			<a class="btn btn-warning btn-sm" href="javascript:noticeDetailUpdate(${noticeBoard.bno})">수정</a> <!-- 자바스크립트 안 붙이면  페이지 이동 -->
			<script type="text/javascript">
				function noticeDetailUpdate(bno) {
					$.ajax({
						url:"noticeDetailUpdate",
						data:{bno:bno},
						method:"get",
						success:function(data) {
							$("#noticeList").html(data);
						}
					});
				}
			</script>	
			
			<a class="btn btn-success btn-sm" href="javascript:noticeList()">목록</a>
		</c:if>
				
		<c:if test="${mid != noticeBoard.mid}">
			<a class="btn btn-success btn-sm" href="javascript:noticeList()">목록</a>
		</c:if>
		
		
	</div>
</div>