<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>행사 전체 페이지</title>
    <link rel="stylesheet" href="/getspo/resources/css/event/event_list.css">
    
    <script>
        function goToPage(pageNumber) {
            var form = document.getElementById('pagingForm');
            form.page.value = pageNumber;
            form.submit();
        }
        
        function filterEvents() {
            // 필터링 기능 구현 (필요 시 추가)
        }

        function resetFilters() {
            document.getElementById('location').value = 'all';
            document.getElementById('running').checked = false;
            document.getElementById('triathlon').checked = false;
            // 필요한 다른 체크박스 초기화
            filterEvents();
        }
        
    </script>
    
</head>
<body>
	 <jsp:include page="/WEB-INF/views/navigation.jsp"></jsp:include><br>

    <div class="container">
    	<!-- 필터 섹션 추가 -->
        <div class="filterSection" id="filterSection">
            <h2>이벤트 선택 옵션 <button class="reset-button" onclick="resetFilters()">옵션 초기화</button></h2>
            <div class="filter-box">
                <!-- 지역 선택 -->
                <div class="filter-item">
                    <label for="location">지역</label>
                    <select id="location" name="location" class="location">
                        <option value="all">전체</option>
					    <option value="seoul_gyeonggi_incheon">서울/경기/인천</option>
					    <option value="busan_ulsan_gyeongnam">부산/울산/경남</option>
					    <option value="daegu_gyeongbuk">대구/경북</option>
					    <option value="chungcheong_daejeon_sejong">충청/대전/세종</option>
					    <option value="jeolla_gwangju">전라/광주</option>
					    <option value="gangwon">강원</option>
					    <option value="jeju">제주</option>
                        <!-- 필요한 다른 지역 추가 -->
                    </select>
                </div>
                <!-- 종목 선택 체크박스 -->
                <div class="filter-item">
				    <label>종목</label>
				    <div class="checkbox-group">
				        <div>
				            <input type="checkbox" id="running" name="sport" value="running" onclick="filterEvents()">
				            <label for="running">러닝</label>
				        </div>
				        <div>
				            <input type="checkbox" id="triathlon" name="sport" value="triathlon" onclick="filterEvents()">
				            <label for="triathlon">철인3종</label>
				        </div>
				        <!-- 필요한 다른 종목 추가 -->
				    </div>
				</div>
            </div>
        </div>
        
        <!-- -------  -->
        
        <div class="eventSection" id="eventSection">
            <div class="search-box">
                <h1 class="total-box">
                    <span class="total-event">${totalEvent}</span> <span>개의 행사가 검색되었습니다</span>
                </h1>
            </div>
            <div class="item-box" id="item-box">
                <!-- JSTL forEach를 사용하여 이벤트 목록 출력 -->
                <c:forEach var="event" items="${events}">
                    <div class="content">
                        <div class="items-1">
                            <a class="title-link" href="${event.link}">
                                <img class="img-link" src="${event.imgSrc}" alt="${event.alt}">
                            </a>
                        </div>
                        <div class="items-2">
                            <div class="dayloc-box">
                                <div>
                                    <span class="openday">${event.openDay}</span>
                                </div>
                                <div>
                                    <span>${event.location}</span>
                                </div>
                            </div>
                            <div class="title-box">
                                <a class="title-link" href="${event.link}">${event.title}</a>
                            </div>
                            <div class="info-box">
                                <div class="pay-box">
                                    <span>${event.price}</span>
                                </div>
                                <div class="check-box">
                                    <span class="check-count"> 조회 ${event.viewCount}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- 페이징 -->
            <div align="center">${pageMenu}</div>
        </div>
    </div>
    <form id="pagingForm" method="get" action="/getspo/event_list.do">
        <input type="hidden" name="page" value="${nowPage}">
    </form>
</body>
</html>










