<%@ page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>

<%
String nm = request.getParameter("name");
String tel = request.getParameter("tel");

String id = "";
if( nm != null && tel != null ) {
	id = "검색된 내용이 없습니다.";
	String sql = "SELECT ID FROM MEMBER WHERE NAME='"+nm+"' AND TEL='"+tel+"' ";
	ResultSet rs = stmt.executeQuery(sql);
	if( rs.next() ) {
		id = "결과 : <font color='blue' size='4'><b>"+rs.getString(1)+"</b></font>"; // error
	}
}
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>아이디 찾기</title>
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
	border:0px solid #cccccc;
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
	width:400px;
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
 
 .span_id {
	position:relative;
	top:1px;
	padding:10px;
	width:50px;
	border:1px solid #cccccc;
	border-right:0px;
 }
 input {
	font-size:12px;
 }
 .input_id {
	padding:11px;
	border:1px solid #cccccc;
	border-left:0px;
	width:300px;
 }
 .span_login {
	position:relative;
	top:0px;
	left:-110px;
 }
 .span_login_txt {
	position:relative;
	top:-10px;
 }
 .btn_submit {
	padding:5px;
	border:1px solid #cccccc;
	width:355px;
	height:48px;
	background-color:#ffffff;
	font-size:20px;
	color:#555555;
	cursor:pointer;
 }
 
 .btn_search {
	width:104px;
	padding:10px;
	border:0px;
	background-color:#ffffff;
	cursor:pointer;
 }
 </style>
 
 <script>
 
 function fn_popup() {
	 
	 
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
		아이디 찾기
	</div>

	<div class="div_agrees">
	<form name="frm" method="post" action="<%=request.getRequestURI() %>">
	<table class="table_member" align="center">
		<tr>
			<td>
			<span class="span_id">이름</span>
			<input type="text" name="name" class="input_id"  placeholder="이름을 입력하세요.">
			</td>
		</tr>
		<tr>
			<td>
			<span class="span_id">전번</span>
			<input type="text" name="tel" class="input_id" placeholder="전화번호를 입력하세요." style="width:295px;">
			</td>
		</tr>
		<tr>
			<td valign="middle">
			<button type="submit" class="btn_submit">
				<span class="span_login"><img src="../images/login_img1.PNG"></span>
				<span class="span_login_txt">아이디찾기</span>
			</button>
			</td>
		</tr>
		<tr>
			<td>
			<hr>
			</td>
		</tr>
	</table>
	
	<div style="width:100%; text-align:center;">
		<%=id %>
	</div>
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
