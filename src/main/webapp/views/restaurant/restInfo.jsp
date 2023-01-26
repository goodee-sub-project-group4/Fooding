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
			height: 1400px;
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
		}
		#form-area input, #form-area select {
			width:100%;
			height: 40px;
		}
		#form-area input[type=checkbox] {
			width:24px;
		}
		#form-area label {
			position: relative;
			bottom:14px;
			margin-right: 30px;
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
			<div id="form-area">
			<form action="">

					<h3>대표자명</h3>
					<input type="text" name="ceo" id="ceo" value="<%=loginRest.getCeo()%>" readonly> <br><br><br>

					<h3>상호명</h3>
					<input type="text" name="resName" id="resName" value="<%=loginRest.getResName()%>" readonly> <br><br><br>

					<h3>사업자등록번호</h3>
					<input type="text" name="permitNo" id="permitNo" value="<%=loginRest.getPermitNo() %>" readonly > <br><br><br>

					<h3>주소</h3>
					<input type="text" name="address" id="address" required value="<%=loginRest.getAddress()%>"> <br><br><br>

					<h3>상세주소</h3>
					<input type="text" name="dAddress" id="dAddress" required value="<%=loginRest.getdAddress() %>" > <br><br><br>

					<h3>전화번호</h3>
					<input type="text" name="phone" id="phone" required value="<%=loginRest.getPhone()%>"> <br><br><br>

					<h3>휴대폰번호</h3>
					<input type="text" name="cellPhone" id="cellPhone" required value="<%=loginRest.getCellphone()%>" > <br><br><br>

					<h3>이메일</h3>
					<input type="email" name="email" id="email" required value="<%=loginRest.getEmail() %>"> <br><br><br>


					<h3>사업체유형(업종)</h3>
					<select name="foodCt" id="foodCt" style="width:190px;">
						<option value="western">양식</option>
						<option value="japanese">일식</option>
						<option value="chinese">중식</option>
						<option value="chicken">분식류/치킨</option>
						<option value="asia">아시아/퓨전</option>
						<option value="buffet">뷔페/레스토랑</option>
						<option value="bar">술집</option>
						<option value="cafe">카페</option>
					</select>
					<br><br>

					<h3>주차여부</h3>
					<input type="checkbox" name="parking" id="parkingY"> <label for="parkingY">가능</label>
					<input type="checkbox" name="parking" id="parkingN"> <label for="parkingN">불가능</label>
					<br><br>


					<h3>대표사진</h3> 
					<input type="file" name="rImg" id="rImg" required> <br><br><br><br><br><br><br>

				<button type="submit" class="btn btn-danger btn-block">정보변경</button>
				<button type="reset" class="btn btn-secondary btn-block">초기화</button>
			</form>
			<div id="check">체크</div>
			</div>
		</div>
	</div>
	
	<br clear="both"><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("매장정보");
			$('#menu2-detail').find('li').eq(1).click();
            $('#menu2').css("background-color","whitesmoke");
            $('#menu2').css("color","rgb(221,45,45)");
			// Menubar.jsp 내의 요소, 스타일이 include시 바뀌는 버그를 수정하기 위한 코드(건들필요X)
			$('#page-name').css({"font-size":"28px", "font-weight":600, "margin-left":"10px", "margin-top":"5px"});
			
			//사업체유형선택
			const foodCt = <%=loginRest.getFoodCt()%>
			const count = 0;
			$('#foodCt option').each(function(){
				if($(this).val() ==foodCt) {
					count++;
					<% System.out.println("확인"); %>
					$(this).html("selected");
					$('#check').text("되나");
				}
			})

		})
	</script>
</body>
</html>