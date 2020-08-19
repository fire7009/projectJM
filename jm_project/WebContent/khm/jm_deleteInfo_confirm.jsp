<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원탈퇴를 위한 비밀번호를 입력받는 JSP 문서 --%>
<%-- => 비로그인 사용자가 요청한 경우 에러페이지로 이동 - 비정상적인 요청 --%>
<%-- => [입력완료]를 클릭한 경우 회원탈퇴 처리페이지(member_remove_action.jsp) 요청 - 입력값 전달 --%>
<%@include file="/kdy/security/login_check.jspf" %>
<%
	String message = (String)session.getAttribute("message");
	if(message == null) {
		message ="";
	} else {
		session.removeAttribute("message");
	}
%>
<form name="passwdForm" action="<%=request.getContextPath()%>/index.jsp?workgroup=khm&work=jm_deleteInfo_action" 
	method="post" onsubmit="return sumbitCheck();" style="text-align: center; font-size: 17px; margin: 200px;">
	<p style="margin-bottom: 10px;">회원탈퇴를 위한 비밀번호를 입력해주세요. </p>
	<p>
		<input type="password" name="password">
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