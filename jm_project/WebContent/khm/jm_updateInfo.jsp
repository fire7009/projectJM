<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@include file="/kdy/security/login_check.jspf" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JM 회원정보수정</title>

<link rel="stylesheet" type="text/css" href="../kdy/css/joinC.css">
<style type="text/css">
.pagetitle1 {
	font-family: 'Noto Sans KR';
	font-size: 26px;
	font-weight: 500;
	color: #555;
	text-align: center;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>  <%-- JQUERY --%>

<script type="text/JavaScript" src="http://code.jquery.com/jquery-1.7.min.js"></script>
	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					jQuery("#hpost").val(data.zonecode);
					jQuery("#haddress1").val(data.address);
					jQuery("#haddress2").focus();
					console.log(data);
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
			<span>회원가입</span> MEMBER JOIN
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
			<form name="form1" method="post" id="join_form"
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

				<div class="xans-element- xans-member xans-member-join" align="center">

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
											<input type="text" name="user_nm" id="user_nm" value="이름"
												class="MS_input_txt w137"
												disabled="">
										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 아이디
										</div>
									</th>
									<td><div class="tb-l pl-6">
											아이디<input type="hidden" name="id" id="id"
												value="아이디">

										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 비밀번호
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="password" name="password1" id="password1"
												class="MS_input_txt w137" value="" size="15" maxlength="20"
												onkeyup="check_pwd_length(this, 'password');"> <span
												class="idpw-info"> (영문자/숫자,4~12자) </span>
										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 비밀번호 확인
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="password" name="password2" id="password2"
												class="MS_input_txt w137" value="" size="15" maxlength="20"
												onkeyup="check_pwd_length(this, 'repassword');">
										</div></td>
								</tr>

									<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 우편번호
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="text" name="hpost" value="" form="join_form" id="hpost"
												class="MS_input_txt"
												readonly="readonly"> 
												<input type="button" onClick="openDaumZipAddress();" value = "우편번호검색" />
										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 집주소
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="text" name="haddress1" value="" form="join_form"
												id="haddress1" class="MS_input_txt w415" size="40"
												maxlength="100" readonly="readonly">
										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 상세주소
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="text" name="haddress2" value="" form="join_form"
												id="haddress2" class="MS_input_txt w415" size="40"
												maxlength="100">
										</div></td>
								</tr>
								<tr>
									<th>
										<div class="tb-l pl-30">
											<span class="red">*</span> 휴대폰
										</div>
									</th>
									<td><div class="tb-l pl-6">
											<input type="hidden" name="etcphone" form="join_form"
												value="01097416585"> <select name="etcphone1"
												id="etcphone1" form="join_form" class="MS_select MS_tel">
												<option value="">선택</option>
												<option value="010" selected="selected">010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select> - <input type="text" name="etcphone2" form="join_form"
												id="etcphone2" class="MS_input_tel" value="9741" size="4"
												maxlength="4"> - <input type="text" name="etcphone3"
												form="join_form" id="etcphone3" class="MS_input_tel"
												value="6585" size="4" maxlength="4" minlength="4">
										</div></td>
								</tr>

								<tr>
            <th>
               <div class="tb-l pl-30">
                  <span class="red">*</span> 이메일
               </div>
            </th>
            <td><div class="tb-l pl-6">
                     <input type="text" name="email3" id="email3" class="MS_input_txt"
                     value="" onchange="this.form.emailcheck.value=''" />
                        <div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
                        <div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
               </div></td>
         </tr>

							</tbody>
						</table>
					</div>

					<div class="agreeWrap"></div>

					<div class="btnArea">
						<a href="javascript:history.back()"><img
							src="btn_modifyCancel.gif" alt="회원가입 취소"></a> <a
							href="javascript:send();"><img src="btn_modifyOk.gif"
							alt="회원정보수정" class="smp-btn-reg"></a> <a
							href="https://www.vittz.co.kr/shop/mypage.html?mypage_type=myexituser"><img
							src="btn_modifyBye.gif" alt="회원탈퇴" class="smp-btn-reg"></a>
					</div>
					</ul>
				</div>
			</form>
		</div>
	</div>
	<%@include file="/jm_Footer.jsp" %>
</body>
</html>