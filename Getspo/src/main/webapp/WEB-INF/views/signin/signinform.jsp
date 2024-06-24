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
      <!-- Ajax -->
      <script src="/getspo/resources/js/httpRequest.js"></script>
      
      <script>
      	function validateId(f){
      		let id = f.user_id.value;
      		let pwd = f.user_pwd.value;
      		
      		console.log("id = " + id);
      		console.log("pwd = " + pwd);
      		
      		//유효성검사
      		let idpattern = /^[a-z][a-z0-9]{5,19}$/;
      		if(id == '' || !idpattern.test(id)){
      			alert("올바른 아이디 비밀번호를 입력하세요");
      			return;
      		}else if(pwd == ''){
      			alert("올바른 아이디 비밀번호를 입력하세요");
      			return;
      		}
      		
      		let url = "login.do";
      		let param = "id=" + id + "&pwd=" + encodeURIComponent(pwd);
      		
      		sendRequest(url, param, resultLog, "POST");     		
      	}
      	
      	function resultLog(){
      		if(xhr.readyState == 4 && xhr.status == 200){
                let data = xhr.responseText;
                if (data === 'no_id') {
                    alert("아이디가 존재하지 않습니다");    
                } else if(data === 'no_pwd'){
                    alert("비밀번호가 일치하지 않습니다");
                } else if(data === 'clear'){
                    location.href = "main.do";
                } else {
                    alert("로그인 실패");
                }
            }
      	}
      	
      </script>
      
      
   </head>
   
   <body>
      <form action="login.do" method="post">
      <div class="login_page">
      
         <div class=logo_text>
            <a href="javascript:" onclick="location.href='main.do'">
               <img src="/getspo/resources/img/logo/가로로고.png">
            </a>
            <h2>다시 만나서 반가워요!</h2> 
         </div>
         
         <br><br>
         
         <div class="login_input">
            <p>아이디(ID)</p>
            <input class="id_box" placeholder="아이디를 입력하세요" name="user_id" id="user_id" type="text" required>
            
            <br>
            <br>
            
            <p>비밀번호</p>
            <input class="pwd_box" placeholder="비밀번호를 입력하세요" name="user_pwd" id="user_pwd" type="password" required>
         </div>
         
         <div class="login_tool">
            <input type="checkbox" id="keep_login" name="keep_login" value="로그인 유지"> 로그인 유지
              <a href="javascript:" onclick="location.href='forgotid.do'">아이디(ID) 찾기</a>
              <a href="javascript:" onclick="location.href='forgotpassword.do'">비밀번호 찾기</a>
         </div>
      
            <input class="login_btn" type="button" value="로그인" onclick="validateId(this.form);">
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