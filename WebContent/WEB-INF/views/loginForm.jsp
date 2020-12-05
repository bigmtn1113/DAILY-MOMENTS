<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="input-form container">

	<div class="section-title">
		<h2>Login</h2>
		<p>Login</p>
	</div>

	<form method="post" role="form" class="php-email-form mt-4">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="form-group">
			<label style="margin-bottom: 10px">ID</label><input type="text" name="mid" class="form-control" id="mid" placeholder="Your ID" value="${mid}"/>
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<label style="margin-bottom: 10px">Password</label><input type="password" class="form-control" name="mpassword" id="mpassword" placeholder="Your Password" />
			<div class="validate"></div>
		</div>

		<div class="text-center">
			<a class="btn btn-lg okBtn" href="javascript:login()">Login</a>
		</div>
	</form>
	
	<script type="text/javascript">
		function login() {
			var mid = $("#mid").val();
			var mpassword = $("#mpassword").val();
			
			$.ajax({
				url: "<%=application.getContextPath()%>/login",
				data: {mid:mid, mpassword:mpassword},
				method:"post",
				success: function(data) {
					if(data.result == "success") {
						location.href = "<%=application.getContextPath()%>/";
					} else {
						$("#errorDiv").show();
					}
				}
			});
		}
	</script>
	
	
	<div id="errorDiv" class="alert alert-danger" style="margin-top:10px; width:auto; display:none;" role="alert">
		아이디 또는 비밀번호가 잘못되었습니다.
	</div>
</div>