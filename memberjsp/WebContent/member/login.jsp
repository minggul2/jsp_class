<%@page import="memberjsp.bean.MemberDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "memberjsp.dao.*" %>
    
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	MemberDTO memberDTO = memberDAO.login(id, password);
	
	String name = memberDTO.getName();
	
	 if (name != null){ 
		
		/*//쿠키		(쿠키는 한글처리 혼자서 못함)
		Cookie cookie1 = new Cookie("memName", URLEncoder.encode(name, "UTF-8"));
		
		cookie1.setMaxAge(30*60);	//초단위 클라이언트에 저장된 쿠키를 직접 지울 수 없으니 쿠키객체에게 유효시간을 정해줌
		response.addCookie(cookie1);	//클라이언트에게 저장
		
		Cookie cookie2 = new Cookie("memId", id);
		cookie2.setMaxAge(30*60);
		response.addCookie(cookie2); */
		
		//세션	(세션은 한글처리 혼자 가능)
		//HttpSession session = request.getSession(); - 세션생성 spring 에서 씀
		session.setAttribute("memName", name);
		session.setAttribute("memId", id);
		
		String email = memberDTO.getEmail1() + "@" + memberDTO.getEmail2();
		
		session.setAttribute("memEmail", email);
		
		
		
		
		//페이지 이동
		//response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(name, "UTF-8")+"&id="+id);
	 	response.sendRedirect("loginOk.jsp");
	 	//한글은 16진수로 인코딩해서 들어와야함
	 	//??가 나온것은 보낼 때 부터 잘못된것이니 보낼때 처리해줘야함
	}else{ 
		response.sendRedirect("loginFail.jsp"); 
	} 
%>
