<%@page import="java.sql.ResultSet"%>
<%@ page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Logger log = Logger.getLogger("");
%>
   
<!-- DB연결 -->
<%@ include file="../include/oracleCon.jsp" %>

<!-- 파라메터값 설정 -->
<%
String userid   = request.getParameter("userid");
String pass    	= request.getParameter("pass");
String name  	= request.getParameter("name");
String tel1 	= request.getParameter("tel1");
String tel2   	= request.getParameter("tel2");
String tel3   	= request.getParameter("tel3");
String mail1    = request.getParameter("mail1");
String mail2    = request.getParameter("mail2");
String post 	= request.getParameter("post");
String addr1   	= request.getParameter("addr1");
String addr2   	= request.getParameter("addr2");
String mailyn   = request.getParameter("mailyn");
String smsyn   	= request.getParameter("smsyn");

// 아이디, 암호, 이름, 연락처, 이메일
if( userid == null || pass == null || name == null ||
	tel1 == null   || tel2 == null || tel3 == null ) 
{
%>
		<script>
		alert("데이터를 다시확인해주세요.!");
		location = "memberWrite.jsp";
		</script>
<%
		return;
}

// 아이디 중복체크
String sql2 = "SELECT COUNT(*) FROM MEMBER WHERE id='"+userid+"'";
ResultSet rs2 = stmt.executeQuery(sql2);
rs2.next();
int cnt = rs2.getInt(1);
if( cnt == 1 ) {
%>
		<script>
		alert("이미 사용중인 아이디입니다.!");
		history.back();
		</script>
<%
		return;
}
%>

<!-- 데이터편집 
   1.연락처  2.이메일  3.이메일수신여부(Y/N)   4.문자수신여부(Y/N)
-->
<%
String tel  =  tel1 + tel2 + tel3;
String mail = mail1 + "@" + mail2;

if( mailyn == null ) {
	mailyn = "N";
}

if( smsyn == null ) {
	smsyn = "N";
}
%>

<!-- 저장SQL작성/적용 -->
<%
String sql  = "INSERT INTO member( "
			+"	 UNQ  "
			+"	,ID   "
			+"	,PASS "
			+"	,NAME "
			+"	,TEL  "
			+"	,MAIL "
			+"	,POST "
			+"	,ADDR1 "
			+"	,ADDR2 "
			+"	,MAILYN "
			+"	,SMSYN  "
			+"	,RDATE ) VALUES( "
					+"	 member_seq.nextval "
					+"	,'"+userid+"' "
					+"	,'"+pass+"' "
					+"	,'"+name+"' "
					+"	,'"+tel+"' "
					+"	,'"+mail+"' "
					+"	,'"+post+"' "
					+"	,'"+addr1+"' "
					+"	,'"+addr2+"' "
					+"	,'"+mailyn+"' "
					+"	,'"+smsyn+"' "
					+"	,sysdate  )";
int result = stmt.executeUpdate(sql);

System.out.println(sql);
log.info("userid :: " + userid);

if( result == 1 ) {
%>
		<script>
		alert("저장완료!");
		location = "loginWrite.jsp";
		</script>
<%
} else {
%>
		<script>
		alert("저장실패!");
		history.back();
		</script>
<%
}
%>

<%

//log.info("abc1212");
%>
