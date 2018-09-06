<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "memberjsp.dao.MemberDAO" %>
 <%
 	//데이터
 	String id = request.getParameter("id");
 	
 	MemberDAO memberDAO = MemberDAO.getInstance();
 	boolean check = memberDAO.isExitsId(id);
 %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <form name = "" method = "" action = "checkId.jsp">
	<%if(check){%>
		 <%=id %>는 사용불가능
		 <br>
		 <br>
		 아이디&nbsp<input type= "text" name = "id" size= 5>&nbsp<input type = "submit" value = "중복체크">
	<%}else{ %>
		<%=id %>는 사용가능
		<br>
		<br>
		<input type = "button" value = "사용" onclick = "checkIdClose('<%=id%>')">
	<%} %>
   </form>
</body>
 <script src = "../js/member.js">

 </script>
</html>