<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.book.model.vo.*" %>    
<%
	String year = (String)request.getAttribute("year");
	String month = (String)request.getAttribute("month");
	ArrayList<NotAble> naList = (ArrayList<NotAble>)request.getAttribute("naList");
	ArrayList<Book> bList = (ArrayList<Book>)request.getAttribute("bList");
	
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
			float:right;
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
			margin-top:50px;
		}
		/* ↓↓↓ 컨텐츠용 스타일 */
		#calendar-outer {
			display: inline-block;
			border: 1px solid lightgray;
			margin:10px;
			box-sizing: border-box;
			width:702px;
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

		
		.notThisMonth { /*지난달날짜칸*/
			text-align: left;
			padding:5px;
            font-size: 14px;
            color:rgb(210, 210, 210);
            text-align: left;
		}

		.thisMonth:hover {
			background-color:rgb(255, 240, 142);
			cursor: pointer;
		}
		.thisMonth { /*이번달날짜칸*/
			text-align: left;
			padding:5px;
            font-size: 14px;
            color:rgb(128, 128, 128);
            text-align: left;
			position: relative;
			z-index: 900;
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
		#prev-area img:hover, #next-area img:hover { 
			cursor:pointer;
		}
		#prev-area img {
			right:8px;
		}
		#book-list-title {
			font-size: 20px;
			font-weight: 600;
			color:rgb(69, 69, 69);
		}
		.book-info {
			font-size:16px;
		}
		#which-year { /* 하단연도표시*/
			float:right;
			color:gray;
			margin-right:120px;
		}
		.x-icon { /*엑스표시*/
			width:35px;
			opacity: 0.5;
			position: absolute;
			left:36px;
			top:22px;
			z-index: 800;

		}
		.bookCount { /*예약갯수 뱃지*/
			background-color:rgb(236, 2, 2);
			opacity: 0.9;
			width:40px;
			height:40px;
			color:white;
			font-size:25px;
			font-weight: 900;
			border-radius : 20px;
			line-height: 40px;
			float:right;
			margin-right:20px;
			margin-top:15px;
			z-index: 100;

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
			<br><br><br>
			<h2><%=month%>월</h2><div id="space"></div>
			<input type="hidden" id="which-date" value="">
			<button type="button" class="btn btn-outline-danger" onclick="enAble();">예약가능 변경</button>
			<button type="button" class="btn btn-outline-danger" onclick="validate();">예약불가 변경</button>
			<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#book-list" onclick="detail();">예약내역 보기</button><br>
			
			<div id="prev-area" >
				<img src="resources/images/prevButton.png" width="60" onclick="prevMonth()">
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
					<!-- 동적으로 생성된 날짜가 들어올 자리 -->
	            </div><br clear="both">
	            <div id="line-2nd" class="line">
	            	<!-- 동적으로 생성된 날짜가 들어올 자리 -->
	            </div><br clear="both">
	            <div id="line-3rd" class="line">
	            	<!-- 동적으로 생성된 날짜가 들어올 자리 -->
	            </div><br clear="both">
	            <div id="line-4th" class="line">
					<!-- 동적으로 생성된 날짜가 들어올 자리 -->
	            </div><br clear="both">
	            <div id="line-5th" class="line">
					<!-- 동적으로 생성된 날짜가 들어올 자리 -->
	            </div>
				<div id="line-6th" class="line">
					<!-- 동적으로 생성된 날짜가 들어올 자리 -->
				</div>
	        </div>
			<div id="next-area">
				<img src="resources/images/nextButton.png" width="60" onclick="nextMonth()">
			</div>
			<br>
	        <span id="which-year"><%=year%>년도</span>
		</div>
		
	</div>

	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<!-- The Modal -->
	<div class="modal" id="book-list">
		<div class="modal-dialog modal-sm">
		<div class="modal-content">
	
			<!-- Modal body -->
			<div class="modal-body" align="center">
				<br><br>
				<h4 id="book-list-title">
					<span id="book-date">2023-02-10</span><br>
					예약내역
					<span id="book-list"></span>
				</h4>
				<br>
			</div>
	
			<!-- Modal footer -->
			<div class="modal-footer">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			</div>
	
		</div>
		</div>
	</div>
	<script>
		let year = <%=year%>;
		let month = <%=month%>;

		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("달력설정");
			$("#menu2").addClass("active");
			$("#menu2_1").addClass("active");
			
			//==============달력만들기===============
			
			
			//이전달의 마지막 날 날짜와 요일 구하기
	        let startDay = new Date(year, month-1, 0);
	        let prevDate = startDay.getDate(); 
	        let prevDay = startDay.getDay(); 
	        
	        //이번달의 마지막날 날짜와 요일 구하기
	        let endDay = new Date(year, month, 0);
	        let lastDate = endDay.getDate(); 
	        let lastDay = endDay.getDay(); 
	        
	        //첫째줄)지난달에 해당하는 칸 작성하기
	        for(let i=prevDay; i>=0; i--) {
	        	$('#line-1st').append('<div class="notThisMonth">'+(prevDate-i)+'<div>');
	        }
	        //첫째줄)이번달에 해당하는 칸 작성하기
	        for(let i=1; i<=6-prevDay; i++) {
	        	$('#line-1st').append('<div class="thisMonth" id="'+i+'"><span>'+i+'</span></div>');
	        }
	        //두번째줄
	        for(let i=(6-prevDay)+1; i<=(6-prevDay)+7; i++) {
	        	$('#line-2nd').append('<div class="thisMonth" id="'+i+'"><span>'+i+'</span></div>');
	        }
	        //세번째줄
	        for(let i=(6-prevDay)+8; i<=(6-prevDay)+14; i++) {
	        	$('#line-3rd').append('<div class="thisMonth" id="'+i+'"><span>'+i+'</span></div>');
	        }
			//네번째줄
	        for(let i=(6-prevDay)+15; i<=(6-prevDay)+21; i++) {
	        	$('#line-4th').append('<div class="thisMonth" id="'+i+'"><span>'+i+'</span></div>');
	        }
      		//다섯번째줄이 마지막줄일수도 있고, 여섯번째 줄이 마지막줄일수도 있다.      	
	      	if(lastDate<=(6-prevDay)+28) {
	      		//다섯번째줄이 마지막인 경우
	      		for(let i=(6-prevDay)+22; i<=lastDate; i++) {
	        		$('#line-5th').append('<div class="thisMonth" id="'+i+'"><span>'+i+'</span></div>');
	        	}
	      		for(let i=1; i<=(6-lastDay); i++) {
	            	$('#line-5th').append('<div class="notThisMonth"><span>'+i+'</span></div>');
	            }
	      	}else {
	      		//여섯번째 줄이 마지막인 경우,
	      		//다섯번째줄
	      		for(let i=(6-prevDay)+22; i<=(6-prevDay)+28; i++) {
	        		$('#line-5th').append('<div class="thisMonth" id="'+i+'"><span>'+i+'</span></div>');
	        	}
	      		//여섯번째줄
	      		for(let i=(6-prevDay)+29; i<=lastDate; i++) {
	        		$('#line-6th').append('<div class="thisMonth" id="'+i+'"><span>'+i+'</span></div>');
	        	}
	      		for(let i=1; i<=(6-lastDay); i++) {
	            	$('#line-6th').append('<div class="notThisMonth"><span>'+i+'</span></div>');
	            }
	      	}
			//===============달력만들기 끝===============
			
			//불가날짜 표기하기
			<% for(NotAble na : naList){ %>
				$('#'+<%=na.getDate()%>).append('<img src="<%=contextPath%>/resources/images/xIcon.png" class="x-icon">');
			<% } %>

			//달력칸 클릭효과
			$('.thisMonth').click(function(){
				$('.thisMonth').css("background-color","");
				$(this).css("background-color","rgb(255, 240, 142)");
				$('#which-date').val($(this).children('span').text());
			});
			
			//예약건수 표기하기
			<% for(int i=0; i<bList.size(); i++) { %>
				<% String bookDate = (bList.get(i).getBookDate()).substring(8); %>
				if($('#'+<%=bookDate%>).val()==5) {
					//기존에 데이터가 추가된 경우
					let count = $('#'+<%= bookDate %>).children('div').text();
					$('#'+<%= bookDate %>).children('div').text(Number(count)+1);
				}else {
					$('#'+<%= bookDate %>).append('<div class="bookCount" align="center">1</div>');
					$('#'+<%=bookDate%>).val(5);
				}
			<% }%>
				
			
		})	
		
		//예약내역 확인하는 함수
		function detail() {
			let date = $('#which-date').val();	
			let month = <%=month%>;
			let year = <%=year%>;
			$.ajax({
				url:"<%=contextPath%>/selectDateBook.re",
				data:{date:date, month:month, year:year},
				success:function(result) {
					
					//이전내역지우기
					$('#book-list-title').children('h4').remove();
					$('#book-list-title').children('br').remove();
					
					//해당 예약 정보 띄우기
					$('#book-date').text(year+"-"+month+"-"+date);
					$('#book-list-title').append('<br><br><br>');
					for(let i=0; i<result.length; i++) {
						$('#book-list-title').append("<h4 class='book-info'>"+
								result[i].bookTime+" "+result[i].bookName+"("+result[i].people+")"+"</h4>");
					}
				}, error:function(){
					console.log('예약내역조회 ajax통신 실패');
				}
			})
		}
		
		
		//예약불가인지 검증하는 함수
		function validate(){
			let date = $('#which-date').val(); 
			if($('#'+date).val() == 5) {
				alert("이미 예약건이 있는 경우에는 불가처리를 할 수 없습니다. 예약취소를 먼저 진행해주세요.");
			}else {
				return notAble();
			}
		}
		
		//예약불가 변경
		function notAble(){
			let notAbleDate = $('#which-date').val();	
			$('#'+notAbleDate).css("background-color","");
			
			//Ajax통신
			$.ajax({
				url:"<%=contextPath%>/insertNotAble.re",
				data:{year:year, month:month, date:notAbleDate},
				success:function(result) {
					if(result==0) { //insert실패하였을때
						alert('이미 예약 불가 상태입니다.');
					}else { //성공했을때
						//X자 이미지 붙이기
						$('#'+notAbleDate).append('<img src="<%=contextPath%>/resources/images/xIcon.png" class="x-icon">');
					}
				}, error:function(){
					console.log('notAble insert ajax통신 실패');
				}
			})
		}
		
		//예약가능 변경
		function enAble(){
			let enAbleDate = $('#which-date').val();
			$('#'+enAbleDate).css("background-color","");
			$.ajax({
				url:"<%=contextPath%>/deleteNotAble.re?month="+month+"&year="+year+"&date="+enAbleDate,
				date:{},
				success:function(result) {
					if(result==0) {//delete실패하였을때
						alert('이미 예약 가능 상태입니다.');
					}else {
						//x자 이미지 삭제하기
						$('#'+enAbleDate).children().remove();
					}
				}, error:function(){
					console.log('notAble delete ajax통신 실패');
				}
			});
		}
		
		//이전달력보기
		function prevMonth(){
			month = month-1;
			if(month==0) {
				year = year-1;
				month = 12;
			}
			location.href='/Fooding/calendar.re?year='+year+'&month='+month+"&flag=1";
		}

		//다음달력보기
		function nextMonth(){
			month = month+1;
			if(month==13) {
				year = year+1;
				month = 1;
			}
			location.href='/Fooding/calendar.re?year='+year+'&month='+month+"&flag=1";
		}
		
		
		
		
		
	</script>
</body>
</html>