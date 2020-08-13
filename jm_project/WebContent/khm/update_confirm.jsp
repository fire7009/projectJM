<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/kdy/security/login_check.jspf" %>

<%
	String message = (String)session.getAttribute("message");
	if(message == null) {
		message ="";
	} else {
		session.removeAttribute("message");
	}
%>
<form name="passwdForm" action="<%=request.getContextPath()%>/index.jsp?workgroup=userInfo&work=jm_updateInfo5" method="post" onsubmit="return sumbitCheck();">
	<p>회원정보변경을 위한 비밀번호를 입력해주세요. </p>
	<p>
		<input type="password" name="passwd">
		<button type="submit">입력완료</button>
	</p>
	<p id="message" style="color: red;"><%= message %></p>
</form>
<script type="text/javascript">
passwdForm.passwd.focus();

function submitCheck() {
	if(passwdForm.passwd.value=="") {
		document.getElementById("message").innerHTML="비밀번호를 입력해 주세요.";
		passwdForm.passwd.focus();
		return false;
	}
	return true;
}

</script>