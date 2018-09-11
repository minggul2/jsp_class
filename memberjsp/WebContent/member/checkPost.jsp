<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "memberjsp.dao.MemberDAO"%>

<%@ page import = "java.util.ArrayList" %>
<%@ page import = "memberjsp.bean.ZipcodeDTO" %>
    
<%
	//데이터
	
	String sido = request.getParameter("sido");
	String sigungu = request.getParameter("sigungu");
	String roadname = request.getParameter("roadname");
	System.out.println(sido +"," + sigungu + "," + roadname);
	ArrayList<ZipcodeDTO> list = null;
	
	//DB
	if(sido != null && sigungu != null && roadname != null){
		//DB로가라 메소드명 : getZipcodeList
		MemberDAO memberDAO = MemberDAO.getInstance();
		list = memberDAO.getZipcodeList(sido, sigungu, roadname);
		for(int i = 0;  i < list.size(); i++){
			System.out.println(list.get(i));	
		}
	}
	
%>
    
<!DOCTYPE html>
<html>
<head>
<style>
	.td_center {
		text-align : center;
	}
	
	td{
		font-size : 15px;
	}
	
	select{
		height : 25px;
	}
	
	#addressA:link{		
		color : black; text-decoration: none;
	}
	
	#addressA:visited{		
		color : black; text-decoration: none;
	}
	
	#addressA:hover{
		color : green; text-decoration: none;
	}
	
	#addressA:active{
		color : black; text-decoration: none;
	}
	
	<!-- 
		link	 	한번이라도 안누른 상태
		visited 	누르고 난 상태
		hover		마우스 올려 놓은 상태
		active		마우스 꾹 누르는 상태
	
	-->
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name = "" method = "get" action = "checkPost.jsp">                     
	 <table border = "1" cellpadding = "1" cellspacing = "0">                                           
	  <tr>                                                          
	   <td class="td_center">시도</td>                                                
	   <td>
	   		<select name = "sido" >                                       
	   		<option selected>시도선택</option>                      
	   		<option value = "서울">서울</option>                    
	   		<option value = "인천">인천</option>                    
	   		<option value = "대전">대전</option>                    
	   		<option value = "대구">대구</option>                    
	   		<option value = "울산">울산</option>                    
	   		<option value = "세종">세종</option>                    
	   		<option value = "광주">광주</option>                    
	   		<option value = "경기">경기</option>                    
	   		<option value = "강원">강원</option>                    
	   		<option value = "전남">전남</option>                    
	   		<option value = "전북">전북</option>                    
	   		<option value = "경남">경남</option>                    
	   		<option value = "경북">경북</option>
	   		<option value = "충청">충청</option>
	   		<option value = "부산">부산</option>
	   		<option value = "제주">제주</option>
	   		</select>
	   </td>
	   <td class="td_center">시.군.구</td>
	   <td><input type = "text" name = "sigungu"></td>
	  </tr>	
	  
	  <tr>
	   <td class="td_center">도로명</td>
	   <td colspan = "4"><input type = "text" name = "roadname">
	   <input type = "submit" value = "검색"></td>
	  </tr>
	  
	  <tr>
	   <td class="td_center">우편번호</td>
	   <td colspan = "4" align = "center">주소</td>
	  </tr>
	  
	  <%if(list != null){%>
	   <%for(ZipcodeDTO zipcodeDTO : list){
	   		String address = zipcodeDTO.getSido() + " "
	 				       + zipcodeDTO.getSigungu() + " "
					   	   + zipcodeDTO.getYubmyundong()+ " "
					   	   + zipcodeDTO.getRoadname() + " "
					 	   + zipcodeDTO.getBuildingname();
	   		//address = address.replaceAll("null", "");
	   		%>
		  <tr>
		  	<td class = "td_center"><%=zipcodeDTO.getZipcode() %></td>
		  	<td colspan = "3" >
		  	 <a href = "#" onclick = "checkPostClose('<%=zipcodeDTO.getZipcode() %>','<%=address %>')" id = "addressA"><%=address %></a>
		  	 
		  	<%-- 내가 한거
		  		<%=zipcodeDTO.getSido()%>시 
		  		<%if(zipcodeDTO.getSigungu() != null){%><%=zipcodeDTO.getSigungu() %> <%} %> 
		  		<%if(zipcodeDTO.getYubmyundong() != null){%> <%=zipcodeDTO.getYubmyundong() %> <%} %> 
		  		<%if(zipcodeDTO.getRi() != null){%> <%=zipcodeDTO.getRi()%> <%}%>
		  		<%if(zipcodeDTO.getRoadname() != null){%> <%=zipcodeDTO.getRoadname() %> <%} %> 
		  		<%if(zipcodeDTO.getBuildingname() != null){%> <%=zipcodeDTO.getBuildingname() %> <%} %>
		  	 --%>
		  	</td>
		  </tr>
		 
		 <%}//for %>
	 <%}//if%>
	  
	 </table>
	</form>
	<script src = "../js/member.js">
	
	</script>
</body>
</html>