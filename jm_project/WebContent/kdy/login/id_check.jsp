
<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디를 전달받아 userInfo 테이블에 저장된 기존 회원정보의 아이디와 
비교하여 사용 가능 여부를 클라이언트에게 전달하는 JSP 문서 --%>
<%-- => 아이디 사용 가능(미중복) : 사용 가능 메세지 전달 - 부모창의 아이디 관련 입력태그의 입력값 변경 --%>
<%-- => 아이디 사용 불가능(중복) : 사용 불가능 메세지 전달 - 아이디 입력 후 재요청 --%>    
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getParameter("id")==null) {
		response.sendError(HttpServletResponse.SC_BAD_REQUEST);
		return;
	}

	//전달값을 반환받아 저장
	String id=request.getParameter("id");
	
	//아이디를 이용하여 Member 테이블에 저장된 회원정보를 검색하여 
	//반환하는 DAO 클래스의 메소드 호출
	// => null 반환 : 회원정보 미검색 - 아이디 사용 가능
	// => 회원정보 반환 : 회원정보 검색 - 아이디 사용 불가능
	UserInfoDTO userInfo=UserInfoDAO.getDAO().selectIdUserinfo(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">
div {
	text-align: center;
	margin: 10px;
}

.id { color: red; }
</style>
</head>
<body>
	<% if(userInfo==null) {//아이디 사용이 가능한 경우 %>
		<div>입력한 <span class="id">[<%=id %>]</span>는 사용 가능한 
		아이디 입니다.</div>
		<div><button type="button" onclick="windowClose();">아이디 사용</button></div>
	
	<% } else {//아이디 사용이 불가능한 경우 %>
		<div id="message">입력한 <span class="id">[<%=id %>]</span>는
		이미 사용중인 아이디 입니다.<br>
		다른 아이디를 입력하고 [확인]을 눌러 주세요.</div>
		<%-- form 태그의 action 속성이 생략된 경우 브라우저의 현재 URL 주소로 요청 --%>
		<%-- form 태그의 method 속성이 생략된 경우 GET 방식으로 요청 --%>
		<div>
			<form name="form" onsubmit="return submitCheck();">
				<input type="text" name="id">
				<button type="submit">확인</button>		
			</form>
		</div>
	<% } %>
	
	<script type="text/javascript">
	function windowClose() {
		//opener : 부모창을 나타내는 객체
		opener.joinForm.id.value="<%=id%>";
		opener.joinForm.idCheckResult.value="1";
		window.close();//창닫기
	}
	
	function submitCheck() {
		var id=form.id.value;
		if(id=="") {
			document.getElementById("message").innerHTML="아이디를 입력해 주세요.";
			document.getElementById("message").style="color: red;";
			return false;
		}
		
		var idReg=/^[a-zA-Z]\w{4,10}$/g;
		if(!idReg.test(id)) {
			document.getElementById("message").innerHTML="아이디는 영문자로 시작되는 영문자,숫자,_의 4~10범위의 문자로만 작성 가능합니다.";
			document.getElementById("message").style="color: red;";
			return false;
		}
		return true;
	}
	</script>
</body>
</html>