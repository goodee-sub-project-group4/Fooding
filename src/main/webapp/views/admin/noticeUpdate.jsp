<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fd.admin.model.vo.Notice, com.fd.common.model.vo.Attachment" %>
<%
	Notice n = (Notice)request.getAttribute("n");
	Attachment at = (Attachment)request.getAttribute("at");
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

    th{
        vertical-align: top;
        padding-top: 5px;
    }

    th>span{
        color: red;
    }

    #noticeTitle>input {
        width: 700px;
        height: 40px;
        padding: 20px;
    }

    #enroll-notice textarea{
        width: 700px;
        height: 400px;
        box-sizing: border-box;
        padding: 20px;
    }

    #noticeImg{  
        padding: 5px;
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

            <form action="<%= contextPath %>/noUpdate.ad" id="enroll-notice" method="post" enctype="multipart/form-data">
            	
            	<input type="hidden" name="no" value="<%=n.getNoticeNo()%>">
                
                <table>
                    <tr>
                        <th width="70">제목 <span id="required">*</span></th>
                        <td id="noticeTitle">
                            <input type="text" name="title" value="<%= n.getNoticeTitle() %>" required >
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <th>내용 <span id="required">*</span></th>
                        <td>
                            <textarea name="content" id="" rows="10" style="resize:none" required><%= n.getNoticeContent() %></textarea>
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <th id="imgTitle">첨부파일</th>
                        <td id="noticeImg">
                        	<% if(at != null){ %>
                        		<%= at.getOriginName() %>
                            	<input type="hidden" name="originFileNo" value="<%=at.getFileNo()%>"> 
                            <% } %>
                            <input type="file" name="upfile">
                        </td>
                    </tr>
                </table>

                <br><br>
                <div align="center">
                    <button type="submit" class="btn btn-danger">수정하기</button>&nbsp&nbsp
                    <button type="button" class="btn btn-outline-danger" onclick="history.back();">취소하기</button>
                </div>

            </form>
		</div>
        <br><br><br>
		
	
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