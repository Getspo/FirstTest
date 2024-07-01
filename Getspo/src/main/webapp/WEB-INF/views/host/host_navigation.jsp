<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>호스트 네비게이션 바</title>
		
		<link rel="stylesheet" href="/getspo/resources/css/host/host_navigation.css">
	
	</head>
	
	<body>
		<nav class="hostCenterBar">
			<div class="resolution">
				<div class="logo">
					<img class="logo_img"
						src="/getspo/resources/img/logo/host_logo.png">
				</div>
					
				<div class="right">
					<input class="toMake" type="button" value="행사 개설"
						onclick="location.href='event_new.do'">
						
					<input class="toMain" type="button" value="스포니버스 홈"
						onclick="location.href='main.do'">
				</div>
			</div>
		</nav>
	</body>
</html>