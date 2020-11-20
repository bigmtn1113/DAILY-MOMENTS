<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<section id="join" class="join">
	<div class="container">

		<div class="section-title">
			<h2>Join</h2>
			<p>Join</p>
		</div>

		<form action="forms/contact.php" method="post" role="form"
			class="php-email-form mt-4">
			<div class="form-group">
				<input type="text" name="joinName" class="form-control"
					id="joinName" placeholder="Your Name" />
				<div class="validate"></div>
			</div>
			<div class="form-group">
				<input type="text" name="joinId" class="form-control" id="joinId"
					placeholder="Your ID" />
				<div class="validate"></div>
			</div>
			<div class="form-group">
				<input type="password" class="form-control" name="joinPassword"
					id="joinPassword" placeholder="Your Password" />
				<div class="validate"></div>
			</div>
			<div class="form-group">
				<input type="text" name="joinPhoneNumber" class="form-control"
					id="joinPhoneNumber" placeholder="Your Phone Number" />
				<div class="validate"></div>
			</div>

			<div class="text-center">
				<button type="submit">Join</button>
			</div>
		</form>
	</div>
</section>