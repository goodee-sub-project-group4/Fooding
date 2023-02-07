<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.fd.restaurant.model.vo.Restaurant, com.fd.book.model.vo.Book
			   , java.util.ArrayList"%>
<%
	ArrayList<Book> book = (ArrayList<Book>)request.getAttribute("book");
%>

<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#content2-padding {
	width: 900px;
	height: 2000px;
	margin: auto;
	margin-top: 45px;
	padding: 20px;
	box-sizing: border-box;
	float: left;
}

#selectList {
	width: 100%;
	height: 100px;
	font-size: 30px;
	margin-bottom: 20px;
	display: inline-block;
	text-align: center;
}

#selectDate {
	width: 100px;
	height: 35px;
	margin-top: 5px;
	margin-right: 5%;
	float: right;
	font-size: 15px;
}

.selectList-main {
	width: 95%;
	display: inline-block;
	margin-left: 2.5%;
	margin-bottom: 50px;
}

.selectList-no {
	width: 5%;
	height: 200px;
	float: left;
	line-height: 200px;
	text-align: center;
	margin-right: 15px;
}

.selectList-img {
	width: 180px;
	height: 200px;
	float: left;
}

.selectList-text {
	width: 350px;
	height: 200px;
	padding-top: 5px;
	padding-left: 15px;
	float: left;
}

.selectList-btn {
	width: 220px;
	height: 200px;
	padding-top: 30px;
	float: right;
	position: relative;
}

.selectList-btn button {
	margin-bottom: 25px;
	height: 55px;
}

.allways-btn {
	float: right;
	width: 100px;
	margin-right: 15px;
}

.service-complete-btn {
	display: block;
}

/* 예약리스트 페이징 */
.paging {
	height: 50px;
	text-align: center;
	padding-top: 20px;
}

/* 리뷰쓰기모달 */
.modal fade {
	border: none;
}

.modal-header1 {
	padding: 30px;
	border: none;
}

.modal-title b {
	margin-left: 20px;
}

.close {
	margin-top: -80px;
}

/* content2 */
.review-content2 {
	height: 200px;
	position: relative;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	margin-top: -45px;
}

#review-content2-1 {
	height: 100%;
	width: 18%;
}

#review-content2-2 {
	height: 100%;
	width: 50%;
	position: absolute;
	top: 0px;
	left: 25%;
}

#review-content2-3 {
	height: 100%;
	width: 20%;
	position: absolute;
	top: 0px;
	left: 80%;
}

/* content2 내용 */
#review-content2-1 img {
	margin: 20px;
}

#review-content2-2 div {
	margin-top: 40px;
}

#review-content2-2-1 {
	height: 15%;
	font-size: 23px;
	font-weight: 600;
	margin-top: 50px;
}

#review-content2-3 p {
	width: 70px;
	position: absolute;
	top: 150px;
	right: 65px;
}

#review-content2-3 select {
	height: 13%;
	position: absolute;
	top: 150px;
	right: 20px;
}

/* content3 */
.review-content3 {
	height: 230px;
	position: relative;
}

#review-content3-1 {
	height: 100%;
	width: 15%;
}

#review-content3-2 {
	height: 100%;
	width: 85%;
	position: absolute;
	top: 0px;
	right: 0px;
}

/* content3 내용 */
#review-content3-1 p, #review-content5-1 p {
	margin: 20px;
	font-weight: 600;
	font-size: 15px;
}

#review-content3-2 textarea {
	margin-left: 40px;
	height: 90%;
	width: 540px;
	margin-top: 20px;
	border-radius: 5px;
}

/* content4 */
.review-content4 {
	height: 340px;
	position: relative;
}

#review-content4-1 {
	height: 100%;
	width: 15%;
}

#review-content4-1 p {
	margin: 20px;
	font-size: 16px;
	font-weight: 600;
}

#review-content4-2 {
	height: 100%;
	width: 85%;
	position: absolute;
	top: 0px;
	left: 15%;
	padding: 20px;
}

#review-content4-2 p {
	color: rgb(190, 190, 190);
	font-size: 13px;
	margin-top: 10px;
	padding-left: 20px;
}

#review-content4-2 img {
	margin: 20px;
	margin-top: 10px;
}

/* content5 */
#review-content5 {
	width: 60px;
	margin: auto;
	padding-top: 30px;
}

/* 문의하기모달 */
.modal-header {
	padding: 30px;
	border: none;
}

/* content2 */
.question-content2 {
	height: 200px;
	position: relative;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	margin-top: -25px;
}

#question-content2-1 {
	height: 100%;
	width: 18%;
}

#question-content2-2 {
	height: 100%;
	width: 50%;
	position: absolute;
	top: 0px;
	left: 25%;
}

/* content5 */
.question-content5 {
	height: 60px;
	position: relative;
}

#question-content5-1 {
	height: 100%;
	width: 15%;
}

#question-content5-2 {
	height: 100%;
	width: 85%;
	position: absolute;
	top: 0px;
	right: 0px;
}

