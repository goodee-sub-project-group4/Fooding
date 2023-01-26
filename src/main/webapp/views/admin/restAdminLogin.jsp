<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            .login-area {margin:auto; width:800px; height:800px; padding-top: 200px;}
            .login-form {margin:auto; width:400px; height:500px; }
            /* 테두리 보기 위한 것 */
            /* .login-form div {border:1px solid black;} */

            /* 푸딩 로고*/
            #logo {
                margin-bottom: 70px;
                text-align: center;
                
            }
            /* 아이디, 비밀번호 input */
            #login-id, #login-pwd {text-align:center; height:13%;}
            #login-id input, #login-pwd input {border:1px; width:90%; height:50px; 
                margin-top:0px; padding-left:10px; border-radius:3px; border-color:rgb(220, 220, 220);
                border-style:solid;}
            /* 로그인, 회원가입 버튼 */
            #login-btn {text-align:center; height:13%;}
            #login-btn input {width:90%; height:50px;}
            /*업체, 관리자 버튼*/
            #rest{
                margin-left: 230px;
                width: 75px;
                height:35px;
                font-size: 14px;
            }
            #admin{
                margin-left: -5px;
                width: 75px;
                height:35px;
                font-size: 14px;
            }
            
        </style>
    </head>
    <body>
    
        <div class="outer">
            
            <div class="login-area">
                
                <form action="/Fooding/login.re.ad" method="post" class="login-form">
                    <div id="logo">
                        <img src="../../resources/images/logo.png" alt="" width="300px">
                    </div>
                    <!-- 관리자로그인인지 업체로그인인지 분간한다 -->
                    <input id="which" name="which"  type="hidden" value="rest">
                    
                    <div id="rest" class="btn btn-danger">업체</div>
                    <div id="admin" class="btn btn-outline-danger">관리자</div>
                    <script>
                        // 관리자 클릭시
                        $("#admin").click(function(){
                            $("#rest").attr("class", "btn btn-outline-danger");
                            $("#admin").attr("class", "btn btn-danger");
                            $('#which').val('admin');
                        });
                        // 업체 클릭시
                        $("#rest").click(function(){
                            $("#admin").attr("class", "btn btn-outline-danger");
                            $("#rest").attr("class", "btn btn-danger");
                            $('#which').val('rest');
                        });
    
                    </script>
    
                    <div id="login-id"><input type="text" name="userId" placeholder="아이디를 입력해주세요" required></div>
                    <div id="login-pwd"><input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요" required></div>
                    <div id="login-btn"><input type="submit" class="btn btn-danger" value="로그인"></div>
                </form>
    
            </div>
        </div>
    
    </body>
</html>