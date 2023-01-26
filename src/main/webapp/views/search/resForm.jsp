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
    
    .ss{
        color:red; 
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

                <img src="/Fooding/resources/images/logo.png" width="500px">

                <form action="">

                    <div class="inputForm">
                        대표자명 <span style="color:red;">*</span> <br>
                        <input type="text" name="ceo" id="ceo" required> <br>
                        <span id="ceoHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        상호명 <span style="color:red;">*</span>  <br>
                        <input type="text" name="resName" id="resName" required> <br> 
                        <span id="resNameHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        사업자등록번호 <span style="color:red;">*</span>  <br>
                        <input type="text" name="permitNo" id="permitNo" required> <br> 
                        <span id="permitNoHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        주소 <span style="color:red;">*</span>  <br>
                        <input type="text" name="address" id="address" required> <br> 
                        <span id="addressHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        상세주소 <span style="color:red;">*</span>  <br>
                        <input type="text" name="dAddress" id="dAddress" required> <br> 
                        <span id="dAddressHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        전화번호 <span style="color:red;">*</span>  <br>
                        <input type="text" name="phone" id="phone" required> <br> 
                        <span id="phoneHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        휴대폰번호 <span style="color:red;">*</span>  <br>
                        <input type="text" name="cellPhone" id="cellPhone" required> <br> 
                        <span id="cellHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        이메일 <span style="color:red;">*</span>  <br>
                        <input type="email" name="email" id="email" required> <br> 
                        <span id="emailHelper" class="ss"></span>
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
                    </div> 
                    <br><br>

                    <div class="inputForm">
                        주차여부 <span style="color:red;">*</span>  <br>
                        <input type="checkbox" name="parking" id="parkingY" checked> <label for="parkingY">가능</label>
                        <input type="checkbox" name="parking" id="parkingN"> <label for="parkingN">불가능</label>
                    </div>
                    <br><br>


                    <div class="inputForm">
                        업체사진등록 <span style="color:red;">*</span>  <br> 
                        <input type="file" name="rImg" id="rImg" required> <br> 
                    </div>
                    <br><br>

                    
                    <br><br><br><br>
                    <p><button type="submit" class="btn btn-danger btn-block" style="margin:auto; width:400px;" >업체등록요청</button></p>

                </form>
            </div>
        </div>

        

        <script>

        
            // (1) 대표자명, 상호명, 사업자등록번호, 주소, 상세주소, 전화번호, 휴대폰번호, 이메일 입력 칸에 

            // 아무것도 입력하지 않았을 때 "필수정보입니다."가 뜨도록 !!
            

            // (2) 유효성체크를 위한 regExp 전역변수 선언 

            let regExp; 

            //업체등록요청 버튼을 누르지 않아도 입력칸에서 focusout 이벤트가 발생하는 순간, 바로바로 유효성체크가 이뤄지도록) 

            // 유효성체크할 목록: 대표자명, 사업자등록번호, 전화번호, 휴대폰번호
            
            $(function(){

                // 1) 대표자명 아무것도 입력 안 했을 때 
                // 대표자명에서 커서가 이동할 때 
                $("#ceo").focusout(function(){
                    // 대표자명 값이 null 값이라면 
                    if($("#ceo").val() == "" || $("#ceo").val() == null){
                        $("#ceoHelper").html("필수정보입니다."); 
                    }else{
                        // 대표자명 값이 null 값이 아니라면 --> 유효성체크(한글로 2글자 이상)
                        regExp = /^[가-힣]{2,}$/;
                        if(!regExp.test($("#ceo").val())){
                            $("#ceoHelper").html("한글로 2글자 이상의 이름을 입력해주세요");
                        }else{
                            $("#ceoHelper").html(""); 
                        }
                    }
                })


                // 2) 상호명 아무것도 입력 안 했을 때 
                // 상호명에서 커서가 이동할 때 
                $("#resName").focusout(function(){
                    // 상호명 값이 null 값이라면 
                    if($("#resName").val() == "" || $("#resName").val() == null){
                        $("#resNameHelper").html("필수정보입니다."); 
                    }else{
                        $("#resNameHelper").html(""); 
                    }
                })

                // 3) 사업자등록번호 아무것도 입력 안 했을 때 
                // 사업자등록번호에서 커서가 이동할 때 
                $("#permitNo").focusout(function(){
                    // 사업자등록번호 값이 null 값이라면 
                    if($("#permitNo").val() == "" || $("#permitNo").val() == null){
                        $("#permitNoHelper").html("필수정보입니다."); 
                    }else{
                        // 사업자등록번호 null 값이 아니라면 -->유효성체크(xxx-xx-xxxxx 형식) 
                        regExp = /^\d{3}-\d{2}-\d{5}/;
                        if(!regExp.test($("#permitNo").val())){
                            $("#permitNoHelper").html("xxx-xx-xxxxx 형식으로 입력해주세요!");
                        }else{
                            $("#permitNoHelper").html(""); 
                        }

                    }
                })


                // 4) 주소 아무것도 입력 안 했을 때 
                // 주소에서 커서가 이동할 때 
                $("#address").focusout(function(){
                    // 주소 값이 null이라면
                    if($("#address").val() == "" || $("#address").val() == null){
                        $("#addressHelper").html("필수정보입니다.");
                    }else{
                        $("#addressHelper").html(""); 
                    }
                })

                // 5) 상세주소 아무것도 입력 안 했을 때 
                // 상세주소에서 커서가 이동할 때 
                $("#dAddress").focusout(function(){
                    // 상세주소 값이 null 이라면 
                    if($("#dAddress").val() == "" || $("#dAddress").val() == null){
                        $("#dAddressHelper").html("필수정보입니다."); 
                    }else{
                       $("#dAddressHelper").html(""); 
                    }
                })

                // 6) 전화번호 아무것도 입력 안 했을 때 
                // 전화번호에서 커서가 이동할 때 
                $("#phone").focusout(function(){ 
                    // 전화번호 값이 null 이라면 
                    if($("#phone").val() == "" || $("#phone").val() == null){
                        $("#phoneHelper").html("필수정보입니다."); 
                    }else{ 
                        // 전화번호 값이 null 값이 아니라면 --> 유효성체크(0xx-xxx-xxxx 형식 또는 0x-xxx-xxxx 형식)) 
                        regExp = /^0\d{1,2}-\d{3}-\d{4}$/;
                        if(!regExp.test($("#phone").val())){
                            $("#phoneHelper").html("0xx-xxx-xxxx 형식으로 입력해주세요!"); 
                        }else{
                            $("#phoneHelper").html(""); 
                        }

                    }
                })


                // 7) 휴대폰번호 아무것도 입력 안 했을 때
                // 휴대폰번호에서 커서가 이동할 때 
                $("#cellPhone").focusout(function(){
                    // 휴대폰번호 값이 null이라면 
                    if($("#cellPhone").val() == "" || $("#cellPhone").val() == null){
                        $("#cellHelper").html("필수정보입니다."); 
                    }else{
                        // 휴대폰번호 값이 null 값이 아니라면 --> 유효성체크(0xx-xxxx-xxxx 형식)
                        regExp = /^0\d{2}-\d{4}-\d{4}$/;
                        if(!regExp.test($("#cellPhone").val())){
                            $("#cellHelper").html("0xx-xxxx-xxxx 형식으로 입력해주세요!"); 
                        }else{
                            $("#cellHelper").html(""); 
                        }
                    }
                })


                // 8) 이메일 아무것도 입력 안 했을 때 
                // 이메일에서 커서가 이동할 때 
                $("#email").focusout(function(){
                    // 이메일 값이 null이라면
                    if($("#email").val() == "" || $("#email").val() == null){
                        $("#emailHelper").html("필수정보입니다."); 
                    }else{
                        $("#emailHelper").html(""); 
                    }
                })
 
            })

   
        </script>

        <div id="footer">
        </div>
    </div>
</body>
</html>