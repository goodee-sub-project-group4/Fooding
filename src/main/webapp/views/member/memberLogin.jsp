<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
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
        .outer {width:1200px; height:1500px; margin:auto;}
        .login-area {margin:auto; width:800px; height:800px; padding-top: 100px;}
        .login-form {margin:auto; width:400px; height:500px; }
        /* 테두리 보기 위한 것 */
        /* .login-form div {border:1px solid black;} */
        /* 로그인 문구 */
        #login {text-align:center; height:15%;}
        #login h2 {font-weight:600; color:rgb(83, 83, 83);}
        /* 아이디, 비밀번호 input */
        #login-id, #login-pwd {text-align:center; height:13%;}
        #login-id input, #login-pwd input {border:1px solid black;width:90%; height:50px; 
            margin-top:0px; padding-left:10px; border-radius:3px; border-color:rgb(220, 220, 220);
            border-style:solid;}
        /* 아이디, 비밀번호 찾기 */
        #find-id-pwd {padding:0px 0px 0px 50%; height:13%;}
        #find-id-pwd a {text-decoration:none; color:black; font-size:12px; padding-left:10px;}
        /* 로그인, 회원가입 버튼 */
        #login-btn, #enroll-btn {text-align:center; height:13%;}
        #login-btn input, #enroll-btn button  {width:90%; height:50px;}
        
    </style>
</head>
<body>

    <div class="outer">
        <div class="login-area">
            
            <form action="" method="post" class="login-form">
                
                <div id="login"><h2>로그인</h2></div>
                <div id="login-id"><input type="text" name="userId" placeholder="아이디를 입력해주세요" required></div>
                <div id="login-pwd"><input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요" required></div>
                <div id="find-id-pwd"><a href="">아이디찾기</a><span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;</span><a href="">비밀번호 찾기</a></div>
                <div id="login-btn"><input type="submit" class="btn btn-danger" value="로그인"></div>
                <div id="enroll-btn"><button type="button" class="btn btn-outline-danger">회원가입</button></div>

            </form>

        </div>
    </div>

</body>
</html>