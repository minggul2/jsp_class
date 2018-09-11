<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "memberjsp.dao.*" %>
<%@ page import = "memberjsp.bean.*" %>
<%
	String id = request.getParameter("id");
	
	MemberDTO memberDTO = new MemberDTO();
	MemberDAO memberDAO = MemberDAO.getInstance();
	memberDTO = memberDAO.getMember(id);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
 <h1 align = "center">회원정보수정</h1>
 <form name = "modifyForm" method = "post" action = "modify.jsp">
  <table border = "1" align = "center" cellpadding = "5" cellspacing = "0" height = "10">
   <tr>
   	<td>이름</td>
   	<td><input type = "text" name = "name" value = "<%=memberDTO.getName() %>" size = "40" ></td>
   </tr>
   
   <tr>
    <td>아이디</td>
    <td>
    	<input type = "text" name = "id" value = "<%=id %>" size = "40" readonly>
    	
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
    <td colspan = "2"><input type = "radio" name = "gender" id = "gender" value = "0" checked>남자
    <input type = "radio" name = "gender" id = "gender" value = "1">여자</td>
   </tr>
   
   <tr>
   	<td>이메일</td>
   	<td><input type = "text" name = "email1" id = "email1">@
   	<select name = "email2" id = "email2" style = "width: 120px;">
   	 <option value = "naver.com">naver.com</option>
   	 <option value = "daum.net">daum.net</option>
   	 <option value = "hanmail.net">hanmail.net</option>
   	 <option value = "gmail.com">gmail.com</option>
   	</select>
   	</td>
   </tr>
   
   <tr>
   	<td>핸드폰</td>
   	<td><select name = "tel1" id = "tel1" style = "width: 70px;">
   	     <option value = "010">010</option>
   	     <option value = "016">016</option>
   	     <option value = "011">011</option>
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
    <td><input type = "text" name = "addr1" id = "addr1" placeholder = "주소" readonly width = "500"></td>
   </tr>
   
   <tr>
    <td><input type = "text" name = "addr2" id = "addr2" placeholder = "상세 주소"></td>
   </tr>
   
   <tr align = "center">
   	<td colspan = "2"><input type = "button" value = "회원정보수정" onclick = "checkModify()">
   	<input type = "reset" value = "다시작성"></td>
   </tr>
  </table>
 </form>
	<script src = "../js/member.js"></script>
	<script>
	window.onload=function(){
		document.modifyForm.gender['<%=memberDTO.getGender()%>'].checked = true;
		document.modifyForm.email1.value = '<%=memberDTO.getEmail1()%>';
		
		/*
		var email = '<%=memberDTO.getEmail2()%>';
		
		for(var i = 0; i < email2.length; i++){
			if(document.modifyForm.email2.options[i].value == email){
				document.modifyForm.email2.options[i].selected = true;							
			}
		}
		
		var tel1 = '<%=memberDTO.getTel1()%>';
		
		for(var i = 0; i< tel1.length; i++){
			if(document.modifyForm.tel1.options[i].value == tel1){
				document.modifyForm.tel1.options[i].selected = true;	
			}
		}getElementById 로 대체가능
		*/
		
		
		document.getElementById('email2').value = '<%=memberDTO.getEmail2() %>';
		document.getElementById('tel1').value = '<%=memberDTO.getTel1() %>';
		
		document.modifyForm.tel2.value = '<%=memberDTO.getTel2()%>';
		document.modifyForm.tel3.value = '<%=memberDTO.getTel3()%>';
		document.modifyForm.zipcode.value = '<%=memberDTO.getZipcode()%>';
		document.modifyForm.addr1.value = '<%=memberDTO.getAddr1()%>';
		document.modifyForm.addr2.value = '<%=memberDTO.getAddr2()%>';
		
	}
	</script>
</body>
</html>









