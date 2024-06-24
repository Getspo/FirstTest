<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
         	<div id="user-info">
	            <c:if test="${not empty sessionScope.user}">
	                ${sessionScope.user.user_name} <!-- 여기서 user_name은 사용자 이름을 담고 있는 변수명입니다. -->
	                <form action="logout.do" method="post">
	                    <input type="submit" value="Logout">
	                </form>
	            </c:if>
	            <c:if test="${empty sessionScope.user}">
	                <a href="javascript:" onclick="location.href='signinform.do'" class="signin">로그인</a>&nbsp;&nbsp;&nbsp;
	                <a href="javascript:" onclick="location.href='signupform.do'" class="signup">회원가입</a>&nbsp;&nbsp;&nbsp;
	            </c:if>
	        </div>            
            <a href="javascript:" onclick="location.href='hostform.do'" class="hostpage">호스트센터</a>
         </div>
      </div>
      </nav>
   </body>
</html>