#question-content5-1 p {
	position: absolute;
	top: 25px;
	left: 20px;
	font-weight: 600;
	font-size: 15px;
}

#question-content5-2 input {
	margin-left: 40px;
	height: 70%;
	width: 540px;
	margin-top: 20px;
	border-radius: 5px;
}

/* content2 내용 */
#question-content2-1 img {
	margin: 20px;
}

#question-content2-2 div {
	margin-top: 40px;
}

#question-content2-2-1 {
	height: 15%;
	font-size: 23px;
	font-weight: 600;
	margin-top: 50px;
}

/* content3 */
.question-content3 {
	height: 230px;
	position: relative;
}

#question-content3-1 {
	height: 100%;
	width: 15%;
}

#question-content3-2 {
	height: 100%;
	width: 85%;
	position: absolute;
	top: 0px;
	right: 0px;
}

#question-content3-1 p {
	position: absolute;
	top: 25px;
	left: 20px;
	font-weight: 600;
	font-size: 15px;
}

#question-content3-2 textarea {
	margin-left: 40px;
	height: 90%;
	width: 540px;
	margin-top: 20px;
	border-radius: 5px;
}

/* content4 */
.question-content4 {
	height: 340px;
	position: relative;
}

#question-content4-1 {
	height: 100%;
	width: 15%;
}

#question-content4-1 p {
	margin: 20px;
	font-size: 16px;
	font-weight: 600;
}

#question-content4-2 {
	height: 100%;
	width: 85%;
	position: absolute;
	top: -20px;
	left: 15%;
	padding: 20px;
}

#question-content4-2 p {
	color: rgb(190, 190, 190);
	font-size: 13px;
	margin-top: 10px;
	padding-left: 20px;
}

#question-content4-2 img {
	margin: 20px;
	margin-top: 10px;
}

/* content5 */
#question-content5 {
	width: 60px;
	margin: auto;
	padding-top: 30px;
}
</style>

</head>

