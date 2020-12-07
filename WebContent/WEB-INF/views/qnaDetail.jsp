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
			
			<span>No. :</span> 
			<span style="line-height: 2.0em;">${qnaBoard.bno}</span> <br style="margin-bottom: 50px; padding-bottom: 50px; height: 50px; line-height: 50px; " />
			
			<span>Title :</span> 
			<span style="line-height: 2.0em;">${qnaBoard.btitle}</span> <br />
			
			<span>ID :</span> 
			<span style="line-height: 2.0em;">${qnaBoard.mid}</span> <br/>
			
			<span class="title">Date :</span> 
			<span><fmt:formatDate value="${qnaBoard.bdate}" pattern="yyyy-MM-dd HH.mm.ss"/></span> <br/>
		</div>
		
		<br/>
		
		
		
		<%-- <div>
			<span class="title">Content :</span> <br/>
			<textarea style="width:100%" readonly>${qnaBoard.bcontent}</textarea>
		</div>
		
		<br/>
		
	
		<div>
			<span>Comment:</span> <br/> --%>
		








	<div class="row portfolio-container">
			<div class="col-sm-12 portfolio-item"
				 style="border-radius:10px;width:auto;height:auto;border:2px solid white;margin-bottom:30px;">
				
				<div
	          		id="midqnacontentcomment_${qnaBoard.bno}"
				    class="invisible-scrollbar" 
					style="height: 250px; width: 100%; resize: none; -ms-overflow-style: none; background-color: #1B1B1B; clear: both;
					color: white; overflow-y: auto;">
					<span class="title">Content :</span> <br/>
					
					
						
					<div style="padding-left:30px; padding-right:30px; padding-top:15px;">
						 <div style="white-space:pre;">${qnaBoard.bcontent}</div>
					</div>
					
					<br>
					
					
					<hr	style="height:1px; background: linear-gradient(to right, gray, lightgray, gray); width:95%">
					
					<span>Comment :</span> <br/>
					
					<div style="padding-left:30px; padding-right:30px; padding-bottom:15px;" id="qnaCommentlist_${qnaBoard.bno}">
						<c:forEach var="qnaBoardComment" items="${qnaBoardCommentsList}">
							<div style="padding-bottom:5px;">
								<a href="#"><c:out value="${qnaBoardComment.mid}"/></a> : <c:out value="${qnaBoardComment.ccontent}"/><br/>
							</div>
						</c:forEach>
					</div>
				</div>
				
				
				<div style="height:20px; margin-bottom:45px;">
		             <textarea class="invisible-scrollbar" id="qnaContent_${qnaBoard.bno}" style="float:left; resize:none; width:87%; height:50px; padding:0.8em; -ms-overflow-style:none; scrollbar-width:none;" placeholder="댓글달기... "></textarea>
		             <button type="button" id="${qnaBoard.bno}" class="bx bx-subdirectory-left" onclick="qnaCommentWrite('${qnaBoard.bno}','${mid}')" style="float:right; background-color:#18d26e; color:white; width:13%; height:50px; font-size:20px;"></button>
	          	</div>


			</div>
	
	</div>
	






			<script type="text/javascript">
				function qnaCommentWrite(bno, mid) {
					var comment = $("#qnaContent_" + bno).val();
					
					$.ajax({
						url : "qnaCommentWrite",
						method : "POST",
						data:{ccomment:comment, bno:bno, mid:mid},
						success : function(data) {
							
							$("#qnaCommentlist_"+bno).html(data);
							$("#qnaContent_"+bno).val("");
							$("#midqnacontentcomment_"+bno).scrollTop($("#midqnacontentcomment_"+bno)[0].scrollHeight);
							
							
							
							
						}
					});
				}
			</script>















	
	
	
	
		
		<c:if test="${mid == qnaBoard.mid}">
		
			<a class="btn btn-danger btn-sm" href="javascript:qnaDetailDelete(${qnaBoard.bno})">Delete</a>
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
			
			<a class="btn btn-warning btn-sm" href="javascript:qnaDetailUpdate(${qnaBoard.bno})">Modify</a> <!-- 자바스크립트 안 붙이면  페이지 이동 -->
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
			
			<a class="btn btn-success btn-sm" href="javascript:qnaList()">List</a>
		</c:if>
				
		<c:if test="${mid != qnaBoard.mid}">
			<a class="btn btn-success btn-sm" href="javascript:qnaList()">List</a>
		</c:if>
		
		
	</div>
</div>

















