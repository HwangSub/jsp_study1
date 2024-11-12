<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 파라메터 값 설정(넘어오는 변수를 받고/오류체크) -->
<%
String deptno = request.getParameter("deptno");
if( deptno == null || deptno.equals("") ) {
%>
	<script>
	alert("잘못된 접근입니다.");
	location = "deptList.jsp";
	</script>
<%	
	return;
}
%>
<!-- DB연결 -->
<%@ include file="/include/oracleCon.jsp" %>

<!-- 삭제 SQL 작성 후 적용 -->
<%
String sql = " DELETE FROM dept "
			+ "   WHERE deptno='"+deptno+"' ";
int result = stmt.executeUpdate(sql);
if( result == 1 ) {
%>  
	<script>
	alert("삭제완료");
	location = "deptList.jsp";
	</script>
<%
} else {
%>
	<script>
	alert("삭제실패");
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