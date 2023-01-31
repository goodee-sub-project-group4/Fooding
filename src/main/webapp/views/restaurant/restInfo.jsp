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
			margin:auto;
		}			
		#content {
			width:950px;
			box-sizing: border-box;
			float:right;
		}
		#menubar {
			border-width:0px;
			width:200px;
			height: 2000px;
			z-index: 1000;
			position: absolute;
		}
		#footer {
			width:1200px;
			margin:auto;
		}
		/* ↓↓↓ 컨텐츠용 스타일 */
		form * {
			color:rgb(76, 76, 76);
		}
		
		#form-area {
			width:300px;
			margin:auto;
		}
		#form-area h3 {
			font-size: 17px;
			font-weight:700;
			display:inline-block;
		}
		.wide {
			width:100%;
			height: 40px;
		}
		.narrow {
			width: 160px;
			float:right;
			height: 40px;
			position: relative;
			bottom: 8px;
		}
		#form-area input[type=checkbox] {
			width:24px;
		}
		#form-area label {
			position: relative;
			bottom:14px;
			margin-right: 30px;
		}

		.hour-box input {
			width: 120px;
		}
		
		
	</style>
	<!-- timepicker CDN (1/2) 24시간 입력용 -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
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
			<div id="form-area">
			<form action="">

					<h3>대표자명</h3>
					<input class="narrow" type="text" name="ceo" id="ceo" value="<%=loginRest.getCeo()%>" readonly> <br><br><br>

					<h3>상호명</h3>
					<input class="narrow" type="text" name="resName" id="resName" value="<%=loginRest.getResName()%>글자가무한히늘어난다면?" readonly> <br><br><br>

					<h3>사업자등록번호</h3>
					<input class="narrow" type="text" name="permitNo" id="permitNo" value="<%=loginRest.getPermitNo() %>" readonly > <br><br><br>

					<h3>주소</h3>
					<input class="wide" type="text" name="address" id="address" required value="<%=loginRest.getAddress()%>"> <br><br><br>

					<h3>상세주소</h3>
					<input class="wide" type="text" name="dAddress" id="dAddress" required value="<%=loginRest.getdAddress() %>" > <br><br><br>

					<h3>전화번호</h3>
					<input class="wide" type="text" name="phone" id="phone" required value="<%=loginRest.getPhone()%>"> <br><br><br>

					<h3>휴대폰번호</h3>
					<input class="wide" type="text" name="cellPhone" id="cellPhone" required value="<%=loginRest.getCellphone()%>" > <br><br><br>

					<h3>이메일</h3>
					<input class="wide" type="email" name="email" id="email" required value="<%=loginRest.getEmail() %>"> <br><br><br>

					
					<h3>사업체유형(업종)</h3>
					<select class="wide" name="foodCt" id="foodCt">
						<option value="western">양식</option>
						<option value="japanese">일식</option>
						<option value="chinese">중식</option>
						<option value="chicken">분식류/치킨</option>
						<option value="asia">아시아/퓨전</option>
						<option value="buffet">뷔페/레스토랑</option>
						<option value="bar">술집</option>
						<option value="cafe">카페</option>
					</select>
					<br><br><br>

					<h3>주차여부</h3>
					<input type="checkbox" name="parking" id="parkingY"> <label for="parkingY">가능</label>
					<input type="checkbox" name="parking" id="parkingN"> <label for="parkingN">불가능</label>
					<br><br><br>

					<div class="hour-box">
						<h3>오픈시간</h3>
						<input class="narrow" type="text" placeholder="시간선택" name="open" required><br><br><br>
						<h3>마감시간</h3>
						<input class="narrow" type="text" class="timepicker" name="close" placeholder="시간선택" required><br><br><br>
						<h3>브레이크타임 시작</h3>
						<input class="narrow" type="text" class="timepicker" name="break-s" placeholder="시간선택"><br><br><br>
						<h3>브레이크타임 끝</h3>
						<input class="narrow" type="text" class="timepicker" name="break-e" placeholder="시간선택"><br><br><br>
					</div>

					<h3>대표사진</h3> 
					<input type="file" name="rImg" id="rImg" required> <br><br><br><br><br>

				<button type="submit" class="btn btn-danger btn-block">정보변경</button>
				<button type="reset" class="btn btn-secondary btn-block">초기화</button>
			</form>
			</div>
		</div>
	</div>
	
	<br clear="both"><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			$('#title').text("매장정보");

			$("#menu2").addClass("active");
			$("#menu2_2").addClass("active");
			
			//사업체유형표시
			let foodCt = "<%=loginRest.getFoodCt()%>"
			$('#foodCt option').each(function(){
				if($(this).val() == foodCt) {
					$(this).attr("selected", true);
				}
			})			
			//주차여부표시
			let parkingId = "#parking"+"<%=loginRest.getParking()%>";
			$(parkingId).attr("checked", true);
			
			//입력시간을 24시로 바꾼다
			$('.hour-box input[type="text"]').timepicker({
				timeFormat: 'HH:mm'
			});

		})
		
		
	</script>
	<!-- timepicker CDN (2/2) 24시간 입력용 -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>	
</body>
</html>