<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MypageForm</title>

<!-- css -->
<link rel="stylesheet" href="/getspo/resources/css/mypage.css">

<!-- 폰트설정 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
 
<!-- Ajax -->
<script src="/getspo/resources/js/httpRequest.js"></script>
 
<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>/* [정보수정>회원정보수정] 정보수정을 위한 콜백함수 */
	function checkPassword(f){
		let user_idx = f.user_idx.value;
		let c_pwd = f.c_pwd.value;//입력받은 비밀번호
		
		if(c_pwd == ''){
			alert("비밀번호를 입력하세요");
			return;
		}
		
		let url = "/checkPassword.do";
		let param = "user_idx="+user_idx+"&user_pwd="+encodeURIComponent(c_pwd);
		sendRequest(url, param, resultFn, "post");
	}
	function resultModify(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			let json = (new Function('return '+data))();
			
			if(json[0].result == 'failure'){
				alert("비밀번호 불일치");
				return;
			}else{
				//json으로 넘겨받은 idx값을 가지고 수정 폼으로 이동
				location.href="userinfo_modify.do?user_idx="+json[0].user_idx;
			}
		}
	}
	
	
	function send(f){
		let user_idx = f.user_idx.value;
		let c_pwd = f.c_pwd.value;
		
		
		
		let url = "userinfo_modify.do";
		let param ="user_idx="+user_idx+"user_name="+f.user_name.value+
        "&user_pwd="+f.user_pwd.value+"&user_birth="+f.user_birth.value+
        "&user_tel="+f.user_tel.value+"&user_email="+f.user_email.value+
        "&user_addr=" + f.user_addr.value;
		
		sendRequest(url, param, resultFn, "post");
	}
	function resultFn(){
		if (xhr.readyState == 4 && xhr.status == 200) {
            if (xhr.responseText == "success") {
                alert("수정완료");
                location.href = "mypageform.do";
            } else {
                alert("수정실패");
            }
        }
	}
</script>

<script>/* 마이페이지(ul)안의 li 선택에 따라 출력되는 화면의 전환에 관한 js */
	document.addEventListener("DOMContentLoaded", function() {
		/* link1 클릭 시 */
		document.querySelector("#link1").addEventListener(
			"click", function(event) {document.querySelector(".contents_div1").style.display = "block"; /* contents_div1 보이기 */
				document.querySelector(".contents_div2").style.display = "none"; /* contents_div2 숨기기 */
					});

		/* link2 클릭 시 */
		document.querySelector("#link2").addEventListener(
			"click", function(event) {document.querySelector(".contents_div1").style.display = "none"; /* contents_div1 숨기기 */
				document.querySelector(".contents_div2").style.display = "block"; /* contents_div2 보이기 */
					});
	});
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/navigation.jsp"></jsp:include><br>

	<div class="container">
		<div class="ul_div">
			<ul>
				<h2 class="ul_div_title">마이페이지</h2>
				<li><a id="link1">정보 수정</a></li>
				<li><a id="link2">참가 행사</a></li>
			</ul>
		</div>
		
		<div class="contents_wrapper">
			<div class="contents_div1">
				<h3>회원 정보 수정</h3>
				
				<form>
					<div class="information">
					<h5>이름</h5>
					<input type="hidden" name="user_idx" value="${vo.user_idx}">
					<input type="hidden" name="user_pwd" value="${vo.user_pwd}">
					<input name="user_name" value="${vo.user_name}"><br>
					<h5>아이디</h5>
					<input name="user_id" value="${vo.user_id}"><br>
					
					<!-- 기존 비밀번호 확인 -->
					<h5>기존 비밀번호 입력</h5>
						<input name="check_pwd" value=""><br>
						<input type="button" value="확인" onclick="checkPassword(this.form);"><br>
					
					<!-- 신규 비밀번호 입력 -->
					<h5>신규 비밀번호 입력</h5>
					<input name="user_pwd" value=""><br>
					<h5>생년월일</h5>
					<input name="user_birth" value=""><br>
					<h5>전화번호</h5>
					<input name="user_tel" value=""><br>
					<h5>이메일</h5>
					<input name="user_email" value=""><br>
					<h5>주소</h5>
					<input name="user_addr" value=""><br>
					
					<input type="button" value="완료" onclick="modify(this.form);">
					</div>
				</form>
				
			</div>
			<div class="contents_div2">
				<h3>참가 행사 목록</h3>
				
				<div class="recommend">
					<img class="thumbnail" src="/getspo/resources/img/thumbnail/thumbnail1.jpg">
					<br>
					<a class="event_date">2024년 8월 17일 / 경기 하남</a>
					<br>
					<a class="event_name">썸머나이트런</a>
					<br>
					<a class="price">10,000</a>
					<a class="view">조회수 100</a>
				</div>
				<div class="recommend">
					<img class="thumbnail" src="/getspo/resources/img/thumbnail/thumbnail1.jpg">
					<br>
					<a class="event_date">2024년 8월 17일 / 경기 하남</a>
					<br>
					<a class="event_name">썸머나이트런</a>
					<br>
					<a class="price">10,000</a>
					<a class="view">조회수 100</a>
				</div>
				<div class="recommend">
					<img class="thumbnail" src="/getspo/resources/img/thumbnail/thumbnail1.jpg">
					<br>
					<a class="event_date">2024년 8월 17일 / 경기 하남</a>
					<br>
					<a class="event_name">썸머나이트런</a>
					<br>
					<a class="price">10,000</a>
					<a class="view">조회수 100</a>
				</div>
				<div class="recommend">
					<img class="thumbnail" src="/getspo/resources/img/thumbnail/thumbnail1.jpg">
					<br>
					<a class="event_date">2024년 8월 17일 / 경기 하남</a>
					<br>
					<a class="event_name">썸머나이트런</a>
					<br>
					<a class="price">10,000</a>
					<a class="view">조회수 100</a>
				</div>
				<div class="recommend">
					<img class="thumbnail" src="/getspo/resources/img/thumbnail/thumbnail1.jpg">
					<br>
					<a class="event_date">2024년 8월 17일 / 경기 하남</a>
					<br>
					<a class="event_name">썸머나이트런</a>
					<br>
					<a class="price">10,000</a>
					<a class="view">조회수 100</a>
				</div>
				<div class="recommend">
					<img class="thumbnail" src="/getspo/resources/img/thumbnail/thumbnail1.jpg">
					<br>
					<a class="event_date">2024년 8월 17일 / 경기 하남</a>
					<br>
					<a class="event_name">썸머나이트런</a>
					<br>
					<a class="price">10,000</a>
					<a class="view">조회수 100</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>