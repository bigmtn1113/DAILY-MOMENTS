<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="input-form container">

	<div class="section-title">
		<h2>Setting</h2>
		<p>Setting</p>
	</div>

	<form action="setting" method="post" class="php-email-form mt-4" enctype="multipart/form-data">
		
		<div class="imageChange" style="text-align:center">
			<img src="<%=request.getContextPath()%>/resources/images/member/${member.mphoto}"
					id="profile-img" style="width:350px; height:350px; margin-bottom:20px;">
		</div>
		
		<div style="text-align:center;">
			<input style="display:none;" type="file" id="mphoto" name="attachMphoto" accept="image/*" onchange="loadFile(event)"/>
			<label for="mphoto" class="btn btn-info btn-xs">프로필 사진 변경</label>
			<script>
				var loadFile = function(event) {
					var output = document.getElementById('profile-img');
					output.src = URL.createObjectURL(event.target.files[0]);
				};
			</script>
		</div>	
		
		<input type="hidden" name="mid" id="mid" value="${mid}"/>
		
		<div class="form-group">
			<input type="text" name="mname" class="form-control" id="mname" placeholder="Your Name" value="${member.mname}"/>
			<div class="validate"></div>
		</div>
		
		<div class="form-group">
			<input type="text" name="mtel" class="form-control" id="mtel" placeholder="Your PhoneNumber" value="${member.mtel}"/>
			<div class="validate"></div>
		</div>
		
		<div class="form-group">
			<input type="text" name="msex" class="form-control" id="msex" placeholder="Your Sex"
				<c:if test="${member.msex != null}">
					value="${member.msex}"
				</c:if>
			/>
			<div class="validate"></div>
		</div>	
		
		<div class="form-group">
			<input type="password" class="form-control" name="mpassword" id="mpassword" placeholder="Your Password" />
			<div class="validate"></div>
		</div>

		<div class="form-group">
			<textarea name="mintroduce" class="form-control" id="mintroduce" placeholder="Your Introduce"><c:if test="${member.mintroduce != null}">${member.mintroduce}</c:if></textarea>
			<div class="validate"></div>
		</div>
		
		<div class="text-center">
			<button type="submit">setting</button>
		</div>
	</form>
</div>