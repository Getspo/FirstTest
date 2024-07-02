<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>호스트 사이드 바</title>
	
		<link rel="stylesheet" href="/getspo/resources/css/host/host_sidebar.css">
	
	</head>
	
	<body>
		<div class="sidebar">
			<div class="event_select">
			<select onchange="">
				<option selected disabled>개최이벤트선택</option>
				<option value="event_detail.jsp">태100블루레이스</option>
				<option value="event_002">부산썸머비치울트라마라톤</option>
			</select>
			</div>
			<ul class="menu">
				<li class="menu-item">
					<a href="#" class="menu-link" data-target="submenu1">이벤트관리</a>
					<ul class="submenu" id="submenu1">
						<li><a href="javascript:" onclick="location.href='host_event_management.do'">이벤트개요</a></li>
						<li><a href="javascript:" onclick="location.href='host_event_modify.do'">이벤트수정</a></li>
						<li><a href="#">이벤트할인쿠폰발송</a></li>
					</ul>
				</li>
				
				<li class="menu-item">
					<a href="#" class="menu-link" data-target="submenu2">참가자관리</a>
					<ul class="submenu" id="submenu2">
						<li><a href="#">참가자리스트</a></li>
						<li><a href="#">결제리스트</a></li>
						<li><a href="#">받은문의내역</a></li>
					</ul>
				</li>
			</ul>
		</div>
	
		<script src="/getspo/resources/js/host_sidebar.js"></script>
	</body>
</html>