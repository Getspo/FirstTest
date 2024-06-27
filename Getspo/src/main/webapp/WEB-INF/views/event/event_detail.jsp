<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>행사 페이지</title>

    <link rel="stylesheet" href="/getspo/resources/css/event_detail.css">

    <!-- 폰트 설정 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const buttons = document.querySelectorAll(".button_bar button");

            buttons.forEach(button => {
                button.addEventListener("click", function() {
                    buttons.forEach(btn => btn.classList.remove("active"));
                    this.classList.add("active");
                });
            });
        });
    </script>
</head>

<body>
    <jsp:include page="../navigation.jsp"></jsp:include><br>

    <div class="event_detail_page">
        <!-- 행사 정보 라인 -->
        <div class="event_line">
            <div>
                <!-- 이미지 임시로 삽입 -->
                <img src="/getspo/resources/img/행사썸네일테스트.png" id="event_image">
           	</div>
			<div class="button_bar">
				<ul>
					<li>
						<button type="button" class="active">
							<span>행사 소개</span>
						</button>
					</li>
					<li>
						<button type="button">
							<span>행사 장소</span>
						</button>
					</li>
					<li>
						<button type="button">
							<span>공지/안내</span>
						</button>
					</li>
					<li>
						<button type="button">
							<span>문의하기</span>
						</button>
					</li>
					<li>
						<button type="button">
							<span>취소/환불</span>
						</button>
					</li>
				</ul>
			</div>

			<div class="event_intro">
				<
			</div>

		</div>

        <!-- 신청하기 라인 -->
        <div class="apply_line">신청하기 라인</div>
    </div>
</body>
</html>
