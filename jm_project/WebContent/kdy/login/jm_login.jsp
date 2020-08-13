<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 로그인 페이지 --%>

<%-- => [로그인]을 클릭한 경우 로그인 처리페이지(jm_login_action.jsp) 요청 - 입력값 전달 --%>
<%
	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
	
	String id=(String)session.getAttribute("id");
	if(id==null) {
		id="";
	} else {
		session.removeAttribute("id");
	}
%> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%-- 로그인 화면 CSS  --%>
<style>

.login{
	position:relative;
	margin:20px 0 50px;
}

.titleArea{
	min-height:30px;
	margin:0;
	border-bottom:0;
}

.titleArea h3{
	display:block;
	clear:both;
	margin:0 0 10px;
	border-bottom:0;
	text-align:center;
	font-size:35px;
	font-weight:400;
	color:#333;
	letter-spacing:-0.03em;
}

.titleArea span{
	display:block;
	clear:both;
	margin:0 0 30px;
	text-align:center;
	font-size:12px;
	font-weight:400;
	color:#999;
	letter-spacing:-0.03em;
}

fieldset{
	border : 0;
	position:relative;
	width:400px;
	margin:0 auto;
}

fieldset .id, fieldset  .passwd{ 
	overflow:hidden;
	display:block;
	width:400px;
	margin:0 0 10px;
}

#member_id{ background:url('../img/login_ico_id.png') 12px 12px no-repeat; }
#member_passwd{ 	background:url('../img/login_ico_pw.png') 12px 12px no-repeat; }

.login input{
	width:400px;
	height:45px;
	padding:2px 2px 2px 75px;
	border:1px solid #ddd;
	none;
	color:#333;
	font-size:14px;
	line-height:45px;
	letter-spacing:0.08em;
	font-weight:normal;
	transition:all .5s ease;
	-webkit-transition:all .5s ease;
}

input:focus{ 	border:1px solid #333; }

.loginBtn:hover{
	filter:alpha(opacity=80);
	opacity:.8;
	-webkit-opacity:.8;
}

fieldset .security{	padding:0 0 0 5px;	margin:20px 0 20px;	color:#666;	font-family:'Nanum Gothic';	font-size: 12px;}
fieldset .security input{ 	width:13px; 	height:13px; 	margin:0 3px 0 0; 	vertical-align:-3px; 	*vertical-align:2px;}
fieldset .security label{margin:0 6px 0 0;}
fieldset .security img{	vertical-align:-1px;}

fieldset > a{
	position:relative;
	display:block;
	margin:20px 0 10px;
}

fieldset ul{
	display:block;
	margin:0 0 20px 0;
	border-top:1px solid #ddd;
	border-bottom:1px solid #ddd;
	text-align:center;
}

fieldset li{
	display:inline-block;
	*display:inline;
	*zoom:1;
	height:50px;
	line-height:50px;
	padding:0 9px 0 13px;
	background:url("/_wg/img/bar_ddd.gif") no-repeat 0 22px;
}

fieldset li:first-child{
	background:none;
}

fieldset li a{
	font-family:'Nanum Gothic';
	font-size : 12px;
	color:#999;
	text-decoration:none;
}

fieldset li a:hover{
	color:#333;
	text-decoration:none;
}

fieldset .link{
	position:relative;
	margin:0;
	padding:0;
	font-size:11px;
	color:#555;
}

fieldset .link a{
	
	position:relative;
	display:block;
	margin:30px 0 10px;
}
</style>
<%-- 경로 입력 --%>
<form id="login" name="loginForm" action="<%=request.getContextPath() %>#" method="post">
<div class="login">
	<div class="titleArea">
		<h3>LOGIN</h3>
		<span>WELCOM BACK</span>
	</div>
	<fieldset>
		<label class="id">
		<input id="member_id" name="member_id"  label="아이디" msg=""  class="inputTypeText"
			autocomplete="off"  value="<%=id %>" type="text" /></label> 
		
		<label class="passwd">
		<input id="member_passwd" name="member_passwd"  label="패스워드" msg=""
			autocomplete="off"  type="password" /></label>
	
		<a id="login_btn"  class="loginBtn"> <img src="../img/btn_login.gif" alt="로그인" /></a>
		<div id="message"><%=message %></div>
		
		<p class="security">
			<img src="../img/ico_access.gif" alt="보안접속" /> 보안접속	</p>

		<ul>
			<li><a href="../join/jm_findId.jsp">아이디찾기</a></li>
			<li><a href="../join/jm_findId.jsp">비밀번호찾기</a></li>
			<li><a href="../join/jm_join.jsp">회원가입</a></li>
		</ul>
	</fieldset>
	
</div>
</form>

<script type="text/javascript">
	$("#member_id").focus();

	$("#login_btn").click(function() {
		if ($("#member_id").val() == "") {
			$("#message").text("아이디를 입력해 주세요.");
			$("#member_id").focus();
			return;
		}

		if ($("#member_passwd").val() == "") {
			$("#message").text("비밀번호를 입력해 주세요.");
			$("#member_passwd").focus();
			return;
		}

		$("#login").submit();
	});
	
</script>

<%@include file="/syd/jm_Footer.jsp" %>


