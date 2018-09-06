 function checkWrite(){
	if(document.writeForm.name.value == ""){
		alert("이름을 입력하세요");
	}else if(document.writeForm.id.value == ""){
		alert("아이디를 입력하세요");	
	}else if(document.writeForm.password.value == "" || document.writeForm.repassword.value == ""){
		alert("비밀번호를 입력하세요");
	}else if(document.writeForm.password.value != document.writeForm.repassword.value){
		alert("비밀번호가 일치하지 않습니다");
	}else {
		document.writeForm.submit();	
	}
  }
 
 function checkId(){
	
	var sId = document.writeForm.id.value;
	 //var sId = sId1;
	 
	
	if(sId == ""){
		alert("먼저 아이디를 입력하세요");
	}else{
		window.open("checkId.jsp?id="+sId,"","width=300 height=100 location=yes");
		//http://localhost:8080/memberjsp/member/가 생략
	}
 }
 
 function checkIdClose(id){
	  	//	1. 데이터 전달
	  	//	2. 창 닫기
	  	//	3. 비밀번호로 포커싱
	  	opener.writeForm.id.value = id;
	  	window.close();
	  	opener.writeForm.pwd.focus();
	  }
 
 //모든 태그의 부모 Element
 