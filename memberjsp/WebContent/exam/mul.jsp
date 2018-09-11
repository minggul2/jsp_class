<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id = "dataDTO" class = "exam.bean.DataDTO" scope = "session"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
	<jsp:getProperty property = "x" name = "dataDTO"/> *
	<jsp:getProperty property = "y" name = "dataDTO"/> = 
	<%=dataDTO.getX() * dataDTO.getY() %>
	</h3>

</body>
</html>