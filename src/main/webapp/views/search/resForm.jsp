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
        width: 200px;
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
                        <span class="requiredInfo" id="ceoSpan"></span>
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
                        <span class="requiredInfo" id="pNoSpan"></span>
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
                        <span class="requiredInfo" id="phoneSpan"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        휴대폰번호 <span style="color:red;">*</span>  <br>
                        <input type="text" name="cellPhone" id="cellPhone" required> <br> 
                        <span class="requiredInfo" id="cellSpan"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        이메일 <span style="color:red;">*</span>  <br>
                        <input type="email" name="email" id="email" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>


                    <div class="inputForm">
                        사업체유형 (업종) <span style="color:red;">*</span>  <br>

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
                        <span class="requiredInfo"></span>
                    </div> 
                    <br><br>

                    <div class="inputForm">
                        주차여부 <span style="color:red;">*</span>  <br>
                        <input type="checkbox" name="parking" id="parkingY" checked> <label for="parkingY">가능</label>
                        <input type="checkbox" name="parking" id="parkingN"> <label for="parkingN">불가능</label>
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>


                    <div class="inputForm">
                        업체사진등록 <span style="color:red;">*</span>  <br> 
                        <input type="file" name="rImg" id="rImg" required> <br> 
                        <span class="requiredInfo"></span>
                    </div>
                    <br><br>

                    
                    <br><br><br><br>
                    <p><button type="submit" class="btn btn-danger btn-block" style="margin:auto; width:400px;" onclick="return validate();">업체등록요청</button></p>

                </form>
            </div>
        </div>

        

        <script>


            // 아무것도 입력하지 않았을 때 "필수정보입니다."가 뜨도록 
            
            /*
            $(function(){
                $("#ceo").focusout(function(){

                    // 아무것도 입력되지 않았을 때 
                    $(".requiredInfo").html("필수정보입니다.");    
                })
            })
            */

            // 자바스크립xm --> 유효성체크 
            function validate(){
                // (1)대표자명, (2)사업자등록번호, (3)전화번호 (4) 휴대폰번호 유효성체크 

                const ceoInput = document.getElementById("ceo"); 
                const pNoInput = document.getElementById("permitNo");
                const phoneInput = document.getElementById("phone"); 
                const cellInput = document.getElementById("cellPhone"); 

                // (1) 대표자명 유효성체크 (한글로 2글자 이상)
                let regExp = /^[가-힣]{2,}$/;
                if(!regExp.test(ceoInput.value)){
                    document.getElementById("ceoSpan").innerHTML = "유효한 이름을 입력해주세요!";
                    return false; 
                }

                // (2) 사업자번호 유효성체크 (xxx-xx-xxxxx 형식) 
                regExp = /^\d{3}-\d{2}-\d{5}/;
                if(!regExp.test(pNoInput.value)){
                    document.getElementById("pNoSpan").innerHTML = "xxx-xx-xxxxx 형식으로 입력해주세요!"
                    return false; 
                }

                // (3) 전화번호 ( 숫자2개or3개-숫자3개-숫자4개 형식)
                regExp = /^0\d{1,2}-\d{3}-\d{4}$/;
                if(!regExp.test(phoneInput.value)){
                    document.getElementById("phoneSpan").innerHTML = "0xx(또는 0x)-xxx-xxxxx 형식으로 입력해주세요!"
                    return false; 
                }

                // (4) 핸드폰
                regExp = /^0\d{2}-\d{4}-\d{4}$/;
                if(!regExp.test(cellInput.value)){
                    document.getElementById("cellSpan").innerHTML = "0xx-xxx-xxxxx 형식으로 입력해주세요!"
                    return false; 
                }
            }
            
        </script>

        <div id="footer">
        </div>
    </div>
</body>
</html>