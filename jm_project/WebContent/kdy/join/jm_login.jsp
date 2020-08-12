<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 로그인 페이지 --%>

<link rel="stylesheet" type="text/css" href="../css/jm_login.css">


<div class="login">
	<div class="titleArea">
		<h3>LOGIN</h3>
		<span>WELCOM BACK</span>
	</div>
	<fieldset>

		<label class="id">
		<input id="member_id" name="member_id"  filter="isFill" label="아이디" msg="" class="inputTypeText"
			placeholder="" value="" type="text" /></label> 
		
		<label class="password">
		<input id="member_passwd" name="member_passwd"  filter="isFill&isMin[4]&isMax[16]" label="패스워드" msg=""
			autocomplete="off" value="" type="password" /></label>
	
		<a href="#none" 	onclick="MemberAction.login('member_form_1561469369'); return false;"
			class="loginBtn -mov"> <img src="../img/btn_login.gif" alt="로그인" /></a>
		
		<p class="security">
			<img src="../img/ico_access.gif" alt="보안접속" /> 보안접속	</p>

		<ul>
			<li><a href="../join/jm_findId.jsp">아이디찾기</a></li>
			<li><a href="../join/jm_findId.jsp">비밀번호찾기</a></li>
			<li><a href="../join/jm_join.jsp">회원가입</a></li>
		</ul>
		
	</fieldset>
</div>


<script type="text/javascript">
	$("#id").focus();

	$("#login_btn").click(function() {
		if ($("#id").val() == "") {
			$("#message").text("아이디를 입력해 주세요.");
			$("#id").focus();
			return;
		}

		if ($("#passwd").val() == "") {
			$("#message").text("비밀번호를 입력해 주세요.");
			$("#passwd").focus();
			return;
		}

		$("#login").submit();
	});
</script>


