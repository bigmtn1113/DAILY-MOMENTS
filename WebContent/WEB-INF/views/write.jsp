<%@ page contentType="text/html; charset=UTF-8"%>

<div class="input-form container">

	<div class="section-title">
		<h2>Write</h2>
		<p>Write</p>
	</div>

	<form action="write" method="post" class="php-email-form mt-4">

		<div class="form-group">
			<input type="text" class="form-control" name="subject" id="subject"
				placeholder="사진을 첨부하세요" data-rule="minlen:4"
				data-msg="Please enter at least 8 chars of subject"
				readonly="readonly" />
		</div>

		<div class="form-group">
			<textarea class="form-control" name="message" rows="5"
				data-rule="required" data-msg="Please write something for us"
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