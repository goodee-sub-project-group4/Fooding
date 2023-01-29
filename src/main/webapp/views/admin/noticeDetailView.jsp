<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.fd.admin.model.vo.Notice, com.fd.common.model.vo.Attachment" %>
<%
	Notice n = (Notice)request.getAttribute("n");	// 글번호, 제목, 내용, 작성자아이디, 작성이 담겨있음
	Attachment at = (Attachment)request.getAttribute("at");	// 첨부파일 없을 경우 null, 있을 경우 파일번호, 원본명, 실제저장된파일명, 저장경로 담겨있음
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
       
    #outer2 {
        width:1200px;
        height: 800px;
        position: relative;
        margin:auto;
    }			
    
    #content {
        width:950px;
        display: inline-block;
        box-sizing: border-box;
        position:absolute;
        right:10px;
        /* margin-top: -60px; 내려가있어서 위로 올려줌 */
    }
    #menubar {
        width: 220px;
        height: 100%;
        z-index: 1000;
        position: absolute;
    }

    
    /* ↓↓↓ 컨텐츠용 스타일 */
    
    form{
        margin: 30px;
    }

    th {height:40px; width: 100px;}

    #detail-area p{
        width: 800px;
        box-sizing: border-box;
        padding: 20px;
    }



</style>
</head>
<body>
	<%@ include file="adminHead.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="adminMenubar.jsp" %>
		</div>
		<div id="content" class="container">

			<!-- 컨텐츠 작성부 -->
			<br><br>
            
            <form action="" id="detail-area">
                
                <table class="table">
                    <tr>
                        <th>제목</th>
                        <td><%= n.getNoticeTitle() %></td>
                    </tr>
                    <tr>
                        <th width="70">작성자</th>
                        <td><%= n.getUserNo() %></td>
                    </tr>
                    <tr>
                        <th width="70">작성일</th>
                        <td><%= n.getCreateDate() %></td>
                    </tr>     
                    <tr>
                        <td colspan="2">
                            <br>
                            <p>
                                <%= n.getNoticeContent() %> 
                            </p>
                        </td>
                    </tr>
                    <tr>
                        <td>첨부파일</td>
                        <td>
               				<% if(at == null) { %>
                     			첨부파일이 없습니다.
                     		<% }else { %>
                     			<a href="<%= contextPath %>/<%=at.getFilePath() + at.getChangeName() %>"><%= at.getOriginName() %></a>
                     		<% } %>
                        </td>
                    </tr>
                </table>


            </form>
            
            
            <div align="center">
                <a href="" class="btn btn-outline-danger">목록가기</a>&nbsp&nbsp
                <a href="<%= contextPath%>/noUpdate.ad?no=<%=n.getNoticeNo()%>" class="btn btn-danger">수정하기</a>&nbsp&nbsp
                <a href="" class="btn btn-danger">삭제하기</a>
            </div>
            <br><br><br>
		</div>


	
	<script>
		$(function(){

            // Head.jsp 내의 요소, #title의 문구를 변경
			$('#title').text("공지사항");
			$("#menu4").addClass("active");
			$("#menu4-detail-1").addClass("active");
            
		})
	</script>
</body>
</html>