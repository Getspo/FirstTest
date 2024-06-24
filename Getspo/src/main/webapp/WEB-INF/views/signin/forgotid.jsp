<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>ID 찾기</title>
      
      <link rel="stylesheet" href="/getspo/resources/css/forgotid.css">
      
   </head>
   
   <body>
      <form>
           <div class="forgot_email">
               <div class="header">
                   <h3>ID 찾기</h3>
                   <p id="comment">이름과 이메일을 입력해주세요</p>
                   <br>
                   <p>이름</p>
                   <input placeholder="이름을 입력하세요" name="name" type="text">
                   <p>이메일</p>
                   <input placeholder="메일을 입력하세요" name="email" type="text">
                     <br><br><br>
                   <input class="find_email" type="button" value="ID 찾기" onclick="location.href='findid.do'">
               </div>
                 
               <hr>
               
              <a href="javascript:" onclick="location.href='main.do'">
                     <img src="/getspo/resources/img/logo/가로로고.png">
              </a>
           </div>
          </form>
   </body>
</html>