<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    DataDTO dataDTO = DataDTO.getInstance();
    dataDTo.setX(25);
    
    <jsp:useBean id = "dataDTO" class="exam.bean.DataDTO" scope = "session"/>
    <jsp:setProperty property = "x" name = "dataDTO"/>
    <jsp:setProperty property = "y" name = "dataDTO"/>
    
    
    
<%
	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<jsp:getProperty property="x" name="dataDTO"/> + 
		<jsp:getProperty property="y" name="dataDTO"/> = 
		<%=dataDTO.getX() + dataDTO.getY()%>

		<h3><%=x %> + <%=y %> = <%=x+y %></h3>
		<input type = "button" value = "곱구하기" onclick = "location.href = 'mul.jsp?x=<%=x %>&y=<%=y %>'">
</body>
</html>
<!--

		
		-->