<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>이벤트 신청페이지</title>
		
		 <link rel="stylesheet" href="/getspo/resources/css/event/event_apply.css">
		
		<script>
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
	        
	        /* 전체 동의하기 체크박스 클릭 시 모든 체크박스를 체크하거나 체크 해제 */
	        function toggleAllCheckboxes(checkbox) {
	            var checkboxes = document.querySelectorAll('.sub_agree input[type="checkbox"]');
	            checkboxes.forEach(function(cb) {
	                cb.checked = checkbox.checked;
	            });
	        }
		</script>
	</head>
	
	<body>
		<jsp:include page="../home/navigation.jsp"></jsp:include>
		<br>
		
		<form>
		<div class="apply_form">
			<div class="info_line">
				<div class="event_info">
					<div class="event_thumnail">
						<img src="${event.event_thumbnail}" id="thumnail">
					</div>
					<div class="event_name">
						<!-- a태그 누르면 해당 행사의 상세보기 파일로 이동되어야 함 -->
						<a href="javascript:" onclick="location.href='sports_view.do'">행사이름${event.event_name}</a>
					</div>
					<div class="event_date">
						행사기간${event.event_h_start } ~ ${event.event_h_end}
					</div>
					<div class="event_addr">
						행사주소${event.eventaddr} ${event.event_addrdetail}
					</div>
				</div>
				
				<div class="event_ticket">
                    <div class="ticket_details">
                    	<div>티켓이름 ${event.event_ticketname}</div>
	                    <div>
	                    <div class="amount_btn">
	                        <input type="button" onclick="minus(this)" value="-">
	                        <span class="quantity">1</span>
	                        <input type="button" onclick="plus(this)" value="+">
		                    <div id="remainSection" class="remain">
			           </div>       
			           <div class="amount">
			                    <c:if test="${event.event_ticket_open eq 'open'}">
									<span>잔여수량 : ${remainticket}</span>
								</c:if>                    
		                    </div>
	                   </div>
					   <div id="event_price">티켓금액${event.event_price}</div>
	                </div>
	                </div>
				</div>
			
	            <div class="apply_info">
	            	<div class="apply_info_title">
		            	<p class="title">신청자 정보</p>
		            	<p class="subtitle">신청 정보는 신청내역 페이지에서 확인할 수 있습니다. &nbsp; <a href="javascript:" onclick="location.href='applyEvent_list.do'">신청 내역 확인하기 ></a></p>
	                </div>
	                <div class="user_name">
	                    <p id="name">이름 <span>*</span></p>
	                    <input type="text" id="name" name="name" value="${vo.user_name}" required>
	                </div>
	                
	                <div class="user_email">
	                    <p id="email">이메일 <span>*</span></p>
	                    <input type="email" id="email" name="email" value="${vo.user_email}" autocomplete="off" required>
	                </div>
	                
	                <div class="user_tel">
	                    <p id="tel">전화번호 <span>*</span></p>
	                    <input type="tel" id="tel" name="tel" value="${vo.user_tel}" required>
	                </div>
	            </div>
            </div>
            
            <div class="apply_line">
            	<div class="apply_box">
	            	 <div id="price_text">
	                	<span>금액</span>
	                </div>
	                
	                <div id="apply_price">
	                	<span>무료${event.event_price}</span>
	                </div>
	                
	                <div class="agree_box">
		                <div class="allagree">
						    <div>
						        <input type="checkbox" id="allagree" name="allagree" onclick="toggleAllCheckboxes(this)">
						        <label for="allagree">전체 동의하기</label>
						    </div>
						</div>  
						
						<div class="line"></div>
						
						<div class="sub_agree">
						    <div><input type="checkbox" id="age_agree" name="agreement" value="age" required> 
						    	 <label for="age_agree">(필수) 만 14세 이상입니다.</label>
						    </div>
						    <div><input type="checkbox" id="privacy_agree" name="agreement" value="privacy" required> 
						    	 <label for="privacy_agree">(필수) 개인정보 수집 이용 동의서</label> 
						    	 <a href="javascript:" onclick="location.href='privacy_agree.do'">내용보기</a>
						    </div>	 
						    <div><input type="checkbox" id="terms_agree" name="agreement" value="terms" required> 
						    	 <label for="terms_agree">(필수) 서비스 이용 약관 동의</label> 
						    	 <a href="javascript:" onclick="location.href='terms_agree.do'">내용보기</a>
						    </div>	 
						    <div><input type="checkbox" id="thirdparty_agree" name="agreement" value="thirdparty" required> 
						    	 <label for="thirdparty_agree">(필수) 제 3자 제공 동의서</label> 
						    	 <a href="javascript:" onclick="location.href='thirdparty_agree.do'">내용보기</a>
						    </div>
						    
						    <c:if test="${event.event_price != 0 && event.event_price != '무료'}">
						    <div><input type="checkbox" id="pay_agree" name="agreement" value="pay" required> 
						    	 <label for="pay_agree">(필수) 구매조건 확인 및 결제대행 약관 동의</label> 
						    	 <a href="javascript:" onclick="location.href='pay_agree.do'">내용보기</a>
						    </div>	 	
						    </c:if> 
						</div>
	                </div>
	                
	                <div class="submit_button">
	                    <button type="submit">신청하기</button>
	                </div>
                </div>
            </div>
        </div>    
        </form>
	</body>
</html>