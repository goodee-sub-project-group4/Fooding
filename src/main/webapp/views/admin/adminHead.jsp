<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery와 부트스트랩 사용하기 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 부트스트랩 Badges 효과 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> 
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
<style>
    #outer {
        width:1200px;
        height:150px;
        margin:auto;
        box-sizing: border-box;
<<<<<<< HEAD
    }
    #title {
        font-size: 30px;
        font-weight: 400;
    }
    #outer>div {
        display: inline-block;        
        margin-top: 40px;
        box-sizing: border-box;
    }
    /* div1 = 로고영역 */
=======
        /* border:5px solid pink; */
    }
    #outer>div {
        display: inline-block;        
        margin-top: 30px;
        box-sizing: border-box;
    }
>>>>>>> 3efb957cd685bfde314175f13719ec98987f944b
    #div1 {
        position: relative;
        bottom: 5px;
    }
<<<<<<< HEAD
    /* div2 = 타이틀문구 영역 */
=======
>>>>>>> 3efb957cd685bfde314175f13719ec98987f944b
    #div2 {
        margin-right: 100px;
        margin-left: 100px;
        width:500px
    }
<<<<<<< HEAD
    /* div3 = 로그아웃, 프로필 영역 */
    #div3 span {
        margin:5px;
    }        
    #div3 h4 { 
        width : 100px;
        height : 50px;
        display: inline-block;
        margin-top: 20px;
    }
    #div3 img { 
        margin-bottom: 20px;
        margin-left:10px
    }  
=======
    #div3 a{
        text-decoration:none; color:black; font-size:12px;
    }
    #div3 span {
        margin:5px;
    }        
    #div3 h4 {
        display: inline-block;
        margin-top: 30px;
    }
    #div3 img {
        margin-bottom: 20px;
        margin-left:10px
    }
    #title {
        font-size: 30px;
        font-weight: 400;
    }
    

>>>>>>> 3efb957cd685bfde314175f13719ec98987f944b
</style>
</head>
<body>
    <div id="outer" align="center">
        <div id="div1">
            <img src="../../resources/images/logo.png" width="190">
        </div>
        <div id="div2">
            <h3 id="title" width="500">페이지마다 수정되는 타이틀</h3>
        </div>
        <div id="div3">
<<<<<<< HEAD
            <span>로그아웃</span>
            <span> | </span>
            <h4> 관리자01 님 </h4>
            <img src="../../resources/images/userIcon.png" width="50">
        </div>
        <hr>
    </div> 
=======
            <a href="">로그아웃</a>
            <span> | </span>
            <h4> 관리자01 님</h4>
            <img src="../../resources/images/userIcon.png" width="50">
        </div>
        <hr>
    </div>
    

>>>>>>> 3efb957cd685bfde314175f13719ec98987f944b
</body>
</html>