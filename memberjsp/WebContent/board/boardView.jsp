<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("memId");	//수정삭제 작성자
	
	

	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	BoardDAO boardDAO = BoardDAO.getInstance();
	
	Cookie[] ar = request.getCookies();		//쿠키받아옴
	Cookie cookie = null;							//쿠키참조변수 만듬
	
	if(ar != null){							//받아온 쿠키가 있다면 (이미 누른 게시글을 다시 눌렀을경우)
		for(int i = 0; i < ar.length; i++){		//받아온 쿠키배열 for문
			//if(cookies[i].getValue().equals(seq+"") && cookies[i].getComment().equals(id)){	//하나하나 비교하다가 쿠키이름이 글번호seq 일경우
			//}
			if(ar[i].getName().equals(id+seq+"")){
				cookie = ar[i];					//쿠키 생성 방지
				System.out.println(cookie.getName());
				break;
			}
		}
	}
	
	if(cookie == null){								//받다온 쿠키가 없다면 (처음 조회할 경우)
		//cookie = new Cookie("hit", seq+"");			//
		cookie = new Cookie(id+seq+"", id);
		cookie.setMaxAge(60*60);
		response.addCookie(cookie);
		boardDAO.hitUpdate(seq);
		
	}
	
	BoardDTO boardDTO = boardDAO.boardView(seq);	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "../css/board.css">
</head>
<body>
	<table border = "0" cellpadding = "5" cellspacing = "0" frame = "hsides" rules ="rows" color = "red" align  ="center">
		<tr>
			<td width = "450" colspan = "3"><h3><%=boardDTO.getSubject() %></h3></td>
		</tr>
		
		<tr>
			<td width = "150" align = "center">글번호 : <%=seq %></td>
			<td width = "150" align = "center">작성자 : <%=boardDTO.getId() %></td>
			<td width = "150" align = "center">조회수 : <%=boardDTO.getHit() %></td>
		</tr>
		
		<tr>
			<td height = "250" colspan = "3" valign = "top"><pre><%=boardDTO.getContent() %></pre></td>
		</tr>
	</table>
	
	<br>
	<div align = "center">	
	<input type = "button" value = "목록" onclick = "location.href = 'boardList.jsp?pg=<%=pg %>'">
	<%if(id.equals(boardDTO.getId())){ %>
		<input type = "button" value = "글수정" onclick = "location.href = 'boardModifyForm.jsp?seq=<%=seq%>&pg=<%=pg%>'">
		<input type = "button" value = "글삭제">
	<%} %>
	</div>
	
</body>
</html>