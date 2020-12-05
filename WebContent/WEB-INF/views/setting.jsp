<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="input-form container">

	<div class="section-title">
		<h2>Setting</h2>
		<p>Setting</p>
	</div>

	<form action="setting" method="post" id="form-setting" class="php-email-form mt-4" enctype="multipart/form-data">
		
		<div class="imageChange" style="text-align:center">
			<img src="<%=request.getContextPath()%>/resources/images/member/${member.mphoto}"
				id="profile-img" style="width:280px; height:280px; margin-bottom:20px;">
		</div>
		
		<div style="text-align:center;">
			<input style="display:none;" type="file" id="mphoto" name="attachMphoto" accept="image/*" onchange="loadFile(event)"/>
			<label for="mphoto" class="btn btn-success btn-xs" style="margin-bottom: 20px">Change Profile Picture</label>
			<script>
				var loadFile = function(event) {
					var output = document.getElementById('profile-img');
					output.src = URL.createObjectURL(event.target.files[0]);
				};
			</script>
		</div>	
		
		<input type="hidden" name="mid" id="mid" value="${mid}"/>
		
		<div class="form-group">
			<label style="margin-bottom: 10px">Name</label><input type="text" name="mname" class="form-control" id="mname" placeholder="Your Name" value="${member.mname}"/>
			<span style="color: green" id="mnameError" ></span>
			<div class="validate"></div>
		</div>
		
		<div class="form-group">
			<label style="margin-bottom: 10px">Tel</label><input type="text" name="mtel" class="form-control" id="mtel" placeholder="Your PhoneNumber" value="${member.mtel}"/>
			<span style="color: green" id="mtelError" ></span>
			<div class="validate"></div>
		</div>
		
		<div class="form-group">
			<label style="margin-bottom: 10px">Sex</label><input type="text" name="msex" class="form-control" id="msex" placeholder="Your Sex" value="${member.msex}"/>
			<span style="color: green" id="msexError" ></span>
			<div class="validate"></div>
		</div>	
		
		<div class="form-group">
			<label style="margin-bottom: 10px">Password</label><input type="password" class="form-control" name="mpassword" id="mpassword" placeholder="Your Password" />
			<span style="color: green" id="mpasswordError" ></span>
			<div class="validate"></div>
		</div>

		<div class="form-group">
			<label style="margin-bottom: 10px">Introduce</label>
			<textarea name="mintroduce" class="form-control" id="mintroduce" placeholder="Your Introduce">${member.mintroduce}</textarea>
			<div class="validate"></div>
		</div>
		
		<div class="text-center">
			<a class="btn btn-lg btn-block okBtn" href="javascript:changeSetting()">Setting</a>
		</div>
		
		<script>
			function changeSetting() {
				var mname = $("#mname").val().trim();
				if(mname == "") $("#mnameError").text("You must write your name");
				else $("#mnameError").text("");
				
				var mtel = $("#mtel").val().trim();
				if(mtel == "") $("#mtelError").text("You must write your tel");
				else $("#mtelError").text("");
				
				var msex = $("#msex").val().trim();
				if(msex == "") $("#msexError").text("You must write your sex");
				else $("#msexError").text("");
				
				var mpassword = $("#mpassword").val().trim();
				if(mpassword == "") $("#mpasswordError").text("You must write new password");
				else $("#mpasswordError").text("");
				
				if(mname == "" || mtel == "" || msex == "" || mpassword == "") return;
				
				$('#form-setting').submit();
			}
		</script>
	</form>
</div>