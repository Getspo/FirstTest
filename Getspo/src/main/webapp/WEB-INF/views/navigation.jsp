<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8"> 
      <title>네비게이션 바</title>
      
      <link rel="stylesheet" href="/getspo/resources/css/navigation.css">
      
      <!-- 네이게이션js -->
		<script src="/getspo/resources/js/navigation.js"></script>
	
      
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
	               <button class="user-button">
		                <span class="user-name">${sessionScope.user.user_name} 님</span>
		                <svg class="user-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
		                    <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"></path>
		                </svg>
		            </button>
	                <div id="menu-items" role="menu" tabindex="0">
		                <div id="menu-1">
		                    <p>${sessionScope.user.user_id}</p>
		                    <a href="mypageform.do">마이페이지 &gt;</a>
		                </div>
		                <div id="menu-2" class="border-t"></div>
		                <form action="logout.do" method="post">
		                    <button id="logout-button">로그아웃</button>
		                </form>
		            </div>
	            </c:if>
	            <c:if test="${empty sessionScope.user}">
	                <a href="javascript:" onclick="location.href='signinform.do'" class="signin">로그인</a>&nbsp;
	                <a href="javascript:" onclick="location.href='signupform.do'" class="signup">회원가입</a>&nbsp;
	            </c:if>
	        </div>
            <a href="javascript:" onclick="location.href='new_event.do'" class="hostpage">무료행사개설</a>&nbsp;
            <a href="javascript:" onclick="location.href='hostMain.do'" class="hostpage">호스트센터</a>
         </div>
      </div>
      </nav>
   </body>
</html>