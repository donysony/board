function fun_reset(){
	alert("교과목 수정을 취소합니다");
	frm.reset();
}

function check(){
	if(frm.id.value==""){
	alert("과목코드를 입력해주세요");
	frm.id.focus();
	return;
	}
	if(frm.name.value==""){
	alert("과목명을 입력해주세요");
	frm.name.focus();
	return;
	}

	if(frm.credit.value==""){
	alert("학점을 입력해주세요");
	frm.credit.focus();
	return;
	}

	if(frm.lecturer.value==""){
	alert("담당강사를 선택해주세요");
	frm.lecturer.focus();
	return;
	}

	if(frm.week.value==""){
	alert("요일을 선택해주세요");
	frm.week.focus();
	return;
	}

	if(frm.start_hour.value==""){
	alert("시작시간을 입력해주세요");
	frm.start_hour.focus();
	return;
	}

	if(frm.end_hour.value==""){
	alert("종료시간를 입력해주세요");
	frm.end_hour.focus();
	return;
	}
	frm.submit();

}