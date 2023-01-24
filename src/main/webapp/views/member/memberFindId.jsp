<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
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
        .find-id-area { margin:auto; width:800px; height:800px; padding-top: 100px;}
        .find-id-form { margin:auto; width:400px; height:700px;}
        /* 테두리 보기 위한 것 */
        /* .find-id-form div {border:1px solid black;} */
        /* 아이디찾기 문구*/
        #find-id { text-align:center; height:10%;}
        #find-id h2 {font-weight:600; color:rgb(83, 83, 83); padding-right:10px;}
        /* 휴대폰/이메일 인증버튼 */
        #find-id-phone-email { text-align:center; height:10%;}
        #find-id-phone-email button {
             width:50%; height:50px; 
             float:left; border:none; 
             box-shadow: rgb(248, 49, 46) 0px -1px 0px 0px inset;
             background-color:transparent;
             font-weight:600;}
        /* 이름/휴대폰번호 p, input */
        #find-id-name, #find-id-phone { height:16%;}
        #find-id-name p, #find-id-phone p, #input-code p { font-size:15px; font-weight:600; padding:5px; margin:0px 20px; width:50%; }
        #find-id-name input, #find-id-phone input { width:90%; height:50px; padding-left:10px; margin:0px 20px;
            border-radius:3px; border-color:rgb(220, 220, 220); border-style:solid;}
        /* 인증번호 받기 버튼 */
        #getcode {text-align:center; height:16%; width: 100%;}
        #getcode button {width:90%; height:50px; margin-top:30px;}
        /* 인증번호 입력, 버튼 */
        #input-code-btn {height:120px;}
        /* 왼 */
        #input-code {height:100%; width:280px; float:left;}
        #input-code input {width:90%; height:50px; margin:0px 20px;}
        #input-code span {color:rgb(253, 55, 55); font-size:12px; margin:20px;}
        /* 오 */
        #resend-btn {height:100%; width: 95px; float: left;}
        #resend-btn button {width:95px; height:50px; margin:2px; margin-top:32px;}
        /* 확인버튼 */
        #verify-btn {text-align:center; height:16%;}
        #verify-btn input {width:90%; height:50px; margin-top:30px;}
        
    </style>
</head>
<body>
	<div class="outer">
        <div class="find-id-area">

            <form action="" method="post" class="find-id-form">

                <div id="find-id"><h2>아이디 찾기</h2></div>
                <div id="find-id-phone-email">
                    <button type="button" id="find-id-phone">휴대폰 인증</button>
                    <button type="button" id="find-id-email">이메일 인증</button>
                </div>
                <div id="find-id-name">
                    <p>이름</p>
                    <input type="text" placeholder="이름을 입력해주세요" name="userName" required>
                </div>
                <div></div>
                <div id="find-id-phone">
                    <p>휴대폰 번호</p>
                    <input type="text" placeholder="휴대폰 번호를 입력해주세요 (-빼고 숫자만)" name="phone" required>
                </div>
                <!-- 인증번호 받기 버튼 -->
                <div id="getcode"><button type="button" class="btn btn-danger">인증번호 받기</button></div>

                <!-- 인증번호 왔을 때 -->
                <div id="input-code-btn">
                    <div id="input-code">
                        <p>인증번호</p>
                        <input type="text" required>
                        <span>인증번호를 입력해주세요.</span>
                    </div>
                    <div id="resend-btn"><button type="button" class="btn btn-danger">재발송</button></div>
                </div>
                
                <div id="verify-btn"><input type="submit" class="btn btn-danger" value="확인"></div>
            
            </form>

        </div>
    </div>

</body>
</html>