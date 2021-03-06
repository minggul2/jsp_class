<%@page import="board.bean.BoardPaging"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//응답 : 테이블
	int pg = Integer.parseInt(request.getParameter("pg"));

	BoardDAO boardDAO = BoardDAO.getInstance();

	//1페이지당 5개씩
	int endNum = pg * 5;
	int startNum = endNum - 4;
	
	List<BoardDTO> list = boardDAO.getList(startNum, endNum);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	
	String id = (String)session.getAttribute("memId");
	
	int totalA = boardDAO.getBoardTotalA();
	
	BoardPaging boardPaging = new BoardPaging();
	boardPaging.setCurrentPage(pg);
	
	boardPaging.setPageBlock(3);
	boardPaging.setPageSize(5);
	boardPaging.setTotalA(totalA);
	boardPaging.makePagingHTML();
	
	
%>
<!DOCTYPE html>
<html>
<head>

<link rel = "stylesheet" href = "../css/board.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align = "center" >
	<table border = "0" cellpadding = "5" cellspacing = "0"  frame = "hsides" rules ="rows">
	
		<tr>
			<th width = "100">글번호</th>
			<th width = "300">제목</th>
			<th width = "100">작성자</th>
			<th width = "100">작성일</th>
			<th width = "100">조회수</th>
		</tr>
		
		<%if (list != null){ %>
			<%for(BoardDTO boardDTO : list){ %>
			<tr>
				<td class = "board"><%=boardDTO.getSeq() %></td>
				<td class = "board"><a id = "subjectA" href = "#" onclick = "isLogin('<%=id %>', <%=boardDTO.getSeq()%>, <%=pg%>)"><%=boardDTO.getSubject() %></a></td>
				<td class = "board"><%=boardDTO.getId() %></td>
				<td class = "board"><%=sdf.format(boardDTO.getLogtime())%></td>
				<td class = "board"><%=boardDTO.getHit() %></td>
			</tr>
			<%} %>
		<%} %>
	</table>
	
	<br><br>
	
</div>

<div align = "center">
<img style = "float : center; cursor: pointer;" src = "../image/aa.png" onclick = "location.href = '../main/index.jsp'">
<div style = "float : center; border : 1px red solid; width : 600px; text-align : center;" align = "center"><%=boardPaging.getPagingHTML() %></div>
</div>
<script src ="../js/board.js">
	
</script>

</body>
</html>