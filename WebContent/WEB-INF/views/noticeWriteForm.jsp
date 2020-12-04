<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <form id="noticeWriteForm">
	<!-- <table style="width:auto" class="table table-sm table-bordered"> -->
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">btitle</span></div>
		<input id="btitleNotice" type="text" name="btitleNotice" class="form-control">
		<span id="btitleErrorNotice" class="error"></span>
	</div>
	
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">bcontent</span></div>
		<textarea id="bcontentNotice" name="bcontentNotice" class="form-control"></textarea>
		<span id="bcontentErrorNotice" class="error"></span>
	</div>
	
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">mid</span></div>
		<input id="mid" type="text" name="mid" class="form-control" 
			<c:if test="${sessionMid!=null}">value="${sessionMid}"</c:if>
			<c:if test="${sessionMid==null}">value="fall"</c:if>
			readonly>
		<span id="btitleError" class="error"></span>
	</div> --%>
	
	<form action="setting" method="post" role="form" class="php-email-form mt-4">
		
			<div class="form-group">
				<input id="btitleNotice" type="text" name="btitleNotice" class="form-control" placeholder="Title"/>
				<span style="color: orange" id="btitleErrorNotice" ></span>
			</div>
			
			<div class="form-group">
				<textarea name="bcontentNotice" id="bcontentNotice" class="form-control" placeholder="Content"></textarea>
				<span style="color: orange" id="bcontentErrorNotice"></span>
			</div>
			
			<div>		
				<a class="btn btn-light" >첨부 이미지</a>
			</div>
			
			</form>
			
			</br>
			
			<div style="text-align: left;">
				<a class="btn btn-center" style="background: #18d26e; color: white;" href="javascript:noticeWrite()">글쓰기</a>
				<a class="btn btn-warning"  href="javascript:notice()">취소</a>
			</div>
			
			<script type="text/javascript">
				function noticeWrite() {
					var btitle = $("#btitleNotice").val().trim();
					var bcontent = $("#bcontentNotice").val().trim();
					
					$.ajax({
							url:"noticeWrite",
							method:"post",
							data:{btitle:btitle, bcontent:bcontent},
							success:function(data) {
								$("#notice").html(data);
								
							}
						});
					}
			</script>
			
			
			
			<!-- <script type="text/javascript">
				function boardWrite() {
					var btitle = $("#btitle").val().trim();  //var는 int, string 등 타입 그냥 다 받음. 만능 타입. / #btitle 은 btitle 찾아라! 는 뜻. 여기선 위로 가서 찾겠지. form태그 밑 div그룹 내 id가 btitle이니까 거기로 간다.
					if(btitle == "") { $("#btitleError").text("Title란을 공백으로 작성하실 수 없습니다."); }
					else { $("#btitleError").text(""); }
					
					var bcontent = $("#bcontent").val().trim();
					if(bcontent == "") { $("#bcontentError").text("Content란을 공백으로 작성하실 수 없습니다."); }
					else { $("#bcontentError").text(""); }
					
					if(btitle == "" || bcontent == "") {
						return;	
					} 
					
					$.ajax({
						url:"qnaWrite",
						method:"post",
						data: {btitle:btitle, bcontent:bcontent},
						success:function(data) {
							$("#qnaList").html(data);
						}
					});
				}
			</script>		 -->
		
		
		
	
<!-- </form> -->

				
				
			