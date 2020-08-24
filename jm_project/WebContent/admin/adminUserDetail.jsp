<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/kdy/security/login_check.jspf"%>

<%
	
	String userNo = request.getParameter("userNo");
	
	UserInfoDTO userInfoDTO = UserInfoDAO.getDAO().getAdminUserInfo(userNo);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 > 회원정보상세</title>

<link rel="stylesheet" type="text/css" href="../kdy/css/joinC.css">

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
				<span>회원정보</span>
			</h2>

			<%-- 회원정보상세/탈퇴 form 설정 --%>
			<form id="userDeleteForm" name="userDeleteForm" method="post">
				<div class="xans-element- xans-member xans-member-join"
					align="center">
					<br>
					<div class="boardView">
						<table class="boardView">
							<tbody>
								<tr>
									<th><div class="tb-l pl-30">회원번호</div></th>
									<td><div class="tb-l pl-6"><%=userInfoDTO.getUserNo()%></div></td>
								</tr>
								<tr>
									<th><div class="tb-l pl-30">아이디</div></th>
									<td><div class="tb-l pl-6"><%=userInfoDTO.getUserId()%></div></td>
								</tr>
								<tr>
									<th><div class="tb-l pl-30">회원명</div></th>
									<td><div class="tb-l pl-6"><%=userInfoDTO.getUserNm()%></div>
									</td>
								</tr>
								<tr>
									<th><div class="tb-l pl-30">연락처</div></th>
									<td><div class="tb-l pl-6"><%=userInfoDTO.getContAddr()%></div>
									</td>
								</tr>
								<tr>
									<th><div class="tb-l pl-30">이메일주소</div></th>
									<td><div class="tb-l pl-6"><%=userInfoDTO.getEmailAddr()%></div>
									</td>
								</tr>
								<tr>
									<th><div class="tb-l pl-30">우편번호</div></th>
									<td><div class="tb-l pl-6"><%=userInfoDTO.getPostCd()%></div>
									</td>
								</tr>
								<tr>
									<th><div class="tb-l pl-30">기본주소</div></th>
									<td><div class="tb-l pl-6"><%=userInfoDTO.getBasAddr()%></div>
									</td>
								</tr>
								<tr>
									<th><div class="tb-l pl-30">상세주소</div></th>
									<td><div class="tb-l pl-6"><%=userInfoDTO.getDetlAddr()%></div>
									</td>
								</tr>
								<tr>
									<th><div class="tb-l pl-30">가입일자</div></th>
									<td><div class="tb-l pl-6"><%=userInfoDTO.getFrstRgstDttm()%></div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="agreeWrap"></div>
					<div class="btnArea">
						<a href="<%=request.getContextPath() %>/index.jsp?workgroup=admin&work=adminUserList"><img src="admin/img/btn_list.gif" alt="목록" width="130px" class="smp-btn-reg"></a>
						<button type="button" id="removeBtn" style="border:none;">
							<img src="admin/img/btn_delete.png" alt="회원탈퇴" width="130px" class="smp-btn-reg">
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		
		$("#removeBtn").click(function() {
			
			if(confirm("정말로 삭제하시겠습니까?")) {
				
				$("#userDeleteForm").attr("action","<%=request.getContextPath() %>/index.jsp?workgroup=admin&work=adminUserDeleteProc&userNo=<%=userNo %>");
				$("#userDeleteForm").submit();
				
			}
		});
		
</script>
	
</body>
</html>