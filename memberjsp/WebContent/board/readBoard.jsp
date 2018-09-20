<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
// 데이터
int pg = Integer.parseInt(request.getParameter("pg"));

// DB
int endNum = pg*5;
int startNum = endNum-4;

BoardDAO boardDAO = BoardDAO.getInstance();

int totalA = boardDAO.getTotalA();// 총 글 수
int totalP = (totalA+4)/5; // 총 페이지 수

SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성한 글 목록</title>
<link rel="stylesheet" href="../css/board.css">
</head>
<body style = "background-color : black;">
 <table align="center" cellpadding="3" frame="hsides" rules="rows">
  <tr align="center" style="color:red;">
   <th width="100" style= "background-color : black;">글번호</th>
   <th width="300" style= "background-color : black;">제목</th>
   <th width="120" style= "background-color : black;">작성자</th>
   <th width="120" style= "background-color : black;">작성일</th>
   <th width="120" style= "background-color : black;">조회수</th>
  </tr>
  </table>
  <img src="../image/image.jpg" width="70" height="52" onclick="location.href='../main/index.jsp'" style="float: left; cursor:pointer;/">
  <div align="center" style="float: left; border: 1px red solid; width: 600px;">
  <%for(int i=1; i<=totalP; i++){
	  if (pg==i){%>
		  [<a href="boardList.jsp?pg=<%=i%>" class="line1"><%=i %></a>]
	  <% } else {%>
	  	[<a href="boardList.jsp?pg=<%=i %>" class="line2"><%=i %></a>]
	  <%} %>
  <%} %>
  </div>
</body>
</html>