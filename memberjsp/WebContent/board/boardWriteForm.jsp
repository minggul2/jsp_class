<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name = "boardWriteForm" method = "post" action = "boardWrite.jsp">
	<table border = "1">
		<tr>
			<td>제목</td>
			<td><input type = "text" name = "subject"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="5" cols="10" name = "content"></textarea>
		</tr>
		<tr>
			<td colspan = "2" align = "center" >
				<input type = "button" value = "글작성" onclick = "checkBoard()">
				<input type = "reset" value = "취소">				
			</td>
		</tr>
	</table>
	</form>
	<script src = "../js/board.js">
	</script>
</body>
</html>