<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이벤트 신청페이지</title>
    <link rel="stylesheet" href="/getspo/resources/css/event/event_apply.css">
    <!-- ajax -->
	<script src="/getspo/resources/js/httpRequest.js"></script>
	
	<!-- 포트원결제api -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	
	<!-- JQuery  -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
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
	        
	        /* 결제수단 버튼 유지 */
	        document.addEventListener('DOMContentLoaded', (event) => {
			    const buttons = document.querySelectorAll('.option_btn input[type="button"]');
			    const virtualAccountBtn = document.getElementById('virtualAccountBtn');
			    const accountComment = document.querySelector('.account_comment');
			    
			    buttons.forEach(button => {
			        button.addEventListener('click', () => {
			            // 모든 버튼에서 active 클래스 제거
			            buttons.forEach(btn => btn.classList.remove('active'));
			            // 클릭된 버튼에 active 클래스 추가
			            button.classList.add('active');
			            
			            // 가상계좌 버튼 클릭 시 약관 표시
			            if (button === virtualAccountBtn) {
			                accountComment.style.display = 'block';
			            } else {
			                accountComment.style.display = 'none';
			            }
			        });
			    });
			});
	       	
	        //신청할때
	        function join(f){
	        	f.method="post";
	        	f.action="order.do";
	        	f.submit();
	        }
	        
	        //결제할때
	        function mypayment() {
			    IMP.init("imp03484531");
			    IMP.request_pay({
			        pg: "html5_inicis",
			        pay_method: "card",
			        name: "${event.event_name}",
			        amount: 1, /* ${event.event_price}, */
			        buyer_email: "${user.user_email}",
			        buyer_name: "${user.user_name}",
			        buyer_tel: "${user.user_tel}",
			        buyer_addr: "${user.user_addr}${user.user_addrdetail}",
			        buyer_postcode: "${user.user_idx}"
			    }, function (response) {
			        if (response.success) {
			            console.log(response);
			
			            // AJAX를 사용하여 결제 정보를 서버로 전송
			            $.ajax({
			                type: "POST",
			                url: "payment.do",
			                data: {
			                    imp_uid: response.imp_uid,
			                    merchant_uid: response.merchant_uid,
			                    paid_amount: response.paid_amount,
			                    apply_num: response.apply_num,
			                    order_idx: "${event.event_idx}",
			                    user_idx: "${user.user_idx}"
			                },
			                success: function (data) {
			                    if (data === "success") {
			                        alert("결제가 완료되었습니다.");
			                        
			                        // 결제 성공 후 폼 데이터를 전송
			                        var form = document.createElement("form");
			                        form.method = "post";
			                        form.action = "payafter.do";
			
			                        let orderGen = document.querySelector('input[name="order_gen"]:checked').value;
			                        let orderAge = document.getElementById('age').value;
			
			                        var fields = [
			                            { name: "user_idx", value: "${user.user_idx}" },
			                            { name: "event_idx", value: "${event.event_idx}" },
			                            { name: "order_name", value: "${user.user_name}" },
			                            { name: "order_tel", value: "${user.user_tel}" },
			                            { name: "order_email", value: "${user.user_email}" },
			                            { name: "order_addr", value: "${user.user_addr}" },
			                            { name: "order_gen", value: orderGen },
			                            { name: "order_age", value: orderAge },
			                            { name: "imp_uid", value: response.imp_uid } // 추가
			                        ];
			
			                        fields.forEach(function(field) {
			                            var input = document.createElement("input");
			                            input.type = "hidden";
			                            input.name = field.name;
			                            input.value = field.value;
			                            form.appendChild(input);
			                        });
			
			                        document.body.appendChild(form);
			                        form.submit();
			                    } else {
			                        alert("결제 처리에 실패했습니다. 관리자에게 문의하세요.");
			                    }
			                },
			                error: function (xhr, status, error) {
			                    console.error(xhr.responseText);
			                    alert("결제 처리에 실패했습니다. 관리자에게 문의하세요.");
			                }
			            });
			        } else {
			            console.log(response);
			            alert("결제에 실패했습니다. 에러 내용: " + response.error_msg);
			        }
			    });
			}
	        
		</script>
		
	
		
		
