<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>네비게이션 바</title>
      
      <link rel="stylesheet" href="/getspo/resources/css/navigation.css">
      
      <script>
         //검색버튼 구현//검색어━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
         function search(){
            let search_text = document.getElementById("search_text").value;
            if( search_text == '' ){
               alert("검색할 내용을 입력하세요");
               return;
            }
            location.href="search.do?search_text="+encodeURIComponent(search_text);
         }//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
      </script>
   </head>
   
   <body>
      <nav class="navibar">
      <div class="resolution">
         <div class="logo_div">
            <img class="sponiverse_logo" src="/getspo/resources/img/logo/정사각형로고.png">
         </div>
         
         <div class="left">
            <input type="text" id="search_text"
                  class="searchbox" placeholder="검색어를 입력해주세요.">&nbsp;
            <a  href="javascript:" onclick="search();">
               <img src="/getspo/resources/img/logo/돋보기아이콘.png" class="searchbutton">
            </a>
         </div>
         
         <div class="right">
            <a href="javascript:" onclick="location.href='signinform.do'" class="signin">로그인</a>&nbsp;&nbsp;&nbsp;
            <a href="javascript:" onclick="location.href='signupform.do'" class="signup">회원가입</a>&nbsp;&nbsp;&nbsp;
            <a href="javascript:" onclick="location.href='hostform.do'" class="hostpage">호스트센터</a>
         </div>
      </div>
      </nav>
   </body>
</html>