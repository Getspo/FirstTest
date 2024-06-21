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

input {
	padding: 3px;
	font-size: 20px;
}

.logo {
	display: inline-block;
	float: left;
}

.spononiverse {
	width: 130px;
	height: 80px;
}

.left {
	display: inline-block;
	float: left;
	margin-top: 20px;
	margin-left: 30px;
}

.right {
	display: inline-block;
	float: right;
	margin-top: 20px;
}
</style>

</head>

<body>
	<nav class="hostCenterBar">
		<div class="resolution">
			<div class="logo">
				<img class="spononiverse"
					src="/getspo/resources/img/logo/logo_black.png">
			</div>

			<div class="right">
				<input class="toMain" type="button" value="toMain"
					onclick="location.href='main.do'">
			</div>
		</div>
	</nav>
</body>
</html>