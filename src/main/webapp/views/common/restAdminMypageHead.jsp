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
<style>
    div {
        /* border: 1px solid black; */
    }
    #outer {
        padding: 10px;
        height:180px;
        box-sizing: border-box;
    }
    #outer>div {
        display: inline-block;
        margin-right: 130px;
        margin-left: 130px;
        margin-top: 30px;
        box-sizing: border-box;
    }
    #div1 {
        position: relative;
        bottom: 5px;
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
    

</style>
</head>
<body>
    <div id="outer" align="center">
        <div id="div1">
            <img src="../../resources/images/logo.png" width="170">
        </div>
        <div id="div2">
            <h3 id="title">페이지마다 수정되는 타이틀</h3>
        </div>
        <div id="div3">
            <span>로그아웃</span>
            <span> | </span>
            <h4> 업체01 님</h4>
            <img src="../../resources/images/userIcon.png" width="50">
        </div>
       
        <hr><br>
    </div>
    

</body>
</html>