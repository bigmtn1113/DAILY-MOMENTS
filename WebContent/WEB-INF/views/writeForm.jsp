<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="input-form container">

	<div class="section-title">
		<h2>Write</h2>
		<p>Write</p>
	</div>

	<form class="php-email-form mt-4">
		<input type="hidden" name="mid" id="mid" value="${mid}"/>

		<c:if test="${board.bno == null}">
			<div class="form-group" id="imageChange" style="text-align: center">
				<img id="id_viewimg" src="<%=request.getContextPath()%>/resources/assets/img/need/default_attachment.png" style=" max-width:100%; height:auto" name="preview" border="0"/>
			</div>
		</c:if>
		<c:if test="${board.bno != null}">
			<div class="form-group" id="imageChange" style="text-align: center">
				<img id="id_viewimg" src="<%=request.getContextPath()%>/resources/images/board/${board.bphoto}" style=" max-width:100%; height:auto" name="preview" border="0"/>
			</div>
		</c:if>
		<div class="form-group">
			<textarea class="form-control" name="bcontent" id="bcontent" rows="5"
				placeholder="내용을 작성하세요."><c:out value="${board.bcontent}"/></textarea>
		</div>

		<div class="form-group">
			<input style="display:none;" type="file" id="bphoto" name="bphoto" accept="image/*" onchange="loadFile(event)"/>
				<label for="bphoto" style="float: right; margin-left:8px"><img src="<%=request.getContextPath()%>/resources/assets/img/need/camera.png"/></label>
				<script>
					var loadFile = function(event) {
						var output = document.getElementById('id_viewimg');
						output.src = URL.createObjectURL(event.target.files[0]);
					};
				</script>
			
			<input style="display:none" type="file" id="bmovie" accept="video/*"/>
				<label for="bmovie" style="float: right;"><img src="<%=request.getContextPath()%>/resources/assets/img/need/movie.png"/></label>
		</div>
		
		<div style="clear: both"></div>

		<c:if test="${board.bno == null}">
			<div style="margin-top: 15px">
				<a class="btn btn-primary btn-lg btn-block li-writeFormBtn" href="javascript:write()">Write</a>
			</div>
		</c:if>
		<c:if test="${board.bno != null}">
			<div style="margin-top: 15px">
				<a class="btn btn-primary btn-lg btn-block li-writeFormBtn" href="javascript:update()">Update</a>
			</div>
		</c:if>
	</form>

	<script type="text/javascript">
		var str = $('#bcontent').val();
		str = str.split('<br/>').join("\r\n");
		$('#bcontent').val(str);
	
		function write() {
			var formdata = new FormData();
			formdata.append("mid", $("#mid").val());
			formdata.append("bcontent", $("#bcontent").val());
			formdata.append("bphoto", $("#bphoto")[0].files[0], $("#bphoto")[0].files[0].name);

			$.ajax({
				url: "write",
				processData: false,
				contentType: false,
				data: formdata,
				method: "post",
				success: function(data) {
					$.ajax({
						url: "feed",
						method: "GET",
						success: function(data) {
							$("#feed").html(data);
							$("#li-feed").attr("href", "#feed");
							$("#li-feed").click();
							$("#li-feed").attr("href", "javascript:feed()");
						}
					});
				}
			});
		}
		
		function update() {
			var bno = '${board.bno}';
			
			var formdata = new FormData();
			formdata.append("bcontent", $("#bcontent").val());
			
			if ($("#bphoto")[0].files[0])
				formdata.append("bphoto", $("#bphoto")[0].files[0], $("#bphoto")[0].files[0].name);

			$.ajax({
				url: "update",
				processData: false,
				contentType: false,
				data: formdata,
				method:"post",
				success: function(data) {
					$.ajax({
						url: "feed",
						method: "GET",
						success: function(data) {
							$("#feed").html(data);
							$("#li-feed").attr("href", "#feed");
							$("#li-feed").click();
							$("#li-feed").attr("href", "javascript:feed()");
						}
					});
				}
			});
		}
	</script>
</div>