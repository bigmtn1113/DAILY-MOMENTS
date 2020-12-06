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
			
			<input type="hidden" id="bno" name="bno" value="${qnaBoard.bno}" />
			
			<%-- <span>번호:</span> 
			<span>${qnaBoard.bno}</span> <br/> --%>
			
			<span>Title :</span> <br/>
			<input id="btitleUpdate" name="btitleUpdate" style="height:10px; line-height: 10px; width: 100%;" value="${qnaBoard.btitle}"></input> <br/>
			<span id="btitleUpdateError" ></span>
			
			<%-- <span>글쓴이:</span> 
			<span>${qnaBoard.mid}</span> <br/> --%>
			
			<%-- <span class="title">날짜:</span> 
			<span><fmt:formatDate value="${qnaBoard.bdate}" pattern="yyyy-MM-dd HH.mm.ss"/></span> <br/> --%>
			
		</div>
		
		<br/>
		
		<div>
			<span>Content :</span> <br/>
			<textarea id="bcontentUpdate" name="bcontentUpdate" style="height:300px; width:100%">${qnaBoard.bcontent}</textarea>
			<span id="bcontentUpdateError" ></span>
		</div>
		
		
		<%-- <div >
			<input id="mid" type="text" name="mid" class="form-control" 
				<c:if test="${mid!=null}">value="${mid}"</c:if>
				<c:if test="${mid==null}">value="fall"</c:if>
				readonly>
		</div> --%>
		
		<br/>
	
		<c:if test="${mid == qnaBoard.mid}"> 
		
			<a class="btn btn-warning btn-sm" href="javascript:qnaDetailUpdate()">Modify</a>
			<script type="text/javascript">
				function qnaDetailUpdate() {
					var bno = $("#bno").val(); //id로 검색
					
					var btitle = $("#btitleUpdate").val().trim();
					if(btitle == "") { $("#btitleUpdateError").text("필수"); }
					else { $("#btitleUpdateError").text(""); }
					
					var bcontent = $("#bcontentUpdate").val().trim();
					if(bcontent == "") { $("#bcontentUpdateError").text("필수"); }
					else { $("#bcontentUpdateError").text(""); }
					
					if(btitle == "" || bcontent == "") {
						return;	
					}
					
					/* var mid = $("#mid").val().trim();  */
					
					$.ajax({
						url:"qnaDetailUpdate",
						data:{bno:bno, btitle:btitle, bcontent:bcontent},
						method:"post",
						success:function(data) {
							if(data.result == "success") {
								qnaList();
							}
						}
					});
				}
			</script>	
			
			
			
			
			<a class="btn btn-success btn-sm" href="javascript:qnaList()">List</a> <!-- 자바스크립트 안 붙이면  페이지 이동 -->
			<!-- <script type="text/javascript">
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
			</script>	 -->
			
		</c:if> 
				
	</div>
</div>