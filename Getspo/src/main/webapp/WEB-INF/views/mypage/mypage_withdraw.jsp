<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage_withdraw</title>
<script>
	//회원탈퇴(DB삭제)
	function del(f) {
		let idx = f.user_idx.value;
		let c_pwd = f.c_pwd.value;//입력받은 비밀번호

		if (!confirm("회원님의 모든 정보가 삭제되며 되돌릴 수 없습니다.\n정말 회원탈퇴를 진행하시겠습니까?")) {
			return;
		}
		if (c_pwd == '') {
			alert("비밀번호를 입력하세요");
			return;
		}

		let url = "delete.do";
		let param = "user_idx=" + idx + "&user_pwd="
				+ encodeURIComponent(c_pwd);
		sendRequest(url, param, resultDelFn, "post");
	}
	function resultDelFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			let data = xhr.responseText;
			let json = (new Function('return ' + data))();

			if (json[0].result == 'no') {
				alert("비밀번호가 일치하지 않습니다.");
				return;
			} else if (json[0].result == 'fail') {
				alert("[회원탈퇴 실패]여러차례 반복될 경우 담당자에게 문의하세요.");
				return;
			} else {
				alert("[회원탈퇴 완료]회원님의 모든 정보가 삭제 되었습니다.");
				location.href = "main.do";
			}

		}
	}
</script>
</head>
<body>
	<div class="contents_div3">
		<form>
			<h3>회원 탈퇴</h3>
			<br>
			<h5>
				비밀 번호 입력&nbsp;
				<input type="password" name="c_pwd">&nbsp;
				<input type="hidden" name="user_idx" value="${vo.user_idx}">
				<input type="hidden" name="user_pwd" value="${vo.user_pwd}">
				<input type="button" value="탈퇴" onclick="del(this.form)">
			</h5>
		</form>
	</div>
</body>
</html>