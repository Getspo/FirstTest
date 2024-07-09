<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage_sidebar</title>

	<!-- 마이페이지(ul)안의 li(a)선택에 따라 출력되는 화면의 전환에 관한 js -->
	<!-- <script src="/getspo/resources/js/link.js"></script> -->
	
	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    function showContent(menu) {
	        document.querySelector(".content_event").style.display = "none";
	        document.querySelector(".content_modify").style.display = "none";
	        document.querySelector(".content_withdraw").style.display = "none";
	
	        if (menu === 'link1') {
	            document.querySelector(".content_event").style.display = "block";
	        } else if (menu === 'link2') {
	            document.querySelector(".content_modify").style.display = "block";
	        } else if (menu === 'link3') {
	            document.querySelector(".content_withdraw").style.display = "block";
	        }
	    }
	
	    /* URL의 쿼리 파라미터 확인 */
	    const urlParams = new URLSearchParams(window.location.search);
	    const menu = urlParams.get('menu');
	
	    if (menu) {
	        showContent(menu);
	    } else {
	        // 기본으로 보여줄 메뉴 설정 (예: link1)
	        showContent('link1');
	    }
	
	    /* link1 클릭 시 */
	    document.querySelector("#link1").addEventListener("click", function(event) {
	        showContent('link1');
	    });
	
	    /* link2 클릭 시 */
	    document.querySelector("#link2").addEventListener("click", function(event) {
	        showContent('link2');
	    });
	
	    /* link3 클릭 시 */
	    document.querySelector("#link3").addEventListener("click", function(event) {
	        showContent('link3');
	    });
	});
	</script>
	
</head>

<body>
    <div class="mypage_menu">
        <ul>
            <h2>마이페이지</h2>
            <li><a id="link1">참가 행사</a></li>
            <li><a id="link2">정보 수정</a></li>
            <li><a id="link3">회원 탈퇴</a></li>
        </ul>
    </div>
</body>
</html>