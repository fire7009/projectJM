<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 회원가입 페이지 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" type="text/css" href="../css/joinC.css">
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
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>   <%-- DAUM API --%>

   <script type="text/javascript">
      function openDaumZipAddress() {
         new daum.Postcode({
            oncomplete:function(data) {
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


	<h2 class="pagetitle1">
			<span>회원가입</span> MEMBER JOIN
	</h2>
	
	<%-- 주소/ 우편번호 API --%>
	<form name="iddupop" method="post" action="/shop/iddup.html">
		<input name="id" type="hidden" value="" /> <input name="mode"
			type="hidden" value="" />
	</form>
	<form name="ipinInForm" method="post">
		<input type="hidden" name="IDPCODE" value="" /> <input type="hidden"
			name="IDPURL" value="" /> <input type="hidden" name="CPCODE"
			value="" /> <input type="hidden" name="CPREQUESTNUM" value="" /> <input
			type="hidden" name="RETURNURL" value="" /> <input type="hidden"
			name="WEBPUBKEY" value="" /> <input type="hidden"
			name="WEBSIGNATURE" value="" /> <input type="hidden" name="FILLER01"
			value="" /> <input type="hidden" name="FILLER02" value="JOIN" />
	</form>
	<form name="ipinOutForm" method="post" action="/ssllogin/idinfo.html">
		<input type="hidden" name="popup" value="" /> <input type="hidden"
			name="cur_page" value="" /> <input type="hidden" name="type"
			value="ok" /> <input type="hidden" name="ipintype" value="" /> <input
			type="hidden" name="brandcode" value=""> <input type="hidden"
			name="first" value=""> <input type="hidden"
			name="data_third_party_agree" value="" /> <input type="hidden"
			name="data_trust_agree" value="" /> <input type="hidden"
			name="data_privacy_agree" value="" /> <input type="hidden"
			name="realname" /> <input type="hidden" name="encdata" /> <input
			type="hidden" name="member_type" value="PERSON" />
	</form>
	
<%-- 회원가입 폼 설정 --%>
<form id="join" name="joinForm" action="<%=request.getContextPath() %>/index.jsp?workgroup=kdy/join&work=jm_join_action" method="post">
	<input type="hidden" name="idCheckResult"  id="idCheckResult" value="0" > 
		                                            <%-- jm_login_action 으로 넘어가는 경로 설정 다시해야함!!!--%>
		
<%-- 테이블 테두리 --%>
<div class="xans-member-join" align="center">

<div class="boardView"></div>

<br> <br>
<div class="boardView">
	<table summary="회원정보 중 기본정보 입력란입니다." class="boardView joinForm">
		<tr>
			<th>
				<div class="tb-l pl-30" id="">
					<span class="red">*</span> 이름
				</div>
			</th>
			<td>
				<div class="tb-l pl-6">
					<input type="text" name="userNm" id="hname" value="" class="MS_input_txt w137" size="15" maxlength="30" />
					<div id="nameMsg" class="error">이름을 입력해 주세요.</div>
				</div>
				
			</td>
		</tr>
		<tr>
			<th>
				<div class="tb-l pl-30">
					<span class="red">*</span> 아이디
				</div>
			</th>
			<td>
				<div class="tb-l pl-6"  >
					<input type="text" name="userId"  id="id"  value=""  class="MS_input_txt w137" size="10" maxlength="20" />
					<span><a style="font-size: 0;">
					<img 	alt="중복확인" src="../img/btn_memJoin3.gif" height="30px" id="idCheck" /></a>
					</span>	(영문소문자/숫자,4~10자) 
					</div>
					
				</div>
				<div id="idMsg" class="error">아이디를 입력해 주세요.</div>
					<div id="idRegMsg" class="error">아이디는 영문자로 시작되는 영문자,숫자,_의 4~10범위의 문자로만 작성 가능합니다.</div>
					<div id="idCheckMsg" class="error">아이디 중복 검사를 반드시 실행해 주세요.</div>
			</td>
		</tr>
		<tr>
			<th>
				<div class="tb-l pl-30">
					<span class="red">*</span> 비밀번호
				</div>
			</th>
			<td><div class="tb-l pl-6">
					<input type="password" name="password" id="password1"
						class="MS_input_txt w137" value="" size="15" maxlength="20" /> 
					<span class="idpw-info"> (영문자/숫자,4~12자) </span>
	<div id="passwdMsg" class="error">비밀번호를 입력해 주세요.</div>
	<div id="passwdRegMsg" class="error">비밀번호는 영문자,숫자,특수문자가 반드시 하나이상 포함된 4~12 범위의 문자로만 작성 가능합니다.</div>
						
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
							class="MS_input_txt w137" value="" size="15" maxlength="20" />
							<div id="repasswdMsg" class="error">비밀번호 확인을 입력해 주세요.</div>
	<div id="repasswdMatchMsg" class="error">비밀번호와 비밀번호 확인이 서로 맞지 않습니다.</div>
					</div></td>
			</tr>
			
		      <tr>
                         <th>
                            <div class="tb-l pl-30">
                               <span class="red">*</span> 우편번호
                            </div>
                         </th>
                         <td><div class="tb-l pl-6">
                               <input type="text" name="postCd" value=""  id="postCd"
                                  class="MS_input_txt"  maxlength="5" readonly="readonly"> 
                                <input type="button" onClick="openDaumZipAddress();" value = "우편번호검색" />
                            	<div id="postCdMsg" class="error">우편번호를 입력해 주세요.</div>
                            </div></td>
                      </tr>
		                     <tr>
                         <th>
                            <div class="tb-l pl-30">
                               <span class="red">*</span> 집주소
                            </div>
                         </th>
                         <td><div class="tb-l pl-6">
                               <input type="text" name="basAddr" value="" 
                                  id="basAddr" class="MS_input_txt w415" size="40"
                                  maxlength="100" readonly="readonly">
                                  <div id="basAddrMsg" class="error">기본주소를 입력해 주세요.</div>
                            </div></td>
                      </tr>
                      <tr>
                         <th>
                            <div class="tb-l pl-30">
                               <span class="red">*</span> 상세주소
                            </div>
                         </th>
                         <td><div class="tb-l pl-6">
                               <input type="text" name="detlAddr" value=""  id="detlAddr" class="MS_input_txt w415" 
                               size="40"  maxlength="100">
                            <div id="detlAddrMsg" class="error">상세주소를 입력해 주세요.</div>
                            </div></td>
                      </tr>
			<tr>
				<th>
					<div class="tb-l pl-30">
						<span class="red">*</span> 휴대폰
					</div>
				</th>
				<td><div class="tb-l pl-6">
						<input type="hidden" name="contAddr"  value="" />
						<select name="etcphone1" id="etcphone1" 
							class="MS_select MS_tel">
							<option value=''>선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select> - 
						<input type="text" name='etcphone2'  	id="etcphone2" class="MS_input_tel" value="" size="4"
							maxlength="4" /> - 
						<input type="text" name="etcphone3"   id="etcphone3" class="MS_input_tel" value=""
							size="4" maxlength="4" minlength=4 />
					<div id="mobileMsg" class="error">전화번호를 입력해 입력해 주세요.</div>
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
							<input type="text" name="email" id="email" class="MS_input_txt"
							value="" size="40" maxlength="25" />
								<div id="emailMsg" class="error">이메일을 입력해 주세요.</div>
								<div id="emailRegMsg" class="error">입력한 이메일이 형식에 맞지 않습니다.</div>
					</div></td>
			</tr>
		</table>
	</div>
	<br> <br>
	
	<%-- 버튼 / 회원가입, 다시입력, 취소 --%>
	<div id="fs">
		<button type="submit" style="border-left-width: 0px;border-bottom-width: 0px;border-right-width: 0px;border-top-width: 0px;">
		<img src="../img/joinBtn.png" alt="회원가입" width="150px" ></button>

		<a	 href="<%=request.getContextPath() %>/index.jsp " class="cancelBtn"> 
			<img	src="../img/CCBtn.png" alt="취소" width="150px" /></a>
	</div>
</form>

<script type="text/javascript">

$("#hname").focus();

$("#join").submit(function() { 
	var submitResult=true;
	
	$(".error").css("display","none");

	var idReg=/^[a-zA-Z]\w{4,10}$/g;
	if($("#id").val()=="") {
		$("#idMsg").css("display","block");
		submitResult=false;
	} else if(!idReg.test($("#id").val())) {
		$("#idRegMsg").css("display","block");
		submitResult=false;
	} else if($("#idCheckResult").val()=="0") {
		$("#idCheckMsg").css("display","block");
		submitResult=false;
	}
		
	var passwdReg=/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*_-]).{4,12}$/g;
	if($("#password").val()=="") {
		$("#passwdMsg").css("display","block");
		submitResult=false;
	} else if(!passwdReg.test($("#password").val())) {
		$("#passwdRegMsg").css("display","block");
		submitResult=false;
	} 
	
	if($("#password1").val()=="") {
		$("#repasswdMsg").css("display","block");
		submitResult=false;
	} else if($("#password").val()!=$("#password1").val()) {
		$("#repasswdMatchMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#hname").val()=="") {
		$("#nameMsg").css("display","block");
		submitResult=false;
	}
	
	var emailReg=/^([a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+(\.[-a-zA-Z0-9]+)+)*$/g;
	if($("#email").val()=="") {
		$("#emailMsg").css("display","block");
		submitResult=false;
	} else if(!emailReg.test($("#email").val())) {
		$("#emailRegMsg").css("display","block");
		submitResult=false;
	}

	var etcphone1Reg=/\d{3}/;
	var etcphone3Reg=/\d{4,4}/;
	if($("#etcphone1").val()=="" || $("#etcphone3").val()=="") {
		$("#mobileMsg").css("display","block");
		submitResult=false;
	} else if(!mobile2Reg.test($("#etcphone1").val()) || !mobile3Reg.test($("#etcphone3").val())) {
		$("#mobileRegMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#postCd").val()=="") {
		$("#postCdMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#basAddr").val()=="") {
		$("#basAddrMsg").css("display","block");
		submitResult=false;
	}
	
	if($("#detlAddr").val()=="") {
		$("#detlAddrMsg").css("display","block");
		submitResult=false;
	}
	
	return submitResult;
});

$("#idCheck").click(function() {
	$("#idMsg").css("display","none");
	$("#idRegMsg").css("display","none");
	
	var idReg=/^[a-zA-Z]\w{4,10}$/g;
	if($("#id").val()=="") {
		$("#idMsg").css("display","block");
		return;
	} else if(!idReg.test($("#id").val())) {
		$("#idRegMsg").css("display","block");
		return;
	}
	
	window.open("<%=request.getContextPath()%>/kdy/login/id_check.jsp?id="
		+$("#id").val(),"idcheck","width=450,height=100,left=450,top=250");
});

$("#id").keyup(function() {
	if($("#idCheckResult").val()=="1") {
		$("#idCheckResult").val("0");
	}
});

</script>
</body>
</html>
