<%@page import="memberjsp.bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 	request.setCharacterEncoding("UTf-8"); 
 %>
	<jsp:useBean id = "memberDTO" class = "memberjsp.bean.MemberDTO"/>	<!-- scope = session-->
	<jsp:setProperty property = "name" name = "memberDTO"/>
	<jsp:setProperty property = "id" name = "memberDTO"/>
	<jsp:setProperty property = "password" name = "memberDTO"/>
	<jsp:setProperty property = "email1" name = "memberDTO"/>
	<jsp:setProperty property = "email2" name = "memberDTO"/>
	<jsp:setProperty property = "gender" name = "memberDTO"/>
	<jsp:setProperty property = "tel1" name = "memberDTO"/>
	<jsp:setProperty property = "tel2" name = "memberDTO"/>
	<jsp:setProperty property = "tel3" name = "memberDTO"/>
	<jsp:setProperty property = "zipcode" name = "memberDTO"/>
	<jsp:setProperty property = "addr1" name = "memberDTO"/>
	<jsp:setProperty property = "addr2" name = "memberDTO"/>
	
	<jsp:useBean id = "memberDAO" class = "memberjsp.dao.MemberDAO"/>
<%
	//DB
	int su = memberDAO.write(memberDTO);

%>
	 
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%if(su != 0){ %>
			회원가입 성공
		<%}else{ %>
			회원가입 실패
		<%} %>
</body>
</html>