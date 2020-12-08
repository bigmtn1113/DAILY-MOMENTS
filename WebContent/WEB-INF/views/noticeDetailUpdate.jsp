<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div>
	<div>
		<div>
			
			<div>
				<td><img class="rounded-circle" width="70px" height="70px" src="photodownload?fileName=${noticeBoard.mphoto}"/></td>
				<!-- <td>사진자리gkgkgkgkgkgkgkgkgkgkgkgkgkgkgg</td> -->
			</div>
			
			<br/>
			
			<span>No :</span> 
			<span style="line-height: 2.0em;">${noticeBoard.bno}</span> <br/>
			
			<span>Title :</span> 
			<span style="line-height: 2.0em;"><br/><input style="width:100%; height: 10px;" id="btitleDetailUpdate" value="${noticeBoard.btitle}"/></span> <br/><br/>
			
			
			<span>ID :</span> 
			<span style="line-height: 2.0em;">${noticeBoard.mid}</span> <br/>
			
			<span class="title">Date :</span> 
			<span><fmt:formatDate value="${noticeBoard.bdate}" pattern="yyyy-MM-dd HH.mm.ss"/></span> <br/>
		</div>
		
		<br/>
		
		<div>
			<span class="title">Content :</span> <br/>
			<textarea id="bcontentDetailUpdate" style="width:100%">${noticeBoard.bcontent}</textarea>
		</div>
		
		<br/>
		
		
		<input type="hidden" id="bno" name="bno" value="${noticeBoard.bno}" />
			
		
		<c:if test="${mid == noticeBoard.mid}">
		
			<a class="btn btn-danger btn-sm" href="javascript:noticeDetailDelete(${noticeBoard.bno})">Delete</a>
			
			<a class="btn btn-warning btn-sm" style="color: white" href="javascript:noticeDetailUpdate(${noticeBoard.bno})">Modify</a> <!-- 자바스크립트 안 붙이면  페이지 이동 -->
			<script type="text/javascript">
				function noticeDetailUpdate() {
					var bno = $("#bno").val();
					var btitle = $("#btitleDetailUpdate").val().trim();
					var bcontent = $("#bcontentDetailUpdate").val().trim();
					
					$.ajax({
						url:"noticeDetailUpdate",
						data:{bno:bno, btitle:btitle, bcontent:bcontent},
						method:"post",
						success:function(data) {
							if(data.result == "success") {
								noticeList();
							}
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