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
			height: 600px;
			position: relative;
			margin:auto;
		}			
		#content {
			width:950px;
			display: inline-block;
			box-sizing: border-box;
			position:absolute;
			right:10px;
			/* border:1px solid green; */
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
		#calendar-outer {
			display: inline-block;
			border: 1px solid lightgray;
			margin:10px;
        }
        #calendar-outer>div>div { /*칸 낱개 스타일*/
            box-sizing: border-box;
            width:100px;
            height:80px;
            border:1px solid lightgray;
            float: left;
        }
        #week>div { /*요일줄 스타일*/
            background-color: whitesmoke;
            line-height: 80px;
            text-align: center;
            font-size: 18px;
            font-weight: 600;
            color:rgb(63, 63, 63);
        }
        .line>div { /*날짜줄 스타일*/
            padding:5px;
            font-size: 14px;
            color:rgb(168, 166, 166);
            text-align: left;
        }
		.line>div:hover {
			background-color:rgb(255, 240, 142);
			cursor: pointer;
		}
		#prev-area, #next-area {
			width:50px;
			display: inline-block;
			margin:10px;
		}
		#content > h2 {
			display: inline-block;
			font-size: 16;
			font-weight: 600;
			color: rgb(103, 103, 103);
			margin:10px;
		}
		#space { /*월과 버튼 사이의 간격 조절용*/
			display: inline-block;
			width:230px;
		}
		#prev-area img, #next-area img { /*이전버튼과 다음버튼*/
			position: relative;
			bottom:90px;
		}
	
	</style>
</head>
<body>
	
	<%@ include file="head.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="menubar.jsp" %>
		</div>
		<div id="content" align="center">
		<!-- 컨텐츠 작성부 -->
			<br>
			<h2>2월</h2><div id="space"></div>
			<button type="button" class="btn btn-outline-danger">예약가능 변경</button>
			<button type="button" class="btn btn-outline-danger">예약불가 변경</button>
			<button type="button" class="btn btn-outline-danger">예약내역 보기</button><br>
			<div id="prev-area">
				<img src="../../resources/images/prevButton.png" width="60">
			</div>
			<div id="calendar-outer">
				<div id="week">
					<div>sun</div>
					<div>mon</div>
					<div>tue</div>
					<div>wed</div>
					<div>thu</div>
					<div>fri</div>
					<div>sat</div>
				</div><br clear="both">
				<div id="line-1st" class="line">
					<div>29</div>
					<div>30</div>
					<div>31</div>
					<div>1</div>
					<div>2</div>
					<div>3</div>
					<div>4</div>
				</div><br clear="both">
				<div id="line-2nd" class="line">
					<div>5</div>
					<div>6</div>
					<div>7</div>
					<div>8</div>
					<div>9</div>
					<div>10</div>
					<div>11</div>
				</div><br clear="both">
				<div id="line-3rd" class="line">
					<div>12</div>
					<div>13</div>
					<div>14</div>
					<div>15</div>
					<div>16</div>
					<div>17</div>
					<div>18</div>
				</div><br clear="both">
				<div id="line-4th" class="line">
					<div>19</div>
					<div>20</div>
					<div>21</div>
					<div>22</div>
					<div>23</div>
					<div>24</div>
					<div>25</div>
				</div><br clear="both">
				<div id="line-5th" class="line">
					<div>26</div>
					<div>27</div>
					<div>28</div>
					<div>1</div>
					<div>2</div>
					<div>3</div>
					<div>4</div>
				</div>
			</div>
			<div id="next-area">
				<img src="../../resources/images/nextButton.png" width="60">
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
			$('#title').text("달력설정");
			$('#menu2-detail').find('li').eq(0).click();
            $('#menu2').css("background-color","whitesmoke");
            $('#menu2').css("color","rgb(221,45,45)");

			// Menubar.jsp 내의 요소, 스타일이 include시 바뀌는 버그를 수정하기 위한 코드(건들필요X)
			$('#page-name').css({"font-size":"28px", "font-weight":600, "margin-left":"10px", "margin-top":"5px"});

		})
	</script>
</body>
</html>