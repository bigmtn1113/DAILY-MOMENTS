<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<div>
		<div>
			
			<div>
				<td><img class="rounded-circle" width="70px" height="70px" src="photodownload?fileName=${qnaBoard.mphoto}"/></td>
			</div>
			
			<br/>
			
			<span>번호 :</span> 
			<span>${qnaBoard.bno}</span> <br/>
			
			<span>제목 :</span> 
			<span>${qnaBoard.btitle}</span> <br/>
			
			<span>글쓴이 :</span> 
			<span>${qnaBoard.mid}</span> <br/>
			
			<span class="title">날짜 :</span> 
			<span><fmt:formatDate value="${qnaBoard.bdate}" pattern="yyyy-MM-dd HH.mm.ss"/></span> <br/>
		</div>
		
		<br/>
		
		<div>
			<span class="title">내용 :</span> <br/>
			<textarea style="width:100%" readonly>${qnaBoard.bcontent}</textarea>
		</div>
		
		<br/>
		
		<c:if test="${mid == qnaBoard.mid}">
		
			<a class="btn btn-danger btn-sm" href="javascript:qnaDetailDelete(${qnaBoard.bno})">삭제</a>
			<script type="text/javascript">
				function qnaDetailDelete(bno) {
					$.ajax({
						url:"qnaDetailDelete",
						data:{bno:bno},
						method:"post",
						success:function(data) {
							if(data.result == "success") {
								qnaList();
							}
						}
					});
				}
			</script>	
			
			<a class="btn btn-warning btn-sm" href="javascript:qnaDetailUpdate(${qnaBoard.bno})">수정</a> <!-- 자바스크립트 안 붙이면  페이지 이동 -->
			<script type="text/javascript">
				function qnaDetailUpdate(bno) {
					$.ajax({
						url:"qnaDetailUpdate",
						data:{bno:bno},
						method:"get",
						success:function(data) {
							$("#qnaList").html(data);
						}
					});
				}
			</script>	
			
			<a class="btn btn-success btn-sm" href="javascript:qnaList()">목록</a>
		</c:if>
				
		<c:if test="${mid != qnaBoard.mid}">
			<a class="btn btn-success btn-sm" href="javascript:qnaList()">목록</a>
		</c:if>
		
		
	</div>
</div>