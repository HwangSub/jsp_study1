<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>
<%
/*
select  id
       ,substr(addr1,1, instr(addr1,' ')-1 )     
       --instr(addr1,' ')
       ,to_char(rdate,'yyyy.mm.dd') rdate 
 from 
      member
*/


String sql1 = "SELECT COUNT(*) FROM MEMBER";
ResultSet rs1 = stmt.executeQuery(sql1);

String sql2 = " SELECT 	 UNQ     "
			+ "			,ID      "
			+ "			,PASS    "
			+ "			,NAME    "
			+ "			,TEL     "
			+ "			,MAIL    "
			+ "			,POST    "
			+ "			,ADDR1   "
			+ "			,ADDR2   "
			+ "			,MAILYN  "
			+ "			,SMSYN   "
			+ "			,RDATE   "
			+ "   FROM  MEMBER   ";
ResultSet rs2 = stmt.executeQuery(sql2);

%>


<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>회원목록</title>
  <!--  ".." 의미는 상위 폴더  -->
  <link rel="stylesheet" href="../css/style.css" />
 </head>
 <body>

 <header>
 <!-- header S -->
 <%@ include file="include/header.jsp" %>
 <!-- header E -->
 </header>
 
 <nav>
 <!-- top menu S -->
 <%@ include file="include/topMenu.jsp" %>
 <!-- top menu E -->
 </nav>
 
 <aside>
 <%@ include file="include/aside.jsp" %>
 </aside>
 
 <section>
	 
	 <div style="margin-left:20px; margin-top:20px;">
	 <table border="1" width="800">
	 	<tr>
	 		<th>번호</th>
	 		<th>아이디</th>
	 		<th>이름</th>
	 		<th>연락처</th>
	 		<th>이메일</th>
	 		<th>지역</th>
	 		<th>등록일</th>
	 	</tr>

		<%
		while( rs2.next() ) {
			int    unq  = rs2.getInt("unq");
			String id   = rs2.getString("id");
			String name = rs2.getString("name");
			String tel  = rs2.getString("tel");
			String mail = rs2.getString("mail");
			String addr1 = rs2.getString("addr1");
			String rdate = rs2.getString("rdate");
			
			if( addr1 != null ) {
				String[] array = addr1.split(" ");
				addr1 = array[0];
			} else {
				addr1 = "";
			}
			
			String[] array1 = rdate.split(" ");
			rdate = array1[0];  // 2024-11-14
			rdate = rdate.replace("-",".");  // "-"를 "."으로 바꿈
			
			// 년/월/일 시간들
		%>
	 	<tr align="center">
	 		<td>100</td>
	 		<td><%=id %></td>
	 		<td><%=name %></td>
	 		<td><%=tel %></td>
	 		<td><%=mail %></td>
	 		<td><%=addr1 %></td>
	 		<td><%=rdate %></td>
	 	</tr>
	 	<%
		}
	 	%>
	 
	 </table>
	 
	 </div>
	 
 </section>
 

 </body>
</html>
