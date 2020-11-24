<%@ page contentType="text/html; charset=UTF-8"%>

<div class="input-form container">

	<div class="section-title">
		<h2>Write</h2>
		<p>Write</p>
	</div>

	<form action="write" method="post" class="php-email-form mt-4" enctype="multipart/form-data">

		<input type="hidden" name="mid" id="mid" value="${mid}"/>

		<div class="form-group">
			<input type="file" class="form-control" name="bphoto" id="bphoto"
				placeholder="사진을 첨부하세요"/>
		</div>

		<div class="form-group">
			<textarea class="form-control" name="bcontent" rows="5"
				placeholder="내용을 작성하세요."></textarea>
		</div>

		<div class="form-group">
			<button style="float: right" type="button"
				class="btn btn-default btn-xs">
				<img src="<%=request.getContextPath()%>/resources/assets/img/need/camera1.png" />
			</button>
			<button style="float: right" type="button"
				class="btn btn-default btn-xs">
				<img src="<%=request.getContextPath()%>/resources/assets/img/need/movie1.png" />
			</button>
		</div>
		<div style="clear: both"></div>

		<div style="margin-top: 15px">
			<button type="submit" class="btn btn-primary btn-lg btn-block">게시</button>
		</div>
	</form>

</div>