<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
 <h1 align = "center">회원가입</h1>
 <form name = "writeForm" method = "post" action = "/memberservlet/WriteServlet">
  <table border = "1" align = "center" cellpadding = "5" cellspacing = "0" height = "10">
   <tr>
   	<td>이름</td>
   	<td><input type = "text" name = "name" size = "40"></td>
   </tr>
   
   <tr>
    <td>아이디</td>
    <td>
    	<input type = "text" name = "id" size = "40">
    	<input type = "button" value = "중복체크" onclick = "checkId()">
    </td>
    
   </tr>
   
   <tr>
   	<td>비밀번호</td>
   	<td><input type = "password" name = "password"></td>
   </tr>
   
   <tr>
   	<td>재확인</td>
   	<td><input type = "password" name = "repassword"></td>
   </tr>
   
   <tr>
    <td>성별</td>
    <td colspan = "2"><input type = "radio" name = "gender" value = "0" checked>남자
    <input type = "radio" name = "gender" value = "1">여자</td>
   </tr>
   
   <tr>
   	<td>이메일</td>
   	<td><input type = "text" name = "email1">@
   	<select name = "email2" style = "width: 120px;">
   	 <option value = "naver.com">naver.com</option>
   	 <option value = "daum.net">daum.net</option>
   	 <option value = "hanmail.net">hanmail.net</option>
   	 <option value = "gmail.com">gmail.com</option>
   	</select>
   	</td>
   </tr>
   
   <tr>
   	<td>핸드폰</td>
   	<td><select name = "tel1" style = "width: 70px;">
   	     <option value = "010">010</option>
   	     <option value = "016">	
   	    </select>
   	    <input type = "text" name = "tel2" size = "4">
   	    <label> - </label> 
   	    <input type = "text" name = "tel3" size = "4">
   	</td>
   </tr>
 
   <tr>
    <td rowspan = "3">주소</td> <td><input type = "text" name = "zipcode" id = "zipcode" size = "4" readonly><input type = "button" value = "우편번호검색" onclick = "checkPost()"></td>
   </tr>
   
   <tr>
    <td><input type = "text" name = "addr1" id = "addr1" placeholder = "주소" readonly></td>
   </tr>
   
   <tr>
    <td><input type = "text" name = "addr2" id = "addr2" placeholder = "상세 주소"></td>
   </tr>
   
   <tr align = "center">
   	<td colspan = "2"><input type = "button" value = "회원가입" onclick = "checkWrite()">
   	<input type = "reset" value = "다시작성"></td>
   </tr>
   
   <tr>	
    <input type = "image" src = "
    .http://localhost:8080/memberservlet/image/tomcat.png" disabled/>
   </tr>
   
  </table>
 </form>
 <script src = "../js/member.js"></script>
</body>
</html>