<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	<link rel="stylesheet" href="/getspo/resources/css/hostPage.css">
	<link rel="stylesheet" href="/getspo/resources/css/recommend.css">
	</head>
	
	<body>
	<jsp:include page="hostCenterBar.jsp"/><br>
	
	<div class="host_content">
		<h4 class="menu_title">개최 이벤트 리스트</h4><br>
		<h6 class="menu_subtitle">이벤트 관리 페이지로 가려면 이벤트명을 클릭하세요.</h6><br>
		
		<table border="1">
		<tr>
			<th>이벤트번호</th>
			<th>조회수</th>
			<th>이벤트명</th>
			<th>개최지역</th>
			<th>이벤트일시</th>
			<th>이벤트개설일</th>
		</tr>
		<tr>
			<!-- 아래내용은 대회작성후 자동으로 나올 수 있게 변경 -->
			<td>001</td>
			<td>100</td>
			<td><a href="#">썸머 나이트런</a></td>
			<td>경기 하남</td>
			<td>2024년 8월 17일</td>
			<td>2024년 8월 1일</td>
		</tr>
		
		</table>
	</div>	
	</body>
</html>