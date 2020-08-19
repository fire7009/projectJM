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

<%-- ��й�ȣ ã�� ������ --%>

<title>��й�ȣ ã��</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%-- ���̵�, ��� ã�� CSS --%>
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
	font: 0.75em "����", Dotum, AppleGothic, sans-serif;
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

.member-findpw {
	background:#f5f5f5;
	border:1px solid #d2d2cf;
	padding:60px 0 70px;
	width:800px;
	margin : 0 auto;
	background:#fefefe;
	border:7px solid #f2f2f2;
	padding:54px 121px;
}
.member-findpw .inner {
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

</style>

	<div id="contentWrapper">
		<div id="contentWrap">
			<div id="contents">
				<h2 class="pagetitle1">
					<span>��й�ȣ ã��</span> PASSWORD SEARCH
				</h2>

				<form id=findPw name="findPw" method="post" action="<%=request.getContextPath() %>/index.jsp?workgroup=kdy/login&work=jm_findPw_action"  method="post">
					<input type="hidden" name="focus_ok"> 
					<input type="hidden"	name="msecure_key"> 
					<input type="hidden" name="mail">
					<input type="hidden" name="authtext" value=""> 
					<input type="hidden" name="authid"> 
					<input type="hidden"	name="find_type" value="find_pw" />
			
					<div class="member-findpw " style="margin-bottom: 100px; ">
						<div class="inner">
							
							<h3 class="login_tit">��й�ȣ ã��</h3>

							<div id="find_pw" class="find_idpw">
							
								<p class="sub-tit">
									�����Ͻ� ���̵�+�̸����� �Է��ϸ� �ӽ� ��й�ȣ�� �߱��ص帳�ϴ�. <br>
									Ȯ�� �� �α����ϼż� �ݵ�� ��й�ȣ�� �����Ͻñ� �ٶ��ϴ�.
								</p>
								<div id="find_pw_input_wrap">
									<div class="find-info">
										<table border="0" summary="�̸�, �̸���">
											<caption>�ӽ� ��й�ȣ �߱� ��</caption>
											 
											<tbody>
												<tr class="user-id">
													<th scope="row"><div>���̵�</div></th>
													<td><div>
															<input type="text" name="userId" id="userId" value="<% %>"
																class="MS_input_txt" size="10" maxlength="20" />
														</div></td>
												</tr>
												<tr id="find_pw_email_wrap">
													<th scope="row"><div>�̸���</div></th>
													<td><div>
															<input type="text" id="email" name="email"
																class="MS_input_txt" value="" maxlength="80"
																title="�̸��� �ּ�" placeholder=""
																onfocus="document.findPw.focus_ok.value='yes'">
														</div></td>
												</tr>
												
											</tbody>
										</table>
										<br>
										<div class="btn-area"> 
											 <button type="submit" id="submit_findpw" style="border-left-width: 0px;border-bottom-width: 0px;border-right-width: 0px;border-top-width: 0px;">
											    	<img src="./img/FindPasswd.PNG"  width="150px" ></button>
											
											<a	 href="<%=request.getContextPath()%>/index.jsp?workgroup=kdy/login&work=jm_login" class="loginBtn"> 
												<img	src="./img/login01.PNG" alt="�α���" height="34.83px;" /></a>
									 	
										</div>
									</div>
								</div>
								</div>
								</div>
							</div>
					</form>			<!--/#find_pw/-->
					
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	$("#userId").focus();
	
	//��й�ȣ ã��
	$("#findPw").submit(function() {
	
	    var checkEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;  //Email ��ȿ�� �˻� ���Խ�
	    	    
		if ($("#userId").val()=="") {
			alert("���̵� �Է��� �ּ���.");
			$("#userId").focus();
			return false ;
		}else if($("#email").val()=="") {
			alert("�̸����� �Է��� �ּ���.");
			$("#email").focus();
			return false ;
		}else if(checkEmail.test($("#email").val())!=true) { 
			alert("�ùٸ� ������ �̸��Ϸ� �Է��� �ּ���.");
			$("#email").focus();
			return false ;
		}
		});
	

	

</script>

