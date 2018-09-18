<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터
	String fileName = request.getParameter("fileName");
	
	String realFolder = request.getServletContext().getRealPath("/storage");
	
	//다운로드 받을 파일 생성
	File file = new File(realFolder, fileName);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>