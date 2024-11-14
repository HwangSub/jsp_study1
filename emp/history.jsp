<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String SESSION_ID2 = (String) session.getAttribute("sessionId");
if( SESSION_ID2 == null ) {
%>
		<script>
		alert("로그인을 해주세요.");
		location="../member/loginWrite.jsp";
		</script>
<%
		return;
}
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" href="../css/style.css" />
 </head>
 
 <style>
 .div_table1 {
	position:relative;
	left:30px;
	width:700px;
	height:100%;
 }
 </style>
 
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
	aside영역
 </aside>
 
 <section>
	
 <div class="div_table1">	
	
 <table border="0" width="700">
	<tr>
		<td>
			<table align="center">
		<tr>
			<td><h2>이&nbsp;력&nbsp;서</h2></td>
		</tr>
	 </table>	 

  <table border="1" cellspacing="1" align="right" width="200">
	<tr>
		<th align="center" width="40%" bgcolor="#ffccff">희망연봉</th>
		<th align="right" width="*"bgcolor="#ffffff">만원&nbsp;&nbsp;</th>
	</tr>
  </table>
  		</td>
	 </tr>	 
  </table>
  
 <h4>1.인적사항<h4>
  <table border="3" width="700" height="30">	
	<tr align="center" >
		<td width="20%" rowspan="5">(사진)</td>
		<th width="20%" bgcolor="#ffccff">성&nbsp;명</th>
		<td colspan="3"></td>
	</tr>
	
	<tr align="center">
		<th bgcolor="#ffccff">주민등록번호</th>
		<td colspan="3"></td>
	</tr>
	<tr align="center">
		<th bgcolor="#ffccff">전자우편</th>
		<td colspan="3"></td>
	</tr>
	<tr align="center">
		<th bgcolor="#ffccff">전화번호</th>
		<td width="20%"></td>
		<th bgcolor="#ffccff">휴 대 폰</th>
		<td width="20%"></td>
	</tr>
	<tr align="center">
		<th bgcolor="#ffccff">주 소</th>
		<td colspan="3"></td>
	</tr>
	<tr align="center">
		<th bgcolor="#ffccff">호적관계</th>
		<th bgcolor="#ffccff">호주성명</th>
		<td width="20%"></td>
		<th bgcolor="#ffccff">호주와의 관계</th>
		<td width="20%"></td>
	</tr>
  </table>
  
<h4>2.학력사항<h4>  
  <table border="3" width="700" height="30">
	<tr align="center" bgcolor="#ffccff">
		<th width="20%">기&nbsp;&nbsp;간</th>
		<th width="50%">학&nbsp;교&nbsp;명</th>
		<th width="30%">전공(학과)</th>
	</tr>
	<tr align="center">
		<th>-</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>-</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>-</th>
		<td></td>
		<td></td>
	</tr>
	
	<tr align="center">
		<th>-</th>
		<td></td>
		<td></td>
	</tr>
  </table>
  
  
<h4>3.경력사항<h4>  
  <table border="3" width="700" height="30">
	<tr align="center" bgcolor="#ffccff">
		<th width="20%">기&nbsp;&nbsp;간</th>
		<th width="40%">회&nbsp;사&nbsp;명</th>
		<th width="30%">부&nbsp;&nbsp;서</th>
		<th width="10%">직위</th>
	</tr>
	
	<tr align="center">
		<th>-</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	
	<tr align="center">
		<th>-</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	
	<tr align="center">
		<th>-</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	
	<tr align="center">
		<th>-</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	
	<tr align="center">
		<th>-</th>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	
  </table>  
  
  
  
<h4>4.어학능력<h4> 
   <table border="3" width="700" height="30">
	<tr align="center" >
		<th width="10%" rowspan="2" bgcolor="#ffccff">어&nbsp;학</th>
		<th width="20%" bgcolor="#ffccff">TOEIC</th>
		<td align="right" width="30%"> 점&nbsp;&nbsp;</td>
		<th width="20%" bgcolor="#ffccff">일본어</th>
		<td align="right" width="30%"> 급&nbsp;&nbsp;</td>
	
	<tr align="center" >
		<th width="20%" bgcolor="#ffccff">TOEIC</th>
		<td align="right" width="30%"> 점&nbsp;&nbsp;</td>
		<th width="20%" bgcolor="#ffccff">중국어</th>
		<td align="right" width="30%"> 급&nbsp;&nbsp;</td>
	
	<tr>
	</tr>
   </table> 
	
  </div>
	
	
 </section>
 
 <footer>
 <!-- footer S -->
 <%@ include file="../include/footer.jsp" %>
 <!-- footer E -->
 </footer>
  
 </body>
</html>
