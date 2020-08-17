<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%
	String message=(String)session.getAttribute("message");
	if(message==null) {
		message="";
	} else {
		session.removeAttribute("message");
	}
	
	String userId=(String)session.getAttribute("userId");
	if(userId==null) {
		userId="";
	} else {
		session.removeAttribute("userId");
	}
%> 

<%-- 아이디 찾기 페이지 --%>

<title>아이디 찾기</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%-- 아이디, 비번 찾기 CSS --%>
<style type="text/css">
.pagetitle1 {
	font-family: 'Noto Sans KR';
	font-size: 26px;
	font-weight: 500;
	color: #555;
	text-align: center;
	padding: 60px 0 30px;
}

.pagetitle1 span {
	font-size: 24px;
	color: #87a1c4;
}

#wrap {
	max-width: 1920px;
	min-width: 1280px;
	width: 100%;
	margin: 0 auto;
	font-family: 'Noto Sans KR', sans-serif;
}

.displaynone {
	display: none !important;
}

html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	code, form, fieldset, legend, input, textarea, p, blockquote, th, td,
	img {
	margin: 0;
	padding: 0;
}

html {
	width: 100%;
	height: 100%;
}

body, code {
	font: 0.75em "돋움", Dotum, AppleGothic, sans-serif;
	color: #333;
	background: #fff;
}

li {
	list-style: none;
}

img, fieldset {
	border: none;
	vertical-align: top;
}

input, select, textarea {
	font-size: 100%;
	color: #767676;
	vertical-align: middle;
}

hr.layout {
	display: none;
}

a, a:link, a:visited {
	text-decoration: none;
	color: #858585;
}

a:hover {
	color: #858585;
}

a:active {
	text-decoration: none;
}

table {
	border-spacing: 0;
	border: 0;
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 0;
	vertical-align: top;
}

legend {
	height: 0;
	width: 0;
	display: block;
	text-indent: -9999em;
}
.pagetitle1 {
	font-family:'Noto Sans KR';
	font-size:26px;
	font-weight:600;
	color:#555;
	text-align:center;
	padding:60px 0 30px;
}
.pagetitle1 span {
	font-size:24px;
	color:#87a1c4;
}
.login_tit {
	text-align:center;
	font-size:27px;
	font-weight:500;
	color:#1e1e1e;
	margin-bottom:20px;
	font-family: 'Noto Sans KR',sans-serif;
}
.login_tit:after {
	display:block;
	content:"";
	width:37px;
	height:1px;
	background:#aaa;
	margin:10px auto;
}

