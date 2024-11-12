<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" href="../css/style.css" />
 </head>

 <style>
 
 .div_title {
	position:relative;
	left:30px;
	top:40px;
	font-size:40px;
	font-weight:bold;
	color:#505050;
	width:840px;
	text-align:center;
 }
 .div_agrees {
	position:relative;
	left:30px;
	top:60px;
	width:840px;
	height:750px;
	border:1px solid #cccccc;
	padding:10px;
	font-size:12px;
	line-height:3.0;
 }
 
 .button1 {
	width:200px;
	padding:10px;
	font-size:14px;
	font-weight:bold;
	color:#ffffff;
	background-color:#0066ff;
	border:0px;
	cursor:pointer; /*help,progress,wait,cell,pointer*/
 }
 
 /* hover  : 마우스올렸을 경우(상태)
  * focus  : 커서가 위치하는 경우
  * active : 클릭순간의 경우
  */
 .button1:hover {
	background-color:#006600;
	/*세로(공간),가로(공간),둥근모서리(번짐),그림자크기    */
	box-shadow:5px 5px 5px 0px #ff33ff;
 }
 .button1:focus {
	background-color:#ffcc99;
 }
 .button1:active {
	background-color:#ffff00;
 }
 
 .button2 {
	width:100px;
	padding:8px;
	font-size:14px;
	font-weight:bold;
	color:#ffffff;
	background-color:#0066ff;
	border:0px;
	cursor:pointer; /*help,progress,wait,cell,pointer*/
 }
 
 .button3 {
	width:70px;
	padding:8px;
	font-size:12px;
	font-weight:bold;
	color:#ffffff;
	background-color:#0066ff;
	border:0px;
	cursor:pointer; /*help,progress,wait,cell,pointer*/
 }
 
 .table_member {
	width:100%;
 }
 
 .table_member td {
	padding:5px;
 }
 
 .input1 {
	width:70%;
	padding:7px;
 }
 .input2 {
	width:90%;
	padding:7px;
 }
 .input3 {
	width:150px;
	padding:7px;
 }
 
 hr {
	border:0px;
	height:1px;
	background:#e9e9e9;
 }
 .select1 {
 	width:150px;
	padding:7px;
 }
 
 </style>
 
 <script>
 
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
 </script>
 
 <body>
  
 <header>
 <!-- header S -->
 <%@ include file="../include/header.jsp" %>
 <!-- header E -->
 </header>
 
 <nav>
 <!-- top menu S -->
 <%@ include file="../include/topMenu.jsp" %>
 <!-- top menu E -->
 </nav>
 
 <aside>
 <%@ include file="../include/aside.jsp" %>
 </aside>
 
 <section>

	<div class="div_title">
		회원등록
	</div>

	<div class="div_agrees">
	
	<form name="frm" method="post" action="memberWriteSave.jsp">
	
	<table class="table_member">
		<tr>
			<td colspan="2">
			■ 로그인 정보 입력
			</td>
		</tr>
		<tr>
			<td>*아이디</td>
			<td>
			<input type="text" name="userid" class="input1">
			<button type="button" class="button2">중복확인</button>
			</td>
		</tr>
		<tr>
			<td>*비밀번호</td>
			<td>
				<input type="password" name="pass" class="input2">
			</td>
		</tr>
		<tr>
			<td>*비밀번호 확인</td>
			<td>
				<input type="password" name="pass2" class="input2">
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<hr>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			■ 회원 정보 입력
			</td>
		</tr>
		<tr>
			<td>*이름(회사명)</td>
			<td>
				<input type="text" name="name" class="input2">
			</td>
		</tr>
		<tr>
			<td>*연락처</td>
			<td>
				<input type="text" name="mobile1" class="input3"> - 
				<input type="text" name="mobile2" class="input3"> - 
				<input type="text" name="mobile3" class="input3">
			</td>
		</tr>
		<tr>
			<td>*이메일</td>
			<td>
				<input type="text" name="mail1" class="input3"> @
				<input type="text" name="mail2" class="input3">
				<select name="mail3" class="select1" onchange="fn_select()">
					<option value="">직접입력</option>
					<option value="naver.com">NAVER.COM</option>
					<option value="google.com">GOOGLE.COM</option>
					<option value="daum.net">DAUM.NET</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<hr>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			■ 정보 수신 동의
			</td>
		</tr>
		<tr>
			<td colspan="2">
			내용은 수신동의 여부와 관계없이 발송됩니다.
			<input type="checkbox" name=""> 이메일
			<input type="checkbox" name=""> 문자
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<hr>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<div style="width:100%;padding:5px;background:yellow;"> 
			<input type="text" name="" class="input1">
			<img src="pic1.PNG" style="margin-bottom:-13px;">
			<button type="button" class="button3">새로고침</button>
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" class="button1" onclick="fn_submit()">저장하기</button>
			</td>
		</tr>

	</table>
	
	</form>
	
	
	</div>

 </section>
 
 <footer>
 <!-- footer S -->
 <%@ include file="../include/footer.jsp" %>
 <!-- footer E -->
 </footer>
  
 </body>
</html>
