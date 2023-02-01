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
			text-align: center;
		}
		#form-area input[type=radio] {
			width:20px;
			height:20px;
			margin-left:30px;
		}
		#form-area label {
			font-size:17px;
		}

		.hour-box input {
			width: 120px;
		}

		#form-area img {
			width:60px;
			height:60px;
			float:right;
		}

		#form-area input[type=file] {
			width:220px;
		}

		#form-area span {
			color: crimson;
			font-size: 12px;
			float: right;
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
			<br><br><br><br>
			<div id="form-area">
			<form action="<%=contextPath%>/updateInfo.re" method="post" enctype="multipart/form-data">
				
					<h3>대표자명</h3>
					<input class="narrow" type="text" name="ceo" id="ceo" value="<%=loginRest.getCeo()%>" readonly><br>
					<span>* 수정은 고객센터로 문의하세요</span><br><br><br>

					<h3>상호명</h3>
					<input class="narrow" type="text" name="resName" id="resName" value="<%=loginRest.getResName()%>" readonly><br>
					<span>* 수정은 고객센터로 문의하세요</span><br><br><br>

					<h3>사업자등록번호</h3>
					<input class="narrow" type="text" name="permitNo" id="permitNo" value="<%=loginRest.getPermitNo() %>" readonly ><br>
					<span>* 수정은 고객센터로 문의하세요</span><br><br><br>

					<h3>전화번호</h3>
					<input class="narrow" type="text" name="phone" id="phone" required value="<%=loginRest.getPhone()%>"> <br><br><br>

					<h3>휴대폰번호</h3>
					<input class="narrow" type="text" name="cellPhone" id="cellPhone" required value="<%=loginRest.getCellphone()%>" > <br><br><br>
					
					<h3>주소</h3>
					<input class="wide" type="text" name="address" id="address" required value="<%=loginRest.getAddress()%>"> <br><br><br>

					<h3>상세주소</h3>
					<input class="wide" type="text" name="dAddress" id="dAddress" required value="<%=loginRest.getdAddress() %>" > <br><br><br>

					

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
					<input type="radio" name="parking" id="parkingY" value="Y"> <label for="parkingY">가능</label>
					<input type="radio" name="parking" id="parkingN" value="N"> <label for="parkingN">불가능</label>
					<br><br><br>

					<div class="hour-box">
						<h3>오픈시간</h3>
						<input class="narrow" type="text" placeholder="시간선택" name="open" value="<%=loginRest.getOpen()%>" required><br><br><br>
						<h3>마감시간</h3>
						<input class="narrow" type="text" class="timepicker" name="close" placeholder="시간선택" value="<%=loginRest.getClose()%>" required><br><br><br>
						<h3>브레이크타임 시작</h3>
						<input class="narrow" type="text" class="timepicker" name="break-s" value="<%=(loginRest.getBreakS()==null)? "" : loginRest.getBreakS()%>" placeholder="시간선택"><br><br><br>
						<h3>브레이크타임 끝</h3>
						<input class="narrow" type="text" class="timepicker" name="break-e" value="<%=(loginRest.getBreakE()==null)? "" : loginRest.getBreakE()%>" placeholder="시간선택"><br><br><br>
					</div>

					<h3>대표사진</h3> 
					<img src="<%=loginRest.getrImg()%>" id="img-area" class="rounded">
					<input type="hidden" name="oldfile" value="<%=loginRest.getrImg()%>">
					<input type="file" name="rImg" id="rImg" onchange="loadImg(this)"> 
					<br><br><br><br><br>
				
					<div align="center">
						<button type="submit" class="btn btn-danger btn-block">정보변경</button>
						<button type="reset" class="btn btn-secondary btn-block">초기화</button>
					</div>

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
		
		//대표사진 미리보기
		function loadImg(inputFile){
			if(inputFile.files.length == 1) {
				const reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e) {
					$('#img-area').attr("src", e.target.result);
				}
			}

		}
		
		
	</script>
	<!-- timepicker CDN (2/2) 24시간 입력용 -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>	
</body>
</html>