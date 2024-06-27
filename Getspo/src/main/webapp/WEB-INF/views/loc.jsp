<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head> 
      <meta charset="UTF-8">
      <title>지역 메뉴</title>
      
      <link rel="stylesheet" href="/getspo/resources/css/loc.css">
      
      <!-- slick관련 참조-->
         <!-- jQuery -->
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <!-- Slick CSS -->
         <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
         <!-- Slick JS -->
         <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
      
      <!-- slick 함수 -->
      <script>
         $(document).ready(function(){
            $('.slider-div').slick({
               infinite: false, /* 무제한전환 */
               slidesToShow: 10,   /* 보여지는개수 */
               slidesToScroll: 1,   /* 이동개수 */
               arrows: true, /* 화살표 보여주기 */
               prevArrow: "<button type='button' class='slick-prev'>&lt;</button>",
               nextArrow: "<button type='button' class='slick-next'>&gt;</button>",
               dots: false, /* 밑에점보여주는거 */
               responsive: [ /* 반응형동작 */
                  {
                     breakpoint: 960,
                     settings: {
                        slidesToShow: 8
                     }
                  },
                  {
                     breakpoint: 768,
                     settings: {
                        slidesToShow: 5
                     }
                  }
               ]
            });
         });
      </script>
   </head>
   
   <body>
      <div class="slider-container">
         <h4 class="menu_title">지역별 스포츠 행사</h4>
            <h6 class="menu_subtitle">원하는 지역의 행사들을 한번에 볼 수 있어요!</h6>
         <div class="slider-div">
               <div id="zone1" class="slick-slide">
                  <a href="javascript:" class="seoul" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/seoul.png" alt="">
                     <span>서울</span>
                  </a>
               </div>
               <div id="zone2" class="slick-slide">
                  <a href="javascript:" class="gyunggi" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/gyungi.png" alt="">
                     <span>경기</span>
                  </a>
               </div>
               <div id="zone3" class="slick-slide">
                  <a href="javascript:" class="incheon" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/incheon.png" alt="">
                     <span>인천</span>
                  </a>
               </div>
               <div id="zone4" class="slick-slide">
                  <a href="javascript:" class="daejeon" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/daejeon.png" alt="">
                     <span>대전</span>
                  </a>
               </div>
               <div id="zone5" class="slick-slide">
                  <a href="javascript:" class="daegu" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/daegu.png" alt="">
                     <span>대구</span>
                  </a>
               </div>
               <div id="zone6" class="slick-slide">
                  <a href="javascript:" class="busan" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/busan.png" alt="">
                     <span>부산</span>
                  </a>
               </div>
               <div id="zone7" class="slick-slide">
                  <a href="javascript:" class="ulsan" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/ulsan.png" alt="">
                     <span>울산</span>
                  </a>
               </div>
               <div id="zone8" class="slick-slide">
                  <a href="javascript:" class="gwangju" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/gwangju.png" alt="">
                     <span>광주</span>   
                  </a>
               </div>
               <div id="zone9" class="slick-slide">
                  <a href="javascript:" class="gangwon" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/gangwon.png" alt="">
                     <span>강원</span>
                  </a>
               </div>
               <div id="zone10" class="slick-slide">
                  <a href="javascript:" class="chungbuk" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/chungbuk.png" alt="">
                     <span>충북</span>
                  </a>
               </div>
               <div id="zone11" class="slick-slide">
                  <a href="javascript:" class="chungnam" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/chungnam.png" alt="">
                     <span>충남</span>
                  </a>
               </div>
               <div id="zone12" class="slick-slide">
                  <a href="javascript:" class="gyungbuk" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/gyungbuk.png" alt="">
                     <span>경북</span>
                  </a>
               </div>
               <div id="zone13" class="slick-slide">
                  <a href="javascript:" class="gyungnam" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/gyungnam.png" alt="">
                     <span>경남</span>
                  </a>
               </div>
               <div id="zone14" class="slick-slide">
                  <a href="javascript:" class="jeonbuk" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/jeonbuk.png" alt="">
                     <span>전북</span>
                  </a>
               </div>
               <div id="zone15" class="slick-slide">
                  <a href="javascript:" class="jeonnam" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/jeonnam.png" alt="">
                     <span>전남</span>
                  </a>
               </div>
               <div id="zone16" class="slick-slide">
                  <a href="javascript:" class="sejong" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/sejong.png" alt="">
                     <span>세종</span>
                  </a>
               </div>
               <div id="zone17" class="slick-slide">
                  <a href="javascript:" class="jeju" onclick="areaClickEvent(this);"   title="">
                     <img src="/getspo/resources/img/loc_img/jeju.png" alt="">
                     <span>제주</span>
                  </a>
               </div>
         </div>
      </div>
   </body>
</html>