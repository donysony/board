function check(){
	if(document.regFrm.custname.value==""){
		alert("이름을 넣어주세요");
		document.regFrm.custname.focus();
		return;
	}
	if(document.regFrm.phone.value==""){
		alert("전화번호를 넣어주세요");
		document.regFrm.phone.focus();
		return;
	}
	if(document.regFrm.address.value==""){
		alert("주소를 넣어주세요");
		document.regFrm.address.focus();
		return;
	}
	if(document.regFrm.joindate.value==""){
		alert("가입일자를 넣어주세요");
		document.regFrm.joindate.focus();
		return;
	}
	if(document.regFrm.grade.value==""){
		alert("등급을 넣어주세요");
		document.regFrm.custname.focus();
		return;
	}
	if(document.regFrm.city.value==""){
		alert("도시코드를 넣어주세요");
		document.regFrm.custname.focus();
		return;
	}
	document.regFrm.submit();
}