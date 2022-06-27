function inputCheck(){
	if(document.regFrm.id.value==""){
		alert("아이디를 입력해주세요");
		document.regFrm.id.focus();
		return;
	}
	if(document.regFrm.pwd.value==""){
		alert("비밀번호를 입력해주세요");
		document.regFrm.pwd.focus();
		return;
	}
	if(document.regFrm.repwd.value==""){
		alert("비밀번호 재확인필요");
		document.regFrm.pwd.focus();
		return;
	}
	if(document.regFrm.pwd.value != document.regFrm.repwd.value){
		alert("비밀번호가 일치하지 않습니다");
		document.regFrm.repwd.value="";
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.name.value==""){
		alert("이름을 입력해주세요");
		document.regFrm.name.focus();
		return;
	}
	if(document.regFrm.gender.value==""){
		alert("성별 체크");
		document.regFrm.gender.focus();
		return;
	}
	if(document.regFrm.email.value==""){
		alert("이메일을 입력해 주세요");
		document.regFrm.email.focus();
		return;
	}
	if(document.regFrm.zipcode.value==""){
		alert("우편번호를 검색해주세요");
		return;
	}
	if(document.regFrm.address.value==""){
		alert("직업을 선택해 주세요");
		return;
	}
	document.regFrm.submit();
		
	
}
function win_close(){
	self.close();
	}