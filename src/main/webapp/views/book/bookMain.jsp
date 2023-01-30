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
        .wrap{position: relative;}
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
        #content-main{width: 100%; padding: 5px; height: 700px; float: left; border: 2px solid gainsboro;}
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
        #content2-2{margin-top: 50px; height: 1270px; overflow: auto; border-bottom: 2px solid gainsboro;}
        #content2-2 div{box-sizing: border-box;}
        #review-head{height: 50px; border: 2px solid gainsboro; padding: 5px;}
        .review-content{width: 100%; height: 500px; border: 2px solid gainsboro;}
        .review-content div{float: left; padding: 5px;}
        .review-content1-1{width: 20%; height: 50px; }
        /* 리뷰 제목 */
        .review-content1-2{width: 80%; height: 60px;}
        /* 리뷰 작성자 */
        .review-content2-1{width: 20%; height: 355px;}
        .review-content2-2{width: 80%; height: 355px;}
        /* 리뷰 내용 */
        .review-text{width: 100%; height: 200px;}
        /* 리뷰 사진 */
        .review-picture{width: 100%; height: 150px; padding: 10px; text-align: center;}
        .review-picture img{width: 140px; height: 120px;}
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
        #content3-3{width: 100%;}
        /* 예약 업체명 */
        #book-title{height: 70px; line-height: 70px; text-align: center; background-color: antiquewhite;}
        /* 예약 카테고리 */
        .book-category, .menu-slide{
            height: 70px; text-align: center; line-height: 70px; margin-bottom: 2px; font-size: 20px; font-weight: 00; 
            color: rgba(220, 20, 60, 0.909); border: 3px solid crimson; border-radius: 7px;}
        /* 슬라이드 */
        .slide-detail{width: 100%; margin-top: 15px; margin-bottom: 15px; padding: 5px; box-sizing: border-box; overflow: auto; display: none;}

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
        .am, .pm{margin-bottom: 10px;}
        #am-box, #pm-box{padding-left: 15px;}
        .book-time{width: 100%; height: 50px; font-size: 30px;}
        .book-time-btn{width: 75px; height: 40px; margin-bottom: 7px; margin-right: 5px;}

        /* 메뉴선택 창 */
        .menu-select{width: 600px; background-color: rgba(128, 128, 128, 0.913); padding: 15px; position: absolute; left: 150px; top: 550px; display: none;}
        #menu-select-background{width: 570px; margin: auto; background-color: white; padding-top: 20px; padding-bottom: 20px;}
        #menu-select-border1{width: 550px; margin: auto; margin-bottom: 10px; border: 1px solid gray; padding: 15px;}
        #menu-selectView1{width: 520px; margin: auto; overflow: auto;}
        .menu-detail{width: 100%; height: 150px; margin-bottom: 5px; background-color: whitesmoke;}
        .menu-detail > img{width: 150px; height: 150px; display: block; float: left; padding: 5px;}
        .menu-datail1{width: 275px; height: 150px; float: left; padding: 5px; }
        .menu-datail2{width: 70px; height: 150px; float: left; padding: 5px;}
        .menuAdd.btn.btn-secondary.btn-sm{margin-left: 13px; margin-top: 20px; height: 40px;}
        .menuRemove.btn.btn-danger.btn-sm{margin-left: 13px; margin-top: 15px; height: 40px;}
        /* 인풋 number 증감 화살표 제거 */
        input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button{-webkit-appearance: none; margin: 0;}
        /* 금액 창 */
        #menu-select-border2{width: 550px; max-height: 400px; overflow: auto; margin: auto; border: 1px solid gray; padding: 15px;}
        .minus{width: 30px;}
        .plus{width: 30px;}
        .quantity{width: 40px; text-align: center;}

        /* 예약인원 */
        #book-menu4-btn{width: 100%; height: 60px; padding-top: 5px; border: 2px solid gainsboro; box-sizing: border-box;}
        #book-menu4-btn>div{float: right;}
        /* placeholder css효과 */
        .align1::-webkit-input-placeholder{text-align: center;}
        .align2::-webkit-input-placeholder{text-align: center; line-height: 160px;}

        /* 서비스 이용약관 */
        .general-condition{width: 95%; height: 45px; margin: auto; margin-bottom: 5px; border: 1px solid gainsboro; text-align: center; line-height: 40px;}
        #general-condition-detail1, #general-condition-detail2{width: 95%; height: 300px; margin: auto; margin-bottom: 5px; border: 2px solid gainsboro; display: none;}
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
                        <div id="content-main" style="">
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
                    <div class="menu-slide" id="book-date">(달)월 (일)일 (요일)요일</div>
                    <div class="slide-detail">
                        <div id='calendar'></div>
                    </div>
                    <div class="menu-slide" id="book-time">시간 선택</div>
                    <div class="slide-detail">
                        <div class="am">&nbsp;&nbsp;오전</div>
                        <div id="am-box"></div>
                        <br>
                        <div class="pm">&nbsp;&nbsp;오후</div>
                        <div id="pm-box"></div>
                        <div style="float: right; margin-left: 20px; font-weight: 600; color: gray;"><div style="width: 15px; height: 15px; margin-top: 4.5px; margin-right: 5px; border: 2px solid gray; border-radius: 3px; float: left;"></div>예약불가</div>
                        <div style="float: right; font-weight: 600; color: crimson;"><div style="width: 15px; height: 15px; margin-top: 4.5px; margin-right: 5px; border: 2px solid crimson; border-radius: 3px; float: left;"></div>예약가능</div>
                    </div>
                    <div class="book-category" id="book-menu">메뉴 선택</div>
                    <form class="menu-fixed" >
                        <div class="menu-select">
                            <div id="menu-select-background">
                                <div id="menu-select-border1">
                                    <div id="menu-selectView1">
                                        <div class="menu-detail">
                                            <img src="" alt="">
                                            <div class="menu-datail1">
                                                <div style="font-weight: 1000; font-size: 20px;">도쿄 수제 함바그 고젠</div>
                                                <div style="color: brown; text-align: right; font-weight: 850; margin-bottom: 5px;"><b>12000</b></div>
                                                <div style="font-size: 13px; height: 80px; overflow: hidden;">함바그는 하나하나 수제로 만든 패티를 사용. 정성들여 만든 데미그라스 소스를 곁들인 한상 메뉴
                                                함바그는 하나하나 수제로 만든 패티를 사용. 정성들여 만든 데미그라스 소스를 곁들인 한상 메뉴함바그는 하나하나 수제로 만든 패티를 사용. 정성들여 만든 데미그라스 소스를 곁들인 한상 메뉴</div>
                                            </div>
                                            <div class="menu-datail2">
                                                <button type="button" class="menuAdd btn btn-secondary btn-sm">추가</button>
                                                <button type="button" class="menuRemove btn btn-danger btn-sm">삭제</button>
                                            </div>
                                        </div>
                                        <div class="menu-detail">
                                            <img src="" alt="">
                                            <div class="menu-datail1">
                                                <div style="font-weight: 1000; font-size: 20px;">치킨 스테이크 고젠</div>
                                                <div style="color: brown; text-align: right; font-weight: 850; margin-bottom: 5px;"><b>13000</b></div>
                                                <div style="font-size: 13px; height: 80px; overflow: hidden;">한국인이 좋아하는 치킨과 일본 갈릭 소스와의 만남.소스와 밥이 환상 궁합</div>
                                            </div>
                                            <div class="menu-datail2">
                                                <button type="button" class="menuAdd btn btn-secondary btn-sm">추가</button>
                                                <button type="button" class="menuRemove btn btn-danger btn-sm">삭제</button>
                                            </div>
                                        </div>
                                        <div class="menu-detail">
                                            <img src="" alt="">
                                            <div class="menu-datail1">
                                                <div style="font-weight: 1000; font-size: 20px;">경양식 돈까스</div>
                                                <div style="color: brown; text-align: right; font-weight: 850; margin-bottom: 5px;"><b>10000</b></div>
                                                <div style="font-size: 13px; height: 80px; overflow: hidden;">한국인이 좋아하는 치킨과 일본 갈릭 소스와의 만남.소스와 밥이 환상 궁합</div>
                                            </div>
                                            <div class="menu-datail2">
                                                <button type="button" class="menuAdd btn btn-secondary btn-sm">추가</button>
                                                <button type="button" class="menuRemove btn btn-danger btn-sm">삭제</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="menu-select-border2">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th style="width: 250px; text-align: center;">주문내역</th>
                                                <th style="width: 125px; text-align: center;">수량</th>
                                                <th style="width: 145px; text-align: center;">금액</th>
                                            </tr>
                                            <tr class="menu-column">
                                                <td colspan="3"><hr></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <td colspan="2" style="font-weight: 700; font-size: 25px;">총액</td>
                                            <td id="sum" style="text-align: right; font-weight: 600; font-size: 20px; color: brown;"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3"><hr></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="font-size: 8px; text-align: right;">* 결제 완료 시 적립금 1% 적립</td>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div style="width: 300px; height: 50px; margin: auto; padding-top: 10px;">
                                    <button type="submit" class="btn btn-primary btn-lg" id="check" style="float: left; width: 100px;" >확인</button>
                                    <button type="button" class="btn btn-secondary btn-lg" id="cancel" style="float: right; width: 100px;" >취소</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="book-category">
                        예약인원
                    </div>
                    <div id="book-menu4-btn">
                        <div>
                            <button class="minus" style="width: 50px; height: 50px;">-</button>
                            <!-- input value가 0인 경우 오류 발생 필요 -->
                            <input id="quantity" class="quantity" type="number" value="1" style="width: 75px; height:50px;"> 
                            <button class="plus" style="width: 50px; height: 50px;">+</button>
                        </div>
                    </div>
                    <br>
                    <div id="book-menu4-userInfo">
                        <div style="width: 100%; height: 70px; text-align: center; line-height: 70px; border: 2px solid gainsboro;">
                            예약확인 및 예약자 정보
                        </div>
                        <div style="width: 95%; border: 1px solid gainsboro; margin: auto; margin-top: 10px; margin-bottom: 10px; text-align: center; font-size: 20px;">
                            <b>날짜</b> &nbsp; <b>시간</b>
                        </div>
                        <table style="width: 95%; margin: auto;">
                            <tr>
                                <th style="width: 25%; height: 50px;">예약자<b style="color: crimson;">*</b></th>
                                <td><input class="align2" type="text" name="bookUserName" placeholder="김푸딩" style="width: 100%; height: 45px;" required></td>
                            </tr>
                            <tr>
                                <th style="height: 50px;">연락처<b style="color: crimson;">*</b></th>
                                <td><input class="align2" type="text" name="bookUserPhone" placeholder="010-0000-0000" style="width: 100%; height: 45px;" required></td>
                            </tr>
                            <tr>
                                <th style="height: 50px;">이메일</th>
                                <td><input class="align2" type="text" name="bookEmail" placeholder="fooding@naver.com" style="width: 100%; height: 45px;" required></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: right;">* 작성 시 예약 확인 메일이 발송됩니다<br><br></td>
                                
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <b>요청사항</b> <br>
                                    <textarea class="align2" name="bookRequest" placeholder="요청사항을 입력해주세요" cols="40" rows="7" style="resize: none; overflow: hidden;"></textarea>
                                </td>
                            </tr>
                        </table>
                        <div></div>
                    </div>
                    <br>
                    <div>
                        <div class="book-category" style="margin-bottom: 10px;">서비스 약관</div>
                        <div class="general-condition">개인정보 수집 동의</div>
                        <div id="general-condition-detail1">에베베</div>
                        <div class="general-condition">개인정보 제공 동의</div>
                        <div id="general-condition-detail2">에베베</div>
                    </div>
                    <br><br>
                    <div>
                        <button type="button" class="btn btn-outline-danger btn-lg" style="display: block; margin: auto;">예약하기</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // 메뉴용 전역변수
            let sum = 0;
            let pirce = 0;
            let menuPrice = [];
            let variable = 0;
            let plus = 0;

            // 문자가 섞인 숫자 => 숫자로 변환해주는 변수
            const transNumber = /[^0-9]/g;




            // 예약 버튼 활성화/비활성화
            $(function(){
                $('#book-btn').click(function(){
                    if($('#content3-3').css('display') == 'none'){
                        $('#content3-3').css('display', 'block')
                    }else{
                        $('#content3-3').css('display', 'none')
                    }
                });
            });

            // 예약날짜, 시간, 메뉴, 약관 슬라이드 효과
            $(function(){
                $('.menu-slide').click(function(){
                    const $slide = $(this).next();
                    if($slide.css('display') == 'none'){
                        $(this).siblings('.slide-detail').slideUp();
                        $slide.slideDown(); 
                    }else{
                        $slide.slideUp();
                    }
                });

                $('#book-menu').click(function(){
                    if($('#book-date').css('display') == 'block' || $('#book-time').css('display') == 'block'){
                        $('#book-date').next().slideUp();
                        $('#book-time').next().slideUp();
                    };
                    $('.menu-select').css('display', 'block');
                });

                $('.general-condition').click(function(){
                    const $slide = $(this).next();
                    if($slide.css('display') == 'none'){
                        $('#general-condition-detail1').slideUp();
                        $('#general-condition-detail2').slideUp();
                        $slide.slideDown();
                    }else{
                        $slide.slideUp();
                    };
                });
            });

            // // 시간 선택 버튼 생성
            $(function(){
                $('#book-time').click(function(){
                    const open = (8*100) + ((00/30)*50);
                    const close = (19*100) + ((00/30)*50);
                    const breakS = (7*100) + ((0/30)*50);
                    const breakE = (15*100) + ((30/30)*50);

                    if($('.am').next().children().length == 0 && $('.pm').next().children().length == 0){
                        // 오전 오픈
                        if(open < 1200){
                            for(let i=0; i<1200-open; i+=50){
                                $('.am').next().append(
                                    '<button type="button" class="book-time-btn btn btn-outline-danger">' + parseInt(Math.floor(open + i)/100) + ':' + ('00' + ((open + i)%100/50*30)).slice(-2) + '</button>' 
                                );
                            };
                            for(let i=0; i<close-1200; i+=50){
                                $('.pm').next().append(
                                    '<button type="button" class="book-time-btn btn btn-outline-danger">' + parseInt(Math.floor(1200 + i)/100) + ':' + ('00' + ((1200 + i)%100/50*30)).slice(-2) + '</button>' 
                                );
                            };
                        // 오후 오픈
                        }else{
                            for(let i=0; i<close-open; i+=50){
                                $('.pm').next().append(
                                    '<button type="button" class="book-time-btn btn btn-outline-danger">' + parseInt(Math.floor(open + i)/100) + ':' + ('00' + ((open + i)%100/50*30)).slice(-2) + '</button>' 
                                );
                            };
                        };
                    };

                    // 브레이크 타임 속성 적용
                    const time = '';
                    let arraytime = new Array();
                    if(breakS != null){
                        console.log($('#am-box, #pm-box').children('button').text())
                        $('#am-box, #pm-box').children().each(function(){
                            arrayTime.
                        })
                    }
                });
            });

            
            
                        
            // 시간 선택 버튼 효과
            $(document).on('click', '.book-time-btn.btn.btn-outline-danger', function(e){
                $('#am-box, #pm-box').children().each(function(){
                    if($(this).prop('name')){
                        $(this).css({'background-color':'', 'color':''});
                        $(this).removeAttr('name');
                        $(this).removeAttr('value');
                    }
                })
                
                const bookTimeValue = $(this).text();
                $(this).css({'background-color':'crimson', 'color':'white'});
                $(this).attr('name', 'bookTime');
                $(this).attr('value', bookTimeValue);
            });
            
            // 메뉴 추가
            
            $('.menuAdd.btn.btn-secondary.btn-sm').click(function(){
                const addMenu = $(this).parent().prev().children();
                const table = $('#menu-select-border2>table>tbody>tr').length;
                const tableData = $('#menu-select-border2>table>tbody>tr').text();
                //console.log(tableData);
                if(table == 0) {
                        $('#menu-select-border2 tbody:first').append(
                        '<tr class="menu-choice">'
                        + '<td>' + addMenu.eq(0).text() + '</td>'
                        + '<td>'
                        +    '<button class="minus" type="button">-</button> '
                        +    '<input id="quantity"  class="quantity" type="number" value="1" required> '
                        +    '<button class="plus" type="button">+</button> '
                        + '</td>'
                        + '<td id="price' + variable + '" style="text-align: right;" >' + addMenu.eq(1).text().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원' + '</td>'
                        + '</tr>'
                    );
                }else if(tableData.indexOf(addMenu.eq(0).text()) < 0){
                    variable++;
                    $('#menu-select-border2 tbody:first').append(
                        '<tr class="menu-choice">'
                        + '<td>' + addMenu.eq(0).text() + '</td>'
                        + '<td>'
                        +    '<button class="minus" type="button">-</button> '
                        +    '<input id="quantity" class="quantity" type="number" value="1" required> '
                        +    '<button class="plus" type="button">+</button> '
                        + '</td>'
                        + '<td id="price' + variable + '"style="text-align: right;" >' + addMenu.eq(1).text().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원' + '</td>'
                        + '</tr>'
                    );
                }else{
                    $(".menu-choice").each(function(){
                        if($(this).children().eq(0).text() == addMenu.eq(0).text()){
                            $(this).find("input").val(Number($(this).find("input").val()) + 1);
                            const price = addMenu.eq(1).text(); 
                            result = $(this).find("input").val() * price;
                            $(this).children().eq(2).text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
                        };
                    });
                };
                sum = 0;
                $(".menu-choice").each(function(){
                    i = 0;
                    menuPrice[i] = parseInt($(this).children().eq(2).text().replace(/,/g, "").replace(transNumber));
                    sum += menuPrice[i];
                    i++
                })
                $('#sum').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
            });
            
            $('.menuRemove.btn.btn-danger.btn-sm').click(function(){
                const addMenu = $(this).parent().prev().children();
                console.log(addMenu);
                $(".menu-choice").each(function(){
                    if($(this).children().eq(0).text() == addMenu.eq(0).text()){
                        $(this).remove();
                    };
                });
                sum = 0;
                $(".menu-choice").each(function(){
                    i = 0;
                    menuPrice[i] = parseInt($(this).children().eq(2).text().replace(/,/g, "").replace(transNumber));
                    sum += menuPrice[i];
                    i++
                })
                $('#sum').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
            })
                
            // 수량 추가, 삭제
            $(document).on('click', '.minus', function(){
                const addedMenuName = $(this).parents('.menu-choice').children().eq(0).text();
                const MenuPrice = $(this).parents('.menu-choice').children().eq(2).text();
                let price = $(this).parents('.menu-choice').children().eq(2);
                let value = $(this).next();
                if($(this).next().val() > 1){
                    value.val(parseInt(value.val()) - 1);
                    $('.menuAdd.btn.btn-secondary.btn-sm').each(function(){
                        if($(this).parent().prev().children().eq(0).text() == addedMenuName){
                            let menuInfo = parseInt($(this).parent().prev().children().eq(1).text());
                            result = menuInfo * parseInt(value.val())
                            price.text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
                        }
                    });
                }else{
                    $(this).parents('tr.menu-choice').remove();
                }
                sum = 0;
                $(".menu-choice").each(function(){
                    i = 0;
                    menuPrice[i] = parseInt($(this).children().eq(2).text().replace(/,/g, "").replace(transNumber));
                    sum += menuPrice[i];
                    i++
                })
                $('#sum').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
            });
            $(document).on('click', '.plus', function(){
                const addedMenuName = $(this).parents('.menu-choice').children().eq(0).text();
                const MenuPrice = $(this).parents('.menu-choice').children().eq(2).text();
                let price = $(this).parents('.menu-choice').children().eq(2);
                let value = $(this).prev();
                if(value.val() == ''){
                    value.val(0);
                }
                value.val(parseInt(value.val()) + 1);
                $('.menuAdd.btn.btn-secondary.btn-sm').each(function(){
                    if($(this).parent().prev().children().eq(0).text() == addedMenuName){
                        let menuInfo = parseInt($(this).parent().prev().children().eq(1).text());
                        result = menuInfo * parseInt(value.val())
                        price.text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
                    }
                })
                sum = 0;
                $(".menu-choice").each(function(){
                    i = 0;
                    menuPrice[i] = parseInt($(this).children().eq(2).text().replace(/,/g, "").replace(transNumber));
                    sum += menuPrice[i];
                    i++
                })
                $('#sum').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
            });
            $(document).on('keyup', '.quantity', function(){
                const addedMenuName = $(this).parents('.menu-choice').children().eq(0).text();
                const MenuPrice = $(this).parents('.menu-choice').children().eq(2).text();
                let price = $(this).parents('.menu-choice').children().eq(2);
                let value = $(this);
                $(this).val().replace(transNumber);
                if($(this).val() == 0 && $(this).val() != ''){
                    alert('1 이상의 숫자만 입력해주세요')
                    $(this).val(1)
                }
                $('.menuAdd.btn.btn-secondary.btn-sm').each(function(){
                    if($(this).parent().prev().children().eq(0).text() == addedMenuName){
                        if(value.val() != ''){
                            let menuInfo = parseInt($(this).parent().prev().children().eq(1).text());
                            result = (menuInfo) * parseInt(value.val());
                            price.text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
                        }else{
                            price.text('0원');
                        }
                    }
                    sum = 0;
                    $(".menu-choice").each(function(){
                        i = 0;
                        menuPrice[i] = parseInt($(this).children().eq(2).text().replace(/,/g, "").replace(transNumber));
                        sum += menuPrice[i];
                        i++
                    })
                    $('#sum').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
                });
            });
            // - / + 입력 방지
            $(document).on('keydown', '.quantity', function(e){
                if(!((e.keyCode > 95 && e.keyCode < 106)
                || (e.keyCode > 47 && e.keyCode < 58) 
                || e.keyCode == 8)) {
                    return false;
                }
            });
            // 메뉴 취소 버튼
            $('#cancel').click(function(){
                $('.menu-select').css('display', 'none');
            });

            
        </script>
        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>