<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("memId");
	String name = (String)session.getAttribute("memName");
	String email = (String)session.getAttribute("memEmail");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	Map<String, String> map = new HashMap<>();
	map.put("id", id);
	map.put("name", name);
	map.put("email", email);
	map.put("subject", subject);
	map.put("content", content);
	
	BoardDAO boardDAO = BoardDAO.getInstance();
	int su = boardDAO.writeBoard(map);
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(su!=0){ %>
	<script>
	/*
		window.onload = function(){
			alert("글쓰기 성공");ㅣ
			location.href = 'boardList.jsp';
		}
	*/
	//		alert("작성하신글을 저장하였습니다");
		window.onload=function(){
			alert("글쓰기 성공");
			location.href="boardList.jsp?pg=1";
		}
	</script>
<%} %>
</body>
</html>