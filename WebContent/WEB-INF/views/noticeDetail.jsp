<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div>
	<div>
		<div>
			
			<div>
				<td><img class="rounded-circle" width="70px" height="70px" src="photodownload?fileName=${noticeBoard.mphoto}"/></td>
				<!-- <td>사진자리</td> -->
			</div>
			
			<br/>
			
			<span>No. :</span> 
			<span style="line-height: 2.0em;">${noticeBoard.bno}</span> <br/>
			
			<span>Title :</span> 
			<span style="line-height: 2.0em;">${noticeBoard.btitle}</span> <br/>
			
			<span>ID :</span> 
			<span style="line-height: 2.0em;">${noticeBoard.mid}</span> <br/>
			
			<span class="title">Date :</span> 
			<span><fmt:formatDate value="${noticeBoard.bdate}" pattern="yyyy-MM-dd HH.mm.ss"/></span> <br/>
		</div>
		
		<br/>
		
		<div class="col-sm-12 portfolio-item"
			 style="border-radius:10px;width:100%;height:auto;border:2px solid white;">
			
			<div
          		id="midqnacontentcomment_${qnaBoard.bno}"
			    class="invisible-scrollbar" 
				style="height: 250px; width: 100%; resize: none; -ms-overflow-style: none; background-color: #1B1B1B; clear: both;
				color: white; overflow-y: auto; margin-top: 15px; margin-bottom: 15px; padding-top: 5px;">
				
				
				<span class="title" style="padding-left: 10px;">Content :</span> <br/>
				<div style="padding-left:20px; padding-right:20px; padding-top:10px;">
					 <div style="white-space:pre-line;">${noticeBoard.bcontent}</div>
				</div>
				
				<br>
			</div>


		</div>
		
		<br/>
		
		<c:if test="${mid == noticeBoard.mid}">
		
			<a class="btn btn-danger btn-sm" href="javascript:noticeDetailDelete(${noticeBoard.bno})">Delete</a>
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
			
			<a class="btn btn-warning btn-sm" style="color: white" href="javascript:noticeDetailUpdate(${noticeBoard.bno})">Modify</a> <!-- 자바스크립트 안 붙이면  페이지 이동 -->
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
			
			<a class="btn btn-success btn-sm" href="javascript:noticeList()">List</a>
		</c:if>
				
		<c:if test="${mid != noticeBoard.mid}">
			<a class="btn btn-success btn-sm" href="javascript:noticeList()">List</a>
		</c:if>
		
		
	</div>
</div>