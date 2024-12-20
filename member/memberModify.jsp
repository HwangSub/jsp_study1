<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/sessionConfirm.jsp" %>

<%
String sqlDetail = "select unq,id,name,tel,mail,post,addr1,addr2,mailyn,smsyn,rdate "
				 + "  from member "
				 + " where id='"+SessionUserid+"'";

ResultSet rs = stmt.executeQuery(sqlDetail);
rs.next();

String unq   = rs.getString("unq");
String name  = rs.getString("name");
String tel   = rs.getString("tel");
String mail  = rs.getString("mail");
String post  = rs.getString("post");
String addr1 = rs.getString("addr1");
String addr2 = rs.getString("addr2");
String mailyn = rs.getString("mailyn");
String smsyn  = rs.getString("smsyn");

// 01077778888
String t1 = tel.substring(0,3); // 0,1,2
String t2 = tel.substring(3,7); // 3,4,5,6
String t3 = tel.substring(7);   // 7번부터 끝까지

String[] array = mail.split("@");
String m1 = array[0];
String m2 = array[1];
%>

<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>정보수정</title>
  <link rel="stylesheet" href="/css/style.css" />
  <link rel="stylesheet" href="/css/member.css" />
 </head>
 
 <script>
 function fn_popup() {
	 let url = "passChange.jsp";
	 window.open(url,"popup","width=400,height=300");
 }
 
 function fn_submit() {
		
		let f = document.frm;

		if( f.name.value == "" ) {
			alert("이름을 다시확인해 주세요.");
			f.name.focus();
			return false;
		}

		if( f.tel2.value.length != 4 || f.tel3.value.length != 4 ) {
			alert("연락처를 다시확인해 주세요.");
			f.tel2.focus();
			return false;
		}
		
		if( f.mail1.value == "" || f.mail2.value == "" ) {
			alert("이메일을 다시확인해 주세요.");
			f.mail1.focus();
			return false;
		}
		
		f.submit();
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
		정보수정
	</div>

	<div class="div_agrees">
	
	<form name="frm" method="post" action="memberModifySave.jsp">
	
	<table class="table_member">
		<tr>
			<td colspan="2">
			■ 로그인 정보 입력
			</td>
		</tr>
		<tr>
			<td>*아이디</td>
			<td>
				<span style="color:red;font-weight:bold;"><%=SessionUserid %></span>
			</td>
		</tr>
		<tr>
			<td>*비밀번호</td>
			<td>
				<button type="button" onclick="fn_popup()">비밀번호 변경</button>
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
				<input type="text" name="name" class="input2" value="<%=name %>">
			</td>
		</tr>
		<tr>
			<td>*연락처</td>
			<td>
				<select name="tel1" class="input3"> 
					<option value="010" <%if(t1.equals("010")){ out.print("selected"); } %>>010</option>
					<option value="011" <%if(t1.equals("011")){ out.print("selected"); } %>>011</option>
				</select>
				- 
				<input type="number" name="tel2" class="input3" maxlength="4" value="<%=t2 %>" > - 
				<input type="number" name="tel3" class="input3" maxlength="4" value="<%=t3 %>" >
			</td>
		</tr>
		<tr>
			<td>*이메일</td>
			<td>
				<input type="text" name="mail1" class="input3" value="<%=m1 %>"> @
				<input type="text" name="mail2" class="input3" value="<%=m2 %>">
				<select name="mail3" class="select1" onchange="fn_select()">
					<option value="">직접입력</option>
					<option value="naver.com">NAVER.COM</option>
					<option value="google.com">GOOGLE.COM</option>
					<option value="daum.net">DAUM.NET</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="post" id="zipcode" value="<%=post %>" class="input3" placeholder="우편번호">
				<input type="button" onclick="postcode()" class="button2" value="우편번호 찾기">
				<br>
				<input type="text" name="addr1" id="addr1" value="<%=addr1 %>" class="input2" placeholder="일반주소"><br>
				<input type="text" name="addr2" id="addr2" value="<%=addr2 %>" class="input2" placeholder="상세주소"><br>
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
			<input type="checkbox" name="mailyn" value="Y"  
						<%if(mailyn.equals("Y")){ out.print("checked"); } %> > 이메일
			<input type="checkbox" name="smsyn"  value="Y"
						<%if(smsyn.equals("Y")){ out.print("checked"); } %> > 문자
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
			<td colspan="2" height="100" align="center">
			<button type="button" class="button1" onclick="fn_submit()">저장하기</button>
			</td>
		</tr>

	</table>
	
	</form>

	</div>
 </section>
 
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
     function postcode() {
         new daum.Postcode({
             oncomplete: function(data) {
                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                 var addr = ''; // 주소 변수
                 var extraAddr = ''; // 참고항목 변수

                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                     addr = data.roadAddress;
                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
                     addr = data.jibunAddress;
                 }

                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                 if(data.userSelectedType === 'R'){
                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                         extraAddr += data.bname;
                     }
                     // 건물명이 있고, 공동주택일 경우 추가한다.
                     if(data.buildingName !== '' && data.apartment === 'Y'){
                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                     }
                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                     if(extraAddr !== ''){
                         extraAddr = ' (' + extraAddr + ')';
                     }
                     // 조합된 참고항목을 해당 필드에 넣는다.
                     //document.getElementById("sample6_extraAddress").value = extraAddr;
                 
                 } else {
                     //document.getElementById("sample6_extraAddress").value = '';
                 }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 document.getElementById("zipcode").value = data.zonecode;
                 document.getElementById("addr1").value = addr;
                 // 커서를 상세주소 필드로 이동한다.
                 document.getElementById("addr2").focus();
             }
         }).open();
     }
 </script>
 
 
 
 <footer>
 <!-- footer S -->
 <%@ include file="../include/footer.jsp" %>
 <!-- footer E -->
 </footer>
  
 </body>
</html>
