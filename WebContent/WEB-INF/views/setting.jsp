<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container">

	<div class="section-title">
		<h2>setting</h2>
		<p>setting</p>
	</div>

	<form action="forms/contact.php" method="post" role="form"
		class="php-email-form mt-4">
		<div class="form-group">
			<input type="text" name="settingName" class="form-control"
				id="settingName" placeholder="Your Name" />
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<input type="text" name="settingId" class="form-control"
				id="settingId" placeholder="Your ID" />
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<textarea name="settingIntroduce" class="form-control"
				id="settingIntroduce" placeholder="Your Introduce"></textarea>
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="settingPassword"
				id="settingPassword" placeholder="Your Password" />
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<input type="text" name="settingPhoneNumber" class="form-control"
				id="settingPhoneNumber" placeholder="Your Phone Number" />
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<input type="text" name="settingSex" class="form-control"
				id="settingSex" placeholder="Your Sex" />
			<div class="validate"></div>
		</div>

		<div class="text-center">
			<button type="submit">setting</button>
		</div>
	</form>
</div>