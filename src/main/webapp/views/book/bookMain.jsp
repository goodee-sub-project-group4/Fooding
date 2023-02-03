<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ 
	page import="com.fd.restaurant.model.vo.Restaurant, com.fd.restaurant.model.vo.Menu,
				 com.fd.review.model.vo.Review"
%>

<%@ page import="java.util.ArrayList" %>
<%
	Restaurant restaurant = (Restaurant)request.getAttribute("restaurant");
	ArrayList<Menu> menuList = (ArrayList<Menu>)request.getAttribute("menuList");
	int bookNo = (int)request.getAttribute("bookNo");
	//ArrayList<Review> reviewList = (ArrayList<Review>)request.getAttribute("reviewList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 지도 API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=694ae779a7a7935c84a1e22edd5c5d87&libraries=services"></script>

    <!-- 달력 API -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.1/index.global.min.js"></script>
    
    <!-- 결제 API -->
 	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <style>
        /* 컨텐트 전체 영역 */
        /* .content div{border: 1px solid black;} */
        .wrap{position: relative;}
        #content1, #content2, #content3{box-sizing: border-box; height: 100%;}
        #content1-padding, #content2-padding, #content3-padding{float: left; margin: auto; padding: 5px; box-sizing: border-box;}

        /* 컨텐트 가운데 영역 */
        #content2-padding{width: 50%; height: 100%;}
        /* 컨텐트 가운데 전체 높이 */
        #content2{max-height: 2450px;}
        #content2-1{max-height: 1050px;}
        #content2-1 div{box-sizing: border-box;}
        
        /* 업체 사진 */
        #thumbnail{height: 450px;}
        /* 업체 정보 */
        #content-main{width: 100%; padding: 5px; float: left; border: 2px solid gainsboro;}
        /* 업체명 (조회/리뷰/별점) */
        #main1{width: 100%;}
        /* 업체세부정보 + 메뉴 */
        #main2{width: 100%;}
        #main2 div{float: left;}
        #main2-1, #main2-3{width: 25%;}
        #main2-2, #main2-4{width: 75%;}
        #main2-3, #main2-4{margin-top: 25px;} 
        #main2-4{max-height: 400px; overflow: auto;}
        /* 메뉴 */
        .menu{width: 50%; padding: 3px; text-align: center;}
        .menu img{width: 180px; height: 100px;}

        /* 리뷰 */
        #content2-2{margin-top: 20px; float: left; max-height: 1700px; overflow: auto;}
        #content2-2 div{box-sizing: border-box;}
        #review-head{height: 50px; border: 2px solid gainsboro; padding: 5px; margin-bottom: 4px;}
        .review-content div{float: left; padding: 5px;}
        .review-content1-1{width: 20%; height: 60px; border-left: 2px solid gainsboro; border-top: 2px solid gainsboro;}
        /* 리뷰 제목 */
        .review-content1-2{width: 80%; height: 60px; border-top: 2px solid gainsboro; border-right: 2px solid gainsboro;}
        /* 리뷰 작성자 */
        .review-content2-1{width: 20%; height: 355px; border-left: 2px solid gainsboro; border-bottom: 2px solid gainsboro; margin-bottom: 2px;}
        .review-content2-2{width: 80%; height: 355px; border-right: 2px solid gainsboro; border-bottom: 2px solid gainsboro; margin-bottom: 2px;}
        /* 리뷰 내용 */
        .review-text{width: 100%; height: 200px;}
        /* 리뷰 사진 */
        .review-picture{width: 100%; height: 150px; padding: 10px; text-align: center;}
        .review-picture img{width: 140px; height: 120px;}
        /* 리뷰 페이징 */
        .paging{text-align: center; margin-top: 30px; width: 100%; float: left;}

        /* 컨텐트 오른쪽 영역 */
        #content3-padding{width: 30%; height: 465px;}
        /* 지도 */
        #map{height: 350px; box-sizing: border-box;}
        /* 예약 펼치기 버튼 */
        #content3-2{height: 100px; box-sizing: border-box;}
        #book-btn{width: 100%; height: 100%; border: none; font-size: 3em; box-sizing: border-box;}

        /* 예약 내용 */
        #content3-3{visibility: hidden;}
        /* 예약 업체명 */
        #book-title{height: 70px; line-height: 70px; text-align: center; background-color: antiquewhite;}
        /* 예약 카테고리 */
        .book-category, .menu-slide{
            height: 70px; text-align: center; line-height: 70px; margin-bottom: 2px; font-size: 20px; font-weight: 600; font-size: 1.5em; 
            color: rgba(220, 20, 60, 0.909); border: 3px solid crimson; border-radius: 7px;}
        /* 슬라이드 */
        .slide-detail1{width: 100%; margin-top: 15px; margin-bottom: 15px; padding: 5px; box-sizing: border-box; overflow: auto; display: block;}
        .slide-detail2{width: 100%; margin-top: 15px; margin-bottom: 15px; padding: 5px; box-sizing: border-box; overflow: auto; display: none;}

        /* 예약날짜 */
        a {color: crimson}
        .fc .fc-toolbar-title{font-size: 2.5em; margin-bottom: 25px;}
        .fc .fc-button{padding: 0; font-size: 1.2em;}
        .fc-today-button.fc-button.fc-button-primary{width: 70px; height: 45px;}
        .fc-prev-button.fc-button.fc-button-primary, .fc-next-button.fc-button.fc-button-primary{width: 45px; height: 45px;}
        .fc .fc-button{line-height: 10px;}
        .fc .fc-toolbar {align-items: center; display: flex; justify-content: space-between; flex-direction: column;}
        .fc .fc-daygrid-body-unbalanced .fc-daygrid-day-events{min-height: 0;}

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
        /* 최종 결제용 추가 창 */
        #menu-select-border3{width: 550px; margin: auto; margin-top: 10px; border: 1px solid gray; padding: 15px; display: none;}
        #menu-payment{display: none;}

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
                            <img style="width: 100%; height: 100%;" src="<%= contextPath %>/resources/restaurantSample/4_loosedoor.jpg" alt="">
                        </div>
                        <div id="content-main">
                            <div id="main1">
                                <b style="font-size: 2em;"><%= restaurant.getResName() %></b>
                                <table style="text-align: center;">
                                    <tr>
                                        <th style="width: 60px;">조회수</th>
                                        <th style="width: 60px;">리뷰수</th>
                                        <th style="width: 60px;">좋아요</th>
                                    </tr>
                                    <tr>
                                        <td><img style="width: 15px; height: 15px;" src="<%= contextPath %>/resources/images/조회수.png" alt=""> <%= restaurant.getCount() %></td>
                                        <td><img style="width: 15px; height: 15px;" src="<%= contextPath %>/resources/images/리뷰수2.png" alt=""> <%= restaurant.getReviewCount() %></td>
                                        <td><img style="width: 15px; height: 15px;" src="<%= contextPath %>/resources/images/찜하기.png" alt=""> <%= Math.round(restaurant.getReviewAvg() * 100.0) / 100.0 %></td>
                                    </tr>
                                </table>
                                <br>
                            </div>
                            <div id="main2">
                                <table style="width: 100%;">
                                    <tr>
                                        <th style="width: 25%;;">사업자명</th>
                                        <td style="width: 75%;"><%= restaurant.getCeo() %></td>
                                    </tr>
                                    <tr>
                                        <th>영업시간</th>
                                        <td><b id="open"><%= restaurant.getOpen() %></b> ~ <b id="close"><%= restaurant.getClose() %></b></td>
                                    </tr>
                                    <tr>
                                        <th>브레이크 타임</th>
                                        <td><b id="breakS"><%= restaurant.getBreakS() %></b> ~ <b id="breakE"><%= restaurant.getBreakE() %></b></td>
                                    </tr>
                                    <tr>
                                        <th>주차</th>
                  	                    <% if(restaurant.getParking().equals("Y")){ %> 
                                        <td>주차가능</td>
                                        <% }else{ %>
                                        <td>주차 불가능</td>
                                        <% } %>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td><%= restaurant.getAddress() %><%= restaurant.getdAddress() %></td>
                                    </tr>
                                    <tr>
                                        <th>업종</th>
                                        <td><%= restaurant.getFoodCt() %></td>
                                    </tr>
                                    <tr>
                                        <th>사업자등록번호</th>
                                        <td><%= restaurant.getPermitNo() %></td>
                                    </tr>
                                </table>

                                <div id="main2-3">
                                    메뉴
                                </div>
                                <div id="main2-4">
                                <% if(!menuList.isEmpty()) {%>
                                	<% for(Menu m :menuList) { %>
                                    <div class="menu">
                                        <img src="<%= m.getmImg() %>" alt=""><br>
                                        <%= m.getMenuName() %> <br>
                                        <%= m.getPrice() %>
                                    </div>
                                    <% } %>
                                <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="content2-2">
                        <div id="review-head">
                            사용자 리뷰
                        </div>
                        <!-- <% //if(!reviewList.isEmpty()) { %> -->
                        	<!-- <% //for(Review r : reviewList) { %> -->
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
                        	<!-- <% //} %>
                        <% //} %> -->
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
                        <div class="paging">
                            < 1 2 3 4 5 6 7 8 9 >
                        </div>
                    </div>
                    
                </div>
            </div>
            <div id="content3-padding">
                <div id="content3-1">
                    <div id="map"></div>
                </div>
                <div id="content3-2">
                    <button type="button" id="book-btn">예약</button>
                </div>
                <br>
                <div id="content3-3">
                    <div>
                        <div id="book-title">업체명</div>
                    </div>
                    <br>
                    <div class="menu-slide" id="book-date">날짜 선택</div>
                    <div class="slide-detail1">
                        <div id='calendar' style='width: 340px;'></div>
                        <input id="date" type="hidden" name="date" value="">
                    </div>
                    <script>
                    // 달력 api -----------------------------------------------------------------------------------------------
                    document.addEventListener('DOMContentLoaded', function() {
                        var calendarEl = document.getElementById('calendar');
                        var calendar = new FullCalendar.Calendar(calendarEl, {
                            locale: "ko",
                            initialView: 'dayGridMonth',
                            dayGridMonth: {type: 'dayGrid', duration: { months: 1 }, monthMode: true, fixedWeekCount: false},
                            contentHeight: 'auto',
                            editable: false,
                            selectable:true,
                            select:function(info){
                                const date = info.startStr
                                $('#date').val(info.startStr);
                                $('#book-date').text('예약날짜 ' + date);
                                $('.bookDate').val(date);
                            }
                        });
                        calendar.render();
                    });
                    </script>
                    <div class="menu-slide" id="book-time">시간 선택</div>
                    <div class="slide-detail2">
                        <div class="am">&nbsp;&nbsp;오전</div>
                        <div id="am-box"></div>
                        <br>
                        <div class="pm">&nbsp;&nbsp;오후</div>
                        <div id="pm-box"></div>
                        <div style="float: right; margin-left: 20px; font-weight: 600; color: gray;"><div style="width: 15px; height: 15px; margin-top: 4.5px; margin-right: 5px; border: 2px solid gray; border-radius: 3px; float: left;"></div>예약불가</div>
                        <div style="float: right; font-weight: 600; color: crimson;"><div style="width: 15px; height: 15px; margin-top: 4.5px; margin-right: 5px; border: 2px solid crimson; border-radius: 3px; float: left;"></div>예약가능</div>
                    </div>

                    <script>
                         // 예약날짜, 시간, 메뉴, 약관 슬라이드 효과 -----------------------------------------------
                        $(function(){
                            $('.menu-slide').click(function(){
                                const $slide = $(this).next();
                                if($slide.css('display') == 'none'){
                                    $(this).siblings('.slide-detail1').slideUp();
                                    $(this).siblings('.slide-detail2').slideUp();
                                    $('#general-condition-detail1').slideUp();
                                    $('#general-condition-detail2').slideUp();
                                    $slide.slideDown();
                                }else{
                                    $slide.slideUp();
                                }
                            })

                            $('#book-menu').click(function(){
                                    $('.menu-select').css('display', 'block');
                                    $('#menu-select-border3').css('display', 'none');
                                    $('#menu-payment').css('display', 'none');
                                    $('#menu-selected').css('display', 'block');
                            });

                            $('.check').click(function(){
                                $('.menu-select').css('display', 'none');
                            })

                            $('.general-condition').click(function(){
                                const $slide = $(this).next();
                                if($slide.css('display') == 'none'){
                                    $('#general-condition-detail1').slideUp();
                                    $('#general-condition-detail2').slideUp();
                                    $('.slide-detail1').slideUp();
                                    $('.slide-detail2').slideUp();
                                    $slide.slideDown();
                                }else{
                                    $slide.slideUp();
                                };
                            });
                        });
                        
                        // 시간 선택 버튼 효과
                        $(document).on('click', '.book-time-btn.btn.btn-outline-danger', function(e){
                            {
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
                                $('#book-time').text('예약시간 ' + bookTimeValue);
                                $('.bookTime').val(bookTimeValue);
                            }
                        });
                    </script>

                    <div class="book-category" id="book-menu">메뉴 선택</div>
                    <form class="menu-fixed" >
                        <div class="menu-select">
                            <div id="menu-select-background">
                                <div id="menu-select-border1">
                                    <div id="menu-selectView1">
                                     	<% if(!menuList.isEmpty()) { %>
                                     		<% for(Menu m : menuList) {%>
	                                        <div class="menu-detail">
	                                            <img src="" alt="">
	                                            <div class="menu-datail1">
	                                                <div style="font-weight: 1000; font-size: 20px;"><%= m.getMenuName() %></div>
	                                                <div style="color: brown; text-align: right; font-weight: 850; margin-bottom: 5px;"><b><%= m.getPrice() %></b></div>
	                                                <div style="font-size: 13px; height: 80px; overflow: hidden;"><%= m.getMenuDes() %></div>
	                                            </div>
	                                            <div class="menu-datail2">
	                                                <button type="button" class="menuAdd btn btn-secondary btn-sm">추가</button>
	                                                <button type="button" class="menuRemove btn btn-danger btn-sm">삭제</button>
	                                            </div>
	                                        </div>
	                                        <% } %>
	                                    <% } %>
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
                                            <td class="sum" style="text-align: right; font-weight: 600; font-size: 20px; color: brown;"></td>
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
                                <div id="menu-select-border3">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="width: 50%;">현재 적립금</td>
                                            <td style="width: 50%; text-align: right;">25,000원</td>
                                        </tr>
                                        <tr>
                                            <td>적립금 사용</td>
                                            <td style="text-align: right;"><input style="width: 80px; text-align: right;" type="number" class="quantity" value="5000">원</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><hr></td>
                                        </tr>
                                        <tr>
                                            <td>주문 금액</td>
                                            <td class="sum" style="text-align: right;"></td>
                                        </tr>
                                        <tr>
                                            <td>적립금 사용</td>
                                            <td style="text-align: right;">- 사용금액</td>
                                        </tr>
                                        <tr>
                                            <td>예상 적립금</td>
                                            <td style="text-align: right;">+ </td>
                                        </tr>
                                        <tr>
                                            <td style="font-weight: 700; font-size: 25px;">최종 결제 금액</td>
                                            <td class="sum-payment" style="text-align: right; font-weight: 600; font-size: 20px; color: brown;"></td>
                                        </tr>
                                    </table>
                                </div>
                                <div id="menu-selected" style="width: 300px; height: 50px; margin: auto; padding-top: 10px;">
                                    <button type="button" class="btn btn-primary btn-lg check" style="float: left; width: 100px;" >확인</button>
                                    <button type="button" class="btn btn-secondary btn-lg cancel" style="float: right; width: 100px;" >취소</button>
                                </div>
                                <div id="menu-payment" style="width: 300px; height: 50px; margin: auto; padding-top: 10px;">
                                    <button type="button" onclick="payment();" class="btn btn-danger btn-lg payment" style="float: left; width: 100px;" >결제</button>
                                    <button type="button" class="btn btn-secondary btn-lg cancel" style="float: right; width: 100px;" >취소</button>
                                    <% if(loginUser != null) { %>
                                    	<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                                    <% } %>
                                    <input type="hidden" name="resNo" value="<%= restaurant.getResNo() %>">
                                    <input type="hidden" class="bookName" name="bookName" value="">
                                    <input type="hidden" class="bookPhone" name="bookPhone" value="">
                                    <input type="hidden" class="bookDate" name="bookDate" value="">
                                    <input type="hidden" class="bookTime" name="bookTime" value="">
                                    <input type="hidden" class="people" name="people" value="">
                                    <input type="hidden" class="email" name="email" value="">
                                    <input type="hidden" class="request" name="request" value="">
                                </div>
                            </div>
                        </div>
                    </form>

                    <script>
                        $(function(){
                            
                        });
                    </script>

                    <!-- 메뉴 / 결제창 -->
                    <script>
                        // 메뉴 추가
                        $('.menuAdd.btn.btn-secondary.btn-sm').click(function(){
                            const addMenu = $(this).parent().prev().children();
                            const table = $('#menu-select-border2>table>tbody>tr').length;
                            const tableData = $('#menu-select-border2>table>tbody>tr').text();
                            //console.log(tableData);
                            if(table == 0) {
                                    $('#menu-select-border2 tbody:first').append(
                                    '<tr class="menu-choice">'
                                    + '<td class="menuName">' + addMenu.eq(0).text() + '</td>'
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
                                    + '<td class="menuName">' + addMenu.eq(0).text() + '</td>'
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
                            $('.sum').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
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
                            $('.sum').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
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
                            $('.sum').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
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
                            $('.sum').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
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
                                $('.sum').text(sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '원');
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
                        $('.cancel').click(function(){
                            $('.menu-select').css('display', 'none');
                        });

                            
                        var IMP = window.IMP; 
                        IMP.init("imp44408883"); 
                        function payment() {
                            const menuChoice = document.querySelectorAll(".menuName"); // [td, td, ..]
                            let menu = [];
                            for(i=0; i<menuChoice.length; i++){
                                menu.push(menuChoice[i].innerText);
                            }
                            // ["xx", "bb"]
                            console.log($('.bookName').val())
                            // IMP.request_pay(param, callback) 결제창 호출
                            IMP.request_pay({ // param
                                pg: "html5_inicis",
                                pay_method: "card",
                                merchant_uid: "<%= bookNo + 1 %>2",
                                name: menu.join("<br>"),
                                amount: 1,
                                buyer_email: $('.email').val(),
                                buyer_name: $('.bookName').val(),
                                buyer_tel: $('.bookPhone').val(),
                            }, function (rsp) { // callback
                                if (rsp.success) {
                                    ajax({
                                        url: "{서버의 결제 정보를 받는 endpoint}", // 예: https://www.myservice.com/payments/complete
                                        method: "POST",
                                        headers: { "Content-Type": "application/json" },
                                        data: {
                                            imp_uid: rsp.imp_uid,
                                            merchant_uid: rsp.merchant_uid
                                        }
                                    })
                                } else {
                                    alert("결제에 실패했습니다.")
                                }
                            });
                        }
                      </script>

                    <div class="book-category">
                        예약인원
                    </div>
                    <div id="book-menu4-btn">
                        <div>
                            <button class="minus" style="width: 50px; height: 50px;">-</button>
                            <input id="quantity" class="quantity bookPeople" type="number" value="1" style="width: 75px; height:50px;"> 
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
                        	<% if(loginUser != null) { %>
                                <tr>
                                    <th style="width: 25%; height: 50px;">예약자<b style="color: crimson;">*</b></th>
                                    <td><input class="align2 bookUserName" type="text" name="bookUserName" value="<%= loginUser.getUserName() %>" placeholder="김푸딩" style="width: 100%; height: 45px;" required></td>
                                </tr>
                                <tr>
                                    <th style="height: 50px;">연락처<b style="color: crimson;">*</b></th>
                                    <td><input class="align2 bookUserPhone" type="text" name="bookUserPhone" value="<%= loginUser.getUserPhone() %>" placeholder="010-0000-0000" style="width: 100%; height: 45px;" required></td>
                                </tr>
                                <tr>
                                    <th style="height: 50px;">이메일</th>
                                    <td><input class="align2 bookEmail" type="text" name="bookEmail" value="<%= loginUser.getUserEmail() %>" placeholder="fooding@naver.com" style="width: 100%; height: 45px;" required></td>
                                </tr>
                            <% }else{ %>
                                <tr>
                                    <th style="width: 25%; height: 50px;">예약자<b style="color: crimson;">*</b></th>
                                    <td><input class="align2 bookUserName" type="text" name="bookUserName" placeholder="김푸딩" style="width: 100%; height: 45px;" required></td>
                                </tr>
                                <tr>
                                    <th style="height: 50px;">연락처<b style="color: crimson;">*</b></th>
                                    <td><input class="align2 bookUserPhone" type="text" name="bookUserPhone" placeholder="010-0000-0000" style="width: 100%; height: 45px;" required></td>
                                </tr>
                                <tr>
                                    <th style="height: 50px;">이메일</th>
                                    <td><input class="align2 bookEmail" type="text" name="bookEmail" placeholder="fooding@naver.com" style="width: 100%; height: 45px;" required></td>
                                </tr>
                            <% } %>
                                <tr>
                                    <td colspan="2" style="text-align: right;">* 작성 시 예약 확인 메일이 발송됩니다<br><br></td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <b>요청사항</b> <br>
                                        <textarea class="align2 bookRequest" name="bookRequest" placeholder="요청사항을 입력해주세요" cols="40" rows="7" style="resize: none; overflow: hidden;"></textarea>
                                    </td>
                                </tr>
                        </table>
                        
                        
                        <div></div>
                    </div>
                    <br>
                    <div>
                        <div class="book-category" style="margin-bottom: 10px;">서비스 약관</div>
                        <div class="general-condition"><input type="checkbox"> 개인정보 수집 동의</div>
                        <div id="general-condition-detail1" style="overflow: auto;">
                            <p style="padding: 5px;"> -개인정보 수집 동의-
                            <br><br>1. 기본수집항목: [필수] 푸딩 아이디, 이름, (휴대)전화번호, [선택] 이메일 주소
                            <br><br>2. 수집 및 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존
                            <br><br>3. 보관기간
                            <br>&nbsp;&nbsp;- 회원탈퇴 시 지체없이 파기
                            <br>&nbsp;&nbsp;- 단, 관련 법령에 의하여 일정 기간 보관이 필요한 경우에는 해당 기간 동안 보관함
                            <br><br>4. 동의 거부권 등에 대한 고지: 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다. 그 밖의 내용은 푸딩 개인정보 처리방침을 따릅니다.</p>
                        </div>
                        <div class="general-condition"><input type="checkbox"> 개인정보 제공 동의</div>
                        <div id="general-condition-detail2" style="overflow: auto;">
                            <p style="padding: 5px;"> -개인정보 제공 동의-
                            <br><br>1. 개인정보를 제공받는 자 : 이용업체
                            <br><br>2. 제공하는 기본 개인정보 항목:  [필수] 푸딩 아이디, 이름, (휴대)전화번호, 성별, 연령대, [선택] 이메일 주소
                            <br><br>3. 개인정보를 제공받는 자의 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 서비스 분석과 통계에 따른 혜택 및 맞춤 서비스 제공, 민원처리 등 고객상담, 고객관리, 서비스 이용에 따른 설문조사 및 혜택 제공, 분쟁조정을 위한 기록보존
                            <br><br>4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 푸딩 회원탈퇴 시 또는 위 개인정보 이용목적 달성 시 까지 이용합니다.
                            <br><br>5. 동의 거부권 등에 대한 고지 : 정보주체는 개인정보 제공 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.</p>
                        </div>
                    </div>
                    <!-- 서비스 약관 동의 -->
                    <script>
                        $('.general-condition').click(function(){
                            $(this).children().attr('checked', true);
                        })
                    </script>
                    <br><br>
                    <div>
                        <button id="book-final" type="button" class="btn btn-outline-danger btn-lg" style="display: block; margin: auto;">예약하기</button>
                    </div>

                    <!-- 예약하기 버튼 -->
                    <script>
                        $('#book-final').click(function(){
                            $('.bookName').val($('.bookUserName').val());
                            $('.bookPhone').val($('.bookUserPhone').val());
                            $('.email').val($('.bookEmail').val());
                            $('.people').val($('.bookPeople').val());
                            $('.request').val($('.bookRequest').val());

                            if($('#book-date').text() == '날짜 선택'){
                                alert('날짜를 먼저 선택해주세요!');
                                $('#book-time').next().slideUp();
                                $('#book-date').next().slideDown();
                            }else if($('#book-time').text() == '시간 선택'){
                                alert('시간을 먼저 선택해주세요!');
                                $('#book-date').next().slideUp();
                                $('#book-time').next().slideDown();
                            }else if($('.bookName').val() == ""){
                                alert("예약자명을 입력해주세요")
                            }else if($('.bookPhone').val() == ""){
                                alert("예약자 연락처를 입력해주세요")
                            }else{
                                $('.menu-select').css('display', 'block');
                                $('#menu-select-border3').css('display', 'block');
                                $('#menu-payment').css('display', 'block');
                                $('#menu-selected').css('display', 'none');
                                // 예약 정보 데이터
                                
                            }
                        });
                    </script>

                </div>
            </div>
        </div>
        <script>
            // 스크립트 전역변수 ---------------------------------------------------------------------
            // 메뉴용 전역변수
            let sum = 0;
            let pirce = 0;
            let menuPrice = [];
            let variable = 0;
            let plus = 0;
            // 문자가 섞인 숫자 => 숫자로 변환해주는 변수
            const transNumber = /[^0-9]/g;

            // 카카오 지도 api ---------------------------------------------------------------------- 
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(37.57150, 126.99034), // 지도의 중심좌표
                    level: 1, // 지도의 확대 레벨
                    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
                }; 

            // 지도를 생성한다 
            var map = new kakao.maps.Map(mapContainer, mapOption); 

            // 지도에 확대 축소 컨트롤을 생성한다
            var zoomControl = new kakao.maps.ZoomControl();

            // 지도의 우측에 확대 축소 컨트롤을 추가한다
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // 지도에 마커를 생성하고 표시한다
            var marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(37.57150, 126.99034), // 마커의 좌표
                map: map // 마커를 표시할 지도 객체
            });

            // 마커 위에 표시할 인포윈도우를 생성한다
            var infowindow = new kakao.maps.InfoWindow({
                content : '<div style="padding:5px;"><%= restaurant.getResName() %></div>' // 인포윈도우에 표시할 내용
            });

            // 인포윈도우를 지도에 표시한다
            infowindow.open(map, marker);

            $(function(){
                $('#test-btn').click(function(){
                    // 주소-좌표 변환 객체를 생성합니다
                    var geocoder = new kakao.maps.services.Geocoder();

                    // 주소로 좌표를 검색합니다
                    geocoder.addressSearch($('#testMap').val(), function(result, status) {
                    
                        // 정상적으로 검색이 완료됐으면 
                        if (status === kakao.maps.services.Status.OK) {

                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                            // 결과값으로 받은 위치를 마커로 표시합니다
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: coords
                            });

                            // 인포윈도우로 장소에 대한 설명을 표시합니다
                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
                            });
                            infowindow.open(map, marker);

                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                        } 
                    });
                    kakao.maps.event.addListener(map, 'center_changed', function() {

                    // 지도의  레벨을 얻어옵니다
                    var level = map.getLevel();

                    // 지도의 중심좌표를 얻어옵니다 
                    var latlng = map.getCenter(); 

                    var message = '<p>지도 레벨은 ' + level + ' 이고</p>';
                    message += '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';

                    var resultDiv = document.getElementById('result');
                    resultDiv.innerHTML = message;
                    });
                });
            });

            // 예약 버튼 활성화/비활성화 ----------------------------------------------------------
            $(function(){
                $('#book-btn').click(function(){
                    if($('#content3-3').css('visibility') == 'hidden'){
                        $('#content3-3').css('visibility', 'visible')
                    }else{
                        $('#content3-3').css('visibility', 'hidden')
                    }
                });
            });


            // 시간 선택 버튼 생성 -------------------------------------------------------------------------------------
            $(function(){
                const open = parseInt($('#open').text().replace(/[:]/g, ""));
                const close = $('#close').text().replace(/[:]/g, "");
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
            });

            // 브레이크 타임 속성 적용
            $(function(){
                const breakS = $('#breakS').text().replace(/[:]/g, "")
                const breakE = $('#breakE').text().replace(/[:]/g, "")
                if(breakS != null){
                    $('#am-box, #pm-box').children().each(function(){
                        if($(this).text().replace(/[:]/g, "") >= breakS && $(this).text().replace(/[:]/g, "") <= breakE){
                            $(this).attr('class', 'book-time-btn btn btn-outline-secondary');
                            $(this).attr('disabled', true);
                        }
                    })
                }
            })
            
            

            
        </script>
        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>