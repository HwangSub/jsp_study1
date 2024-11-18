<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/include/oracleCon.jsp" %>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
if( id == null || pw == null ) {
	response.sendRedirect("/main/main.jsp");
	return;
}
String sql = "select lv from admin where id='"+id+"' and pw='"+pw+"'";
ResultSet rs = stmt.executeQuery(sql);
String lv = "";
if( rs.next() ) {
	lv = rs.getString(1);  // 결과값의 첫번째 요소
} else {
	response.sendRedirect("/admin/login.jsp");
	return;
}

// 세션변수 생성 (2개)
session.setAttribute("AdminSessionId", id);
session.setAttribute("AdminSessionLevel", lv);
%>
		<script>
		alert("관리자 <%=id %>님 로그인 하셨습니다.");
		location = "/admin/index.jsp";
		</script>






    