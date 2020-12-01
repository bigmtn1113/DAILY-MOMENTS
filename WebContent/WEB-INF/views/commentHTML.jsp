<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:forEach var="boardComment" items="${boardCommentsListWrite}">
	<a href="#"><c:out value="${boardComment.mid}"/></a> : <c:out value="${boardComment.ccontent}"/><br/>
</c:forEach>