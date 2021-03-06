<%@page import="jm.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/kdy/security/login_check.jspf"%>

<%-- 
	//비정상적인 요청에 대한 응답처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//입력값을 반환받아 저장
	String password=Utility.encrypt(request.getParameter("password"));
	
	//로그인 사용자의 비밀번호와 입력 비밀번호 비교
	if(!loginMember.getPassword().equals(password)) {//비밀번호가 틀린 경우
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khm&work=jm_update_confirm';");
		out.println("</script>");
		return;
	}
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JM 회원정보수정</title>

<link rel="stylesheet" type="text/css" href="kdy/css/joinC.css">

<style type="text/css">
.pagetitle1 {
	font-family: 'Noto Sans KR';
	font-size: 26px;
	font-weight: 500;
	color: #87a1c4;
	text-align: center;
	margin-top: 100px;
}

.new-privercy-contract textarea {
	height: 150px !Important;
}

.new-btn-area a {
	display: block;
	width: 234px;
	height: 64px;
	line-height: 66px;
	margin: 0 auto;
	font-size: 22px;
	font-weight: bold;
	color: #fff;
	background: none !Important;
	border: none !Important;
}

.MS_input_txt.w137 {
	min-width: 180px;
}

.xans-member-join h3 {
	float: left;
}

.xans-member-join .chkAdd {
	float: right;
	margin: 34px 0 0;
	color: #34a7b3;
	font-size: 12px;
}

.xans-member-join div.boardView {
	clear: both;
	margin-top: 18px;
}

.xans-member-join table.boardView {
	border-collapse: collapse;
	border: 1px solid #ddd;
}

.xans-member-join table.boardView input, .xans-member-join table.boardView textarea
	{
	border: 1px solid #bcbcbc;
	background: #fff;
	color: #202020;
	padding: 1px 0 2px 4px;
}

.xans-member-join table.boardView input {
	border: 1px solid #ddd;
	height: 29px;
	line-height: 29px;
	padding: 0 5px;
}

.xans-member-join table.boardView select {
	border: 1px solid #ddd;
	height: 31px;
	line-height: 31px;
	padding: 0 5px;
}

.xans-member-join table.boardView th {
	width: 148px;
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #e6e6e6;
	color: #555;
	font-weight: normal;
	background: #f7f7f7;
	font-size: 14px;
	font-weight: 600;
}

.xans-member-join table.boardView td {
	padding: 15px;
	border-bottom: 1px solid #e6e6e6;
	font-size: 14px;
	color: #8b8b8c;
}

.xans-member-join table.boardView td fieldset {
	width: 580px;
}

.xans-member-join table.boardView td.write {
	width: 100%;
}

.xans-member-join table.boardView td img {
	vertical-align: middle;
}

.xans-member-join table.boardView thead th {
	border-bottom: 1px solid #bfc5c5;
}

.xans-member-join table.boardView thead td {
	border-bottom: 1px solid #bfc5c5;
}

.xans-member-join table.boardView tfoot th {
	border-top: 1px solid #bfc5c5;
}

.xans-member-join table.boardView tfoot td {
	border-top: 1px solid #bfc5c5;
}

.xans-member-join table.boardView .first {
	border-top: 0;
	padding-top: 20px;
}

.xans-member-join .agree01 {
	width: 100%;
}

.xans-member-join .agree02 {
	width: 100%;
}

.xans-member-join .agreeWrap {
	content: "";
	display: block;
	clear: both;
	margin: 70px 0 0;
}

.xans-member-join .agreeArea {
	clear: both;
	padding: 20px;
	background: #f7f7f7;
	border: 1px solid #bfc5c5;
	border-top: 1px solid #333;
	font-size: 12px;
	line-height: 2em;
	color: #8f8f8f;
}

.xans-member-join .agreeArea .agreeInner {
	overflow: auto;
	height: 140px;
	padding: 20px 20px 37px;
	border: 1px solid #bcbcbc;
	background: #fff;
}

.xans-member-join .agreeArea .agreement {
	height: 500px;
}

.xans-member-join .agreeArea>p {
	font-size: 14px;
	font-weight: 600;
	color: #444;
	padding: 10px 0 0;
}

.xans-member-join .agreeArea p span {
	padding: 0 20px 0 0;
}

