<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.common.model.vo.Attachment" %>

<%
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
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
            <form align="center" action="<%=contextPath%>/baEnroll.ad" method="post" enctype="multipart/form-data">
                <table>
                	<% if(list.size()!=0){ %>
	                	<% for(int i=0; i<list.size(); i++){ %>
		                    <tr>
		                        <td>	
		                            <img src="<%=contextPath %>/<%=list.get(i).getFilePath() + list.get(i).getChangeName() %>" width="791.47px" height="250">
		                        	<br><br>
		                        </td>
		                    </tr>  
		                <% } %>
	                <% } else{ %>
	                	<tr>
	                        <td>
	                            <img src="" width="791.47px" height="250">
	                        </td>
	                    </tr>  
	                    <tr>
	                        <td>
	                            <br><img src="" width="791.47px" height="250">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <br><img src="" width="791.47px" height="250">
	                        </td>
	                    </tr>   
	                <% } %>
                    <tr><td><br></td></tr> 
                    <tr>
                        <td>
                            <button type="submit" class="btn btn-danger">등록하기</button>&nbsp;&nbsp;
                            <a href="<%=contextPath%>/baUpdateForm.ad" class="btn btn-danger">수정하기</a>&nbsp;&nbsp;
                            <a href="<%=contextPath%>/baDelete.ad" class="btn btn-outline-danger">삭제하기</a>
                        </td>
                    </tr>               
                </table>

    
                <br>
                
                
            </form>
            <br><br>

            
			
		</div>

		
	
	<script>
		$(function(){
            
            // Head.jsp 내의 요소, #title의 문구를 변경
			$('#title').text("메인 배너");
			$("#menu3").addClass("active");
			$("#menu3-detail-1").addClass("active");

		})

	</script>
</body>
</html>