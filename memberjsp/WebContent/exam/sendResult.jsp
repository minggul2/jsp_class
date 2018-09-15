<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String apple = (String)request.getAttribute("apple");	//업캐스팅필요
	//반환값은 Object
%>

결과 = <%=apple %>