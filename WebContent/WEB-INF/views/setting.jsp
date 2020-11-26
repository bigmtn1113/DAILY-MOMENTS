<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="input-form container">

	<div class="section-title">
		<h2>Setting</h2>
		<p>Setting</p>
	</div>

	<form action="setting" method="post" role="form" class="php-email-form mt-4">
		<div class="form-group">
			<input type="text" name="mname" class="form-control" id="mname" placeholder="Your Name" value="${member.mname}"/>
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<input type="text" name="mid" class="form-control" id="mid" placeholder="Your ID" value="${member.mid}"/>
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<textarea name="mintroduce" class="form-control" id="mintroduce" placeholder="Your Introduce"><c:if test="${member.mintroduce != null}">${member.mintroduce}</c:if></textarea>
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="mpassword" id="mpassword" placeholder="Your Password" />
			<div class="validate"></div>
		</div>
		<div class="form-group">
			<input type="text" name="mtel" class="form-control" id="mtel" placeholder="Your Phone Number" value="${member.mtel}"/>
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

		<div class="text-center">
			<button type="submit">setting</button>
		</div>
	</form>
</div>