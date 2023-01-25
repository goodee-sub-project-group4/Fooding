<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Fooding</title>

<!-- 부트스트랩 사용하기 -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!--제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
<!-- 부트스트랩 Badges 효과 위해 바꾼 구문-->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">  -->

<!-- 부트스트랩 5버전 -->
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
    #outer {
        width:1200px;
        height:150px;
        margin:auto;
        box-sizing: border-box;
    }
    #title {
        font-size: 30px;
        font-weight: 600;
        color: rgb(71, 71, 71);
    }
    
    #outer>div {
        display: inline-block;        
        margin-top: 40px;
        box-sizing: border-box;
    }
    /* div1 = 로고영역 */
    #div1 {
        position: relative;
        bottom: 5px;
    }
    /* div2 = 타이틀문구 영역 */
    #div2 {
        margin-right: 100px;
        margin-left: 100px;
        width:500px
    }
    /* div3 = 로그아웃, 프로필 영역 */
    #div3 span {
        margin:5px;
    }        
    #div3 h4 { 
        width : 100px;
        height : 50px;
        display: inline-block;
        margin-top: 20px;
        font-size: 20px;
    }
    #div3 img { 
        margin-bottom: 20px;
        margin-left:10px
    }   
    

</style>
</head>
<body>
    <div id="outer" align="center">
        <div id="div1">
            <img src="resources/images/logo.png" width="190">
        </div>
        <div id="div2">
            <h3 id="title" width="500">페이지마다 수정되는 타이틀</h3>
        </div>
        <div id="div3">
            <span>로그아웃</span>
            <span> | </span>
            <h4> 업체01 님 </h4>
            <img src="resources/images/userIcon.png" width="50">
        </div>
        <hr>
    </div>
    

</body>
</html>