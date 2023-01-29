<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#outer2 {
			width:1200px;
			position: relative;
			margin:auto;
		}		
		#footer {
			width:1200px;
			margin:auto;
		}
		.guide {
			text-align: center;
			color:gray;
			font-size: 20px;
		}
		.menu-box {
			/* border: 1px solid green; */
			width:600px;
			height:220px;
			position:relative;
			margin:auto;
			margin-top: 40px;
		}
		.text-box {
			display: inline-block;
			width:320px;
			height:34px;
			margin-top:18px;
		}
		.text-box>span {
			font-size: 20px;
			font-weight: 600;
			line-height: 34px;
			color:rgb(75, 75, 75);
		}
		.text-box>input {
			width: 220px;
			height:28px;
			float: right;
			font-size: 16px;
			margin-top: 3px;
			color: gray;
		}
		.photo {
			float:right;
			position:absolute;
			right:10px;
			top:10px;
		}
		.photo button {
			margin-top: 10px;
		}
		
	</style>
</head>
<body>
	
	<%@ include file="head.jsp" %>
	<div id="outer2">
		<br><br><br><br>
		<div class="guide">
			입점을 환영합니다!<br>
			(3단계/3단계) 메뉴를 하나씩 등록해주세요.
		</div><br>

		<form action="/menuInsert.re" method="post" enctype="multipart/form-data">
			<div class="menu-box">
				<div class="text-box">
					<span name="name1" >메뉴명 </span><span style="color:crimson">* </span>
					<input type="text" required><br>
				</div><br>
				<div class="text-box">
					<span name="price1">가격 </span><span style="color:crimson">* </span>
					<input type="text" required><br>
				</div><br>
				<div class="text-box">
					<span name="describe1">설명</span>
					<input type="text"><br>
				</div>
				<div class="photo" align="center">
					<img src="/Fooding/resources/images/forTest.png" class="rounded" width="200" height="150"><br>
					<button type="button" class="btn btn-outline-danger" onclick="clickFile(1)">사진등록</button>
					<div style="display:none"><input type="file" name="file1"></div>
				</div>
			</div>
			
			<div align="center"><br><br><br><br><br>
				<button type="button" class="btn btn-outline-danger">메뉴추가</button>
				<button type="submit" class="btn btn-danger">저장</button>
				<button type="button" class="btn btn-secondary">다음에하기</button>
			</div>
			
		</form>
		
		
	</div>
	<br><br><br><br><br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("");
		})

		function clickFile(num) {
			$('input[name=file'+num+']').click();
		}
	</script>
</body>
</html>