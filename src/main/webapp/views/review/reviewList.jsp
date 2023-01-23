<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰리스트</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 제이쿼리 구문 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<style>
        /* 리뷰바상단 */
        #content2-padding {width: 900px; height: 1000px; margin:auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float: left;}
        /* #content2-padding div {border:1px solid green;} */
        #review-area {width: 100%; height: 135px; font-size: 30px; margin-bottom: 30px; text-align: center;}
        #revise-btn {width:10%; margin-left:774px; margin-top:65px;}
        #revise-btn button {width:60px; height:35px; padding:3px;}

        /* 타이틀 */
        #review-title {height:60px; border-bottom:1px solid black; border-top:1px solid black; position:relative; text-align:center; font-weight: 600;}
        #review-title1 {height:100%; width:5%;}
        #review-title2 {height:100%; width:5%; position:absolute; top:0px; left:5%; padding-top:14px;}
        #review-title3 {height:100%; width:55%; position:absolute; top:0px; left:10%; padding-top:14px;}
        #review-title4 {height:100%; width:10%; position:absolute; top:0px; left:65%; padding-top:14px;}
        #review-title5 {height:100%; width:15%; position:absolute; top:0px; left:75%; padding-top:14px;}
        #review-title6 {height:100%; width:10%; position:absolute; top:0px; left:90%;}
       
        /* 내용틀 */
        #review-content {height:180px; border-bottom:1px solid black; position:relative;}
        #review-content1 {height:100%; width:5%; text-align:center; padding-top:70px;}
        #review-content2 {height:100%; width:5%; position:absolute; top:0px; left:5%; text-align:center; padding-top:70px;}
        #review-content3 {height:100%; width:20%; position:absolute; top:0px; left:10%;text-align:center; padding-top:20px;}
        #review-content4 {height:100%; width:35%; position:absolute; top:0px; left:30%;}
        #review-content5 {height:100%; width:10%; position:absolute; top:0px; left:65%; text-align:center; padding-top:70px;}
        #review-content6 {height:100%; width:15%; position:absolute; top:0px; left:75%; text-align:center; padding-top:70px;}
        #review-content7 {height:100%; width:10%; position:absolute; top:0px; left:90%; text-align:center; padding-top:65px;}

        /* 내용 */
        #review-content4-1 {height:30%; padding:20px; padding-top:40px; font-weight:600;}
        #review-content4-2 {height:70%; padding:20px; color:rgb(86, 86, 86);}
        #review-content7 button {height:35px;}
        
        /* 페이징 */
        #paging {margin-top: 50px;}
        .container a {color:red; }
        .pagination {justify-content: center;}        

    </style>
    
</head>
<body>

	<%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/myPageSidebar.jsp" %>

    <div id="content2-padding">
        <div id="review-area">
            <b>내가 쓴 리뷰</b>
            <div id="revise-btn"><button type="button" class="btn btn-outline-danger">삭제</button></div>
        </div>
        <div id="review-title">
            <div id="review-title1"></div>
            <div id="review-title2">번호</div>
            <div id="review-title3">예약명</div>
            <div id="review-title4">별점</div>
            <div id="review-title5">작성일</div>
            <div id="review-title6"></div>
        </div>
        <div id="review-content">
            <div id="review-content1"><input type="checkbox" style="width:20px; height:20px; accent-color: rgb(222, 66, 66); "></div>
            <div id="review-content2">3</div>
            <div id="review-content3"><img src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230123_223422687.jpg" width="120" height="140"></div>
            <div id="review-content4">
                <div id="review-content4-1">식당이름</div>
                <div id="review-content4-2">리뷰내용</div>
            </div>
            <div id="review-content5">★ 4.5</div>
            <div id="review-content6">2023.01.23</div>
            <div id="review-content7"><button type="button" class="btn btn-danger">수정</button></div>
        </div>
        <div id="review-content">
            <div id="review-content1"><input type="checkbox" style="width:20px; height:20px; accent-color: rgb(222, 66, 66); "></div>
            <div id="review-content2">2</div>
            <div id="review-content3"><img src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230123_223422687.jpg" width="120" height="140"></div>
            <div id="review-content4">
                <div id="review-content4-1">식당이름</div>
                <div id="review-content4-2">리뷰내용</div>
            </div>
            <div id="review-content5">★ 4.5</div>
            <div id="review-content6">2023.01.23</div>
            <div id="review-content7"><button type="button" class="btn btn-danger">수정</button></div>
        </div>
        <div id="review-content">
            <div id="review-content1"><input type="checkbox" style="width:20px; height:20px; accent-color: rgb(222, 66, 66); "></div>
            <div id="review-content2">1</div>
            <div id="review-content3"><img src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230123_223422687.jpg" width="120" height="140"></div>
            <div id="review-content4">
                <div id="review-content4-1">식당이름</div>
                <div id="review-content4-2">리뷰내용</div>
            </div>
            <div id="review-content5">★ 4.5</div>
            <div id="review-content6">2023.01.23</div>
            <div id="review-content7"><button type="button" class="btn btn-danger">수정</button></div>
        </div>
        <div id="paging">
            <div class="container">                  
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>