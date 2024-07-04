<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage_modify</title>

<script>
	//회원정보 수정
	function modify(f) {

		let url = "userinfo_modify.do";
		let param = "user_idx=" + f.user_idx.value + "&user_name="
				+ f.user_name.value + "&user_pwd=" + f.new_pwd.value
				+ "&user_tel=" + f.user_tel.value + "&user_birth="
				+ f.user_birth.value + "&user_addrcode="
				+ f.user_addrcode.value + "&user_addr=" + f.user_addr.value
				+ "&user_addrdetail=" + f.user_addrdetail.value;

		sendRequest(url, param, resultFn, "post");
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let data = xhr.responseText;
			let json = (new Function('return ' + data))();

			if (json[0].result == "fail") {
				alert("수정실패");
			} else {
				alert("수정완료");
				location.href = 'mypageform.do?user_idx=${vo.user_idx}';
			}
		}
	}
</script>

</head>

<body>
	<div class="contents_div2">
		<h3>회원 정보 수정</h3>
		<div class="information">
			<form>
				<input type="hidden" name="user_idx" value="${vo.user_idx}">

				<h5>이름</h5>
				<input id="user_name" name="user_name" class="inp" value="${vo.user_name}" required>

				<h5>전화번호</h5>
				<input type="tel" id="user_tel" name="user_tel" class="inp" value="${vo.user_tel}" required>

				<h5>생년월일</h5>
				<input type="date" id="user_birth" name="user_birth" class="inp" value="${vo.user_birth}" required>

				<h5>주소</h5>
				<div>
					<input type="button" class="btn" value="찾기" onclick="sample6_execDaumPostcode()">
					<br>
					<input type="text" id="user_addrcode" name="user_addrcode" class="addrinp" value="${vo.user_addrcode}">
					<br>
					<input type="text" id="user_addr" name="user_addr" class="addrinp" value="${vo.user_addr}">
					<br>
					<input type="text" id="user_addrdetail" name="user_addrdetail" class="addrinp" value="${vo.user_addrdetail}">
				</div>

				<h5>새 비밀번호</h5>
				<input type="password" id="user_pwd" name="new_pwd" class="inp" required>
				<div class="last_btn_div">
					<input type="button" class="last_btn" value="완료" onclick="modify(this.form);">
					<input type="button" class="last_btn" value="취소" onclick="location.href='mypageform.do?user_idx=${vo.user_idx}'">
				</div>
			</form>
		</div>
	</div>
</body>
</html>