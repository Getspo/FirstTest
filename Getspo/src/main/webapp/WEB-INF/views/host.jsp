<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
	<link rel="stylesheet" href="/getspo/resources/css/hostPage.css">
	</head>
	
	<body>
	<jsp:include page="hostCenterBar.jsp"/><br>
	
	<div class="host_content">
		<h4>개최 이벤트 리스트</h4><br>
		
		<table>
		<tr>
			<th>이벤트번호</th>
			<th>조회수</th>
			<th>이벤트명</th>
			<th>이벤트일시</th>
			<th>이벤트개설일</th>
		</tr>
		<tr>
			<!-- 아래내용은 대회작성후 자동으로 나올 수 있게 변경 -->
			<td>001</td>
			<td>100</td>
			<td>썸머 나이트런</td>
			<td>2024년 8월 17일</td>
			<td>2024년 8월 1일</td>
		</tr>
		
		</table>
	</div>	
	</body>
</html>