<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>회원가입</title>
		
		<!-- css -->
		<link rel="stylesheet" href="/getspo/resources/css/signup.css">
		
		<!-- 폰트 설정 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
			rel="stylesheet">
		
		<script src="/vs/resources/js/httpRequest.js"></script>
		
		<!-- 우편번호 API -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		
		<!-- <!-- 회원가입 javascript  -->
		<script src="/getspo/resources/js/signup.js"></script> 
		
		
	</head>
	
	<body>
		<div class="signup-form">
			<form>
				<h3>회원가입</h3>
				<div class="form-group">
					<p>이름</p>
					<input type="text" id="name" name="name" required>
				</div>
				
				<div class="form-group">
	               <p>아이디
	               <button type="button" onclick="checkDul();">중복확인</button>
	               </p> 
	               <input type="text" id="id" name="id" maxlength="20" required>
	               <span id="idWarning"></span>
          	  </div> 
				
            	
				<div class="form-group">
					<p>비밀번호</p> 
					<input type="password" id="pwd" name="pwd" placeholder="6~15자의 영문 대/소문자 숫자 및 특수문자 조합" required>
					<span id="passwordWarning"></span>
				</div>
				
				<div class="form-group">
					<p>이메일
					<button type="button" class="btn-authenticate">본인인증</button>
					</p> 
					<input type="email" id="email" name="email" required>
				</div>
				
				 <div class="verification-group" id="verificationGroup">
                	<input type="text" id="verificationCode" name="verificationCode" placeholder="인증번호6자리" required>
                	<button type="button" class="btn-verify">인증번호 확인</button>
            	</div>
            	
				<div class="form-group">
					<p>전화번호</p>
					<input type="tel" id="tel" name="tel" placeholder="(010)-0000-0000" required>
					<span id="telWarning"></span>
				</div>
				
				<div class="form-group">
					<p>생년월일</p>
					<input type="date" id="birth" name="birth" required>
				</div>
				
				<div class="form-group">
					<p>주소
					<input type="button" class="addr_btn" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
					</p>
					
					<input type="text" id="addrcode" name="addrcode" placeholder="우편번호">
					<input type="text" id="addr" name="addr" placeholder="주소"><br>
					<input type="text" id="addrdetail" name="addrdetail" placeholder="상세주소">
				</div>
				
				<div class="form-group">
					<input type="button" class="submit" value="회원가입" onclick="send(this.form);">
				</div>
			</form>
			
			<hr>
	             
	        <a href="javascript:" onclick="location.href='main.do'">
	       		<img src="/getspo/resources/img/logo/가로로고.png">
	        </a>	
		</div>
	
	</body>
</html>