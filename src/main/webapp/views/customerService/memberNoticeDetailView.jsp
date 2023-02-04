<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
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
        #content2-padding {width: 900px; height:1300px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float:left;}
        /* #content2-padding div {border:1px solid green;} */
        #notice-area {width: 100%; height: 135px; font-size: 30px; text-align: center; display: inline-block;}
        
        #detail-area {border-bottom: 1px solid black; border-top: 1px solid black; padding-top:20px;}
        
        th {height:40px; width: 100px; text-align: center; background-color: rgb(240, 239, 239);}
        .table td {padding-left:20px;}

        #btn-area a {margin-top: 70px;}
    </style>

</head>
<body>
	
    <%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/customerServiceSidebar.jsp" %>

    <div id="content2-padding">
        <div id="notice-area">
            <b>공지사항</b>
        </div>
        <div id="detail-area">

            <table class="table">
                <tr>
                    <th>제목</th>
                    <td>푸딩 공지사항</td>
                </tr>
                <tr>
                    <th width="70">작성자</th>
                    <td>푸딩 공지사항</td>
                </tr>
                <tr>
                    <th width="70">작성일</th>
                    <td>2023.01.22</td>
                </tr>     
                <tr>
                    <td colspan="2">
                        <br>
                        <p>
                            푸딩공지사항 
                        </p>
                        <br>
                    </td>
                </tr>
                
            </table>
        </div>

        <div id="btn-area" align="center">
            <a href="" class="btn btn-danger">수정하기</a>
        </div>

    </div>

</body>
</html>