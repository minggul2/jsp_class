<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "memberjsp.dao.MemberDAO" %>
 <%
 	//데이터
 	String id = request.getParameter("id");
 	
 	MemberDAO memberDAO = MemberDAO.getInstance();
 	boolean check = memberDAO.checkId(id);
 %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(check){%> <%=id %>는 사용불가능
	<%}else{ %>
		<%=id %>는 사용가능
	<%} %>
	
</body>
</html>