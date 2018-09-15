 function checkBoard(){
	 if(document.boardWriteForm.subject.value == ""){
		 alert("제목을 입력하세요");
	 }else if(document.boardWriteForm.content.value == ""){
		 alert("내용을 입력하세요");
	 }else{
		 document.boardWriteForm.submit();
	 }	
 }
 
 function viewBoard(seq, pg){
		
}
 
 function isLogin(id, seq, pg){
	 //만약에 로그인을 했으면 boardView.jsp 로 가고
	 //		로그인을 안했으면 alert("먼저 로그인 하세요")
	 if(id == 'null'){
		 alert("먼저 로그인 하세요");
		 location.href="../member/loginForm.jsp";
	 }else{
		 location.href="boardView.jsp?seq="+seq+"&pg="+pg; 
	 }
	 
 }
 
 