function loginCheck() {
	if (document.loginfrm.userId.value.length == 0){
		alert("아이디를 작성해 주세요");
		loginfrm.userId.focus();
		return false;
		}
	if (document.loginfrm.userPass.value == ""){
		alert("비밀번호를 작성해 주세요");
		loginfrm.userPass.focus();
		return false;
		}
	return true;
}

function idfindCheck() {
	if (document.frm.userName.value.length == 0){
		alert("이름을 작성해 주세요");
		frm.userName.focus();
		return false;
		}
	if (document.frm.email.value.length == 0){
		alert("이메일을 작성해 주세요");
		frm.email.focus();
		return false;
		}
	if (document.frm.birth.value.length == 0){
		alert("생년월일을 작성해 주세요");
		frm.birth.focus();
		return false;
		}
		var url = "idFindList.do?userName=" + document.frm.userName.value
		+ "&email=" + document.frm.email.value + "&birth=" + document.frm.birth.value;
	window.open(url, "_blank_1",
	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
	return true;
}

function pwfindCheck() {
	if (document.frm.userId.value.length == 0){
		alert("아이디를 입력해 주세요");
		frm.pwfindid.focus();
		return false;
		}
	if (document.frm.question.value == "select"){
		alert("질문을 선택해 주세요");
		frm.question.focus();
		return false;
		}
	if (document.frm.answer.value.length == 0){
		alert("답변을 작성해 주세요");
		frm.answer.focus();
		return false;
		}
		var url = "passwordFind.do?userId=" + document.frm.userId.value
		+ "&question=" + document.frm.question.value + "&answer=" + document.frm.answer.value;
	window.open(url, "_blank_1",
	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
	return true;
}

function checkJoin() {

	if (document.joinfrm.userId.value.length == 0){
		alert("아이디를 입력하세요.");
		joinfrm.userId.focus();
		return false;
	}
	
	if (document.joinfrm.reid.value.length == 0){
		alert("아이디 중복확인을 해주세요.");
		joinfrm.userId.focus();
		return false;
	}
	
	if (document.joinfrm.userPass.value.length == 0){
		alert("비밀번호를 입력하세요.");
		joinfrm.userPass.focus();
		return false;
	}
	
	var p1 = document.getElementById('signup-pw').value;
	var p2 = document.getElementById('signup-pww').value;
	if( p1 != p2 ) {
		alert("비밀번호가 일치 하지 않습니다");
		return false;
	}
			
	if (document.joinfrm.userName.value.length == 0){
		alert("이름을 입력하세요.");
		joinfrm.userName.focus();
		return false;
	}
	
	if (document.joinfrm.nickName.value.length == 0){
		alert("닉네임을 입력하세요.");
		joinfrm.nickName.focus();
		return false;
	}
	
	if (document.joinfrm.email.value.length == 0){
		alert("이메일을 입력하세요.");
		joinfrm.email.focus();
		return false;
	}
	
	var birth_day = document.getElementById('signup-birth-dd').value;
	if (birth_day > 31){
		alert("생년월일을 정확히 입력해주세요.");
		return false;
	}
		
	
	if (document.joinfrm.gender.value == "gender"){
		alert("성별을 선택하세요.");
		joinfrm.gender.focus();
		return false;
	}
	
	if (document.joinfrm.phone.value.length != 11){
		alert("- 을 제외한 11자리를 입력해주세요.");
		joinfrm.phone.focus();
		return false;
	}
	
 	if (document.joinfrm.question.value == "select"){
		alert("질문을 선택하세요.");
		joinfrm.question.focus();
		return false;
	}
	
	if (document.joinfrm.answer.value.length == 0){
		alert("본인확인질문을 작성해 주세요.");
		joinfrm.answer.focus();
		return false;
	}
	return true;
}

function idCheck() {
	if (document.joinfrm.userId.value == "") {
		alert('아이디를 입력하여 주십시오.');
		document.joinfrm.userId.focus();
		return;
	}
	var url = "../idCheck.do?userId=" + document.joinfrm.userId.value;
	window.open(url, "_blank_1",
	"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}

function idok() {
	opener.joinfrm.userId.value=document.frm.userId.value;
	opener.joinfrm.reid.value=document.frm.userId.value;
	self.close();
}
