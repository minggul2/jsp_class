<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	//String id = request.getParameter("id");
	//String name = request.getParameter("name");
	
	String name = null;
	String id = null;
	
	/* //쿠키
	Cookie[] ar = request.getCookies(); 	//특정 쿠키를 얻지 못하고 모든 쿠키를 얻어온다
	if(ar!=null){	//쿠키 생존시간 3초로 정해줬으니 바로죽지 않고 넘어온다면
		for(int i = 0; i < ar.length; i++){	
			
			
			*
			 String cookieName = ar[i].getName();
			String cookieValue = URLDecoder.decode(ar[i].getValue(), "UTF-8");	//디코딩 안하면 16진수로 나옴
			System.out.println("쿠키명 = " + cookieName);
			System.out.println("값 = " + cookieValue); 
			*
			
			//쿠키는 여러 클라이언트의 요청 을 name에 구분할 필요가 있다
			//J세션 아이디가 고유하게 저장이된다
			if(ar[i].getName().equals("memName")){						//login.jsp의 변수명을 알고있어야함
				name=URLDecoder.decode(ar[i].getValue(), "UTF-8");		
			}else if(ar[i].getName().equals("memId")){					//
				id = ar[i].getValue();
			}
		}
	} */
	
	//세션
	name = (String)session.getAttribute("memName");
	id = (String)session.getAttribute("memId");
	
	
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src = "../image/aa.png" onclick = "location.href = '../main/index.jsp'" style = "cursor: pointer;">
	<%=name %> 님 로그인
	<br><br>
	<input type="button" value="로그아웃" onclick = "location.href = 'logout.jsp'">
	<input type="button" value="회원정보수정" onclick = "location.href='modifyForm.jsp?'">
</body>
</html>