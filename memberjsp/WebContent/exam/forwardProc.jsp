<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("apple", "사과");
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp");	//합병할 상대번지
	dispatcher.forward(request, response);
	
	//절대번지
	//(http://localhost:8080)/memberjsp/exam/forwardResult.jsp
%>

<%--<jsp:forward page = "forwardResult.jsp"/> --%>


