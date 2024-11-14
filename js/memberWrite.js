/**
 * 
 */
function fn_submit() {
	
	let f = document.frm;
	
	if(f.userid.value == "") {
		alert("아이디를 입력해주세요.");	
		f.userid.focus();
		return false;
	}
	
	if(f.userid.value.length < 4 ||
	   f.userid.value.length > 12 ) 
	{
		alert("아이디는 4자리~12자리 사이로 입력해주세요.");
		f.userid.focus();
		return false;
	}
	
	if(f.pass.value == "") {
		alert("암호를 입력해주세요.");	
		f.pass.focus();
		return false;
	}
	
	if(f.pass.value.length < 4 ||
	   f.pass.value.length > 20 ) 
	{
		alert("암호는 4자리~20자리 사이로 입력해주세요.");
		f.pass.focus();
		return false;
	}
	
	if(f.pass.value != f.pass2.value) {
		alert("암호가 암호확인과 일치하지 않습니다.");
		f.pass.focus();
		return false;
	}
	
	if( f.name.value == "" ) {
		alert("이름을 다시확인해 주세요.");
		f.name.focus();
		return false;
	}

	if( f.tel2.value.length != 4 || f.tel3.value.length != 4 ) {
		alert("연락처를 다시확인해 주세요.");
		f.tel2.focus();
		return false;
	}
	
	if( f.mail1.value == "" || f.mail2.value == "" ) {
		alert("이메일을 다시확인해 주세요.");
		f.mail1.focus();
		return false;
	}
	
	f.submit();
 }
 

 function fn_select() {
	
	var ss = document.frm.mail3.value; // select 상자 값
	if( ss != "" ) {
		document.frm.mail2.value = ss;	
		document.frm.mail2.readOnly = true;
	} else {
		document.frm.mail2.value = "";
		document.frm.mail2.readOnly = false;
	}
 }
