<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호재설정</title>
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
        .outer { width:1200px; height:1500px; margin:auto;}
        .reset-pwd-area { margin:auto; width:800px; height:800px; padding-top: 100px;}
        .reset-pwd-form {margin:auto; width:400px; height:400px;}
        /*  테두리 보기 위한 것 */
        /* .reset-pwd-form div {border:1px solid black;} */
        /* 비밀번호재설정 문구 */
        #reset-pwd {text-align: center; height:100px;}
        #reset-pwd h2 {font-weight:600; color:rgb(83, 83, 83);}
        /* 새 비밀번호 등록 p, input */
        #newpwd, #newpwd-again {height:100px;}
        #newpwd p, #newpwd-again p { font-size:15px; font-weight:600; padding:5px; margin:0px 20px; width:50%;}
        #newpwd input, #newpwd-again input {width:90%; height:50px; padding-left:10px; margin:0px 20px;
            border-radius:3px; border-color:rgb(220, 220, 220); border-style:solid;}
        /* 확인버튼 */
        #verify-btn {text-align:center; height:100px;}
        #verify-btn input {width:90%; height:50px; margin-top:30px;}
    </style>
</head>
<body>
	<div class="outer">
        <div class="reset-pwd-area">

            <form action="" method="post" class="reset-pwd-form">

                <div id="reset-pwd"><h2>비밀번호 재설정</h2></div>
                <div id="newpwd">
                    <p>새 비밀번호 등록</p>
                    <input type="password" name="userPwd" placeholder="새 비밀번호를 입력해주세요" required>
                </div>
                <div id="newpwd-again">
                    <p>새 비밀번호 확인</p>
                    <input type="password" placeholder="새 비밀번호를 다시 한 번 입력해주세요" required>
                </div>
                <div id="verify-btn"><input type="submit" class="btn btn-danger" value="확인"></div>

            </form>

        </div>
    </div>

</body>
</html>