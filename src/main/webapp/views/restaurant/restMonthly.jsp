<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.book.model.vo.Payment" %>
<%
	ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list");
	String year = (String)request.getAttribute("year");
	String month = (String)request.getAttribute("month");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* ↓↓↓ 기본골격용 스타일들 (수정할필요X) */
		#outer2 {
			width:1200px;
			margin:auto;
		}			
		#content {
			width:950px;
			box-sizing: border-box;
			float: right;
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
			width:45px;
			position: relative;
			bottom:8px;
			margin-left:30px;
			margin-right:30px;
		}
		#title-area img:hover {
			cursor:pointer;
		}
		#title-area h2 {
			display: inline-block;
			font-weight: 700;
			font-size: 27px;
			color:rgb(77, 77, 77);
			margin:50px;
		}
		#table-area {
			width:700px;
			margin:auto;
			text-align: center;
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
			<br><br>
			<div id="title-area" align="center">
				<img src="/Fooding/resources/images/prevButton.png" onclick="preMonth()">
				<h2 id="month-title" value=""><%=year+"년도 "+Integer.parseInt(month)%>월 정산표</h2>
				<img src="/Fooding/resources/images/nextButton.png" onclick="nextMonth()">
			</div>
			<div id="table-area">
				<table class="table table-bordered" align="center">
					<thead class="table-light">
						<tr>
							<th>예약번호</th>
							<th>이용완료날짜</th>
							<th>결재금액</th>
							<th>정산금액</th>
						</tr>
					</thead>
					<tbody>
					<% int monthlyPay = 0;
					   for(int i=0; i<list.size(); i++) { 
				            monthlyPay += list.get(i).getPayTotal(); %>
						<tr>
							<td><%=list.get(i).getBookNo() %></td>
							<td><%=list.get(i).getModifyDate() %></td>
							<td><%=list.get(i).getPayTotal() %></td>
							<td><%=(int)(list.get(i).getPayTotal()*0.9) %></td>							
						</tr>
						<% } %>
					</tbody>
				</table>
				<span style="text-align:left; font-size:13px">
					* 확정날짜가 해당되는 월에 정산이 됩니다. <br>
					** 확정날짜는 이용완료날로부터 7일 후 입니다<br>
					*** 입금날짜는 익월 15일 입니다.
				</span><br clear="both">
				<h2>
					계: <%=(int)(monthlyPay*0.9) %> 원
					<br><br><br><br><br><br>
				</h2>

				
			</div>
			
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("정산");
			$("#menu2").addClass("active");
			$("#menu2_1").addClass("active");
		})
		
		function preMonth(){
			//현재월에서 1달을 빼기(0월이 되면 이전해 12월로 만들기)
			let year = <%= year%>;
			let month = <%=month %>;
			month = month-1;
			if(month==0) {
				month=12;
				year=year-1;
			}
			let lastDay = new Date(year, month, 0).getDate();
        	location.href='<%=contextPath%>/monthly.re?year='+year+'&month='+month+'&lastDay='+lastDay;
		}
		
		function nextMonth(){
			//현재월에서 1달을 더하기(13월이 되면 다음해 1월로 만들기)
			let year = <%= year%>;
			let month = <%=month %>;
			month = month+1;
			if(month==13) {
				month=1;
				year=year+1;
			}
			let lastDay = new Date(year, month, 0).getDate();
        	location.href='<%=contextPath%>/monthly.re?year='+year+'&month='+month+'&lastDay='+lastDay;
		}
		
	</script>
</body>
</html>