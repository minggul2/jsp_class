<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터
	request.setCharacterEncoding("UTF-8");
	
	String fileName = request.getParameter("fileName");
	//String fileName = request.getParameter("fileName");
	String realFolder = request.getServletContext().getRealPath("/storage");
	
	//다운로드 받을 파일 생성
	//파일명의 공백이 +로 나타나면 다시 공백으로
	//파일명 자체에 +는 그대로 + 표시
	File file = new File(realFolder, fileName);
	fileName = URLEncoder.encode(fileName, "UTF-8").replace("+", " ");
	
	//--------------------------
	response.setHeader("Content-Disposition", "attachment;fileName="+fileName);
	response.setHeader("Content-Length", file.length()+"");
	//response.setHeader("Refresh", "3;url=input.jsp");
	
	//--------------------------
	
	out.clear();	//out객체를 비우고
	out = pageContext.pushBody();	//설정을 다시 불러옴
	
	
	//파일 입출력
	BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
	//입력은 업로드한 file 로부터
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	//출력은 사용자가 설정한 곳으로

	/*
	int data;
	while((data = bis.read()) != -1){
		bos.write((char)data);	
	}
	*/
	
	int size = (int)file.length();
	
	byte[] b = new byte[size];
	bis.read(b, 0, size);	//b 배열을 0번째방부터 size만큼
	for(int i = 0; i < b.length; i++){
		System.out.println(b[i] + " ");
	}
	bos.write(b);	//안하면 아무것도 안보임
	
	
	
	bis.close();
	bos.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>