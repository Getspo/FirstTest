<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			.navibar { width: 100%;
				  height: 85px;
				  position: fixed;
				  background-color: #0099bc;	  
			}
			
			.resolution{width:1200px;
						margin:0 auto;}
			
			input {	padding: 3px;
					font-size: 20px;
			}
			
			.logo {	display: inline-block;
		            float: left;
		            margin: 5px;
	        }
			.left {	display: inline-block;
		            float: left;
		            margin-top: 20px;
		            margin-left: 30px;
	        }
	        
	        .right {display: inline-block;
	            	float: right;
	            	margin-top: 20px;
	        }
	        
			.searchbox {width: 276px;
						height: 36px;
						border:none;
						border-radius: 15px;
						text-align: center;
						font-size: 20px;
						 
			}
			
		</style>
		<script>
			//검색버튼 구현//검색어━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
			function search(){
				let search_text = document.getElementById("search_text").value;
				if( search_text == '' ){
					alert("검색할 내용을 입력하세요");
					return;
				}
				location.href="search.do?search_text="+encodeURIComponent(search_text)+
						"&page=1";
			}//━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
		</script>
	</head>
	
	<body>
		<nav class="navibar">
		<div class="resolution">
			<div class="logo">
				<img src="/getspo/resources/img/logo/logo2.png">
			</div>
			<div class="left">
				<input type="text" id="search_text"
						class="searchbox" placeholder="검색어를 입력해주세요.">&nbsp;
				<input class="searchbutton" type="button" value="search" onclick="search();">
			</div>
			<div class="right">
				<input class="signin" type="button" value="Sign In" onclick="location.href='signinform.do'">&nbsp;&nbsp;┃&nbsp;
				<input class="signup" type="button" value="Sign up" onclick="location.href='signupform.do'">&nbsp;&nbsp;┃&nbsp;
				<input class="hostpage" type="button" value="Hostpage" onclick="location.href='hostform.do'">
				
			</div>
		</div>
		</nav>
	</body>
</html>