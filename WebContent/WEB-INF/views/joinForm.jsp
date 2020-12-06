<%@ page contentType="text/html; charset=UTF-8"%>

<div class="input-form container">

	<div class="section-title">
		<h2>Join</h2>
		<p>Join</p>
	</div>

	<form action="join" method="post" id="form-join" class="php-email-form mt-4">
		<div class="form-group">
			<label style="margin-bottom: 10px">Name</label><input type="text" name="mname" class="form-control" id="mname" placeholder="Your Name" />
			<span style="color: green" id="mnameError" ></span>
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<label style="margin-bottom: 10px">ID</label><input type="text" name="mid" class="form-control" id="mid" placeholder="Your ID" />
			<span style="color: green" id="midError" ></span>
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<label style="margin-bottom: 10px">Password</label><input type="password" class="form-control" name="mpassword" id="mpassword" placeholder="Your Password" />
			<span style="color: green" id="mpasswordError" ></span>
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<label style="margin-bottom: 10px">Tel</label><input type="text" name="mtel" class="form-control" id="mtel" placeholder="Your Phone Number" />
			<span style="color: green" id="mtelError" ></span>
			<div class="validate"></div>
		</div>

		<div class="text-center">
			<a class="btn btn-lg btn-block okBtn" href="javascript:join()">Join</a>
		</div>
		
		<script>
			function join() {
				var mname = $("#mname").val().trim();
				if(mname == "") $("#mnameError").text("You must write your name");
				else $("#mnameError").text("");
				
				var mid = $("#mid").val().trim();
				if(mid == "") $("#midError").text("You must write new id");
				else $("#midError").text("");
				
				var mpassword = $("#mpassword").val().trim();
				if(mpassword == "") $("#mpasswordError").text("You must write new password");
				else $("#mpasswordError").text("");
				
				var mtel = $("#mtel").val().trim();
				if(mtel == "") $("#mtelError").text("You must write your tel");
				else $("#mtelError").text("");
				
				if(mname == "" || mid == "" || mpassword == "" || mtel == "") return;
				
				$('#form-join').submit();
			}
		</script>
	</form>
</div>