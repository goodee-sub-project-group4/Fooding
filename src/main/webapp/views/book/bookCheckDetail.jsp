<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fd.book.model.vo.Book, com.fd.book.model.vo.BookMenu"%>
<%@ page import="java.util.ArrayList" %>
<%
	Book book = (Book)request.getAttribute("book");
	ArrayList<BookMenu> bookMenu = (ArrayList<BookMenu>)request.getAttribute("bookMenu");
	int point = (int)request.getAttribute("point");
%>
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
	.menu-details{width: 800px; min-height: 50px; max-height: 300px; overflow-y: auto; margin-top: 20px; margin-bottom: 15px;}
	.menu-one{width: 800px; height: 20px; margin-bottom: 15px;}
	.detail-menuName{width: 70%; float: left; font-size: 15px;}
	.detail-menuCount{width: 5%; float: left; font-size: 15px;}
	.detail-menuPrice{width: 25%; float: left; text-align: right; font-size: 20px; line-height: 20px;}
	#detail-content3{width: 100%; background-color: whitesmoke; margin-top: 30px; margin-bottom: 50px;}

	/* 결제정보 */
	#detail-content4{width: 100%; display: block; margin-bottom: 50px;}
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
		<% if(book.getStatus().equals("C")) { %>
		<!-- 예약 취소 -->
		<b style="font-size: 30px; color: crimson;">취소 처리된 예약입니다</b>
		<br><br>
			<!-- 업체 취소 -->
			<!-- <b style="font-size: 20px;">&lt;취소 사유 : 업체 취소&gt;</b> -->
			<!-- 사용자 취소 -->
			<!-- <b style="font-size: 20px;">&lt;취소 사유 : 사용자 취소&gt;</b> -->
		<% }else if(book.getStatus().equals("D")){ %>
		<!-- 이용 완료 -->
		<b style="font-size: 30px; color: dodgerblue;">이용 완료된 예약입니다</b>
		<% }else{ %>
        <b id="detail-head1">&nbsp;&nbsp;예약/결제내역 상세조회</b>
        <% } %>
		
		<b id="detail-head2">no. &nbsp; <%= book.getBookNo() %> &nbsp;&nbsp;/&nbsp;&nbsp; 결제일시 &nbsp; <%= book.getPayDate() %> &nbsp;&nbsp;</b>
        <hr style="display: block; margin-top: 5px; margin-bottom: 30px; background: black; height: 2px;">
		<div id="detail-content1">
			<b class="detail-index">식당정보</b>
			<br>
			<div id="map" style="margin-top: 15px;"></div>
			<div id="content1-text1">
				<b>식당명</b> &nbsp;&nbsp; <b style="font-size: 30px;"><%= book.getResName() %></b>
				<br><br>
				<%= book.getAddress() %>&nbsp;<%= book.getdAddress() %>
				<br><br>
				<%= book.getResPhone() %>
			</div>
			<br><br>
			<div id="content1-text2">
				<table>
					<tr>
						<th style="width: 75px;">예약자</th>
						<td style="width: 200px;"><%= book.getBookName() %></td>
						<th style="width: 75px;">연락처</th>
						<td style="width: 200px;"><%= book.getBookPhone() %></td>
						<th style="width: 100px;">예약날짜</th>
						<td><%= book.getBookDate() %>&nbsp;<%= book.getBookTime() %></td>
					</tr>
					<tr>
						<% if(book.getEmail() != "") { %>
						<th>이메일</th>
						<td colspan="3" ><%= book.getEmail() %></td>
						<% } %>
						<th>예약인원</th>
						<td style="text-align: right;"><%= book.getPeople() %>명</td>
					</tr>
				</table>
			</div>


			<script>
				// 카카오 지도 api ---------------------------------------------------------------------- 
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(<%=book.getLatitude() %>, <%=book.getLongtitude()%>), // 지도의 중심좌표
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
					position: new kakao.maps.LatLng(<%=book.getLatitude() %>, <%=book.getLongtitude()%>), // 마커의 좌표
					map: map // 마커를 표시할 지도 객체
				});

				// 마커 위에 표시할 인포윈도우를 생성한다
				var infowindow = new kakao.maps.InfoWindow({
					content : '<div style="padding:5px;"><%= book.getResName() %></div>' // 인포윈도우에 표시할 내용
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
			</script>
		</div>
		<div id="detail-content2">
			<b class="detail-index">예약메뉴</b>
			<div class="menu-details">
				<% if(!bookMenu.isEmpty()) { %> 
					<% for(BookMenu bm : bookMenu) { %>
						<div class="menu-one">
							<div class="detail-menuName"><%= bm.getMenuName() %></div>
							<div class="detail-menuCount"><%= bm.getMenuCount() %> 개</div>
							<div class="detail-menuPrice"><%= bm.getMenuCount() * bm.getPrice() %> 원</div>
						</div>
					<% } %>
				<% } %>
			</div>
			<div id="detail-price">
				<div style="width: 50%; float: left; font-size: 25px;">합 계</div>
				<div style="width: 50%; float: right; text-align: right; font-size: 25px;"><%= book.getPayTotal() %> 원</div>
			</div>
		</div>
		<div id="detail-content3">
			<% if(book.getStatus().equals("C")) { %>
				<b class="detail-index" style="color: crimson">취소내역</b>
				<br><br>
				<b>결제방법 - 카드결제</b>
				<br>
				<b>적립금 취소 내역</b>
				<br><br>
			<% } else { %>
				<b class="detail-index">결제내역</b>
				<br><br>
				<b>결제방법 - 카드결제</b>
				<br>
				<b>적립금내역</b>
				<br><br>
			<% } %>
			<table style="width: 100%; font-size: 20px;">
				<% if(book.getStatus().equals("C")) { %>
				<tr>
					<td style="width: 50%;">적립금 사용 취소</td>
					<td style="width: 50%; text-align: right;">+ <%= book.getPayPoint() %> 원</td>
				</tr>
				<tr>
					<td>적립 취소</td>
					<td style="text-align: right;">- <%= book.getPayTotal() / 100 %> 원</td>
				</tr>
				<tr>
					<td>적립금 잔액</td>
					<td style="text-align: right;"><%= book.getPointNow() %> 원</td>
				</tr>
				<% }else{ %>
				<tr>
					<td style="width: 50%;">적립금 사용</td>
					<td style="width: 50%; text-align: right;">- <%= book.getPayPoint() %> 원</td>
				</tr>
				<tr>
					<td>적립</td>
					<td style="text-align: right;">+ <%= book.getPayTotal() / 100 %> 원</td>
				</tr>
				<tr>
					<td>적립금 잔액</td>
					<td style="text-align: right;"><%= book.getPointNow() %> 원</td>
					
				</tr>
				<% } %>
			</table>
			<br>
			<div class="" style="background-color: whitesmoke; width: 100%; height: 50px; line-height: 50px; float: left;">
				<% if(book.getStatus().equals("C")) { %>
					<!-- 결제 취소 -->
					<div style="width: 50%; float: left; font-size: 25px;">결제 취소</div>
					<div style="width: 50%; float: right; text-align: right; font-size: 25px;">-&nbsp;<%= book.getPayTotal() %> 원</div>
				<% }else{ %>
					<div style="width: 50%; float: left; font-size: 25px;">결제 금액</div>
					<div style="width: 50%; float: right; text-align: right; font-size: 25px;"><%= book.getPayTotal() %> 원</div>
				<% } %>
			</div>
		</div>
		<div style="width: 100%; height: 150px; margin-top: 50px;">
			<% if(book.getStatus().equals("B")) { %>
				<form action="<%= contextPath %>/cancel.bo">
					<button type="submit" id="btn" class="btn btn-outline-danger btn-lg">예약취소</button>
					<input type="hidden" name="bookNo" value="<%= book.getBookNo() %>">
					<input type="hidden" name="pointNow" value="<%= book.getPointNow() %>">
					<input type="hidden" name="payPoint" value="<%= book.getPayPoint() %>">
					<input type="hidden" name="savePoint" value="<%= book.getPayTotal() / 100 %>">
				</form>
			<% } %>
		</div>
	</div>
</body>
</html>