<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fd.restaurant.model.vo.*" %>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	Restaurant loginRest = (Restaurant)session.getAttribute("loginRest");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Fooding</title>
<!--제이쿼리-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- 부트스트랩 5버전 (4버전 오류로인한 불가피한 선택) -->
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script> 

<style>
    #outer {
        width:1200px;
        height:150px;
        margin:auto;
        box-sizing: border-box;
    }
    #title {
        font-size: 30px;
        font-weight: 600;
        color: rgb(71, 71, 71);
    }
    
    #outer>div {
        display: inline-block;        
        margin-top: 40px;
        box-sizing: border-box;
    }
    /* div1 = 로고영역 */
    #div1 {
        position: relative;
        bottom: 5px;
    }
    /* div2 = 타이틀문구 영역 */
    #div2 {
        margin-right: 100px;
        margin-left: 100px;
        width:500px
    }
    /* div3 = 로그아웃, 프로필 영역 */
    #div3 span {
        margin:5px;
    }   
    #div3 span:hover {
    	cursor:pointer;
    }   
    #div3 h4 { 
        width : 100px;
        height : 50px;
        display: inline-block;
        margin-top: 20px;
        font-size: 20px;
    }

    #rest-img {
    	width:50px;
    	height:50px;
    	border-radius:25px;
    	margin-bottom: 10px;
        margin-left:10px
    } 
    
    #logo:hover, h4:hover, #rest-img {
    	cursor:pointer;
    }
    

</style>
</head>
<body>
	<% if(alertMsg != null) { %>
		<script>
			alert('<%=alertMsg%>');
			<% session.removeAttribute("alertMsg");%>
		</script>
	<% } %>
    <div id="outer" align="center">
        <div id="div1">
            <img id="logo" src="<%=contextPath%>/resources/images/logo.png" width="190">
        </div>
        <div id="div2">
            <h3 id="title" width="500"></h3>
        </div>
        <div id="div3">
            <span onclick="location.href='<%= contextPath%>/logout.re.ad'">로그아웃</span>
            <span> | </span>
            <h4 onclick="location.href='<%=contextPath%>/info.re'"><%=loginRest.getResName()%></h4>
            <% if(loginRest.getrImg() == null) {%>
            <img id="rest-img" src="<%= contextPath %>/resources/images/userIcon.png">
            <% }else { %>
            <img id="rest-img" src="<%=contextPath %>/<%= loginRest.getrImg() %>">
            <% } %>
        </div>
        <hr>
    </div>
    <script>
    	$('#logo').click(function(){
    		location.href="<%=contextPath%>/home.re";
    	})
    	$('#rest-img').click(function(){
    		location.href="<%=contextPath%>/info.re"
    	})
    </script>

</body>
</html>