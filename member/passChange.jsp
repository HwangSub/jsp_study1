<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/sessionConfirm.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호변경팝업</title>
</head>

<script>
function fn_submit() {
	let f = document.frm;
	if(f.p1.value == "") {
		alert("현재 암호를 입력해주세요.");
		f.p1.focus();
		return false;
	}
	if(f.p2.value == "") {
		alert("새로운 암호를 입력해주세요.");
		f.p2.focus();
		return false;
	}
	
	let p2 = f.p2.value;  // 새로운 암호
	p2 = p2.replaceAll(" ","");  // 변수의 공백제거
	f.p2.value = p2;  // 공백제거된 암호를 화면에 적용
	
	if(f.p2.value.length < 4 || f.p2.value.length > 20) {
		alert("암호는 4~20로 해주세요.");
		f.p2.focus();
		return false;
	}
	if(f.p2.value != f.p3.value) {
		alert("새로운 암호와 확인 암호가 일치하지 않습니다.");
		f.p2.focus();
		return false;
	}
	f.submit();
}

</script>


<body>

<form name="frm" method="post" action="passChangeSave.jsp">
<table>
	<tr>
		<th>패스워드(현재)</th>
		<td><input type="text" name="p1"></td>
	</tr>
	<tr>
		<th>패스워드(변경)</th>
		<td><input type="text" name="p2"></td>
	</tr>
	<tr>
		<th>패스워드(확인)</th>
		<td><input type="text" name="p3"></td>
	</tr>
</table>
<div>
	<button type="submit" onclick="fn_submit();return false;">적용</button>
	<button type="reset">취소</button>
</div>
</form>


</body>
</html>



