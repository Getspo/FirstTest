<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>이벤트 개설하기</title>
      
      <!-- css -->
      <link rel="stylesheet" href="/getspo/resources/css/new_event.css">
      
      <!-- 폰트 설정 -->
      <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
      
      <!-- 주소 찾기 -->
      <script   src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
      <script src="/getspo/resources/js/addr.js"></script>
      
      <!-- 에디터 -->
      <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      
        <!-- include summernote css/js -->
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
      
      <!-- Cropper.js -->
       <link href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.css" rel="stylesheet">
       <script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>
      
   </head>
   
   <body>

    <form class="new_event_form">
            <div class="form-group">
                <h2>구상 중인 행사를 개설해보세요! </h2>
            </div>

            <div class="form-group" id="event_category_group">
                <h5>카테고리</h5>
                <select id="category_sport" name="category_sport">
                    <option selected disabled>종목 선택</option>
                    <option value="running">러닝</option>
                    <option value="triathlon">철인3종</option>
                    <option value="etc">기타</option>
                </select>
                
                <select id="category_loc" name="category_loc">
                    <option selected disabled>지역 선택</option>
                    <option value="seoul">서울</option>
                    <option value="gyunggi">경기</option>
                    <option value="incheon">인천</option>
                    <option value="daejeon">대전</option>
                    <option value="daegu">대구</option>
                    <option value="busan">부산</option>
                    <option value="ulsan">울산</option>
                    <option value="gwangju">광주</option>
                    <option value="gangwon">강원</option>
                    <option value="chungbuk">충북</option>
                    <option value="chungnam">충남</option>
                    <option value="gyungbuk">경북</option>
                    <option value="gyungnam">경남</option>
                    <option value="jeonbuk">전북</option>
                    <option value="jeonnam">전남</option>
                    <option value="sejong">세종</option>
                    <option value="jeju">제주</option>
                </select>
            </div>

            <div class="form-group" id="event_name_group">
                <h5>행사명</h5>
                <input id="event_name" name="event_name" type="text" required>
            </div>

            <div class="form-group" id="event_date_group">
                <h5>행사 기간</h5>
                <div>
                    <p class="start_date">시작 날짜</p>
                    <input type="date" id="start_date" name="start_date">
                    <input type="time" id="start_time" name="start_time">
                </div>
                <div>
                    <p class="end_date">종료 날짜 </p> 
                    <input type="date" id="end_date" name="end_date">
                    <input type="time" id="end_time" name="end_time">
                </div>
                <p id="comment">* 종료날짜는 시작날짜 보다 뒤로 설정해주세요!</p>
             </div>    
             
             <div class="form-group" id="apply_date_group">
                <h5>모집 기간</h5>
                <div>
                    <p class="start_date">시작 날짜</p>
                    <input type="date" id="apply_start_date" name="apply_start_date">
                    <input type="time" id="apply_start_time" name="apply_start_time">
                </div>
                <div>
                    <p class="end_date">종료 날짜 </p> 
                    <input type="date" id="apply_end_date" name="apply_end_date">
                    <input type="time" id="apply_end_time" name="apply_end_time">
                </div>
                <p id="comment">* 종료날짜는 시작날짜 보다 뒤로 설정해주세요!</p>
            </div>
            
         <div class="form-group" id="event_addr_group">
                <h5>행사 장소
                    <input type="button" class="addr_btn" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
                </h5>
                <input type="text" id="addrcode" name="addrcode" placeholder="우편번호">
                <input type="text" id="addr" name="addr" placeholder="주소">
                <input type="text" id="addrdetail" name="addrdetail" placeholder="상세주소">
            </div>
               
           <div class="form-group" id="event_content_group">
              <h5>행사 대표 이미지
              <input type="button" id="reset_button" style="display: none;" onclick="resetThumbnail()" value="재설정">
            </h5>
              <!-- 삭제버튼 보류
              <button type="button" id="delete_button" style="display: none;" onclick="deleteThumbnail()">삭제</button> 
              -->
              <div id="thumbnail_preview">
                  <!-- 이미지가 추가될 자리 -->
                  <img id="image">
              </div>
              <div class="thumbnail_group">
                  <label for="thumbnail_image" id="thumbnail_label" style="cursor: pointer;">
                썸네일 이미지 추가
                <input type="file" id="thumbnail_image" name="thumbnail_image" style="display: none;" onchange="handleFileChange(event)">
            </label>
                  <div id="image_size">960*540px</div>
              </div>
              <br>
              <h5>행사 정보</h5>
              <div id="summernote"><p></p></div>
          </div>

          <!-- Cropper Modal -->
         <div class="modal fade" id="cropperModal" tabindex="-1" role="dialog" aria-labelledby="cropperModalLabel" aria-hidden="true">
             <div class="modal-dialog modal-lg" role="document">
                 <div class="modal-content">
                     <div class="modal-header">
                         <h5 class="modal-title" id="cropperModalLabel">이미지 크롭</h5>
                         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                             <span aria-hidden="true">&times;</span>
                         </button>
                     </div>
                     <div class="modal-body">
                         <div>
                             <img id="cropperImage" src="#" alt="크롭할 이미지">
                         </div>
                     </div>
                     <div class="modal-footer">
                         <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                         <button type="button" class="btn btn-primary" id="crop_button">이미지 크롭 완료</button>
                     </div>
                 </div>
             </div>
         </div>
         
            <div class="form-group" id="entry_group">
            <h5>참가자 정보 수집
               <input type="button" class="add-item-btn" onclick="addNewItem()" value="새 항목 추가">
               </h5>
                   <span>
                      <input id="entry_name" name="entry" type="checkbox" value="이름" checked disabled>
                      <label for="entry_name">이름 *</label>
                  </span>
                  <span>
                      <input id="entry_email" name="entry" type="checkbox" value="이메일" checked disabled>
                      <label for="entry_email">이메일 *</label>
                  </span>
                  <span>
                      <input id="entry_tel" name="entry" type="checkbox" value="휴대전화번호" checked disabled>
                      <label for="entry_tel">휴대전화번호 *</label>
                  </span>
                  <span>
                      <input id="entry_gender" name="entry" type="checkbox" value="성별" >
                      <label for="entry_gender">성별</label>
                  </span>
                  <span>
                      <input id="entry_age" name="entry" type="checkbox" value="나이">
                      <label for="entry_age">나이</label>
                  </span>
            </div>    
            
         <div class="form-group" id="event_pay_group">
            <h5>결제방식</h5>
            <div class="radio-group">
               <input type="radio" id="free" name="pay" value="free" required>
               <label for="free">무료</label>
               <input type="radio" id="paid" name="pay" value="paid" required>
               <label for="paid">유료</label>
            </div>
            
         <div class="paid_choice" id="paid_choice">
               <select id="bank" name="bank">
                <option value="" disabled selected>은행 선택</option>
                <option value="kookmin">국민은행</option>
                <option value="shinhan">신한은행</option>
                <option value="nonghyup">농협중앙회</option>
                <option value="sinhyup">신협중앙회</option>
                <option value="hana">KEB하나은행</option>
                <option value="kakao">카카오뱅크</option>
            </select>
                    <input id="account" name="account" type="text" placeholder="입금받을 계좌번호" required>
                    <input id="account_name" name="account_name" type="text" placeholder="예금주 성명" required>
                </div>
            </div>
            
            <div class="form-group" id="ticket_group">
            <h5>티켓</h5>
               <input id="ticket_name" name="ticket" type="text" placeholder="티켓명" required>
               <input id="member_limit" name="ticket"  type="number" min="1" step="1" placeholder="모집정원" required>
               <input id="ticket_amount" name="ticket" type="number" min="0" max="1000000"step="1000" placeholder="티켓금액" required>
               
             <div class="radio-group">
             <p>잔여수량</p>   
                 <input type="radio" id="remain_open" name="ticket_remain" value="open" required>
                 <label for="remain_open">공개</label>
                 <input type="radio" id="remain_close" name="ticket_remain" value="close" required>
                 <label for="remain_close">비공개</label>
             </div>
            </div>   
             
             <div class="form-group" id="contact_group">
                <h5>담당자 정보</h5>
                <p>담당자 이름</p>
                <input id="contact_name" name="contact" type="text" required>
                <p>이메일 주소</p>
                <input id="contact_email" name="contact" type="text" required>
                <p>전화번호</p>
                <input id="contact_tel" name="contact" type="text" required>
            </div>
             
          </div>
            
        <input type="button" class="event_btn" onclick="send(this.form)" value="행사 등록하기"> 
    </form>
       
    
    
      <script>
            /* 상세정보 입력창 관련 함수 */
          $(document).ready(function() {
              $('#summernote').summernote({
                 height:300
              });
          });
      
            /* 결제방식에 따른 티켓 금액 입력창 활성화/비활성화 함수 */
               document.addEventListener('DOMContentLoaded', function() {
                   const freeRadio = document.getElementById('free');
                   const paidRadio = document.getElementById('paid');
                   const paidChoice = document.getElementById('paid_choice');
                   const ticketAmount = document.getElementById('ticket_amount');
   
                   freeRadio.addEventListener('change', function() {
                       if (freeRadio.checked) {
                           paidChoice.style.display = 'none';
                           paidChoice.querySelectorAll('input, select').forEach(input => {
                               input.value = '';
                               input.required = false;
                           });
                           ticketAmount.disabled = true;
                           ticketAmount.value = '';
                           
                           ticketAmount.classList.add('disabled-input');
                       }
                   });
   
                   paidRadio.addEventListener('change', function() {
                       if (paidRadio.checked) {
                           paidChoice.style.display = 'block';
                           paidChoice.querySelectorAll('input, select').forEach(input => {
                               input.required = true;
                           });
                           ticketAmount.disabled = false;
                           
                           ticketAmount.classList.remove('disabled-input');
                       }
                   });
               });
            
            /* 참가자 정보 모집 새 항목 추가 함수 */
               function addNewItem() {
                   const entryGroup = document.getElementById('entry_group');

                   // 새로운 체크박스 항목 생성
                   const newSpan = document.createElement('span');
                   const newCheckbox = document.createElement('input');
                   newCheckbox.type = 'checkbox';
                   newCheckbox.name = 'entry';
                   newCheckbox.value = '';
                   newCheckbox.id = 'entry_new_' + document.querySelectorAll('#entry_group input[type="checkbox"]').length;

                   const newInput = document.createElement('input');
                   newInput.type = 'text';
                   newInput.placeholder = '새 항목 입력';
                   newInput.oninput = function() {
                       newCheckbox.value = newInput.value;
                   };

                   const deleteButton = document.createElement('button');
                   deleteButton.type = 'button';
                   deleteButton.textContent = '삭제';
                   deleteButton.onclick = function() {
                       entryGroup.removeChild(newSpan);
                   };

                   newSpan.appendChild(newCheckbox);
                   newSpan.appendChild(newInput);
                   newSpan.appendChild(deleteButton);

                   // 새로운 항목 추가
                   entryGroup.appendChild(newSpan);
               }
            
               /* 이미지 파일 프리뷰 */
               var cropper;

               $('#cropperModal').on('shown.bs.modal', function(e) {
                   cropper = new Cropper(document.getElementById('cropperImage'), {
                       aspectRatio: 16 / 9,
                       viewMode: 2
                   });
               });

               $('#cropperModal').on('hidden.bs.modal', function(e) {
                   if (cropper) {
                       cropper.destroy();
                       cropper = null;
                   }
               });

               function handleFileChange(event) {
                   var file = event.target.files[0];
                   var reader = new FileReader();

                   reader.onload = function(e) {
                       document.getElementById('cropperImage').src = e.target.result;
                       $('#cropperModal').modal('show');
                   };

                   reader.readAsDataURL(file);
               }

               document.getElementById('crop_button').addEventListener('click', function() {
                   if (cropper) {
                       var canvas = cropper.getCroppedCanvas({
                           width: 960,
                           height: 540,
                       });

                       var smallCanvas = document.createElement('canvas');
                       var smallContext = smallCanvas.getContext('2d');
                       smallCanvas.width = 200;
                       smallCanvas.height = 113;
                       smallContext.drawImage(canvas, 0, 0, 200, 113);

                       var croppedImage = document.createElement('img');
                       croppedImage.src = smallCanvas.toDataURL();

                       var previewDiv = document.getElementById('thumbnail_preview');
                       previewDiv.innerHTML = '';
                       croppedImage.style.maxWidth = '100%';
                       previewDiv.appendChild(croppedImage);

                       $('#cropperModal').modal('hide');
                       previewDiv.style.display = 'block';
                       document.querySelector('.thumbnail_group').style.display = 'none';
                       document.getElementById('reset_button').style.display = 'block';
                       document.getElementById('delete_button').style.display = 'block';
                   }
               });

               function resetThumbnail() {
                   var thumbnailImageInput = document.getElementById('thumbnail_image');
                   thumbnailImageInput.value = ''; // 초기화하여 다시 선택할 수 있도록 함
                   thumbnailImageInput.click(); // 파일 선택 다이얼로그 표시

                   thumbnailImageInput.onchange = function(event) {
                       handleFileChange(event);
                       thumbnailImageInput.onchange = handleFileChange; // 변경 이벤트 핸들러 복원
                   };
               }
            
               /* 삭제 버튼 보류
                  function deleteThumbnail() {
                   var thumbnailImageInput = document.getElementById('thumbnail_image');
                   thumbnailImageInput.value = ''; // 파일 입력 초기화
                   document.getElementById('cropperImage').src = ''; // 크롭 이미지 초기화
                   document.getElementById('image').src = ''; // 프리뷰 이미지 초기화
                   document.getElementById('thumbnail_preview').innerHTML = ''; // 썸네일 미리보기 초기화
                   document.getElementById('thumbnail_label').style.display = 'block'; // 썸네일 추가 버튼 다시 보이기
                   document.getElementById('reset_button').style.display = 'none'; // 재설정 버튼 숨기기
                   document.getElementById('delete_button').style.display = 'none'; // 삭제 버튼 숨기기
                   document.getElementById('thumbnail_preview').style.display = 'none'; // 썸네일 미리보기 숨기기
                   document.querySelector('.thumbnail_group').style.display = 'block'; // 썸네일 그룹 보이기
               } */
    </script>
       
   </body>
</html>