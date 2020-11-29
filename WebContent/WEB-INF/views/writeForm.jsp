<%@ page contentType="text/html; charset=UTF-8"%>

<div class="input-form container">

	<div class="section-title">
		<h2>Write</h2>
		<p>Write</p>
	</div>

	<form class="php-email-form mt-4">
		<input type="hidden" name="mid" id="mid" value="${mid}"/>

		<div class="form-group" id="imageChange" style="display:none; text-align: center">
			<img id="id_viewimg" src="<%=request.getContextPath()%>/resources/assets/img/need/movie.png" style=" max-width:100%; height:auto" name="preview" border="0"/>
		</div>
		
		
		<div class="form-group">
			<textarea class="form-control" name="bcontent" id="bcontent" rows="5"
				data-rule="required" data-msg="Please write something for us"
				placeholder="내용을 작성하세요."></textarea>
		</div>

		<div class="form-group">
			<input style="display:none;" type="file" id="bphoto" name="bphoto" accept="image/*" onchange="loadFile(event)"/>
				<label for="bphoto" style="float: right; margin-left:8px"><img src="<%=request.getContextPath()%>/resources/assets/img/need/camera.png"/></label>
				<script>
					var loadFile = function(event) {
						document.getElementById("imageChange").style.removeProperty("display");
						var output = document.getElementById('id_viewimg');
						output.src = URL.createObjectURL(event.target.files[0]);
					};
				</script>
			
			<input style="display:none" type="file" id="bmovie" accept="video/*"/>
				<label for="bmovie" style="float: right;"><img src="<%=request.getContextPath()%>/resources/assets/img/need/movie.png"/></label>
		</div>
		
		<div style="clear: both"></div>

		<div style="margin-top: 15px">
			<a class="btn btn-primary btn-lg btn-block" href="javascript:write()" id="li-write">게시</a>
		</div>
	</form>
	
	<script type="text/javascript">
		function write() {
			var formdata=new FormData();
			formdata.append("mid",$("#mid").val());
			formdata.append("bcontent",$("#bcontent").val());
			formdata.append("bphoto",$("#bphoto")[0].files[0], $("#bphoto")[0].files[0].name);
			console.log(formdata.get("mid"));
			
			$.ajax({
				url: "write",
				processData: false,
				contentType: false,
				data: formdata,
				method:"post",
				success: function(data) {
					$.ajax({
						url : "feed",
						method : "GET",
						success : function(data) {
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