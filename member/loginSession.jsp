<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/oracleCon.jsp" %>
  
<%
 String id = request.getParameter("id");
 String pass = request.getParameter("pass");
 
 if( id == null || pass == null ) {
%>
		<script>
		alert("누구냐?");
		location="loginWrite.jsp";
		</script> 
<% 
		return;
 } 
 String sql="select count(*) from member where id='"+id+"' and pass='"+pass+"' ";
 ResultSet rs = stmt.executeQuery(sql);
 rs.next();
 int cnt = rs.getInt(1);
 if( cnt == 0 ) {
%>
		<script>
		alert("일치하는 정보가 없습니다.");
		history.back();
		</script> 
<%
		return;
 }

// 세션변수 생성
 session.setAttribute("sessionId", id); 
// String sessionId = id;
%>
	<script>
	alert("<%=id%>님 환영합니다.");
	location="../main/main.jsp";
	</script>
