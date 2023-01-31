<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
	<!-- 제이쿼리구문 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- 부트스트랩 링크3개 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .delete-area {text-align:center;}
        .delete-area h2 { font-weight:600;}
        #manual {height: 250px; width:600px; margin:auto; position:relative;}
        #manual1 {width:150px; font-weight: 600;}
        #manual2 {width:450px; position:absolute; top:0px; left:150px;}
        #manual2 p {color:rgb(50, 50, 50); font-size:13px; text-align:left;}
        #manual2 span {color:red;}

        .delete-area button {width:100px; height:40px; font-size:14px;}
    </style>

</head>
<body>

	<%@ include file="/views/common/head.jsp" %>
	
	<%
		String userId = loginUser.getUserId();
	%>
	
	<div class="delete-area">
        <br><br><br>
        <h2>회원 탈퇴 안내</h2>
        <hr width="600">
        
        <div id="manual">

            <div id="manual1">회원탈퇴 안내</div>
            <div id="manual2">
                <p>고객님께서 회원 탈퇴를 원하신다니 저희 사이트의 서비스가 많이 부 족하고 미흡했나봅니다.
                    불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.
                    <br><br>
                    <span>회원탈퇴 시의 아래 사항을 숙지하시기 바랍니다.</span>
                    <br><br>
                     1. 회원 탈퇴 시 고객님의 정보는 소비자 보호에 관한 법률에 의거한 고객정보<br>
                      보호정책에 따라 관리됩니다. <br>
                      2. 탈퇴 시 고객님께서 보유하셨던 적립금은 모두 삭제됩니다.<br>
                      3. 회원 탈퇴 후 30 일간 재가입이 불가능합니다.</p>
            </div>

        </div>

		<input type="hidden" name="userId" value="<%=userId %>">
        <button type="button" class="btn btn-outline-danger" onclick="location.href='<%=request.getContextPath()%>'">취소하기</button>&nbsp;&nbsp;
        <button type="button" class="btn btn-danger" onclick="location.href='<%=contextPath%>/confirmDelete.me'">탈퇴하기</button>
        <br><br><br>
    </div>

</body>
</html>