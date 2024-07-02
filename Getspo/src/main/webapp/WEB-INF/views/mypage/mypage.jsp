<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


<script>
	function modify(f) {
		let user_idx = f.user_idx.value;
		let check_pwd = f.c_pwd.value;

		let url = "userinfo_modify.do";
		let param = "user_idx=" + user_idx + "user_name=" + f.user_name.value
				+ "&user_pwd=" + f.user_pwd.value + "&user_birth="
				+ f.user_birth.value + "&user_tel=" + f.user_tel.value
				+ "&user_addr=" + f.user_addr.value;

		sendRequest(url, param, resultFn, "post");
	}
	function resultFn() {
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

<script>
	/* 마이페이지(ul)안의 li 선택에 따라 출력되는 화면의 전환에 관한 js */
	document.addEventListener("DOMContentLoaded", function() {
		/* link1 클릭 시 */
		document.querySelector("#link1").addEventListener(
		"click", function(event) {
			document.querySelector(".contents_div1").style.display = "block"; /* contents_div1 보이기 */
			document.querySelector(".contents_div2").style.display = "none"; /* contents_div2 숨기기 */
		});

		/* link2 클릭 시 */
		document.querySelector("#link2").addEventListener(
		"click", function(event) {
			document.querySelector(".contents_div1").style.display = "none"; /* contents_div1 숨기기 */
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
				<li><a id="link1">참가 행사</a></li>
				<li><a id="link2">정보 수정</a></li>
			</ul>
		</div>

		<div class="contents_wrapper">
		
			<div class="contents_div1">
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
<!--━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━-->
			<div class="contents_div2">
				<h3>회원 정보 수정</h3>
				<div class="information">
				<form>
					<input type="hidden" name="user_idx" value="${vo.user_idx}">
					<input type="hidden" name="user_pwd" value="${vo.user_pwd}">
					
					<h5>이름</h5>
					<input id="user_name" name="user_name" class="inp" value="${vo.user_name}" required>

					<h5>전화번호</h5>
					<input type="tel" id="user_tel" name="user_tel" class="inp" value="${vo.user_tel}" required>

					<h5>생년월일</h5>
					<input type="date" id="user_birth" name="user_birth" class="inp" value="${vo.user_birth}" required>

					<h5>주소
					<input type="button" class="btn" value="찾기" onclick="sample6_execDaumPostcode()">
					</h5>
					

					<input type="text" id="user_addrcode" name="user_addrcode" class="addrinp" value="${vo.user_addrcode}">
					<br>
					<input type="text" id="user_addr" name="user_addr" class="addrinp" value="${vo.user_addr}">
					<br>
					<input type="text" id="user_addrdetail" name="user_addrdetail" class="addrinp" value="${vo.user_addrdetail}">

					<h5>비밀번호</h5>
					<input type="password" id="user_pwd" name="user_pwd" class="inp" placeholder="비밀번호를 입력하세요"  required>
					<div class="last_btn_div">
					<input type="button" class="last_btn" value="완료" onclick="modify(this.form);">
					<input type="button" class="last_btn" value="취소" onclick="history.go(-1);">
					</div>
				</form>
				</div>
			</div>

		</div>
	</div>
</body>
</html>