<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    /* 전체 */
    #content1-padding {float: left; margin: auto; padding: 5px; box-sizing:border-box; width: 25%; height: 1200px;}
    #content1{box-sizing: border-box; height: 100%;}
    #content1-1 {height: 120px; box-sizing: border-box; padding:60px 60px 10px 60px;}
    #content1-2 {height: 450px; box-sizing: border-box; padding:40px;}
    #content1-3 {height: 100px;}
    #content1-2 div { border:1px solid lightgrey; margin:0px; height:70px; padding:20px; font-size:17px; font-weight:600;}
    #content1-2 div:hover {background-color: rgb(244, 244, 244); cursor: pointer; color:red;}
    #content1-2 a {color:black; text-decoration:none; display:block;}
    .arrow {float: right;}
    #content1-3 div {
        background-color:rgb(240, 239, 239);
        margin:14px 40px;
        height:70px;
        padding:10px 20px;
        width:205px;
        border-radius: 0px 50px 50px 0px;
        font-weight:500;
    }
    #content1-3 div:hover { background-color:rgb(251, 249, 249); cursor: pointer;}
	</style>
</head>
<body>
   <div class="wrap">
     
       <div class="content">
           <div id="content1-padding">
               <div id="content1">
                   <div id="content1-1"><h2><b>마이페이지</b></h2></div>
                   <div id="content1-2">
                       <div><a href="<%=request.getContextPath()%>/check.bo">예약/결제내역<span class="arrow">></span></a></div>
                       <div><a href="<%=request.getContextPath()%>/reviewList.me">리뷰조회<span class="arrow">></span></a></div>
                       <div><a href="">적립금조회<span class="arrow">></span></a></div>
                       <div><a href="<%=request.getContextPath()%>/zzim.is">찜하기조회<span class="arrow">></span></a></div>
                       <div><a href="<%=request.getContextPath()%>/myPageConfirmPwd.me">개인정보수정<span class="arrow">></span></a></div>
                   </div>
                   <div id="content1-3">
                       <div>도움이 필요하신가요?<br>1 : 1 문의하기 ></div>
                   </div>
               </div>
           </div>
       </div>

	</div>
</body>
</html>