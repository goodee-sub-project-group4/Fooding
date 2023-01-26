<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="head.jsp" %>
	
	<br><br><br>
	<h1 align="center" style="color:crimson;"><%= request.getAttribute("errorMsg") %></h1>

</body>
</html>