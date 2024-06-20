<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>회원가입 페이지</title>
		<link rel="stylesheet" href="/getspo/resources/css/signup.css">
		<script src="/vs/resources/js/httpRequest.js"></script>
		<script>		
	        document.addEventListener("DOMContentLoaded", function() {
	            const authenticateBtn = document.querySelector(".btn-authenticate");
	            const verificationGroup = document.getElementById("verificationGroup");
	
	            authenticateBtn.addEventListener("click", function() {
	            	let pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	            	let emailInput = document.getElementById("email");
	            	if(pattern.test(emailInput.value)){
	            		verificationGroup.classList.add("show");
	            		let userEmail = emailInput.value;
	    				let url = "mailCheck.do";
	    				let param = "email="+ encodeURIComponent(userEmail);
	    				sendRequest(url, param, resultMail, "post");
	            	}else{
	            		alert("올바른 이메일주소를 입력하세요");
	            		return;
	            	}
	                               
	            });
	            
	            let res;
				function resultMail(){
					if(xhr.readyState == 4 && xhr.status == 200){
						let data = xhr.responseText;
						alert("인증코드가 입력하신 이메일로 전송 되었습니다");
						//전역변수 res에 넘겨받은 인증번호를 담는다
						res = data;
					}
				}
				      
	
	            const verifyBtn = document.querySelector(".btn-verify");
	
	            verifyBtn.addEventListener("click", function() {
	            	let check_input = document.getElementById("verificationCode");
	            	let email_input = document.getElementById("email");
	                // 여기에 실제 인증번호 확인 로직을 추가하면 됩니다.
	            	if( check_input.value == res ){
						alert("인증되었습니다");
						email_input.disabled = true;
					}else{
						alert("인증번호 불일치");
						return;
					}
	            });
	        });
	        	        
	    </script>
	    
	    <script>
		    function send(f){
				let email = f.email.value;
				let pwd = f.pwd.value;
				let name = f.name.value;
				let birth = f.birth.value;
				let tel = f.tel.value;
				let addr = f.addr.value;
				
				
				f.method="post";
				f.action = "signupInsert.do?email="+encodeURIComponent(email);
				f.submit();
			}	     
	    </script>
	    
						
	</head>
	<body>
		<div class="signup-form">
			<h2>회원가입</h2>
			<form>
				<div class="form-group">
					<label for="email">이메일</label> 
					<input type="email" id="email" name="email" required>
					<button type="button" class="btn-authenticate">본인인증</button>
				</div>
				 <div class="verification-group" id="verificationGroup">
                	<input type="text" id="verificationCode" name="verificationCode" placeholder="인증번호6자리" required>
                	<button type="button" class="btn-verify">인증번호 확인</button>
            	</div>
				<div class="form-group">
					<label for="password">비밀번호</label> 
					<input type="password" id="pwd" name="pwd" required>
				</div>
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" id="name" name="name" required>
				</div>
				<div class="form-group">
					<label for="birthdate">생년월일</label>
					<input type="date" id="birth" name="birth" required>
				</div>
				<div class="form-group">
					<label for="phone">전화번호</label>
					<input type="tel" id="tel" name="tel" required>
				</div>
				<div class="form-group">
					<label for="address">주소</label>
					<input type="text" id="addr" name="addr" required>
				</div>
				<div class="form-group">
					<input type="button" class="submit" value="회원가입" onclick="send(this.form);">
				</div>
			</form>
		</div>
	
	</body>
</html>
