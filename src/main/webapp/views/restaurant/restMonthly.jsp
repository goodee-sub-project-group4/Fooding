<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* ↓↓↓ 기본골격용 스타일들 (수정할필요X) */
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
			border-width:0px;
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
		#title-area {
			width:700px;
			margin:auto;
		}
		#title-area img { /*이전버튼, 다음버튼*/
			width:50px;
			position: relative;
			bottom:8px;
		}
		#title-area h2 {
			display: inline-block;
			font-weight: 700;
			color:rgb(77, 77, 77);
			margin:50px;
		}
		#table-area {
			width:700px;
			margin:auto;
		}
		#table-area span {
			color: rgb(63, 63, 63);
			float: left;
			font-size: 16px;
		}
		#table-area h2 {
			float:right;
			font-weight: 600;
			font-size: 32px;
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
			<div id="title-area" align="center">
				<img src="/Fooding/resources/images/prevButton.png">
				<h2>1월정산표</h2>
				<img src="/Fooding/resources/images/nextButton.png">
			</div>
			<div id="table-area">
				<table class="table table-bordered" align="center">
					<thead class="table-light">
						<tr>
							<th>예약번호</th>
							<th>확정날짜</th>
							<th>결재금액</th>
							<th>정산금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>25</td>
							<td>2023/01/09</td>
							<td>55000</td>
							<td>49500</td>							
						</tr>
						<tr>
							<td>25</td>
							<td>2023/01/09</td>
							<td>55000</td>
							<td>49500</td>							
						</tr><tr>
							<td>25</td>
							<td>2023/01/09</td>
							<td>55000</td>
							<td>49500</td>							
						</tr><tr>
							<td>25</td>
							<td>2023/01/09</td>
							<td>55000</td>
							<td>49500</td>							
						</tr><tr>
							<td>25</td>
							<td>2023/01/09</td>
							<td>55000</td>
							<td>49500</td>							
						</tr>
						<tr>
							<td>25</td>
							<td>2023/01/09</td>
							<td>55000</td>
							<td>49500</td>							
						</tr>
						<tr>
							<td>25</td>
							<td>2023/01/09</td>
							<td>55000</td>
							<td>49500</td>							
						</tr>
					</tbody>
				</table>
				<span>
					* 확정날짜는 이용완료날로부터 7일 후 입니다<br>
					** 입금날짜는 익월 15일 입니다.
				</span><br clear="both">
				<h2>
					계: 242,100 원
				</h2>

			</div>
			
			
		</div>
	</div>
	<br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("정산");
			$('#menu2-detail').find('li').eq(5).click();
            $('#menu2').css("background-color","whitesmoke");
            $('#menu2').css("color","rgb(221,45,45)");


			// Menubar.jsp 내의 요소, 스타일이 include시 바뀌는 버그를 수정하기 위한 코드(건들필요X)
			$('#page-name').css({"font-size":"28px", "font-weight":600, "margin-left":"10px", "margin-top":"5px"});

		})
	</script>
</body>
</html>