<body>

	<%@ include file="/views/common/head.jsp"%>
	<%@ include file="/views/common/myPageSidebar.jsp"%>

	<div id="content2-padding">
		<div id="selectList">
			<b>예약/결제내역 조회</b> <br> <select name="selectDate" id="selectDate">
				<option value="oneM">1개월</option>
				<option value="threeM">3개월</option>
				<option value="sixM">6개월</option>
				<option value="oneY">1년</option>
			</select>
		</div>
		<% if(!book.isEmpty()) { %>
			<% for(Book b : book) { %>
				<div class="selectList-main">
					<b style="font-size: larger;">결제일시 &nbsp;&nbsp;&nbsp; <%= b.getBookA() %></b>
					<hr
						style="display: block; margin-top: 5px; margin-bottom: 30px; background: black; height: 2px;">
		
					<div>
						<div class="selectList-no" style="font-size: 20px;"><%= b.getBookNo() %></div>
						<img src="<%= b.getrImg() %>" alt="" class="selectList-img">
						<div>
							<div class="selectList-text">
		
								<table>
									<tr>
										<th style="width: 80px; height: 70px;">업체명</th>
										<td style="width: 250px;" class="ResName"><%= b.getResName() %></td>
									</tr>
									<tr>
										<td style="height: 40px;">예약일시</td>
										<td><%= b.getBookDate() %> <%= b.getBookTime() %></td>
									</tr>
									<tr>
										<td style="height: 40px;">예약인원</td>
										<td><%= b.getPeople() %>명</td>
									</tr>
									<tr>
										<td style="height: 40px;">결제금액</td>
										<td><%= b.getPayTotal() %>원</td>
									</tr>
								</table>
							</div>
							<div class="selectList-btn">
								<div class="allways-btn">
									<div>
										<button type="button" class="btn btn-outline-secondary select">상세조회</button>
									</div>
									<div>
										<button type="button" class="btn btn-outline-secondary">문의하기</button>
									</div>
								</div>
								<% if(b.getStatus() == "B") { %>
								<div class="service-complete-btn">
									<div>
										<button id="<%= b.getResNo() %>" type="button" class="btn btn-outline-danger review"
											data-toggle="modal" data-target="#reviewModal">리뷰쓰기</button>
									</div>
									<div>
										<button type="button" class="btn btn-outline-danger">신고하기</button>
									</div>
								</div>
								<% } %>
							</div>
						</div>
					</div>
				</div>
			<% } %>
		<% } %>
		<script>
			$(function(){
				$('.select').click(function(){
					let bookNo = $(this).parent().parent().parent().parent().prev().prev().text()
					$('#bookNo').attr('value', bookNo);
					location.href = "<%= contextPath %>/checkDetail.bo?bookNo="+bookNo
				})
			})
		</script>

		<br>
		<br>
		
	</div>

	<script>
		$('.btn.btn-outline-danger.review').click(function(){
			const resName = $(this).parent().parent().parent().prev().children().children().children().eq(0).children().eq(1).text();
			const imgSrc = $(this).parent().parent().parent().parent().prev().attr('src');
			const bookNo = $(this).parent().parent().parent().parent().prev().prev().text();
			const a = $('#review-content2-1').children().attr('src', imgSrc);

			console.log(bookNo)
			$('#review-content2-2').text(resName);
			$('#bookNo').val(bookNo);
		}); 
	</script>

	<!-- 리뷰쓰기모달  -->
	<!-- The Modal -->
	<div class="modal fade" id="reviewModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header1">
					<h3 class="modal-title">
						<b>리뷰</b>
					</h3>
					<br>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<form action="<%=contextPath%>/reviewForm.me" id="review-form"
					method="post" enctype="multipart/form-data">
					<input id="bookNo" type="hidden" name="bookNo" value="">	
					<div class="modal-body"></div>
					<div class="review-content2">
						<div id="review-content2-1">
							<img src="" width="130" height="160">
						</div>
						<!-- 업체이미지 가져와야함 -->
						<div id="review-content2-2">
							<div id="review-content2-2-1"></div>
							<!-- 업체명 가져와야함  -->
							
						<script>
							$(function(){
								$('#review-content2-1')
							})
						</script>
						</div>
						<div id="review-content2-3">
							<p>★ 별점</p>
							<select name="star" id="star">
								<option value="1.0">1.0</option>
								<option value="1.5">1.5</option>
								<option value="2.0">2.0</option>
								<option value="2.5">2.5</option>
								<option value="3.0">3.0</option>
								<option value="3.5">3.5</option>
								<option value="4.0">4.0</option>
								<option value="4.5">4.5</option>
								<option value="5.0" selected>5.0</option>
							</select>
						</div>
					</div>
					<div class="review-content3">
						<div id="review-content3-1">
							<p>내용</p>
						</div>
						<div id="review-content3-2">
							<textarea name="reviewContent" style="resize: none" required></textarea>
						</div>
					</div>
					<div class="review-content4">
						<div id="review-content4-1">
							<p>사진첨부</p>
						</div>
						<div id="review-content4-2">
							<img id="img1" src="" width="150" height="150"
								onclick="clickFile(1);"> <img id="img2" src="" width="150"
								height="150" onclick="clickFile(2);"> <img id="img3"
								src="" width="150" height="150" onclick="clickFile(3);">

							<div id="file-area" style="display: none">
								<input type="file" name="file1" onchange="loadImg(this, 1);">
								<input type="file" name="file2" onchange="loadImg(this, 2);">
								<input type="file" name="file3" onchange="loadImg(this, 3);">
							</div>

							<br>
							<p>
								- 사진은 최대 8 장까지, 30 MB 이하의 이미지만 업로드가 가능합니다. <br> - 상품과 무관하거나
								반복되는 동일 단어 / 문장을 사용하여 후기로 볼 수 없는 <br>&nbsp 글, 판매자와 고객의 후기
								이용을 방해한다고 판단되는 경우, 배송 박스, 구매 <br>&nbsp 상품을 구분할 수 없는 전체 사진,
								화면캡쳐, 음란 및 부적절하 거나 불법적인 <br>&nbsp 내용은 통보없이 삭제 및 적립금 회수될 수
								있습니다. <br> - 전화번호, 이메일, 주소, 계좌번호 등 개인정보가 노출되지 않도록 주의해 주<br>&nbsp세요.
								<br>
							</p>
						</div>
					</div>
					<br>

					<!-- Modal footer -->
					<div class="modal-footer" style="border: none;">
						<input type="submit" class="btn btn-danger" style="width: 90px;"
							value="등록">
					</div>
					<br>
				</form>

				<!-- 사진첨부 스크립트 -->
				<script>
					// 클릭했을 때 파일첨부 가능
					function clickFile(num) {
						$("input[name=file" + num + "]").click();
					}

					// inputFile : input type="file" 요소객체 / num : input요소에 변화가 생겼는지 구분숫자(해당 img 영역)
					function loadImg(inputFile, num) {

						if (inputFile.files.length == 1) { // 파일이 있다면 미리보기
							// 파일 읽을 FileReader 객체생성
							const reader = new FileReader();
							// 파일 읽어들이는 메소드 실행
							reader.readAsDataURL(inputFile.files[0]);
							// 이 파일만의 고유한 url 부여됨

							// 읽기 완료. 실행할 함수
							reader.onload = function(e) {
								// e.target.result : url 경로
								switch (num) {
								case 1:
									$("#img1").attr("src", e.target.result);
									break;
								case 2:
									$("#img2").attr("src", e.target.result);
									break;
								case 3:
									$("#img3").attr("src", e.target.result);
									break;
								}
							}

						} else { // 미리보기 취소
							switch (num) {
							case 1:
								$("#img1").attr("src", null);
								break;
							case 2:
								$("#img2").attr("src", null);
								break;
							case 3:
								$("#img3").attr("src", null);
								break;
							}

						}

					}
				</script>
			</div>
		</div>
	</div>
	</div>


</body>

</html>