<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>로그인</title>
		
		<!-- signin css -->
		<link rel="stylesheet" href="/getspo/resources/css/signin.css">
		
		<!-- 폰트 설정 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
			rel="stylesheet">
		
	</head>
	
	<body>
		<form>
		<div class="login_page">
		
			<div class=logo_text>
				<a href="javascript:" onclick="location.href='main.do'">
					<img src="/getspo/resources/img/logo/가로로고.png">
				</a>
				<h2>다시 만나서 반가워요!</h2> 
			</div>
			
			<br><br>
			
			<div class="login_input">
				<p>이메일(ID)</p>
				<input class="email_box" placeholder="이메일을 입력하세요" name="email" type="text" required>
				
				<br>
				<br>
				
				<p>비밀번호</p>
				<input class="pwd_box" placeholder="비밀번호를 입력하세요" name="pwd" type="password" required>
			</div>
			
			<div class="login_tool">
				<input type="checkbox" id="keep_login" name="keep_login" value="로그인 유지"> 로그인 유지
		        <a href="javascript:" onclick="location.href='forgotid.do'">이메일(ID) 찾기</a>
		        <a href="javascript:" onclick="location.href='forgotpassword.do'">비밀번호 찾기</a>
			</div>
		
				<input class="login_btn" type="button" value="로그인" onclick="validateEmail()">
				<input class="signup_btn" type="button" value="회원가입" onclick="location.href='signupform.do'">
			
			<br>
			<br>
			<br>
			
			<div>
				<hr>
				
				<br>
					
				<a class="nonmember" href="javascript:" onclick="location.href='nonmemberconfirm.do'">비회원 신청 조회</a>
			</div>
			
		</div>
		
		</form>
	</body>
</html>