<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fd.admin.model.vo.Faq" %>
    
<%
	Faq f = (Faq)request.getAttribute("f");
	/*int faqNo = (int)request.getAttribute("no");*/
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

    #select{
        width: 700px;
        height: 40px;
        padding-left: 15px;
    }

    #faqTitle>input {
        width: 700px;
        height: 40px;
        padding: 20px;
    }

    #enroll-faq textarea{
        width: 700px;
        height: 400px;
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

            <form action="<%= contextPath %>/faqUpdate.ad" id="enroll-faq" method="post">
                <input type="hidden" name="no" value="<%= f.getFaqNo()%>">

                <table>
                    <tr>
                        <th width="70">구분 <span id="required">*</span></th>
                        <td id="category">
                            <select id="select" name="category">
                                <option value="<%=f.getCategory()%>">
                                	<%= (f.getCategory().equals("caM")) ? "회원" : (f.getCategory().equals("caR")) ? "업체" : (f.getCategory().equals("caB")) ? "예약/결제/취소" : (f.getCategory().equals("caP")) ? "적립금" : "서비스이용" %>
                                </option>
                                <option value="caM">회원</option>
                                <option value="caR">업체</option>
                                <option value="caB">예약/결제/취소</option>
                                <option value="caP">적립금</option>
                                <option value="caS">서비스이용</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <th width="70">제목 <span id="required">*</span></th>
                        <td id="faqTitle">
                            <input type="text" name="title" value="<%= f.getFaqTitle() %>" required >
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <th>내용 <span id="required">*</span></th>
                        <td>
                            <textarea name="content" id="" rows="10" style="resize:none" required><%= f.getFaqContent() %></textarea>
                        </td>
                    </tr>
                </table>

                <br><br>
                <div align="center">
                    <button type="submit" class="btn btn-danger">수정하기</button>&nbsp&nbsp
                    <button type="submit" class="btn btn-outline-danger" onclick="history.back();">취소하기</button>
                </div>

            </form>
		</div>
        <br><br><br>
		
	
	<script>
		$(function(){
			
            // Head.jsp 내의 요소, #title의 문구를 변경
			$('#title').text("FAQ");
			$("#menu4").addClass("active");
			$("#menu4-detail-2").addClass("active");
            
		})
	</script>
</body>
</html>