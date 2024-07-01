<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>행사 페이지</title>
    <link rel="stylesheet" href="/getspo/resources/css/event_detail.css">
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
                    
                    // 섹션 이동
                    const targetSection = this.getAttribute("data-target");
                    document.getElementById(targetSection).scrollIntoView({ behavior: 'smooth' });
                });
            });

            // 모달 관련 스크립트
            const modal = document.querySelector('.modal');
            const modalOpen = document.querySelector('.modal_btn');
            const modalClose = document.querySelectorAll('.close_btn');
            const submitBtn = document.getElementById('submitQuestion');
            const questionText = document.getElementById('questionText');

            // 모달 열기
            modalOpen.addEventListener('click', function() {
                modal.style.display = 'block';
                questionText.focus(); // 포커스를 텍스트 영역으로 이동
            });

            // 모달 닫기
            modalClose.forEach(btn => {
                btn.addEventListener('click', function() {
                    modal.style.display = 'none';
                });
            });

            // 문의하기 버튼 클릭 시
            submitBtn.addEventListener('click', function() {
                const question = questionText.value.trim();
                if (question !== '') {
                    // AJAX를 이용하여 서버에 문의 내용 전송
                    const xhr = new XMLHttpRequest();
                    xhr.open('POST', '/your-server-endpoint', true);
                    xhr.setRequestHeader('Content-Type', 'application/json');
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState === XMLHttpRequest.DONE) {
                            if (xhr.status === 200) {
                                alert('문의가 접수되었습니다.');
                                modal.style.display = 'none';
                            } else {
                                alert('문의 접수 중 오류가 발생했습니다.');
                            }
                        }
                    };
                    const data = JSON.stringify({ question: question });
                    xhr.send(data);
                } else {
                    alert('문의 내용을 입력해주세요.');
                }
            });
        });

        /* 수량 조절 버튼 */
        function minus(button) {
            // 부모 요소에서 .quantity 클래스를 가진 요소를 찾음
            var quantitySpan = button.parentNode.querySelector('.quantity');
            var currentQuantity = parseInt(quantitySpan.innerText);
            if (currentQuantity > 1) {  // 최소 수량을 1로 설정
                quantitySpan.innerText = currentQuantity - 1;
            }
        }

        function plus(button) {
            // 부모 요소에서 .quantity 클래스를 가진 요소를 찾음
            var quantitySpan = button.parentNode.querySelector('.quantity');
            var currentQuantity = parseInt(quantitySpan.innerText);
            quantitySpan.innerText = currentQuantity + 1;
        }
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
                        <button type="button" class="active" data-target="intro">
                            <span>행사 소개</span>
                        </button>
                    </li>
                    <li>
                        <button type="button" data-target="place">
                            <span>행사 장소</span>
                        </button>
                    </li>
                    <li>
                        <button type="button" data-target="notice">
                            <span>공지/안내</span>
                        </button>
                    </li>
                    <li>
                        <button type="button" data-target="ask">
                            <span>문의하기</span>
                        </button>
                    </li>
                    <li>
                        <button type="button" data-target="cancel">
                            <span>취소/환불</span>
                        </button>
                    </li>
                </ul>
            </div>

            <br>
            <hr>
            <br>
                
            <section id="intro" class="intro">
                <div>
                    <span>일시</span>
                    <span>${vo.event_h_start}~${vo.event_h_end}</span><!-- ${vo.event_h_start}~${vo.event_h_end} -->
                </div>
                <div>
                    <span>신청</span>
                    <span>${vo.event_r_start}~${vo.event_r_end}</span>
                </div>
                <div>
                    <span>비용</span>
                    <span>${vo.event_price}</span>
                </div>
                <div>
                    <span>장소</span>
                    <span>${vo.event_loc}</span>
                </div>
            </section>
            
            <br>
            <hr>
            <br>
            
            <section id="place" class="place">
                <div>
                    <h4>행사 장소</h4>
                    <div>
                        <span id="loc">장소</span>
                        <span>${vo.event_loc}</span>
                    </div>
                </div>
            </section>
            
            <section id="notice" class="notice">
                <div>
                    <h4>공지/안내</h4>
                    <div class="notice_box">
                        <span>등록된 공지/안내가 없습니다.</span><!-- ${vo.event_notice} -->
                    </div>
                </div>
            </section>
            
            <section id="ask" class="ask">
                <div>
                    <h4>문의하기
                        <button type="button" class="modal_btn">호스트에게 문의하기</button>
                    </h4>
                    <div class="ask_box">
                        <span>등록된 문의가 없습니다.</span><!-- ${vo.event_notice} -->
                    </div>
                </div>
            </section>
            
            <section id="contact" class="contact">
                <div>
                    <div>
                        <div class="contact_category"><span>담당자</span></div> 
                        <div class="contact_db" id="name">${vo.user_name}</div>
                    </div>
                    <div>
                        <div class="contact_category"><span>이메일</span></div> 
                        <div class="contact_db" id="email">${vo.user_email}</div>
                    </div>
                    <div>
                        <div class="contact_category"><span>전화번호</span></div> 
                        <div class="contact_db" id="tel">${vo.user_tel}</div>
                    </div>
                    
                </div>
            </section>
            
            <section id="cancel" class="cancel">
                <div>
                    <h4>취소 및 환불규정</h4>
                    <div class="cancel_box">
                        <div><span>- <b>행사의 취소/환불 기간은</b> 행사 호스트가 설정한 신청기간과 동일합니다.</span></div> 
                        <div><span>- 신청한 행사의 <b>신청 정보 수정 및 취소/환불은</b> ‘마이페이지-신청 행사’에서 할 수 있습니다.</span></div> 
                        <div><span>- 결제 수단, 환불 신청 시점, 환불 사유에 따라 <b>환불 수수료가 부과</b>될 수 있습니다.</span></div> 
                        
                        <div style="color:red;"><span>*이벤터스는 통신판매 중개자이며, 해당 행사의 호스트가 아닙니다.</span></div> 
                    
                    </div>
                </div>	
            </section>			

        </div>

        <!-- 신청하기 라인 -->
        <div class="apply_line">
            <div class="apply_box">
                <div class="apply_category">
                    <a href="javascript:" onclick="location.href='sports_view.do'" id="sports"><!-- 스포츠종목 카테고리 전체보기 컨트롤러 추가 필요-->
                        <span>러닝</span><!-- ${vo.category_sports} -->
                    </a>
                    <a href="javascript:" onclick="location.href='sports_view.do'" id="loc"><!-- 지역 카테고리 전체보기 컨트롤러 추가 필요-->
                        <span>서울</span><!-- ${vo.category_loc} -->
                    </a>
                </div>
                
                <div class="apply_name">
                	<span>행사이름 ${vo.event_name}</span>
                </div>
                
                <div class="apply_ticket">
                    <span>티켓이름${vo.ticket_name}</span>
                    
                    <br><br>
                    
                    <div class="ticket_details">
	                    <div class="amount_btn">
	                        <input type="button" onclick="minus(this)" value="-">
	                        <span class="quantity">1</span>
	                        <input type="button" onclick="plus(this)" value="+">
	                    </div>
	                    <div class="remain">
							<span>잔여수량 : ${vo.ticket_remain} </span>                    
	                    </div>
	                     <div class="price">
	                    <span>티켓금액${vo.ticket_price}</span>   
	                    </div>     
	               	</div>    
                </div>
                
                <input type="button" id="apply_btn" value="신청하기" onclick="location.href='apply_form.do'"> 
            </div>
        </div>
    </div>
    
    <!--모달 팝업-->
    <div class="modal" style="display: none;">
        <div class="modal_popup">
            <h3>호스트에게 문의하세요!</h3>
            <p>행사와 관련 없거나, 부적합한 내용이 기재되어 있을 경우 관리자에 의해 삭제되거나 차단 될 수 있습니다</p>
            <textarea id="questionText" rows="4" placeholder="문의 사항이 자세할수록 더욱 정확한 답변을 받으실 수 있습니다. 답변은 이메일로 전송됩니다"></textarea>
            <button type="button" class="close_btn">닫기</button>
            <button type="button" id="submitQuestion" class="submit_btn">문의하기</button>
        </div>
    </div>
</body>
</html>
