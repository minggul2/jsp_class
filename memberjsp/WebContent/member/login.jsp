<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "memberjsp.dao.*" %>
    
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	String name = memberDAO.login(id, password);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if (name != null){ %>
		<%=name %>님 로그인
	<%}else{ %>
		로그인 실패
	<%} %>
	<br><br>
	<input type="button" value="로그아웃">
	<input type="button" value="회원정보수정" onclick = "location.href='modifyForm.jsp?id=<%=id%>'">
</body>
</html>