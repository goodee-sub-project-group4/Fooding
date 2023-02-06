<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.fd.restaurant.model.vo.Restaurant" %>
<%
	Restaurant r = (Restaurant)request.getAttribute("r");	
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

    #registerContent{
        padding: 60px;
    }
    
    .contentDetail>div{
        display: inline-block;
    }

    .detailTitle{
        width:170px; height: 40px; 
        color: rgb(46, 46, 46);
           
    }

    .inputContent{
        border: 1px solid rgb(223, 223, 223);
        color: dimgray;
        width: 500px; height: 30px;
        border-radius: 5px;
        padding: 2px;
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
                        <th width="70">업체명</th>
                        <td><%=r.getResName() %></td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td><%=r.getApplyDate() %></td>
                    </tr>    
                    <tr>
                        <td colspan="2" id="registerContent">
                            <div class="contentDetail">
                                <input type="hidden" name="resNo" value="<%=r.getResNo() %>">
                                <div class="detailTitle">대표자명</div><div class="inputContent"><%= r.getCeo() %></div><br>
                                <div class="detailTitle">상호명</div><div class="inputContent"><%=r.getResName() %></div><br>
                                <div class="detailTitle">사업자등록번호</div><div class="inputContent"><%=r.getPermitNo() %></div><br>
                                <div class="detailTitle">주소</div><div class="inputContent"><%=r.getAddress() %></div><br>
                                <div class="detailTitle">상세주소</div><div class="inputContent"><%=r.getdAddress() %></div><br>
                                <div class="detailTitle">전화번호</div><div class="inputContent"><%=r.getPhone() %></div><br>
                                <div class="detailTitle">휴대폰번호</div><div class="inputContent"><%=r.getCellphone() %></div><br>
                                <div class="detailTitle">이메일</div><div class="inputContent"><%=r.getEmail() %></div><br>
                                <div class="detailTitle">사업체유형(업종)</div><div class="inputContent"><%=r.getFoodCt() %></div><br>
                                <div class="detailTitle">주차여부</div><div class="inputContent">
                                											<%= (r.getParking().equals("Y")) ? "주차 가능" : (r.getParking().equals("N")) ? "주차 불가" : "" %>
                                											
                                									</div><br>
                                <div class="detailTitle">업체사진등록</div><div class="inputContent" style="width: 300px; height: 200px;"><img src="<%=contextPath %><%=r.getImg() %>" alt=""></div><br>
                      			
                            </div>

                        </td>
                    </tr>
                    
                </table>

                <div align="center">
                    <button type="button" class="btn btn-outline-danger" style="width:90px" onclick="history.back();">확인</button>&nbsp&nbsp 
                    <button type="submit" class="btn btn-danger" style="width:90px" formaction="<%=contextPath%>/setY.ad" <%=(r.getStatus().equals("C"))? "disabled" : ""%> <%=(r.getStatus().equals("N"))? "disabled" : ""%>>업체등록</button>&nbsp&nbsp
                    <button type="submit" class="btn btn-danger" style="width:90px" formaction="<%=contextPath%>/setN.ad" <%=(r.getStatus().equals("C"))? "disabled" : ""%> <%=(r.getStatus().equals("N"))? "disabled" : ""%>>반려</button>
                </div>
                <br><br><br><br><br>

            </form>
            
            
            
		</div>


	
	<script>
		
        $(function(){
               
               // Head.jsp 내의 요소, #title의 문구를 변경
               $('#title').text("업체 등록 요청");
               $("#menu4").addClass("active");
               $("#menu4-detail-4").addClass("active");
               
        })

	</script>
</body>
</html>