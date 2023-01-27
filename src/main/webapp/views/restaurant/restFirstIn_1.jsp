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
		#footer {
			width:1200px;
			margin:auto;
		}
		.guide {
			text-align: center;
			color:gray;
			font-size: 20px;
		}
		#password-box {
			width:420px;
			margin:auto;
			margin-top: 30px;;
		}
		#password-box input{
			float:right;
			width:250px;

		}
		#password-box button{
			float:right;

		}
		#password-box span {
			font-size: 22px;
			font-weight: 600;
			color:rgb(81, 81, 81);

		}
		
	</style>
</head>
<body>
	
	<%@ include file="head.jsp" %>
	<div id="outer2">
		<br><br><br><br>
		<div class="guide">
			입점을 환영합니다!<br>
			(1단계/2단계) 비밀번호를 설정해주세요.
		</div><br>
		<div id="password-box">
			<form action="<%=contextPath%>/pwd.re" method="post">
				<span>비밀번호</span>
				<input type="password" name="userPwd" id="userPwd"><br>
				<span>비밀번호 확인</span>
				<input type="password" name="checkPwd" id="checkPwd" onfocusout="validate();">
				<br clear="both"><br>
				<button class="btn btn-danger">확인</button>
			</form>			
		</div>
		
		
	</div>
	<br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		
		//비밀번호 일치여부확인
		function validate(){
			if($('#userPwd').val() != $('#checkPwd').val()) {
				alert('비밀번호가 일치하지 않습니다');
				$('#userPwd').val("");
				$('#checkPwd').val("");				
			}
		}
	</script>
</body>
</html>