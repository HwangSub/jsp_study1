/**
 * 
 */
function fn_submit() {
	 
	if(document.frm.userid.value == "") {
		alert("아이디를 입력해주세요.");	
		document.frm.userid.focus();
		return false;
	}
	
	if(document.frm.userid.value.length < 4 ||
	   document.frm.userid.value.length > 12 ) 
	{
		alert("아이디는 4자리~12자리 사이로 입력해주세요.");
		document.frm.userid.focus();
		return false;
	}
	
	if(document.frm.pass.value == "") {
		alert("암호를 입력해주세요.");	
		document.frm.pass.focus();
		return false;
	}
	
	if(document.frm.pass.value.length < 4 ||
	   document.frm.pass.value.length > 20 ) 
	{
		alert("암호는 4자리~20자리 사이로 입력해주세요.");
		document.frm.pass.focus();
		return false;
	}
	
	if(document.frm.pass.value != document.frm.pass2.value) {
		alert("암호가 암호확인과 일치하지 않습니다.");
		document.frm.pass.focus();
		return false;
	}

	document.frm.submit();
 
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