</head>
<body>
    <jsp:include page="../home/navigation.jsp"></jsp:include>
    <jsp:useBean id="currentDate" class="java.util.Date"/> 
    <br>

    <form>
    	<input type="hidden" name="user_idx" value="${event.user_idx}">
    	<input type="hidden" name="event_idx" value="${event.event_idx}">
    	<input type="hidden" name="order_addr" value="${user.user_addr}">
        <div class="apply_form">
            <div class="info_line">
                <div class="event_info">
                    <div class="event_thumbnail">
                        <img src="/getspo/resources/upload/${event.event_thumbnail}" id="thumbnail" alt="Event Thumbnail">
                    </div>
                    <div class="event_name">
                        <a href="javascript:" onclick="location.href='sports_view.do'">${event.event_name}</a>
                    </div>
                    <div class="event_date">
                        ${event.getFormattedEventHStart()} ~ ${event.getFormattedEventHEnd()}
                    </div>
                    <div class="event_addr">
                        ${event.event_addr} ${event.event_addrdetail}
                    </div>
                </div>
                
                <div class="event_ticket">
                    <div class="ticket_details">
                        <div id="ticketname">
                        	${event.event_ticketname}
                        </div>
                        
                        <div class="ticket_etc">
	                        <div class="amount_btn">
	                            <input type="button" onclick="minus(this)" value="-">
	                            <span class="quantity">1</span>
	                            <input type="button" onclick="plus(this)" value="+">
	                        </div>
	                        
	                        <div id="remainSection" class="remain">
	                            <c:if test="${event.event_ticket_open eq 'open'}">
	                                <span>잔여수량 : ${remainticket}</span>
	                            </c:if>
	                        </div>
	                        
	                        <div id="event_price">
								<c:choose>
							        <c:when test="${event.event_price > 0}">
							            <fmt:formatNumber value="${event.event_price}" type="number" groupingUsed="true" />원
							        </c:when>
							        <c:otherwise>
							            <span>무료</span>
							        </c:otherwise>
							    </c:choose>
							</div>
						</div>	
                    </div>
                </div>
            
                <div class="apply_info">
                    <div class="apply_info_title">
                        <p class="title">신청자 정보</p>
                        <p class="subtitle">신청 정보는 신청내역 페이지에서 확인할 수 있습니다. &nbsp; <a href="javascript:" 
                           onclick="location.href='applyEvent_list.do?user_idx=${user.user_idx}'">신청 내역 확인하기 ></a></p>
                    </div>
                    <div class="user_name">
                        <p id="name">이름 <span>*</span></p>
                        <input type="text" id="name" name="order_name" value="${user.user_name}" required>
                    </div>
                    
                    <div class="user_email">
					    <p class="email">이메일 <span>*</span></p>
					    <input type="email" id="email" name="order_email" value="${user.user_email}" autocomplete="off" readonly>
					</div>
                    
                    <div class="user_tel">
                        <p id="tel">전화번호 <span>*</span></p>
                        <input type="tel" id="tel" name="order_tel" value="${user.user_tel}" required>
                    </div>
                     <!-- 성별 선택 체크박스 -->
				    <div class="user_gender">
				        <p id="gender">성별 <span>*</span></p>
				        <label><input type="radio" id="order_gen" name="order_gen" value="male" required> 남성</label>
				        <label><input type="radio" id="order_gen" name="order_gen" value="female" required> 여성</label>
				    </div>
				
				    <!-- 나이 선택 드롭다운 -->
				    <div class="user_age">
				        <p id="age">나이 <span>*</span></p>
				        <select id="age" name="order_age" required>
				            <option value="">선택하세요</option>
				            <!-- 14세부터 100세까지 옵션 추가 -->
				            <c:forEach var="i" begin="14" end="100">
				                <option value="${i}">${i}세</option>
				            </c:forEach>
				        </select>
				    </div>
                </div>
            </div>
            
            <div class="apply_line">
                <div class="apply_box">
                    <div id="price_text">
                        <span>금액</span>
                    </div>
                    
                    <div id="apply_price">
                        <c:choose>
					        <c:when test="${event.event_price > 0}">
					            <fmt:formatNumber value="${event.event_price}" type="number" groupingUsed="true" />원
					        </c:when>
					        <c:otherwise>
					            <span>무료</span>
					        </c:otherwise>
					    </c:choose>
                    </div>
                    
                    <div class="pay_option">
                    	<div class="pay_option_text">
                        	<span>결제방법</span>
                    	</div>
					   <div class="option_btn">
						    <c:if test="${event.event_price > 0}">
						        <input type="button" value="신용카드/간편결제" onclick="console.log('신용카드/간편결제 버튼 클릭됨')">
						        <input type="button" value="가상계좌" id="virtualAccountBtn" onclick="console.log('가상계좌 버튼 클릭됨')">
						        <div class="account_comment">
						            <div id="comment_title">*가상계좌 입금 안내</div>
						            <div id="comment_ment">
						                <span><b><fmt:formatDate value="${currentDate}" pattern="MM월 dd일" /></b> 이전에 입금을 완료해 주세요.</span>
						                <span>기한 내 입금이 확인되지 않을 경우, 신청은 <b>자동 취소</b>됩니다.</span>
						            </div>
						        </div>
						    </c:if>
						</div>
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
                            <c:if test="${event.event_price > 0}">
                                <div><input type="checkbox" id="pay_agree" name="agreement" value="pay" required> 
                                    <label for="pay_agree">(필수) 구매조건 확인 및 결제대행 약관 동의</label> 
                                    <a href="javascript:" onclick="location.href='pay_agree.do'">내용보기</a>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    
                    <div class="submit_button">
	                    <c:choose>
						    <c:when test="${event.event_price > 0}">
						        <input type="button" value="결제하기" onclick="mypayment(this.form);"/>
						    </c:when>
						    <c:otherwise>
						        <input type="button" value="신청하기" onclick="join(this.form);"/>
						    </c:otherwise>
						</c:choose>
                    </div>					
                </div>
            </div>
        </div>    
        
    	
    </form>
	
</body>
</html>