.xans-member-join #hint_answer {
	width: 500px;
}

.xans-member-join #postcode1, .xans-member-join #postcode2 {
	width: 40px;
	text-align: center;
	padding: 1px 0 2px 0;
}

.xans-member-join #addr1, .xans-member-join #addr2 {
	width: 500px;
	margin: 3px 0;
}

.xans-member-join #phone1, .xans-member-join #mobile1 {
	width: 60px;
	margin: 0 4px 0 0;
}

.xans-member-join #phone2, .xans-member-join #phone3, .xans-member-join #mobile2,
	.xans-member-join #mobile3 {
	width: 80px;
	margin: 0 4px;
}

.xans-member-join #email1, .xans-member-join #email2 {
	width: 150px;
	margin: 0 4px 0 0;
}

.xans-member-join #email2 {
	margin: 0 4px;
}

.xans-member-join #birth_year, .xans-member-join #marry_year,
	.xans-member-join #partner_year {
	width: 60px;
	margin: 0 4px 0 0;
}

.xans-member-join #birth_month, .xans-member-join #marry_month,
	.xans-member-join #partner_month, .xans-member-join #birth_day,
	.xans-member-join #marry_day, .xans-member-join #partner_day {
	width: 30px;
	margin: 0 4px 0 0;
}

.xans-member-join #job, .xans-member-join #job_class, .xans-member-join #school,
	.xans-member-join #region, .xans-member-join #internet,
	.xans-member-join #child, .xans-member-join #car, .xans-member-join #earning
	{
	width: 200px;
}

.xans-member-join #add1, .xans-member-join #add2, .xans-member-join #add3,
	.xans-member-join #add4, .xans-member-join #add5, .xans-member-join #add6,
	.xans-member-join #add7, .xans-member-join #add8, .xans-member-join #add9
	{
	width: 500px;
}

.xans-member-join .btnArea {
	clear: both;
	text-align: center;
	overflow: hidden;
	width: 100%;
	padding-top: 30px;
	margin: 20px 0 50px;
}

.xans-member-join .btnArea.miniType {
	margin: 10px 0 20px;
	padding: 0 15px;
}

.xans-member-join .btnArea img {
	padding: 0 1px 0 0;
	cursor: pointer;
}

.xans-member-join .btnArea p.btnRight {
	float: right;
}

.xans-member-join .btnArea p.btnRight img {
	float: left;
	padding: 0 0 0 1px;
}

#realNameAuth p span {
	display: inline-block;
	width: 80px;
}

#ipinWrap img {
	display: block;
}

.mem_title {
	padding: 70px 0 0;
	font-size: 19px;
	font-weight: 600;
	color: #333;
	padding-bottom: 10px;
	background: url(/design/vittz/img/mem_title_bg.gif) no-repeat left
		bottom
}

.mem_title2 {
	padding: 70px 0 0;
	font-size: 19px;
	font-weight: 600;
	color: #333;
	padding-bottom: 10px;
}

.error {
	color: red;
	position: relative;
	left: 10px;
	display: none;
}

.xans-member-join table.memcate {
	
}

.xans-member-join table.memcate th {
	
}

.xans-member-join table.memcate td {
	
}

/***기본CSS***/
.tb-l {
	text-align: left;
}

.tb-c {
	text-align: center;
}

.pl-30 {
	padding-left: 15px;
}

.pl-6 {
	padding-left: 6px;
}

#join h1.tit-join {
	margin-bottom: 30px;
	padding-bottom: 6px;
	border-bottom: 4px solid #3a4452;
	font-size: 16px;
	font-weight: bold;
}

#join h3.cont-tit {
	margin-top: 30px;
	margin-bottom: 5px;
	padding-left: 15px;
	color: #575757;
	font-weight: bold;
	background: url("/images/d3/modern_simple/bull_tit_h11.gif") no-repeat 0
		0;
}

#join .red {
	color: #ff3333
}

#join .font-n {
	font-weight: normal;
}

#join .w137 {
	width: 137px;
}

#join .w415 {
	width: 415px;
}

#join .ipin-confirm {
	height: 110px;
	padding: 15px 0;
	border: 3px solid #d4d4d4;
	text-align: center;
	background-color: #fdfdfd;
}

