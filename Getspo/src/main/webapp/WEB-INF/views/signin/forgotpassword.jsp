<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 찾기</title>
		
		<link rel="stylesheet" href="/getspo/resources/css/forgotpassword.css">
		
	</head>
	
	<body>
		<form>
			<div class="forgot_pwd">
				<div class="header">
					<h3>비밀번호 찾기</h3>
					<p id="comment">가입하신 이메일로 비밀번호 재설정 URL을 전송해드립니다</p>
					
					<br>
					
					<p>아이디(ID)</p>
					<input placeholder="아이디를 입력하세요" name="id" type="text">
					<br>
					
					
					<p>이름</p>
					<input placeholder="이름을 입력하세요" name="name" type="text">
					<br>
									
					
					<p>이메일</p>
					<input placeholder="이메일을 입력하세요" name="email" type="text">
					<br><br><br>
					<input class="reset_pwd" type="button" value="재설정 메일 받기" onclick="location.href='pwd.do'">
				</div>
	
				<hr>
				
				<a href="javascript:" onclick="location.href='main.do'">
					<img src="/getspo/resources/img/logo/가로로고.png">
				</a>					
			</div>
		</form>
	</body>
</html>