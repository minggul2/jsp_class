<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//쿠키삭제
	/* Cookie[] ar = request.getCookies();
	if(ar!=null){
		for(int i = 0; i < ar.length; i++){
			if(ar[i].getName().equals("memName")){
				ar[i].setMaxAge(0);	
				response.addCookie(ar[i]);//클라이언트에게 보내기
			}else if(ar[i].getName().equals("memId")){
				ar[i].setMaxAge(0);
				response.addCookie(ar[i]);
			}
		}
	} */
	
	//세션
	session.removeAttribute("memName");
	session.removeAttribute("memId");
	
	session.invalidate();	//무효화 (모든 세션 제거)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		window.onload = function(){
			alert("로그아웃");
			location.href = '/memberjsp/main/index.jsp';
		}
	</script>
</body>
</html>