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
	
	/* Cookie[] cookies = request.getCookies();	//쿠키가 있든없든 받아와봄
	//null or 쿠키
	
	if(cookies != null){		//쿠키가 있을 경우
		//그냥 암것도안함
		for(int i = 0; i < cookies.length; i++){
			if(!cookies[i].getValue().equals(id)){
				Cookie cookie = new Cookie("id", id);
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
				boardDAO.updateHit(seq);
				System.out.println("쿠키없음");		
			}else{
				System.out.println("쿠키있음");
				System.out.println(cookies[i].getName());
				break;	
			}
		}
	} */
	
	
	Cookie[] cookies = request.getCookies();		//쿠키받아옴
	Cookie cookie = null;							//쿠키참조변수 만듬
	
	
	
	if(cookies != null){							//받아온 쿠키가 있다면 (같은사람이 게시글을 눌렀을경우)
		for(int i = 0; i < cookies.length; i++){		//받아온 쿠키배열 for문
			//if(cookies[i].getValue().equals(seq+"") && cookies[i].getComment().equals(id)){	//하나하나 비교하다가 쿠키이름이 글번호seq 일경우
			//}
			if(cookies[i].getName().equals(id+seq+"")){
				cookie = cookies[i];					//쿠키 생성 방지
				break;
			}
		}
	}
	
	
	
	if(cookie == null){								//받다온 쿠키가 없다면 (처음 조회할 경우)
		//cookie = new Cookie("hit", seq+"");			//
		cookie = new Cookie(id+seq+"", id);
		cookie.setComment(id);
		cookie.setMaxAge(5);
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
		<input type = "button" value = "글수정" onclick = "location.href = 'boardModifyForm.jsp?seq=<%=seq%>'">
		<input type = "button" value = "글삭제">
	<%} %>
	</div>
	
</body>
</html>