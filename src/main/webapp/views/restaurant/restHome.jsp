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
		
		.more { /*더보기버튼*/
			float:right;
			margin-top:25px;
			font-size: 17px;
		}
		#area1 span img { /*더보기버튼*/
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

	</style>
	
</head>
<body>

	<%@ include file="restHead.jsp" %>
	
	<div id="outer2">
		<div id="menubar">
			<%@ include file="restMenubar.jsp" %>
		</div>
		<div id="content">
			<!-- 컨텐츠 작성부 -->			
			<div id="area1">
				<div>
					
					<h3>신규예약건 </h3> <span class="badge">2</span>
					<span class="more">더보기 <img src="../../resources/images/more.png" width="25"></span>
					
					<div class="alert alert-secondary">
						<strong>Success!</strong> Indicates a successful or positive action.
						<button type="button" class="btn btn-outline-danger">조회</button>
					</div>
					<div class="alert alert-secondary">
						<strong>Success!</strong> Indicates a successful or positive action.
					</div>
					<div class="alert alert-secondary">
						<strong>Success!</strong> Indicates a successful or positive action.
					</div>
				</div>
				<div>
					<h3>이달의 스케줄 </h3> <span class="more">더보기 <img src="../../resources/images/more.png" width="25"></span>

				</div>
			</div>
			<div id="area2">
				<h3>미답변문의</h3> <span class="badge">4</span>
				<span class="more">더보기 <img src="../../resources/images/more.png" width="25"></span>
				<br clear="both">
				<div class="alert alert-secondary">
					<strong>Success!</strong> Indicates a successful or positive action.
				</div>
				<div class="alert alert-secondary">
					<strong>Success!</strong> Indicates a successful or positive action.
				</div>
			</div>
			<div id="area3">
				<h3>리뷰</h3> <span class="badge">5</span>
				<span class="more">더보기 <img src="../../resources/images/more.png" width="25"></span>
				<br clear="both">
				<div class="alert alert-secondary">
					<strong>Success!</strong> Indicates a successful or positive action.
				</div>
				<div class="alert alert-secondary">
					<strong>Success!</strong> Indicates a successful or positive action.
				</div>
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


			// Menubar.jsp 내의 요소, 스타일이 include시 바뀌는 버그를 수정하기 위한 코드(건들필요X)
			$('#page-name').css({"font-size":"28px", "font-weight":600, "margin-left":"10px", "margin-top":"5px"});
		})
	</script>
</body>
</html>