.member-findid {
	background:#f5f5f5;
	border:1px solid #d2d2cf;
	padding:60px 0 70px;
	width:1025px;
	margin:0 auto 100px;
	background:#fefefe;
	border:7px solid #f2f2f2;
	padding:54px 121px;
}
.member-findid .inner {
	width:440px;
	margin:0 auto;
}
.member-findid .inner input {
	font-size:12px;
}
.member-findid .inner .ipt {
	overflow:hidden;
}
.member-findid .inner .ipt label {
	float:left;
	width:55px;
	margin-top:15px;
	font-size:14px;
	color:#333;
}
.member-findid .inner .ipt input {
	display:block;
	float:right;
	border:1px solid #ddd;
	width:369px;
	height:44px;
	padding:0 5px;
	margin:3px 0;
}
.member-findid .inner p.check {
	width:440px;
}
.member-findid .inner p.check img {
	display:block;
	padding:6px 0 4px;
}
.member-findid .inner p.check span {
	display:block;
	padding:2px 0 0;
	color:#8f8f91;
}
.member-findid .inner p.check span.type {
	padding:30px 0 15px;
}
.member-findid .inner p.check span label {
	padding:0 0 0 0;
}
.member-findid .inner .findType {
	padding:0 0 8px;
}
.member-findid .inner .findType span {
	display:block;
	padding:3px 0 0;
	font-size:12px;
	color:#000;
}
.member-findid .inner .findType span.question {
	margin:2px 0 0;
	padding:2px 5px;
	width:168px;
	background:#34a7b3;
	color:#fff;
	font-size:11px;
}
.member-findid .inner .findType .question input {
	border:1px solid #34a7b3;
	background:#34a7b3;
	color:#fff;
}
.member-findid .inner .lostInput {
	border:1px solid #bcbcbc;
	width:166px;
	height:14px;
	padding:2px 5px;
}
.member-findid .inner #ssn1 {
	width:70px;
}
.member-findid .inner #ssn2 {
	width:70px;
}
.member-findid .inner .btn {
	margin-left:60px;
}
.find_idpw { font-size:12px; color:#777; text-align: left; font-family:'Dotum'; }
.find_idpw img { border: 0 none; vertical-align: middle; }
.find_idpw a,
.find_idpw a:hover,
.find_idpw select,
.find_idpw input { vertical-align: middle; text-align: left; font-family:'Dotum'; }
.find_idpw .input-radio { width:12px; height:12px; margin:-2px 0 0; padding:0; }
.find_idpw .tit { margin:0; padding-bottom: 6px; border-bottom: 4px solid #3b4453; font-size: 16px; font-weight: bold; line-height:20px; }
.find_idpw .sub-tit { margin:10px 0 40px; font-family: 'Noto Sans KR',sans-serif;}
.find_idpw .radio-wrap { margin:0 0 10px; }
.find_idpw .radio-wrap label { margin-right:30px; color:#575757; font-weight:bold; }
.find_idpw .find-info table {
    width: 100%;
    border-spacing: 0;
    border-collapse: collapse;
    font-size: 12px;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    font-family: 'Noto Sans KR',sans-serif;
}
.find_idpw .find-info table caption { display:none; }
.find_idpw .find-info table th { font-weight: bold; font-size:12px; color:#767678; background:#f9f9fb; text-align:center; }
.find_idpw .find-info table th div,
.find_idpw .find-info table td div { padding:7px 0; }
.find_idpw .find-info table td div { padding-left: 6px; }
.find_idpw .MS_input_txt { width: 150px; height: 20px; line-height:22px; border: 1px solid #e3e3eb; }
.find_idpw tr.user-name th,
.find_idpw tr.user-name td { border-bottom: 1px solid #ececee; }
.find_idpw .btn-area { padding:20px 0 50px; text-align: center; }
.find_idpw .btn-area a {
    font-size: 14px;
    background: #110252;
    padding: 10px 40px;
    color: #fff;
    font-family: 'Noto Sans KR',sans-serif;
margin:0 5px;
}

.find_idpw .btn-area a {
    font-size: 14px;
    background: #110252;
    padding: 10px 40px;
    color: #fff;
    font-family: 'Noto Sans KR',sans-serif;
    margin: 0 5px;
}

</style>

	<div id="contentWrapper">
		<div id="contentWrap">
			<div id="contents">
				<h2 class="pagetitle1">
					<span>아이디/비밀번호 찾기</span> ID/PASSWORD SEARCH
				</h2>

				<form id="form1" name="form1" method="post" action="<%=request.getContextPath() %>/index.jsp?workgroup=kdy/login&work=jm_findId_action"  method="post">
					<input type="hidden" name="focus_ok"> 
					<input type="hidden"	name="msecure_key"> 
					<input type="hidden" name="mail">
					<input type="hidden" name="authtext" value=""> 
					<input type="hidden" name="authid"> 
					<input type="hidden"	name="find_type" value="find_pw" />
					
			
					<div class="member-findid ">
						<div class="inner">
							
							<h3 class="login_tit">아이디 찾기</h3>
							<div id="find_id" class="find_idpw">
								<p class="sub-tit">회원가입 시, 입력하신 이름 + 이메일로 아이디를 확인하실 수 있습니다.</p>
								
								<div class="find-info">
									<table>
											<th><div>이&nbsp;&nbsp;름</div></th>
											<td><div>
													<input type="text" id="name" name="name"
														class="MS_input_txt" value="" maxlength="30" title="이름"
														placeholder="">
												</div></td>
										<tr/>
										<tr height="38" id="find_id_email_wrap">
											<th><div>이메일</div></th>
											<td><div>
													<input type="text" id="find_id_email" name="find_id_email"
														class="MS_input_txt" value="" maxlength="80"
														title="이메일 주소" placeholder="">
												  </div>
											</td>
										</tr>
									</table>
									<br>
								    <div class="btn-area"> 
								    <a class="info-confirm" href="javascript:find_type('find_id');"> 아이디 찾기 </a>
								    <a class="info-confirm" href="index.jsp?workgroup=kdy/login&work=jm_login"> 로그인 </a> 
								    </div>
								</div>
							</div>
							<!--/#find_id/-->


							<br> 
							<br>


							<h3 class="login_tit">비밀번호 찾기</h3>

							<div id="find_pw" class="find_idpw">
								<p class="sub-tit">
									가입하신 아이디 + 이메일을 입력, 본인인증을 통해 이메일로 임시
									비밀번호를 보내드립니다. 확인 후 로그인하셔서 반드시 비밀번호를 변경하시기 바랍니다.
								</p>
								<div id="find_pw_input_wrap">
									<div class="find-info">
										<table border="0" summary="이름, 이메일">
											<caption>임시 비밀번호 발급 폼</caption>
											 
											<tbody>
												<tr class="user-name">
													<th scope="row"><div>아이디</div></th>
													<td><div>
															<input type="text" name="user_id" id="user_id" value="<% %>"
																class="MS_input_txt" size="10" maxlength="20" />
														</div></td>
												</tr>
												<tr id="find_pw_email_wrap">
													<th scope="row"><div>이메일</div></th>
													<td><div>
															<input type="text" id="email" name="email"
																class="MS_input_txt" value="" maxlength="80"
																title="이메일 주소" placeholder=""
																onfocus="document.form1.focus_ok.value='yes'">
														</div></td>
												</tr>
												
											</tbody>
										</table>
										<br>
										<div class="btn-area"> 
										<a href="javascript:find_type('find_pw');"> 임시 비밀번호 발급 </a> 
										<a href="index.jsp?workgroup=kdy/login&work=jm_login"> 로그인 </a> 
										</div>
									</div>
								</div>
							</div>
							<!--/#find_pw/-->
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	$("#name").focus();
	
	//아이디 찾기
	$("#findId").submit(function() {
	
	    var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;  //Email 유효성 검사 정규식
	    	    
		if ($("#findId").val()=="") {
			alert("이름을 입력해 주세요.");
			$("#findId").focus();
			return false ;
		}else if($("#email").val()=="") {
			alert("이메일을 입력해 주세요.");
			$("#email").focus();
			return false ;
		}else if(checkEmail.test($("#email").val())!=true) {
			alert("올바른 형식의 이메일로 입력해 주세요.");
			$("#email").focus();
			return false ;
		}
		});
	
	
	function find_type(type) {
		if (document.form1.find_type) {
		    document.form1.find_type.value = type;
		}
		send();
		}
	
	function send() {
		var find_type = '';

		if (document.form1.find_type && document.form1.find_type.value.length > 0) {
		    find_type = document.form1.find_type.value;
		}

	 if (find_type == 'find_pw') {
		    var find_pw_type = 'email';
		    if (document.form1.find_pw_type) {
		        for (var i = 0; i < document.form1.find_pw_type.length; i++) {
		            if (document.form1.find_pw_type[i].checked) {
		                find_pw_type = document.form1.find_pw_type[i].value;
		            }
		        }
		    }
		 
		    if (document.form1.user_id.value.length == 0) {
		        alert('아이디를 입력해주세요.');
		        document.form1.user_id.focus();
		        return;
		    }

		    if (find_pw_type == 'email') {
		       
		        if (document.form1.email.value.length == 0) {
		            alert('이메일을 입력해주세요.');
		            document.form1.email.focus();
		            return;
		        }
		    } 
		} else if (find_type == 'find_id') {
		    var find_id_type = 'email';
		    if (document.form1.find_id_type) {
		        for (var i = 0; i < document.form1.find_id_type.length; i++) {
		            if (document.form1.find_id_type[i].checked) {
		                find_id_type = document.form1.find_id_type[i].value;
		            }
		        }
		    }
		    if (document.form1.name.value.length == 0) {
		        alert("이름을 입력해주세요.");
		        alert(1);
		        document.form1.name.focus();
		        return;
		    }

		    if (find_id_type == 'email') {
		
		        if (document.form1.find_id_email.value.length == 0) {
		            alert('이메일을 입력해주세요.');
		            document.form1.find_id_email.focus();
		            return;
		        }
		    } 
		} else {
		    if (document.form1.name.value.length == 0) {
		        alert("이름을 입력해주세요.");
		        document.form1.name.focus();
		        return;
		    }
		
		    if (document.form1.email.value.length == 0) {
		        alert('이메일을 입력해주세요.');
		        document.form1.email.focus();
		        return;
		    }
		}

	 	$("#form1").submit();	 
	}
</script>

