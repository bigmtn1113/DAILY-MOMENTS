<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table style="color:#636568; width:100%; border-collapse: separate; border-spacing: 5px;">
	<tr style="height: 30px; background-color: white">
		<th  style="width:50px; background-color: #262626;">번호</th>
		<th  style="width:200px; background-color: #262626;">제목</th>
		<th  style="width:100px; background-color: #262626;">글쓴이</th>
		<th  style="width:100px; background-color: #262626;">날짜</th>
	</tr>
	
	<c:forEach var="board" items="${list}">
			<tr>
			<td>${board.bno}</td>
			<td><a href="javascript:boardDetail(${board.bno})">${board.btitle}</a></td>
			<td>${board.mid}</td>
			<%-- <td><img class="rounded-circle" width="50px" height="50px" src="photodownload?fileName=${board.mphoto}"/></td> --%>
			<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
				

	<div class="pageNo">
		<tr style="text-align: center;">
			<td colspan="4" style="text-align: center;">
				<a class="btn btn-info btn-sm" href="javascript:boardList(1)">처음</a>
				
				<c:if test="${pager.groupNo > 1}">
					<a class="btn btn-outline-info btn-sm" href="javascript:boardList(${pager.startPageNo-1})">이전</a> <!-- 페이지 에서 '이전' 누르면 그 그룹 바로 전 페이지그룹으로 간다 ex)12345탭 페이지 -> 678910탭 페이지 ... 이렇게 됨 -->
				</c:if>
				
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo == i}">
						<a class="btn btn-danger btn-sm" href="javascript:boardList(${i})">${i}</a>
					</c:if>
					
					<c:if test="${pager.pageNo != i}">
						<a class="btn btn-outline-success btn-sm" href="javascript:boardList(${i})">${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pager.groupNo < pager.totalGroupNo}">
					<a class="btn btn-outline-info btn-sm" href="javascript:boardList(${pager.endPageNo+1})">다음</a>
				</c:if>
				
				<a class="btn btn-outline-primary btn-sm" href="javascript:boardList(${pager.totalPageNo})">맨끝</a>
			</td>
		</tr>
		
		<div id="board_result" style="margin-top:30px"></div>
		
	</div>

</table>