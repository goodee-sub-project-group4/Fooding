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
		#outer2>iframe {
			border-width:0px;
			width:100%;
			height: 100%;
			z-index: 1000;
			position: absolute;
		}
		#content {
			/* border: 3px solid blue; */
			width:950px;
			display: inline-block;
			box-sizing: border-box;
			position:absolute;
			right:10px;
		}
		/* ↓↓↓ 컨텐츠용 스타일 */
		#content {
			display: inline-block;
		}
		#content>div {
			/* border: 3px solid green; */
			width:100%;
			box-sizing:border-box;
		}
		#area1 {
			height:400px
		}
		#area1 h3 {
			font-size: 24px;
			font-weight: 700;
			margin-bottom: 20px;
			display: inline-block;
		}
		#area1 span {
			float:right;
			margin-top:5px;
			font-size: 17px;
		}
		#area1 span img {
			margin-bottom:5px;
		}
		#area1>div {
			width:50%;
			height:100%;
			/* border: 3px solid pink; */
			box-sizing: border-box;
			float:left;
			padding:30px;
		}
		#area1 .alert {
			margin:auto;
			height: 80px;
			margin-top: 12px;

		}
		#area2, #area3 {
			height:200px			
		}

	</style>
</head>
<body>
	<%@ include file="restHead.jsp" %>
	<div class="container">
		<h2>Badges</h2>
		<a href="#">News <span class="badge">5</span></a><br>
		<a href="#">Comments <span class="badge">10</span></a><br>
		<a href="#">Updates <span class="badge">2</span></a>
	  </div>
	  
	<div id="outer2">
		<iframe src="restMenubar.jsp"></iframe>
		<div id="content">
			<!-- 컨텐츠 작성부 -->
			
			<div id="area1">
				<div>
					<h3>신규예약건</h3>
					<span>더보기 <img src="../../resources/images/more.png" width="25"></span>
					<div class="alert alert-secondary">
						<strong>Success!</strong> Indicates a successful or positive action.
					</div>
					<div class="alert alert-secondary">
						<strong>Success!</strong> Indicates a successful or positive action.
					</div>
					<div class="alert alert-secondary">
						<strong>Success!</strong> Indicates a successful or positive action.
					</div>
				</div>
				<div>
					<h3>이달의 스케줄</h3>
				</div>
			</div>
			<div id="area2"></div>
			<div id="area3"></div>
			
		</div>
	</div>
	<script>
		$(function(){
			$('#title').text("");
		})
	</script>
</body>
</html>