<%@ page import="java.util.logging.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
//Logger log = Logger.getLogger("");
//log.info("abc1212");
%>
