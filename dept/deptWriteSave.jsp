<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@
 include file="/include/oracleCon.jsp"
%>

<%
String deptno = request.getParameter("deptno");
String dname = request.getParameter("dname");
String loc = request.getParameter("loc");

if( deptno == null || dname == null || 
    deptno.equals("") || dname.equals("") ) {
%>
	<script>
	alert("부서정보가 없습니다. 다시 시도해주세요.");
	history.back(); // 이전화면으로 이동
	</script>
<%
	return;  // 프로그램 수행 중단
}

String sql2 = "SELECT COUNT(*) cnt FROM DEPT WHERE deptno='"+deptno+"' ";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt("cnt");
if( cnt > 0 ) {
%>
	<script>
	alert("이미 사용중인 부서번호입니다.");
	history.back(); // 이전화면으로 이동
	</script>
<%
	return;  // 프로그램 중단
}

String sql = " INSERT INTO dept(deptno,dname,loc) "
		   + "  VALUES('"+deptno+"','"+dname+"','"+loc+"')";

int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>  
	<script>
	alert("저장완료");
	location = "deptList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("저장실패");
	history.back();
	</script>
<%
}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>