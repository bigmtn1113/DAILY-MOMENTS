<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section id="login" class="input-form">
	<div class="container">

		<div class="section-title">
			<h2>Login</h2>
			<p>Login</p>
		</div>

		<form action="forms/contact.php" method="post" role="form"
			class="php-email-form mt-4">
			<div class="form-group">
				<input type="text" name="loginId" class="form-control" id="loginId"
					placeholder="Your ID" />
				<div class="validate"></div>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="loginPassword"
					id="loginPassword" placeholder="Your Password" />
				<div class="validate"></div>
			</div>

			<div class="text-center">
				<button type="submit">Login</button>
			</div>
		</form>
	</div>
</section>