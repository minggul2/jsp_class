 function checkWrite(){
	if(document.writeForm.name.value == ""){
		alert("이름을 입력하세요");
	}else if(document.writeForm.id.value == ""){
		alert("아이디를 입력하세요");	
	}else if(document.writeForm.password.value == "" || document.writeForm.repassword.value == ""){
		alert("비밀번호를 입력하세요");
	}else if(document.writeForm.password.value != document.writeForm.repassword.value){
		alert("비밀번호가 일치하지 않습니다");
	}else if(document.writeForm.idCheck.value != document.writeForm.id.value){
		alert("중복체크를 하세요");
	}else{
		document.writeForm.submit();	
	}
  }
 
 function checkId(){
	
	var sId = document.writeForm.id.value;
	
	 //var sId = sId1;
	 
	
	
	if(sId == ""){
		alert("먼저 아이디를 입력하세요");
	}else{
		alert(document.writeForm.idCheck.value);
		window.open("checkId.jsp?id="+sId,"","width=300 height=100 location=yes");
		//http://localhost:8080/memberjsp/member/가 생략
	}
 }
 
 function checkIdClose(id){
	  	//	1. 데이터 전달
	  	//	2. 창 닫기
	  	//	3. 비밀번호로 포커싱
	 	opener.writeForm.idCheck.value = id;
	  	opener.writeForm.id.value = id;
	  	window.close();
	  	opener.writeForm.pwd.focus();
	  }
 
 function checkPost(formName){
	 window.open("checkPost.jsp", "", "width=400 height=400 scrollbars=yes");
	 
 }
 
 function checkPostClose(zipcode, address, formName){
	 
	 opener.document.forms[0].zipcode.value = zipcode;
	 opener.document.forms[0].addr1.value = address;
	 opener.document.forms[0].addr2.focus();
	 window.close();
	 
	 /*
	 opener.document.getelementById('zipcode').value = zipcode;
	 opener.document.getelementById('addr1').addr1.value = address;
	 opener.document.getelementById('addr2').addr2.focus();
	 window.close();
	 */
	 //		1. 우편번호 값 채우기
	 //		2. 주소 채우기 address
	 //		3. 창 끄기
	 //		4. 상세주소에 포커스
	 //		5.
 }
 
 function checkLogin(){
	if(window.loginForm.id.value == ""){
		alert("아이디를 입력하세요");	
	}else if(window.loginForm.password.value == ""){
		alert("비밀번호를 입력하세요");	
	}else{
		window.loginForm.submit();	
	}
}

 //location.href='modifyForm.jsp?id=<%=id %>'
 
 function checkModify(){
	if(document.modifyForm.name.value == ""){
		alert("이름을 입력하세요");
	}else if(document.modifyForm.password.value == "" || document.modifyForm.repassword.value == ""){
		alert("비밀번호를 입력하세요");
	}else if(document.modifyForm.password.value != document.modifyForm.repassword.value){
		alert("비밀번호가 일치하지 않습니다");
	}else {
		document.modifyForm.submit();	
	}
  }
 
 
 
 
 
 
 
 
 
 
 
 
 
 //모든 태그의 부모 Element
 