<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	694ae779a7a7935c84a1e22edd5c5d87"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<style>
	/* 상세예약 헤더 영역 */
    #detail-main{width: 900px; height: 2000px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float: left;}
    #detail-head1{width: 100%; font-size: 25px; margin-bottom: 20px; display: inline-block;}
	#detail-head2{width: 100%; font-size: 15px; display: block; text-align: right;}

	/* 카카오 지도 api */
	#map{width: 300px; height: 250px; float: left;}

	/* 상세정보 공통 */
	#detail-content1, #detail-content2, #detail-content3{padding: 20px; float: left;}
	.detail-index{font-size: 25px;}
	/* 식당 상세정보 */
	#content1-text1{width: 500px; height: 250px; margin-top: 30px; text-align: right; float: left; padding-left: 25px;}
	#content1-text2{width: 900px; float: left; padding: 5px; font-size: 20px;}

	/* 메뉴정보 */
	.detail-menu{width: 800px; height: 100%; padding-left: 5px; margin-bottom: 15px;}
	.detail-menuName{width: 100%; float: left; font-size: 20px;}
	.detail-menuPrice{width: 100%; float: right; margin-bottom: 5px; text-align: right; font-size: 25px;}
	.detail-line{width: 100%; height: 1px; background-color: gainsboro; float: right; margin-bottom: 15px;}

	/* 결제정보 */
	#detail-content3{width: 100%; display: block; margin-bottom: 50px;}
	#detail-payment{width: 100%; float: right; text-align: right;}
	
	/* 예약취소 버튼 */
	#btn{display: block; margin: auto;}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="/views/common/head.jsp" %>
	<!-- 마이페이지 사이드바 -->
	<%@ include file="/views/common/myPageSidebar.jsp" %>

	<div id="detail-main">
        <b id="detail-head1">&nbsp;&nbsp;예약/결제내역 상세조회</b>
		<b id="detail-head2">no. &nbsp; (예약번호) &nbsp;&nbsp;/&nbsp;&nbsp; 결제일시 &nbsp; 2023.01.01 &nbsp;&nbsp;</b>
        <hr style="display: block; margin-top: 5px; margin-bottom: 30px; background: black; height: 2px;">
		<div id="detail-content1">
			<b class="detail-index">식당정보</b>
			<br>
			<div id="map" style="margin-top: 15px;"></div>
			<div id="content1-text1">
				<b>식당명</b> &nbsp;&nbsp; <b style="font-size: 30px;">미오 도쿄 다이닝</b>
				<br><br>
				서울 성동구 연무장 5가길 7 현대 테러스타워 1층 117호
				<br><br>
				0507-1490-2120
			</div>
			<br><br>
			<div id="content1-text2">
				<table>
					<tr>
						<th style="width: 75px;">예약자</th>
						<td style="width: 200px;">홍길동</td>
						<th style="width: 75px;">연락처</th>
						<td style="width: 200px;">010-1234-5678</td>
						<th style="width: 100px;">예약날짜</th>
						<td>2023-01-01 17:30</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="3" >naver@naver.com</td>
						<th>예약인원</th>
						<td style="text-align: right;">1명</td>
					</tr>
				</table>
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
		</div>
		<div id="detail-content2">
			<b class="detail-index">예약메뉴</b>
			<br><br>
			<div class="detail-menu">
				<div class="detail-menuName">1. 도쿄 수제 함바그 고젠</div>
				<div class="detail-menuPrice">12,000 원</div>
				<div class="detail-line"></div>
			</div>
			<div class="detail-menu">
				<div class="detail-menuName">2. 치킨 스테이크 고젠</div>
				<div class="detail-menuPrice">25,000 원</div>
				<div class="detail-line"></div>
			</div>
			<div>
				<div style="width: 50%; float: left; font-size: 25px;">합 계</div>
				<div style="width: 50%; float: right; text-align: right; font-size: 25px;">37,000 원</div>
			</div>
		</div>
		<div id="detail-content3">
			<b class="detail-index">결제내역</b>
			<br><br>
			<b>결제방법 - 카드결제</b>
			<div id="detail-payment">
				~~~~~~ <br>
				~~~~~~ <br>
				~~~~~~ <br>
			</div>
			<br>
			<b>적립금내역</b>
			<br><br>
			<table style="width: 100%; font-size: 20px;">
				<tr>
					<td style="width: 50%;">적립금 사용</td>
					<td style="width: 50%; text-align: right;">- 0 원</td>
				</tr>
				<tr>
					<td>적립</td>
					<td style="text-align: right;">+ 250 원</td>
				</tr>
				<tr>
					<td>적립금 잔액</td>
					<td style="text-align: right;">1,283 원</td>
				</tr>
			</table>
			<br>
			<div style="background-color: whitesmoke; width: 100%; height: 50px; line-height: 50px; float: left;">
				<div style="width: 50%; float: left; font-size: 25px;">합 계</div>
				<div style="width: 50%; float: right; text-align: right; font-size: 25px;">37,000 원</div>
			</div>
		</div>
		<div style="width: 100%; height: 150px; margin-top: 50px;">
			<button type="button" id="btn" class="btn btn-outline-danger btn-lg">예약취소</button>
		</div>
	</div>
</body>
</html>