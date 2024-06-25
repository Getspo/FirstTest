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
}

.resolution {
	width: 1200px;
	margin: 0 auto;
}


.logo {
	display: inline-block;
	float: left;
}

.spononiverse {
	width: 100px;
	height: 60px;
}

.left {
	display: inline-block;
	float: left;
	margin-top: 20px;
	margin-left: 30px;
}

.right {
    display: flex; /* Flexbox를 사용하여 내부 요소들을 정렬 */
    align-items: center; /* 수직 가운데 정렬 */
    height: 100%; /* 부모 요소(.right)의 높이를 기준으로 링크의 높이 설정 */
    float: right;
    margin-top : 25px;
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
					src="/getspo/resources/img/logo/logo_black.png">&nbsp
					<a class="hostText">HOST CENTER </a>
					
			</div>
				
				<div class="right">
				<input class="toMake" type="button" value="이벤트개최하기"
					onclick="location.href='make.do'">
					
				<input class="toMain" type="button" value="메인페이지"
					onclick="location.href='main.do'">
				</div>
		</div>
	</nav>
</body>
</html>