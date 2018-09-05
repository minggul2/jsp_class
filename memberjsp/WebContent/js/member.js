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
	 
	if(sId == ""){
		alert("먼저 아이디를 입력하세요");
	}else{
		window.open("checkId.jsp","","width=300 height=100");
	}
 }
 //모든 태그의 부모 Element
 