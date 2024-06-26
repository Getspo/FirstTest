<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>비밀번호 재설정</title>
		
		<link rel="stylesheet" href="/getspo/resources/css/resetpassword.css">
		
	</head>
	<body>
		<div class="container">
	        <div class="form-wrapper">
	            <h2>비밀번호 재설정</h2>
	            <form id="reset-form">
	            	<input type="hidden" name="user_id" value="${user_id}">
	            	
	                <div class="input-group">
	                    <label for="new-password">새 비밀번호</label>
	                    <input type="password" id="new-password" name="new-password" placeholder="새 비밀번호를 입력하세요" required>
	                </div>
	                <div class="input-group">
	                    <label for="confirm-password">비밀번호 확인</label>
	                    <input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호를 다시 입력하세요" required>
	                </div>
	                <button type="submit">Reset Password</button>
	            </form>
	        </div>
	    </div>
	</body>
</html>