<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	

	BoardDAO boardDAO = BoardDAO.getInstance();
	BoardDTO boardDTO = boardDAO.boardView(seq);
	
	
	String id = (String)session.getAttribute("memId");
	
%>
<!DOCTYPE html>
<html>
<head>
<style>
	.shows{
		width : 50px;
    	text-align: center;
    	color: "red";
    	outline-color: "red";
    	text-shadow: aqua;
    	text-transform: capitalize;
    	
	}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(!boardDTO.getId().equals(id)){%>
		<script>alert("작성자가아닙니다");</script>
		
		<%response.sendRedirect("boardList.jsp?pg=1");
	}%>

	<form name = "boardWriteForm" method = "post" action = "boardModify.jsp">
	<table border = "1">
		<tr>
			<td class = "shows">제목</td>
			<td><input type = "text" name = "subject" size = "30" value = <%=boardDTO.getSubject() %>><input type = "hidden" name = "seq" value = "<%=seq %>"></td>
			
		</tr>
		<tr>
			<td class = "shows">내용</td>
			<td><textarea rows="10" cols="30" name = "content" ><%=boardDTO.getContent() %></textarea>
		</tr>
		<tr>
			<td colspan = "2" align = "center" >
				<input type = "button" value = "글수정" onclick = "checkBoard()">
				<input type = "reset" value = "취소">				
			</td>
		</tr>
	</table>
	</form>
	<script src = "../js/board.js">
	</script>
</body>
</html>