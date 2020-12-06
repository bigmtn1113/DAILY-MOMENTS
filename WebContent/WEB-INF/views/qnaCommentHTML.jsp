<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach var="qnaBoardComment" items="${qnaBoardCommentsListWrite}">
	<div style="padding-bottom:5px;">
		<a href="#"><c:out value="${qnaBoardComment.mid}"/></a> : <c:out value="${qnaBoardComment.ccontent}"/><br/>
	</div>
</c:forEach>