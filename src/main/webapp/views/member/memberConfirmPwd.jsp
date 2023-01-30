<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재확인</title>
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
        
        /* 리뷰바상단 */
        #content2-padding {width: 900px; height: 800px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float:left;}
        /* #content2-padding div {border:1px solid transparent;} */
        #reconfirm-pwd-area {width: 100%; height: 135px; font-size: 30px; margin-bottom: 30px; text-align: center;
             display: inline-block; border-bottom:1px solid black;}
        /* 문장 */
        #sentence-area {height:80px; border-bottom:1px solid black;}
        #sentence-area p {margin:5px;}
        /* input */
        #input-id-pwd-area {height:250px; border-bottom:1px solid black;}
        #input-id-area, #input-pwd-area {height:50%; position:relative;}
        #input-id-area1{width:100px; position:absolute; top:60px; left:80px; font-weight:600; font-size:18px;}
        #input-pwd-area1 {width:100px; position:absolute; top:30px; left:65px; font-weight:600; font-size:18px;}

        #input-id-area2 {position:absolute; top:50px; left:290px;}
        #input-pwd-area2 {position:absolute; top:20px; left:290px;}
        #input-id-area2 input {padding-left:10px;}
        #input-pwd-area2 input {padding-left:10px;}

        #input-pwd-area span {color:red;}
        #input-id-pwd-area input {height:50px; font-size:14px; margin-top:0px;}


        /* 확인버튼 */
        #btn-area {text-align: center;}
        #confirm-btn {width:230px; height:50px; margin-top:50px; }
        
    </style>
</head>
<body>

 	<%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/myPageSidebar.jsp" %>
	<%
		String userId = loginUser.getUserId();
	%>

    <div id="content2-padding">
        <div id="reconfirm-pwd-area">
            <b>개인 정보 수정</b>
        </div>
        <div id="sentence-area">
            <p style="font-weight:600; font-size:20px;">비밀번호 재확인</p>
            <p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인해주세요.</p>
        </div>
        <form action="<%=contextPath%>/confirmPwd.me" method="post">
        <input type="hidden" name="userId" value="<%=userId%>">
            <div id="input-id-pwd-area">

                <div id="input-id-area">
                    <div id="input-id-area1">아이디</div>
                    <div id="input-id-area2"><input type="text" name="userId" size="40" value="<%=userId%>"></div> <!--아이디가 이미 적혀있어야함-->
                </div>
                <div id="input-pwd-area">
                    <div id="input-pwd-area1">비밀번호<span> *</span></div>
                    <div id="input-pwd-area2"><input type="password" size="40" name="userPwd" placeholder="현재 비밀번호를 입력해주세요" required></div>
                </div>

                <div id="btn-area">
                    <button type="submit" id="confirm-btn" class="btn btn-danger">확인</button>
                </div>

            </div>
        </form>

    </div>
    


</body>
</html>