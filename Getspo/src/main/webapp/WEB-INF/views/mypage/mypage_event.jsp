<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage_event</title>

</head>

<body>
	<div class="content_event">
		<h2>참가 행사 목록</h2>
	
		<div>
			<c:if test="${not empty events}">
			
			<table border="1">
			<tr>
				<th>이벤트번호</th>
				<th>조회수</th>
				<th>이벤트명</th>
				<th>개최지역</th>
				<th>이벤트일시</th>
				<th>이벤트개설일</th>
			</tr>
			
			<!-- getspo_user 테이블의 user_event 컬럼 추가 필요 -->
			<c:forEach var="vo" items="${list}">
			<tr>
				<td>${vo.event_idx}</td>
				<td>${vo.event_viewCount}</td>
				<td>
					<a href="javascript:" 
					onclick="location.href='host_event_management.do'">
					${vo.event_name}
					</a>
				</td>
				<td>${vo.event_loc}</td>
				<td>${vo.formattedEventHStart}</td>
				<td>${vo.formattedEventHEnd}</td>
			</tr>
			</c:forEach>
			</table>
			
			</c:if>
			<c:if test="${empty events}">
				<p>개설된 이벤트가 없습니다</p>
			</c:if>
		</div>
		
	</div>
</body>
</html>