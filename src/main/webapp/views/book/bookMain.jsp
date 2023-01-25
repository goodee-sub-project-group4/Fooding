<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 지도 API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	694ae779a7a7935c84a1e22edd5c5d87"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
    <!-- 달력 API -->
    <link href='resources/fullcalendar/main.css' rel='stylesheet'/>
    <script src='resources/fullcalendar/main.js'></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth',
                height: '500px',
                headerToobar: {
                    left: 'prev,next today',
                    center: 'title'
                },
                locale: 'ko',
                eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                    console.log(obj);
                },
                eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
                    console.log(obj);
                },
                eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
                    console.log(obj);
                },
            });
            calendar.render();
        });
    </script>
    <style>
        /* 컨텐트 전체 영역 */
        /* .content div{border: 1px solid black;} */
        #content1, #content2, #content3{box-sizing: border-box; height: 100%;}
        #content1-padding, #content2-padding, #content3-padding{float: left; margin: auto; padding: 5px; box-sizing: border-box;}

        /* 컨텐트 가운데 영역 */
        #content2-padding{width: 50%; height: 100%;}
        /* 컨텐트 가운데 전체 높이 */
        #content2{height: 2450px;}
        #content2-1{height: 1050px;}
        #content2-1 div{box-sizing: border-box;}
        
        /* 업체 사진 */
        #thumbnail{height: 350px;}
        /* 업체 정보 */
        #content-main{width: 100%; padding: 5px; height: 700px; float: left;}
        /* 업체명 (조회/리뷰/별점) */
        #main1{width: 100%; height: 100px;}
        /* 업체세부정보 + 메뉴 */
        #main2{width: 100%; height: 600px;}
        #main2 div{float: left;}
        #main2-1, #main2-3{width: 25%;}
        #main2-2, #main2-4{width: 75%;}
        #main2-1, #main2-2{height: 200px;}
        #main2-3, #main2-4{height: 400px;}
        #main2-4{overflow: auto;}
        /* 메뉴 */
        .menu{width: 50%; padding: 3px; text-align: center;}
        .menu img{width: 180px; height: 100px;}

        /* 리뷰 */
        #content2-2{margin-top: 50px; height: 1270px; overflow: auto}
        #content2-2 div{box-sizing: border-box;}
        #review-head{height: 50px;}
        .review-content{width: 100%;}
        .review-content div{float: left;}
        .review-content1-1{width: 20%; height: 50px;}
        /* 리뷰 제목 */
        .review-content1-2{width: 80%; height: 50px;}
        /* 리뷰 작성자 */
        .review-content2-1{width: 20%; height: 355px;}
        .review-content2-2{width: 80%; height: 355px;}
        /* 리뷰 내용 */
        .review-text{width: 100%; height: 200px;}
        /* 리뷰 사진 */
        .review-picture{width: 100%; height: 150px; padding: 10px; text-align: center;}
        .review-picture img{width: 30%; height: 120px;}
        /* 리뷰 페이징 */
        .paging{height: 50px; text-align: center; padding-top: 20px;}

        /* 컨텐트 오른쪽 영역 */
        #content3-padding{width: 30%; height: 465px;}
        /* 지도 */
        #map{height: 350px; box-sizing: border-box;}
        /* 예약 펼치기 버튼 */
        #content3-2{height: 100px; box-sizing: border-box;}
        #book-btn{width: 100%; height: 100%; border: none; font-size: 3em; box-sizing: border-box;}
        #content3-3{display: none;}

        /* 예약 내용 */
        #content3-3{width: 100%; height: 1500px;}
        /* 예약 업체명 */
        #book-title{height: 70px; line-height: 70px; text-align: center;}
        /* 예약 날짜 */
        #book-menu1, #book-menu2, #book-menu3, #book-menu4{height: 70px; text-align: center; line-height: 70px;}
        /* 슬라이드 */
        .slide-detail{width: 100%; height: 550px; margin-top:5px; padding: 5px; box-sizing: border-box; overflow: auto;
            /* display: none; */
        }
        /* 달력 */
        .fc .fc-toolbar{display: block;}
        .fc .fc-toolbar-title{width: 335px;}
        #fc-dom-1{width: 100%; height: 45px; display: block; float: left; margin: auto;}
        .fc-toolbar-chunk{width: 140px; float: left; margin-left: 25px;}
        .fc-today-button{width: 50px;}
        .fc .fc-button {height: 35px; padding: 0; font-size: small;}
        .fc .fc-button-group>.fc-button{width: 30px;}
        .fc-scroller{overflow: auto;}
        .fc table{font-size: 15px;}
        .fc .fc-daygrid-day-top{flex-direction: row; padding-left: 5px;}
        .fc .fc-daygrid-day-number{padding: 0; text-align: left;}
        /* 달력 테이블 가로 사이즈 */
        .fc table{table-layout: auto;}
        .fc-view > table{min-width: 0; width: auto;}
        .fc-axis{min-width:20px; width:20px;}
        .fc-day,.fc-resource-cell,.fc-content-col{min-width:20px; width:48px;}

        /* 예약시간 */
        .book-time{width: 100%; height: 50px; font-size: 30px;}
        .book-time-btn{width: 75px; height: 50px; margin-bottom: 5px;}

        /* 메뉴선택 창 */
        #menu-select{width: 600px; height: 800px; background-color: rgba(128, 128, 128, 0.913); position: fixed; left: 800px; top: 200px; padding: 15px;}
        #menu-select-background{width: 570px; height: 770px; margin: auto; background-color: white; padding-top: 20px; }
        #menu-select-border1{width: 550px; height: 450px; margin: auto; margin-bottom: 10px; border: 1px solid gray; padding: 15px;}
        #menu-selectView1{width: 520px; height: 420px; margin: auto; overflow: auto;}
        .menu-detail{width: 100%; height: 150px; margin-bottom: 5px; background-color: whitesmoke;}
        .menu-detail > img{width: 150px; height: 150px; display: block; float: left; padding: 5px;}
        .menu-datail1{width: 275px; height: 150px; float: left; padding: 5px; }
        .menu-datail2{width: 75px; height: 150px; float: left; padding: 5px;}
        .btn.btn-secondary.btn-sm{margin-left: 18px; margin-top: 50px; height: 40px;}

        /* 금액 창 */
        #menu-select-border2{width: 550px; height: 270px; margin: auto; border: 1px solid gray; padding: 15px;}
    </style>
