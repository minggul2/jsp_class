<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
	.shows{
		width : 50px;
    	text-align: center;
    	color: "red";
    	outline-color: "red";
    	text-shadow: aqua;
    	text-transform: capitalize;
    	
	}
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name = "boardWriteForm" method = "post" action = "boardWrite.jsp">
	<table border = "1">
		<tr>
			<td class = "shows">제목</td>
			<td><input type = "text" name = "subject" size = "30"></td>
		</tr>
		<tr>
			<td class = "shows">내용</td>
			<td><textarea rows="10" cols="30" name = "content"></textarea>
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