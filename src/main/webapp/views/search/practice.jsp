<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fd.restaurant.model.vo.Restaurant" %>
<%
	Restaurant r  = (Restaurant)request.getAttribute("r");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	지역 : <span><%= r.getLocalCt() %></span> <br>
	세부지역 : <span><%= r.getdLocalCt() %></span> <br> 
	음식 : <span><%= r.getFoodCt() %></span> <br> 
	
</body>
</html>