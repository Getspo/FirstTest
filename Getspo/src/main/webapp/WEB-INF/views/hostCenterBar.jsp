<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
* {
	margin: 0;
	padding: 0;
	font-family: "Noto Sans KR", sans-serif;
}

.hostCenterBar {
	width: 100%;
	height: 85px;
	position: fixed;
	background-color: #171717;
	display: flex;
	justify-content: center;
	align-items: center;
}

.resolution {
	width: 1200px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
}


.logo {
	display: inline-block;
}

.spononiverse {
	width: 100px;
	height: 70px;
}

.right {
    display: flex;
    align-items: center;
    height: 100%;
}

.toMake {
    text-decoration: none;
    color: #0099bc;
    background-color: white;
    border-radius: 5px;
    padding: 5px;
    margin-right: 5px;
}

.toMain {
    text-decoration: none;
    color: #0099bc;
    background-color: white;
    border-radius: 5px;
    padding: 5px;
}

.hostText {
	color: white;
	font-weight: bold;
	margin-left: -65px; 
}

</style>

</head>

<body>
	<nav class="hostCenterBar">
		<div class="resolution">
			<div class="logo">
				<img class="spononiverse"
					src="/getspo/resources/img/logo/host_logo.png">
			</div>
				
			<div class="right">
				<input class="toMake" type="button" value="이벤트개최하기"
					onclick="location.href='new_event.do'">
					
				<input class="toMain" type="button" value="메인페이지"
					onclick="location.href='main.do'">
			</div>
		</div>
	</nav>
</body>
</html>