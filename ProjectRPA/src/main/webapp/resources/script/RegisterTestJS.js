function joinform_check() {
	  
	  var idEX = /^[a-zA-z0-9]{5,12}$/;
	  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
	  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식
	  var email_EX = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,20}$/i;
		// >> / ~ /안에 있는 내용은 정규표현식 검증에 사용되는 패턴이 이 안에 위치함
		// >> / ~ /i 정규표현식에 사용된 패턴이 대소문자를 구분하지 않도록 i를 사용함
		// >> ^ 표시는 처음 시작하는 부분부터 일치한다는 표시
		// >> [0-9a-zA-Z] 하나의 문자가 [] 안에 위치한 규칙을 따른다는 것으로 숫자와 알파벳 소문자 대문자인 경우를 뜻함
	 	// >> * 이 기호는 0 또는 그 이상의 문자가 연속될 수 있음을 말함


	     			//return: 반환하다// return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
	  if(document.join_form.id.value == "") { 		//해당 입력값이 없을 경우 같은말: if(!uid.value)
		    alert("아이디를 입력하세요.");
		    document.join_form.id.focus(); 			//focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
		  	return false;
	  } else if(!idEX.test(document.join_form.id.value)) {
			alert("아이디는 영문 대/소문자+숫자 조합으로 5~12자리로 입력해야합니다.");
			document.join_form.id.focus();
			return false;
	  } else if(document.join_form.pwd1.value == "") {
	    	alert("비밀번호를 입력하세요.");
	    	document.join_form.pwd1.focus();
	    	return false;
	  } else if(!pwdCheck.test(document.join_form.pwd1.value)) {
	    	alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
	    	document.join_form.pwd1.focus();
	    	return false;
	  } else if(document.join_form.pwd2.value !== document.join_form.pwd1.value) {
	    	alert("비밀번호가 일치하지 않습니다..");
	    	document.join_form.pwd2.focus();
	    	return false;
	  } else if(document.join_form.name.value == "") {
	    	alert("이름을 입력하세요.");
	    	document.join_form.name.focus();
	    	return false;
	  } else if(document.join_form.phone.value == "") {
	    	alert("전화번호를 입력하세요.");
	    	document.join_form.phone.focus();
	    	return false;
	  } else if(!reg.test(document.join_form.phone.value)) {
	    	alert("전화번호는 숫자만 입력할 수 있습니다.");
	    	document.join_form.phone.focus();
	    	return false;
	  } else if(document.join_form.email.value == "") {
	    	alert("이메일 주소를 입력하세요.");
	    	document.join_form.email.focus();
	    	return false;
	  } else if(!email_EX.test(document.join_form.email.value)) {
	 		alert("이메일 주소 확인 후 다시 작성해주시기 바랍니다.");
	 		document.join_form.email.focus();
	 		return false;
	 } else{
	   		alert("회원가입성공.");
			document.join_form.action = "BoardServlet?command=join_Member";
			document.join_form.submit();
	 }
	 	return true;
}
	 //아이디 중복체크 팝업창
	function id_check() {
	  //window.open("팝업될 문서 경로", "팝업될 문서 이름", "옵션");
	 var url = "idCheck.do?userid=" + document.join_form.userid.value;
	 window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
	}
	
	function idok() {
		opener.join_form.userid.value=document.join_form.userid.value;
		opener.join_form.reid.value=document.join_form.userid.value;
		self.close();
	}	