#join .ipin-confirm .chk-wrap {
	line-height: 20px;
	vertical-align: middle;
}

#join .ipin-confirm .chk-wrap i {
	display: inline-block;
	vertical-align: middle;
}

#join .ipin-confirm .chk-wrap label {
	vertical-align: middle;
	line-height: 1.25;
}

#join .ipin-confirm .chk-wrap .first {
	margin-right: 20px;
}

#join .ipin-confirm p {
	margin: 20px 0;
	line-height: 18px;
	font-size: 14px;
}

#join a.ipin-svc {
	font-size: 14px;
	font-weight: bold;
	color: #ff3333;
	text-decoration: underline;
	margin: 0 10px;
}

#join .btn-area {
	text-align: center;
	margin: 10px 0;
}

#join .btn-area a {
	font-size: 0;
}

#join .ftr-btn {
	margin-top: 55px;
}

#join .ipin-btn {
	margin-top: 35px;
}

/* 회원 정보입력 */
#join .join-info {
	margin-top: 40px;
	margin-bottom: 5px;
	padding-left: 15px;
	background: url("/images/d3/modern_simple/bull_terms_h14.gif") no-repeat
		0 0;
}

#join .tb-tit {
	padding: 15px 0 10px 25px;
	border-width: 1px 1px 2px 1px;
	border-color: #dedfde #dedfde #3a4452 #dedfde;
	border-style: solid;
	color: #575757;
	font-weight: bold;
	background: url("/images/d3/modern_simple/bull_tit_h11.gif") no-repeat
		10px 14px #f7f7f7;
}

h4.tit {
	margin-top: 50px;
	margin-bottom: 5px;
	padding-left: 5px;
	font-size: 19px !Important;
	font-weight: bold;
	color: #333;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<%-- JQUERY --%>

<script type="text/JavaScript"
	src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete : function(data) {
				jQuery("#postCd").val(data.zonecode);
				jQuery("#basAddr").val(data.address);
				jQuery("#detlAddr").focus();
				console.log($("#postCd").val());
			}
		}).open();
	}
</script>

