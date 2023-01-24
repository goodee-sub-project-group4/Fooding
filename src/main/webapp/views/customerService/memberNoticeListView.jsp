<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
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
        #content2-padding {width: 900px; height: 1000px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float:left;}
        /*#content2-padding div {border:1px solid green;}*/
        #notice-area {width: 100%; height: 135px; font-size: 30px; text-align: center;}
        /* 목록부분 */
        #list-area {height: 600px;}
        table td, table th {
        margin:auto;
        text-align: center;
        line-height: 25px;     
        }

        /*페이징바*/
        .pagination a{
        color:red;
        }
    </style>

</head>
<body>

	<%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/CustomerServiceSidebar.jsp" %>

    <div id="content2-padding">
        <div id="notice-area">
            <b>공지사항</b>
        </div>

        <div id="list-area">
            <table class="table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td id="noticeTitle">푸딩 공지사항</td>
                        <td>푸딩</td>
                        <td>0</td>
                        <td>2023.01.22</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td id="noticeTitle">푸딩 공지사항</td>
                        <td>푸딩</td>
                        <td>0</td>
                        <td>2023.01.22</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td id="noticeTitle">푸딩 공지사항</td>
                        <td>푸딩</td>
                        <td>0</td>
                        <td>2023.01.22</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td id="noticeTitle">푸딩 공지사항</td>
                        <td>푸딩</td>
                        <td>0</td>
                        <td>2023.01.22</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td id="noticeTitle">푸딩 공지사항</td>
                        <td>푸딩</td>
                        <td>0</td>
                        <td>2023.01.22</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td id="noticeTitle">푸딩 공지사항</td>
                        <td>푸딩</td>
                        <td>0</td>
                        <td>2023.01.22</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td id="noticeTitle">푸딩 공지사항</td>
                        <td>푸딩</td>
                        <td>0</td>
                        <td>2023.01.22</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td id="noticeTitle">푸딩 공지사항</td>
                        <td>푸딩</td>
                        <td>0</td>
                        <td>2023.01.22</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td id="noticeTitle">푸딩 공지사항</td>
                        <td>푸딩</td>
                        <td>0</td>
                        <td>2023.01.22</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td id="noticeTitle">푸딩 공지사항</td>
                        <td>푸딩</td>
                        <td>0</td>
                        <td>2023.01.22</td>
                    </tr>

                </tbody>	
            </table>
    
        </div>
        <div>
            <ul class="pagination justify-content-center" style="margin:50px 0">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
            </ul>
        </div> 
        <br><br><br>

    </div>    


</body>
</html>