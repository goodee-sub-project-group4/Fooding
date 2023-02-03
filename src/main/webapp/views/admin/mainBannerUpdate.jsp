<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.common.model.vo.Attachment" %>

<%
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
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
            <form align="center" action="<%=contextPath%>/baUpdate.ad" method="post" enctype="multipart/form-data">
                <table>          
	                	<% for(int i=0; i<list.size(); i++){ %>
		                    <tr>
		                        <td>	
		                            <img src="<%=contextPath %>/<%=list.get(i).getFilePath() + list.get(i).getChangeName() %>" id='<%= "bannerImg" + String.valueOf(i+1)%>' class="bannerImg" width="791.47px" height="250" onclick="clickFile(<%= i %>+1);">
                                    <br><br>
		                        </td>
		                    </tr>  
		                <% } %>          
                    <tr><td><br></td></tr> 
                    <tr>
                        <td>
                            <button type="submit" class="btn btn-danger">수정하기</button>&nbsp;&nbsp;
                            <button type="reset" class="btn btn-outline-danger" onclick="history.back();">취소하기</button>
                        </td>
                    </tr>               
                </table>

                <div id="file-area" style="display: none;">
                
                    <% if(at != null) {%>
	                    <input type="hidden" name="originFileNo" value="<%=at.getFileNo()%>">
					<% } %>
                    <input type="file" name="file1" onchange="loadImg(this, 1);">
                    <input type="file" name="file2" onchange="loadImg(this, 2);">
                    <input type="file" name="file3" onchange="loadImg(this, 3);">
                </div>


                
    
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

        function clickFile(num){
        	$('input[name=file'+num+']').click();
        }
		
        


        function loadImg(inputFile, num){
            if(inputFile.files.length == 1){
                const reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function(e){
                    switch(num){
                        case 1 : $("#bannerImg1").attr("src", e.target.result); break;
                        case 2 : $("#bannerImg2").attr("src", e.target.result); break;
                        case 3 : $("#bannerImg3").attr("src", e.target.result); break;
                    }
                }
            }else{
                switch(num){
                    case 1 : $("#bannerImg1").attr("src", null); break;
                    case 2 : $("#bannerImg2").attr("src", null); break;
                    case 3 : $("#bannerImg3").attr("src", null); break;
                }
            }
        }


	</script>
</body>
</html>