</head>
<body>
	<div id="contentWrap">

		<div id="contents" class="container">

			<div>
				<map name="2018join">
					<area shape="rect" coords="13,66,426,157"
						href="https://goo.gl/PFZnMr">
					<area shape="rect" coords="437,68,852,162"
						href="https://goo.gl/fNcVV7">
					<area shape="rect" coords="856,64,1276,158"
						href="https://goo.gl/z9dq8y">
				</map>
			</div>


			<h2 class="pagetitle1">
				<span>회원정보수정</span> INFO UPDATE
			</h2>


			<form name="iddupop" method="post" action="/shop/iddup.html">
				<input name="id" type="hidden" value=""> <input name="mode"
					type="hidden" value="">
			</form>
			<form name="ipinInForm" method="post">
				<input type="hidden" name="IDPCODE" value=""> <input
					type="hidden" name="IDPURL" value=""> <input type="hidden"
					name="CPCODE" value=""> <input type="hidden"
					name="CPREQUESTNUM" value=""> <input type="hidden"
					name="RETURNURL" value=""> <input type="hidden"
					name="WEBPUBKEY" value=""> <input type="hidden"
					name="WEBSIGNATURE" value=""> <input type="hidden"
					name="FILLER01" value=""> <input type="hidden"
					name="FILLER02" value="JOIN">
			</form>
			<form name="ipinOutForm" method="post" action="/ssllogin/idinfo.html">
				<input type="hidden" name="popup" value=""> <input
					type="hidden" name="cur_page" value=""> <input
					type="hidden" name="type" value="ok"> <input type="hidden"
					name="ipintype" value=""> <input type="hidden"
					name="brandcode" value=""> <input type="hidden"
					name="first" value=""> <input type="hidden"
					name="data_third_party_agree" value=""> <input
					type="hidden" name="data_trust_agree" value=""> <input
					type="hidden" name="data_privacy_agree" value=""> <input
					type="hidden" name="realname"> <input type="hidden"
					name="encdata"> <input type="hidden" name="member_type"
					value="PERSON">
			</form>
			<form name="form1" method="post" id="modify_form"
				action="/shop/idinfo.html" enctype="multipart/form-data"
				autocomplete="off">
				<input type="hidden" name="resno" value=""> <input
					type="hidden" name="cur_page" value=""> <input
					type="hidden" name="brandcode" value=""> <input
					type="hidden" name="sslid" value="vittz"> <input
					type="hidden" name="sslip" value="www.vittz.co.kr"> <input
					type="hidden" name="haddress" id="haddress" value=""> <input
					type="hidden" name="msecure_key" value=""> <input
					type="hidden" name="loginkeyid"
					value="9f86981b1f70b176f519e5283a0cc656"> <input
					type="hidden" name="idcheck" value=""> <input type="hidden"
					name="emailcheck"> <input type="hidden"
					name="junk_member_ok" value=""> <input type="hidden"
					name="hiddenres" value="d41d8cd98f00b204e9800998ecf8427e">
				<input type="hidden" name="mem_type" value="PERSON"> <input
					type="hidden" name="member_join_type" value="NEW"> <input
					type="hidden" name="member_join_minor" value="N"> <input
					type="hidden" name="use_company_num" value="Y"> <input
					type="hidden" name="company_num_modify" value="N"> <input
					type="hidden" name="admin_type" value="N"> <input
					type="hidden" name="old_company_num1" value=""> <input
					type="hidden" name="old_company_num2" value=""> <input
					type="hidden" name="old_company_num3" value=""> <input
					type="hidden" name="old_email" id="old_email"
					value="ysmb13579@naver.com"> <input type="hidden"
					name="etc_phone" id="etc_phone" value="01097416585"> <input
					type="hidden" name="simple_login" value=""> <input
					type="hidden" name="app_os" value=""> <input type="hidden"
					name="type" value="upd"> <input type="hidden" name="reurl"
					value="">
			</form>


			<%-- 회원가입 폼 설정 --%>
			<form id="modify" name="modifyForm"
				action="<%=request.getContextPath()%>/index.jsp?workgroup=khm&work=jm_updateInfo_action"
				method="post">
				<input type="hidden" name="idCheckResult" id="idCheckResult"
					value="0">
				<div class="xans-element- xans-member xans-member-join"
					align="center">
					<br>
					<div class="boardView">
						<table summary="회원정보 중 기본정보 입력란입니다." class="boardView joinForm">
							<tbody>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 이름
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="text" name="userNm" id="userNm"
												value="<%=loginMember.getUserNm()%>"
												class="MS_input_txt w137" readonly="readonly">
										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 아이디
										</div>
									</th>
									<td><div class="tb-l pl-6"><%=loginMember.getUserId()%>
											<input type="hidden" name="userId" id="userId" value="<%=loginMember.getUserId()%>">
										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 비밀번호
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="password" name="password" id="password"
												class="MS_input_txt w137" value="" size="15" maxlength="20"> <span
												class="idpw-info"> (영문자/숫자,4~12자) </span>
												<div id="passwdMsg" class="error">비밀번호를 입력해 주세요.</div>
												<div id="passwdRegMsg" class="error">비밀번호를 형식에 맞게 입력해 주세요.</div>
										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 비밀번호 확인
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="password" name="repassword" id="repassword"
												class="MS_input_txt w137" value="" size="15" maxlength="20">
											<div id="repasswdMsg" class="error">비밀번호 확인을 입력해 주세요.</div>
											<div id="repasswdMatchMsg" class="error">비밀번호와 비밀번호 확인이
												서로 맞지 않습니다.</div>
										</div></td>
								</tr>

								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 우편번호
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="text" name="postCd"
												value="<%=loginMember.getPostCd()%>"
												id="postCd" class="MS_input_txt" readonly="readonly">
											<input type="button" onClick="openDaumZipAddress();"
												value="우편번호검색" />
											<div id="postCdMsg" class="error">우편번호를 확인해 주세요.</div>
										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 집주소
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="text" name="basAddr"
												value="<%=loginMember.getBasAddr()%>"
												id="basAddr" class="MS_input_txt w415" size="40"
												maxlength="100" readonly="readonly">
											<div id="basAddrMsg" class="error">집주소를 입력해 주세요.</div>
										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 상세주소
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="text" name="detlAddr"
												value="<%=loginMember.getDetlAddr()%>" 
												id="detlAddr" class="MS_input_txt w415" size="40"
												maxlength="100">
												<div id="detlAddrMsg" class="error">상세주소를 입력해 주세요.</div>
										</div></td>
								</tr>
								<tr>
									<th>
									<% String[] mobile=loginMember.getContAddr().split("-"); %>
										<div class="tb-l pl-30">
											<span class="red">*</span> 휴대폰
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<select name="etcphone1" id="etcphone1"  class="MS_select MS_tel">
												<option value="">선택</option>
												<option value="010" selected="selected">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select> - <input type="text" name="etcphone2" 
												id="etcphone2" class="MS_input_tel" value="<%=mobile[1] %>" size="4"
												maxlength="4"> - <input type="text" name="etcphone3"
												 id="etcphone3" class="MS_input_tel"
												value="<%=mobile[2] %>" size="4" maxlength="4" minlength="4">
												<div id="mobileMsg" class="error">전화번호를 입력해 주세요.</div>
												<div id="mobileRegMsg" class="error">전화번호는 3~4 자리의 숫자로만 입력해 주세요.</div>
										</div></td>
								</tr>

								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 이메일
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="text" name="email" id="email"
												class="MS_input_txt"
												value="<%=loginMember.getEmailAddr()%>"
												onchange="this.form.emailcheck.value=''" />
											<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
											<div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
										</div></td>
								</tr>

							</tbody>
						</table>
					</div>

					<div class="agreeWrap"></div>

					<div class="btnArea">
						<button type="button" style="border:none;";>
							<a href="<%=request.getContextPath() %>/index.jsp?workgroup=khm&work=jm_myPage">
							 <img src="khm/img/btn_cancel.png" alt="취소" width="130px" ></a>
						</button>
						<button type="submit" style="border:none;";>
							<img src="khm/img/btn_modify.png" alt="회원정보수정" width="130px" 
								class="smp-btn-reg">
						</button>
						<button type="button" style="border:none;";>
							<a href="<%=request.getContextPath() %>/index.jsp?workgroup=khm&work=jm_deleteInfo"> <img src="khm/img/btn_delete.png" alt="회원탈퇴"
								width="130px" class="smp-btn-reg"></a>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
	$("#modify").submit(function() {
		var submitResult = true;
			$(".error").css("display", "none");
	
			var passwdReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,12}$/g;
			if ($("#password").val() == "") {
				$("#passwdMsg").css("display", "block");
				submitResult = false;
			} else if (!passwdReg.test($("#password").val())) {
				$("#passwdRegMsg").css("display", "block");
				submitResult = false;
			}
	
			if ($("#repassword").val() == "") {
				$("#repasswdMsg").css("display", "block");
				submitResult = false;
			} else if ($("#password").val() != $("#repassword").val()) {
				$("#repasswdMatchMsg").css("display", "block");
				submitResult = false;
			}
	
			if ($("#hname").val() == "") {
				$("#nameMsg").css("display", "block");
				submitResult = false;
			}
	
			var emailReg = /^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
			if ($("#email").val() == "") {
				$("#emailMsg").css("display", "block");
				submitResult = false;
			} else if (!emailReg.test($("#email").val())) {
				$("#emailRegMsg").css("display", "block");
				submitResult = false;
			}
	
			var etcphone2Reg = /\d{4}/;
			var etcphone3Reg = /\d{4}/;
			if ($("#etcphone2").val() == "" || $("#etcphone3").val() == "") {
				$("#mobileMsg").css("display", "block");
				submitResult = false;
			} else if (!etcphone2Reg.test($("#etcphone2").val()) || !etcphone3Reg.test($("#etcphone3").val())) {
				$("#mobileRegMsg").css("display", "block");
				submitResult = false;
			}
	
			if ($("#postCd").val() == "") {
				$("#postCdMsg").css("display", "block");
				submitResult = false;
			}
	
			if ($("#basAddr").val() == "") {
				$("#basAddrMsg").css("display", "block");
				submitResult = false;
			}
	
			if ($("#detlAddr").val() == "") {
				$("#detlAddrMsg").css("display", "block");
				submitResult = false;
			}
			
	
			return submitResult;
	});
	</script>
</body>
</html>