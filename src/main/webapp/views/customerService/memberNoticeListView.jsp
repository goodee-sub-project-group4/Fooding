<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.admin.model.vo.Notice" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
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
        .list-area {height: 600px;}
        table td, table th {
        margin:auto;
        text-align: center;
        line-height: 25px;     
        }
        
        tbody:hover {cursor:pointer;}

        /*페이징바*/
        .pagination a{
        color:red;
        }

    </style>

</head>
<body>

	<%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/customerServiceSidebar.jsp" %>

    <div id="content2-padding">
        <div id="notice-area">
            <b>공지사항</b>
        </div>

	
        <div class="list-area">
            <table class="table">
                <thead>
                    <tr>
                        <th width="100px">번호</th>
                        <th width="450px">제목</th>
                        <th width="120px">작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                <% if(list.isEmpty()) { %>
                    <!-- 공지글이 없을 경우 -->
                    <tr>
                    	<td colspan=5><b>존재하는 공지사항이 없습니다.</b></td>
                    </tr>
                <% } else { %>    
                    <!-- 공지글이 있을 경우 -->
                    <% for(Notice n : list) { %>
                    <tr>
                        <td><%=n.getNoticeNo()%></td>
                        <td><%=n.getNoticeTitle()%></td>
                        <td><%=n.getUserNo()%></td>
                        <td><%=n.getCount()%></td>
                        <td><%=n.getCreateDate()%></td>
                    </tr>
                    <% } %>
                <% } %>
                </tbody>	
            </table>
            <script>
            	
            	$(function() {
            		$(".table>tbody>tr").click(function() {
            			
            			const num = $(this).children().eq(0).text() // 클릭했을 때 글번호
            			
            			location.href = "<%=contextPath%>/noticeDetail.me?no=" + num;
            		})
            	})
            
            
            </script>
    
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
        

    </div>    


</body>
</html>