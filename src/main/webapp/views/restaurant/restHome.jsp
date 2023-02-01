<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* ↓↓↓ 기본골격용 스타일들 */
		#outer2 {
			width:1200px;
			height: 800px;
			position: relative;
			margin:auto;
		}			
		
		#content {
			width:950px;
			display: inline-block;
			box-sizing: border-box;
			position:absolute;
			right:10px;
		}
		#menubar {
			width:200px;
			height: 100%;
			z-index: 1000;
			position: absolute;
		}
		#footer {
			width:1200px;
			margin:auto;
		}

		/* ↓↓↓ 컨텐츠용 스타일 */
		#content {
			display: inline-block;
		}
		#content>div {
			width:100%;
			box-sizing:border-box;
		}
		#area1 {
			height:400px
		}
		#area1 h3, #area2 h3, #area3 h3 {
			font-size: 24px;
			font-weight: 700;
			margin-bottom: 20px;
			display: inline-block;
		}
		
		.more { /*더보기 큰버튼*/
			float:right;
			font-size: 17px;
		}
		#area1 span img { /*더보기 큰버튼*/
			margin-bottom:5px;
		}
		#area1>div {
			width:50%;
			height:100%;
			box-sizing: border-box;
			float:left;
			padding:30px;
		}
		#area1 .alert {
			margin:auto;
			height: 80px;
			margin-top: 12px;
			background-color:whitesmoke;
			border-color: whitesmoke;
		}
		#area2 .alert, #area3 .alert {
			width:350px;
			height:150px;
			display:inline-block;
			margin-right: 30px;
			background-color:whitesmoke;
			border-color: whitesmoke;
			padding:20px;
		}
		#area2, #area3 {
			height:280px;
			padding:30px;			
		}
		.badge {
			background-color: crimson;
			font-size: 18px;
			position:relative;
			bottom:4px;
		}
		
		#calendar-area {
			/* border:1px solid pink; */
			width:100%;
			margin-top: 30px;
		}

		.user { /*신규예약건-유저아이콘*/
			width:50px;
			margin-left:10px
		}
		.alert button { /*신규예약건-조회버튼*/
			margin-left: 10px;
			/* line-height: 100%; */
			position: relative;
			bottom:2px;
		}
		.book-date { /*신규예약건-예약날짜*/
			font-weight: 700;
			color:rgb(77, 77, 77);
			margin-left: 10px;
		}
		.booker { /*신규예약건-예약자*/
			margin-left: 10px;			
		}
		#area2 p, #area3 p { /* . . . . . */
			display: inline-block;
			font-size: 100;
			font-weight: 900;
			color:rgb(69, 69, 69);
			position: relative;
			bottom:20px;
		}
		
		.title {
			font-weight: 900;
			color:rgb(69, 69, 69);
		}
		.content {
			display: inline-block;
			margin-top: 10px;
		}
		.create-date {
			float:right;
			margin-top: 10px;
		}


	</style>
	
</head>
<body>

	<%@ include file="head.jsp" %>
	
	<div id="outer2">
		<div id="menubar">
			<%@ include file="menubar.jsp" %>
		</div>
		<div id="content">
			<!-- 컨텐츠 작성부 -->			
			<div id="area1"><br>
				<div>					
					<h3>신규예약건 </h3> <span class="badge">2</span>
					<span class="more">더보기 <img src="resources/images/more.png" width="25"></span>
					
					<div class="alert alert-secondary">
						<img class="user" src="/Fooding/resources/images/userIcon3.png">
						<span class="book-date">2023-02-07 15:00</span>
						<span class="booker">강개순</span>
						<span>(3명)</span>
						<button type="button" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button>
					</div>
					<div class="alert alert-secondary">
						<img class="user" src="/Fooding/resources/images/userIcon3.png">
						<span class="book-date">2023-02-07 15:00</span>
						<span class="booker">강백호</span>
						<span>(5명)</span>
						<button type="button" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button>
					</div>
					<div class="alert alert-secondary">
						<img class="user" src="/Fooding/resources/images/userIcon3.png">
						<span class="book-date">2023-02-07 15:00</span>
						<span class="booker">서태웅</span>
						<span>(1명)</span>
						<button type="button" class="btn btn-sm btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button>
					</div>
				</div>
				<div>
					<h3>이달의 스케줄 </h3> <span class="more">더보기 <img src="resources/images/more.png" width="25"></span>
					<div id="calendar-area" align="center">
						<%@ include file="calendarSmall.jsp" %>
					</div>

				</div>
			</div>
			<div id="area2">
				<h3>미답변문의</h3> <span class="badge">4</span>
				<span class="more">더보기 <img src="resources/images/more.png" width="25"></span>
				<br clear="both">
				<div class="alert alert-secondary">
					<span class="title">애견 동반 가능한가요?</span><br>
					<span class="content">문의/리뷰 내용...어쩌고저쩌고<br>두줄까지표현가능</span><br>
					<span class="create-date">2023-01-01</span>
				</div>
				<div class="alert alert-secondary">
					<span class="title">애견 동반 가능한가요?</span><br>
					<span class="content">문의/리뷰 내용...어쩌고저쩌고<br>두줄까지표현가능</span><br>
					<span class="create-date">2023-01-01</span>
				</div>
				<p>. . . . .</p>
			</div>
			<div id="area3">
				<h3>리뷰</h3> <span class="badge">1</span>
				<span class="more">더보기 <img src="resources/images/more.png" width="25"></span>
				<br clear="both">
				<div class="alert alert-secondary">
					<span class="title">애견 동반 가능한가요?</span><br>
					<span class="content">문의/리뷰 내용...어쩌고저쩌고<br>두줄까지표현가능</span><br>
					<span class="create-date">2023-01-01</span>
				</div>
				
				<p>. . . . .</p>
			</div>
			
		</div>
	</div>
	<br clear="both">
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			$('#title').text("");

		})
	</script>
</body>
</html>