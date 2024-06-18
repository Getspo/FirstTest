<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- sport,loc 파트 css -->
		<link rel="stylesheet" href="/getspo/resources/css/sport.css">
		<link rel="stylesheet" href="/getspo/resources/css/recommend.css">
		<link rel="stylesheet" href="/getspo/resources/css/loc.css">
	   
		<!-- sport 파트 폰트 설정 -->
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
		rel="stylesheet">
		
		<!-- slick관련 참조-->
			<!-- jQuery -->
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<!-- Slick CSS -->
			<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
			<!-- Slick JS -->
			<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<!-- 개최행사관련 -->
		<style>
			.marketing_title{font-size:20px; font-weight:bold;}
			.marketing_subTitle{color:grey; font-size:15px;}
			.thumbnail {width:279px;
						height:150px;}
			.gutter{width:30px;}
			.event_date{color:grey;	font-size:15px;}
			.event_name{font-size:20px; font-weight:bold;}
			.price{color:#0099bc; font-size:15px; font-weight:bold; float: left;}
			.view{color:grey; font-size:10px; float: right; }
		</style>
		
		<script>
			$(document).ready(function(){
				$('.slider-div').slick({
					infinite: false, /* 무제한전환 */
					slidesToShow: 10,	/* 보여지는개수 */
					slidesToScroll: 1,	/* 이동개수 */
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
		<jsp:include page="navigation.jsp"></jsp:include><br>
		
		<!-- 종목 메뉴 -->
		<div class="sport">
            <h4>종목별 스포츠 행사</h4>
            <h6>참가하고 싶은 종목의 행사들을 한번에 볼 수 있어요!</h6>
			
            <a href="javascript:" onclick="sport_running(this.form);">
               <img src="/getspo/resources/img/sport_img/러닝 픽토그램.png">
            </a> 
            
            <a href="javascript:" onclick="sport_triathlon(this.form);">
               <img src="/getspo/resources/img/sport_img/철인3종 픽토그램.png">
            </a> 
            
            <a href="javascript:" onclick="sport_etc(this.form);"> 
               <img src="/getspo/resources/img/sport_img/기타 픽토그램.png">
            </a>
		</div>
		
		<!-- 지역 slick메뉴  -->
		<div class="slider-container">
			<h4>지역별 스포츠 행사</h4>
			<h6>원하는 지역의 행사들을 한번에 볼 수 있어요!</h6>
			<div class="slider-div">
					<div id="zone1" class="slick-slide">
						<a href="javascript:" class="seoul" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/seoul.png" alt="">
							<span>서울</span>
						</a>
					</div>
					<div id="zone2" class="slick-slide">
						<a href="javascript:" class="gyunggi" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/gyungi.png" alt="">
							<span>경기</span>
						</a>
					</div>
					<div id="zone3" class="slick-slide">
						<a href="javascript:" class="incheon" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/incheon.png" alt="">
							<span>인천</span>
						</a>
					</div>
					<div id="zone4" class="slick-slide">
						<a href="javascript:" class="daejeon" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/daejeon.png" alt="">
							<span>대전</span>
						</a>
					</div>
					<div id="zone5" class="slick-slide">
						<a href="javascript:" class="daegu" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/daegu.png" alt="">
							<span>대구</span>
						</a>
					</div>
					<div id="zone6" class="slick-slide">
						<a href="javascript:" class="busan" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/busan.png" alt="">
							<span>부산</span>
						</a>
					</div>
					<div id="zone7" class="slick-slide">
						<a href="javascript:" class="ulsan" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/ulsan.png" alt="">
							<span>울산</span>
						</a>
					</div>
					<div id="zone8" class="slick-slide">
						<a href="javascript:" class="gwangju" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/gwangju.png" alt="">
							<span>광주</span>	
						</a>
					</div>
					<div id="zone9" class="slick-slide">
						<a href="javascript:" class="gangwon" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/gangwon.png" alt="">
							<span>강원</span>
						</a>
					</div>
					<div id="zone10" class="slick-slide">
						<a href="javascript:" class="chungbuk" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/chungbuk.png" alt="">
							<span>충북</span>
						</a>
					</div>
					<div id="zone11" class="slick-slide">
						<a href="javascript:" class="chungnam" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/chungnam.png" alt="">
							<span>충남</span>
						</a>
					</div>
					<div id="zone12" class="slick-slide">
						<a href="javascript:" class="gyungbuk" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/gyungbuk.png" alt="">
							<span>경북</span>
						</a>
					</div>
					<div id="zone13" class="slick-slide">
						<a href="javascript:" class="gyungnam" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/gyungnam.png" alt="">
							<span>경남</span>
						</a>
					</div>
					<div id="zone14" class="slick-slide">
						<a href="javascript:" class="jeonbuk" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/jeonbuk.png" alt="">
							<span>전북</span>
						</a>
					</div>
					<div id="zone15" class="slick-slide">
						<a href="javascript:" class="jeonnam" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/jeonnam.png" alt="">
							<span>전남</span>
						</a>
					</div>
					<div id="zone16" class="slick-slide">
						<a href="javascript:" class="sejong" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/sejong.png" alt="">
							<span>세종</span>
						</a>
					</div>
					<div id="zone17" class="slick-slide">
						<a href="javascript:" class="jeju" onclick="areaClickEvent(this);"	title="">
							<img src="/getspo/resources/img/loc_img/jeju.png" alt="">
							<span>제주</span>
						</a>
					</div>
			</div>
		</div>
		
		<!-- 개최된 행사 -->
		<div class="recommend">
			<h4><a class="marketing_title">Upcoming Event</a></h4>
            <h6><a class="marketing_subTitle">다가오는 스포츠 이벤트를 만나보세요!</a></h6>
            
		
		<table align="center" width="1200px;">
			<tr>
				<td colspan="7" align="left">
					<br>
					
				</td>
			</tr>
		<!-- 대회썸네일 -->
			<tr>
				<td>
					<img class="thumbnail" src="/getspo/resources/img/thumbnail/thumbnail1.jpg"><br>
					<a class="event_date">2024년 8월 17일 / 경기 하남</a><br>
					<a class="event_name">썸머나이트런</a><br>
					<a class="price">10,000</a>
					<a class="view">조회수 100</a>
				</td>
				
				<td class="gutter"></td>
				
				<td>
					<img class="thumbnail" src="/getspo/resources/img/thumbnail/thumbnail1.jpg"><br>
					<a class="event_date">2024년 8월 17일 / 경기 하남</a><br>
					<a class="event_name">썸머나이트런</a><br>
					<a class="price">10,000</a>
					<a class="view">조회수 100</a>
				</td>
			
				<td class="gutter"></td>
				 
				<td>
					<img class="thumbnail" src="/getspo/resources/img/thumbnail/thumbnail1.jpg"><br>
					<a class="event_date">2024년 8월 17일 / 경기 하남</a><br>
					<a class="event_name">썸머나이트런</a><br>
					<a class="price">10,000</a>
					<a class="view">조회수 100</a>
				</td>
				
				<td class="gutter"></td>
				
				<td>
					<img class="thumbnail" src="/getspo/resources/img/thumbnail/thumbnail1.jpg"><br>
					<a class="event_date">2024년 8월 17일 / 경기 하남</a><br>
					<a class="event_name">썸머나이트런</a><br>
					<a class="price">무료</a>
					<a class="view">조회수 100</a>
				</td>  
			</tr>
			
		</table>
		</div>
	</body>
</html>