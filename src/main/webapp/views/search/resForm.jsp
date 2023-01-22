<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    /* 가로 규격 */
    .wrap{width: 1200px; margin: auto;}

    /* 헤드바 */
    .header div{border: 1px solid black;}
    #header1-padding, #header2-padding, #header3-padding{float:left; box-sizing: border-box; padding: 5px; height: 150px;}
    /* 헤드바 왼쪽, 오른쪽 영역 */
    #header1-padding, #header3-padding{width: 25%;}
    /* 헤드바 가운데 */
    #header2-padding{width: 50%;}
    /* 헤드바 높이 */
    #header1, #header2, #header3{height: 100%;}
    #header3-1, #header3-2{width: 100%; height: 50%; box-sizing: border-box; }
    /* 헤드바 하단 구분 선 */
    #header-line{width:100%; float: left; box-sizing: border-box; padding: 20px;}
    #header-line>div{height:3px; background-color: black;}


    /*content*/
    .content{
        border: 1px solid red;
        width: 1200px;
        box-sizing: border-box;
        margin: auto;
    }

    #content-padding{
        border:1px solid blue; 
        margin: auto;
        padding: 5px;
        box-sizing: border-box;
    }
    #content-padding>img{
        margin: auto;
        display: block;
    }

    .inputForm{
        width:200px;
        margin:auto;
   
    }
    
</style>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div id="header1-padding">
                <div id="header1">

                </div>
            </div>
            <div id="header2-padding">
                <div id="header2">
            </div>

            </div>
            <div id="header3-padding">
                <div id="header3">
                    <div id="header3-1"></div>
                    <div id="header3-2"></div>
                </div>
            </div>
        </div>
        <div id="header-line">
            <div></div>
        </div>    

        <div class="content">
            <div id="content-padding">

                <img src="images/푸딩로고.png" width="500px">

                <form action="">

                    <div class="inputForm">
                        대표자명 <span style="color:red;">*</span> <br>
                        <input type="text" name="ceo" id="ceo" required> <br>
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        상호명 <span style="color:red;">*</span>  <br>
                        <input type="text" name="resName" id="resName" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        사업자등록번호 <span style="color:red;">*</span>  <br>
                        <input type="text" name="permitNo" id="permitNo" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        주소 <span style="color:red;">*</span>  <br>
                        <input type="text" name="address" id="address" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        상세주소 <span style="color:red;">*</span>  <br>
                        <input type="text" name="dAddress" id="dAddress" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        전화번호 <span style="color:red;">*</span>  <br>
                        <input type="text" name="phone" id="phone" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        휴대폰번호 <span style="color:red;">*</span>  <br>
                        <input type="text" name="cellPhone" id="cellPhone" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        이메일 <span style="color:red;">*</span>  <br>
                        <input type="text" name="email" id="email" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        사업체유형 (업종) <span style="color:red;">*</span>  <br>
                        <input type="" name="foodCt" id="foodCt" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        주차여부 <span style="color:red;">*</span>  <br>
                        <input type="text" name="parking" id="parking" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        업체사진등록 <span style="color:red;">*</span>  <br> 
                        <input type="text" name="rImg" id="rImg" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    <br><br><br><br>
                    <p><button type="button" class="btn btn-danger btn-block" style="margin:auto; width:400px;">업체등록요청</button></p>

                </form>
            </div>
        </div>

        

        <script>


            // 아무것도 입력하지 않았을 때 "필수정보입니다."가 뜨도록 
            $(function(){
                $("#ceo").focusout(function(){
                    $(".requiredInfo").html("필수정보입니다.");    
                })
            })
     
        </script>

        <div id="footer">
        </div>
    </div>
</body>
</html>