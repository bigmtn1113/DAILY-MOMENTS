<%@ page contentType="text/html; charset=UTF-8"%>

<div class="input-form container">

	<div class="section-title">
		<h2>Login</h2>
		<p>Login</p>
	</div>

	<form action="login" method="post" role="form"
		class="php-email-form mt-4">
		<div class="form-group">
			<input type="text" name="mid" class="form-control" id="mid" placeholder="Your ID" />
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="mpassword" id="mpassword" placeholder="Your Password" />
			<div class="validate"></div>
		</div>

		<div class="text-center">
			<button type="submit">Login</button>
		</div>
	</form>
</div>