</head>
<body>

	<%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/searchSidebar.jsp" %>

    <div class="wrap">
        <div class="content">
            <div id="content2-padding">
                <div id="content2">
                    <div id="content2-1">
                        <div id="thumbnail">
                            <img src="" alt="">
                        </div>
                        <div id="content-main">
                            <div id="main1">
                                <b>(업체명)</b>
                                <br>
                                조회수 / 리뷰수 / 별점
                            </div>
                            <div id="main2">
                                <table style="width: 100%;">
                                    <tr>
                                        <th style="width: 25%;;">사업자명</th>
                                        <td style="width: 75%;">사업자명</td>
                                    </tr>
                                    <tr>
                                        <th>영업시간</th>
                                        <td>영업시간</td>
                                    </tr>
                                    <tr>
                                        <th>브레이크 타임</th>
                                        <td>브레이크 타임</td>
                                    </tr>
                                    <tr>
                                        <th>주차</th>
                                        <td>주차</td>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td>주소</td>
                                    </tr>
                                    <tr>
                                        <th>업종</th>
                                        <td>업종</td>
                                    </tr>
                                    <tr>
                                        <th>사업자등록번호</th>
                                        <td>사업자등록번호</td>
                                    </tr>
                                </table>

                                <div id="main2-3">
                                    메뉴
                                </div>
                                <div id="main2-4">
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div id="content2-2">
                        <div id="review-head">
                            사용자 리뷰
                        </div>
                        <div class="review-content">
                            <div class="review-content1-1">
                            </div>
                            <div class="review-content1-2">
                                리뷰 작성일<br>
                                리뷰 제목
                            </div>
                            <div class="review-content2-1">
                                홍길동<br>
                                별점
                            </div>
                            <div class="review-content2-2">
                                <div class="review-text"></div>
                                <div class="review-picture">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="review-content">
                            <div class="review-content1-1">
                            </div>
                            <div class="review-content1-2">
                                리뷰 작성일<br>
                                리뷰 제목
                            </div>
                            <div class="review-content2-1">
                                홍길동<br>
                                별점
                            </div>
                            <div class="review-content2-2">
                                <div class="review-text"></div>
                                <div class="review-picture">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="review-content">
                            <div class="review-content1-1">
                            </div>
                            <div class="review-content1-2">
                                리뷰 작성일<br>
                                리뷰 제목
                            </div>
                            <div class="review-content2-1">
                                홍길동<br>
                                별점
                            </div>
                            <div class="review-content2-2">
                                <div class="review-text"></div>
                                <div class="review-picture">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="paging">
                        < 1 2 3 4 5 6 7 8 9 >
                    </div>
                </div>
            </div>
            <div id="content3-padding">
            	<!-- 지도 api -->
                <div id="content3-1">
                	<div id="map">
                		
                	</div>
                </div>
                
                <script>
                	// 지도 api 띄우기
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(33.450701, 126.570667),
						level: 3,
						
					};
					var map = new kakao.maps.Map(container, options);
				
					// 카카오 지도 라이브러리
					// 지도 확대 축소
					var zoomControl = new kakao.maps.ZoomControl();
					map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
				</script>
				<script type="text/javascript">
					// 지도 마커
					var clusterer = new kakao.maps.MarkerClusterer({
				     	map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
				        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
				        minLevel: 10 // 클러스터 할 최소 지도 레벨 
				    });
				 
				    // 데이터를 가져오기 위해 jQuery를 사용합니다
				    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
				    $.get("/download/web/data/chicken.json", function(data) {
				        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
				        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
				        var markers = $(data.positions).map(function(i, position) {
				            return new kakao.maps.Marker({
				                position : new kakao.maps.LatLng(33.450701, 126.570667)
				            });
				        });
				
				        // 클러스터러에 마커들을 추가합니다
				        clusterer.addMarkers(markers);
				    });
				</script>
                
                <div id="content3-2">
                    <button type="button" id="book-btn">예약</button>
                </div>
                <br>
                <div id="content3-3">
                    <div>
                        <div id="book-title">업체명</div>
                    </div>
                    <br>
                    <div id="book-menu1" class="menu-slide">(달)월 (일)일 (요일)요일</div>
                    <div class="slide-detail">
                        <div id='calendar'></div>
                    </div>
                    <div id="book-menu2" class="menu-slide">시간 선택</div>
                    <div class="slide-detail">
                        <div class="book-time">&nbsp;&nbsp;오전</div>
                        <button class="book-time-btn">00:00</button>
                        <button class="book-time-btn">00:30</button>
                        <button class="book-time-btn">01:00</button>
                        <button class="book-time-btn">01:30</button>
                        <button class="book-time-btn">02:00</button>
                        <button class="book-time-btn">02:30</button>
                        <button class="book-time-btn">03:00</button>
                        <button class="book-time-btn">03:30</button>
                        <button class="book-time-btn">00:00</button>
                        <button class="book-time-btn">00:30</button>
                        <button class="book-time-btn">01:00</button>
                        <button class="book-time-btn">01:30</button>
                        <button class="book-time-btn">02:00</button>
                        <button class="book-time-btn">02:30</button>
                        <button class="book-time-btn">03:00</button>
                        <button class="book-time-btn">03:30</button>
                        <br><br><br>
                        <div class="book-time">&nbsp;&nbsp;오후</div>
                        <button class="book-time-btn">12:00</button>
                        <button class="book-time-btn">12:30</button>
                        <button class="book-time-btn">13:00</button>
                        <button class="book-time-btn">13:30</button>
                        <button class="book-time-btn">14:00</button>
                        <button class="book-time-btn">14:30</button>
                        <button class="book-time-btn">15:00</button>
                        <button class="book-time-btn">15:30</button>
                        <button class="book-time-btn">12:00</button>
                        <button class="book-time-btn">12:30</button>
                        <button class="book-time-btn">13:00</button>
                        <button class="book-time-btn">13:30</button>
                        <button class="book-time-btn">14:00</button>
                        <button class="book-time-btn">14:30</button>
                        <button class="book-time-btn">15:00</button>
                        <button class="book-time-btn">15:30</button>
                        <button class="book-time-btn">12:00</button>
                        <button class="book-time-btn">12:30</button>
                        <button class="book-time-btn">13:00</button>
                        <button class="book-time-btn">13:30</button>
                        <button class="book-time-btn">14:00</button>
                        <button class="book-time-btn">14:30</button>
                        <button class="book-time-btn">15:00</button>
                        <button class="book-time-btn">15:30</button>
                        <button class="book-time-btn">12:00</button>
                        <button class="book-time-btn">12:30</button>
                        <button class="book-time-btn">13:00</button>
                        <button class="book-time-btn">13:30</button>
                        <button class="book-time-btn">14:00</button>
                        <button class="book-time-btn">14:30</button>
                        <button class="book-time-btn">15:00</button>
                        <button class="book-time-btn">15:30</button>
                    </div>
                    <div id="book-menu3" onclick="menubox();">메뉴 선택</div>
                    <div id="menu-select">
                        <div id="menu-select-background">
                            <div id="menu-select-border1">
                                <div id="menu-selectView1">
                                    <div class="menu-detail">
                                        <img src="" alt="">
                                        <div class="menu-datail1">
                                            <div style="font-weight: 1000; font-size: 20px;">도쿄 수제 함바그 고젠</div>
                                            <div style="color: brown; text-align: right; font-weight: 850; margin-bottom: 5px;">12,000원</div>
                                            <div style="font-size: 13px; height: 80px; overflow: hidden;">함바그는 하나하나 수제로 만든 패티를 사용. 정성들여 만든 데미그라스 소스를 곁들인 한상 메뉴
                                            함바그는 하나하나 수제로 만든 패티를 사용. 정성들여 만든 데미그라스 소스를 곁들인 한상 메뉴함바그는 하나하나 수제로 만든 패티를 사용. 정성들여 만든 데미그라스 소스를 곁들인 한상 메뉴</div>
                                        </div>
                                        <div class="menu-datail2">
                                            <button type="button" class="btn btn-secondary btn-sm">추가</button>
                                        </div>
                                    </div>
                                    <div class="menu-detail">
                                        <img src="" alt="">
                                        <div class="menu-datail1">
                                            <div style="font-weight: 1000; font-size: 20px;">치킨 스테이크 고젠</div>
                                            <div style="color: brown; text-align: right; font-weight: 850; margin-bottom: 5px;">12,000원</div>

                                            <div style="font-size: 13px; height: 80px; overflow: hidden;">한국인이 좋아하는 치킨과 일본 갈릭 소스와의 만남.소스와 밥이 환상 궁합</div>
                                        </div>
                                        <div class="menu-datail2">
                                            <button type="button" class="btn btn-secondary btn-sm">추가</button>
                                        </div>
                                    </div>
                                    <div class="menu-detail">
                                        <img src="" alt="">
                                        <div class="menu-datail1">
                                            <div style="font-weight: 1000; font-size: 20px;">치킨 스테이크 고젠</div>
                                            <div style="color: brown; text-align: right; font-weight: 850; margin-bottom: 5px;">12,000원</div>
                                            <div style="font-size: 13px; height: 80px; overflow: hidden;">한국인이 좋아하는 치킨과 일본 갈릭 소스와의 만남.소스와 밥이 환상 궁합</div>
                                        </div>
                                        <div class="menu-datail2">
                                            <button type="button" class="btn btn-secondary btn-sm">추가</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="menu-select-border2">
                                <table>
                                    <tr>
                                        <th style="width: 250px; text-align: center;">주문내역</th>
                                        <th style="width: 125px; text-align: center;">수량</th>
                                        <th style="width: 145px; text-align: center;">금액</th>
                                    </tr>
                                    <tr>
                                        <td colspan="3"><hr></td>
                                    </tr>
                                    <tr>
                                        <td>1. 도쿄 수제 함바그 고젠</td>
                                        <td><button style="width: 30px;">-</button><input type="text" style="width: 40px; text-align: center;" value="1"><button style="width: 30px;">+</button></td>
                                        <td style="text-align: right;" >12,000원</td>
                                    </tr>
                                    <tr>
                                        <td>2. 치킨 스테이크 고젠</td>
                                        <td><button style="width: 30px;">-</button><input type="text" style="width: 40px; text-align: center;" value="1"><button style="width: 30px;">+</button></td>
                                        <td style="text-align: right;">12,000원</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="font-weight: 700; font-size: 25px;">총액</td>
                                        <td style="text-align: right; font-weight: 600; font-size: 20px; color: brown;">25,000원</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3"><hr></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="font-size: 7px; text-align: right;">* 결제 완료 시 적립금 1% 적립</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div id="book-menu4">
                        예약인원
                    </div>
                    <br>
                    <div id="book-menu5">
                        예약확인 및 예약자 정보
                    </div>
                    <br>
                    <div id="book-menu6">
                        서비스 약관
                    </div>
                    <br><br>
                    <button>예약하기</button>
                </div>
            </div>
        </div>
 
        <script>
            // 예약 버튼 활성화/비활성화
            $(function(){
                $("#book-btn").click(function(){
                    if($("#content3-3").css('display') == "none"){
                        $("#content3-3").css('display', 'block')
                    }else{
                        $("#content3-3").css('display', 'none')
                    }
                })
            })

            // 예약날짜, 시간, 메뉴 슬라이드 효과

            $(function(){
                $(".menu-slide").click(function(){
                const $slide = $(this).next();
                if($slide.css('display') == 'none'){

                    $(this).siblings('.slide-detail').slideUp();
                    $slide.slideDown(); 
                }else{
                    $slide.slideUp();
                }
                })
            })

            function menubox(){

            }
        </script>
        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>