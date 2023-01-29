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
		.content-box {
			width:350px;
			margin:auto;
			margin-top:18px;
		}
		.content-box>span { /*글자*/
			font-size: 20px;
			font-weight: 600;
			line-height: 34px;
			color:rgb(75, 75, 75);
		}
		.content-box>input {
			width: 120px;
			height:28px;
			float: right;
			font-size: 16px;
			margin-top: 3px;
			color: gray;
		}
		
		.content-box>button { /*다음버튼*/
			float:right;
			margin-left: 10px;
		}
		
	</style>
	<!-- timepicker CDN (1/2) 24시간 입력용 -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

</head>
<body>
	
	<%@ include file="head.jsp" %>
	<div id="outer2">
		<br><br><br><br>
		<div class="guide">
			입점을 환영합니다!<br>
			(2단계/3단계) 영업시간을 입력해주세요.
		</div><br>

		<form action="<%=contextPath %>/hours.re" method="get">
			<div class="content-box">
				<span>오픈시간</span>
				<input type="text" placeholder="시간선택" name="open" required><br>
				<span>마감시간</span>
				<input type="text" class="timepicker" name="close" placeholder="시간선택" required><br>
				<span>브레이크타임 시작</span>
				<input type="text" class="timepicker" name="break-s" placeholder="시간선택"><br>
				<span>브레이크타임 끝</span>
				<input type="text" class="timepicker" name="break-e" placeholder="시간선택"><br><br>
				
				<button type="submit" class="btn btn-danger">저장</button>
				<button type="reset" class="btn btn-outline-secondary">초기화</button>
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

			//입력시간을 24시로 바꾼다
			$('input[type="text"]').timepicker({
				timeFormat: 'HH:mm'
			});
		})

		function clickFile(num) {
			$('input[name=file'+num+']').click();
		}
		
		

	</script>

	<!-- timepicker CDN (2/2) 24시간 입력용 -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>