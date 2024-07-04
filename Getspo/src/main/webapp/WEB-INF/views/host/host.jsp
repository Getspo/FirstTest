<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
			
		<link rel="stylesheet" href="/getspo/resources/css/host/hostPage.css">
		<link rel="stylesheet" href="/getspo/resources/css/recommend.css">
		
	</head>
	
	<body>
		<jsp:include page="host_navigation.jsp"/><br>
		
		<div class="host_content">
			<h4 class="menu_title">개최 이벤트 리스트</h4><br>
			<h6 class="menu_subtitle">이벤트 관리 페이지로 가려면 이벤트명을 클릭하세요.</h6><br>
			
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
			
			<!-- 아래내용은 대회작성후 자동으로 나올 수 있게 변경 -->
			<c:forEach var="event" items="${events}">
			<tr>
				<td>${event.event_idx}</td>
				<td>${event.event_viewCount}</td>
				<td><a href="javascript:" onclick="location.href='host_event_management.do'">${event.event_name}</a></td>
				<td>${event.event_loc}</td>
				<td>${event.formattedEventHStart}</td>
				<td>${event.formattedEventHEnd}</td>
			</tr>
			</c:forEach>
			</table>
			
			</c:if>
			<c:if test="${empty events}">
				<p>개설된 이벤트가 없습니다</p>
			</c:if>
		</div>	
	</body>
</html>