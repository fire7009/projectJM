<%@page import="jm_dao.CartHisDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] check=request.getParameterValues("check");
String[] tot=request.getParameterValues("tot");
String[] prodNm=request.getParameterValues("prodNm");
String user=request.getParameter("user");

int tot_price=0;
String tot_prod="";
for(String price:tot){
	tot_price=tot_price+Integer.parseInt(price);
}

for(String name:prodNm){
	if(name.equals(prodNm[0])){
		tot_prod=tot_prod+name;
	}else{
	tot_prod=tot_prod+", "+name;
	}
}

for(String his:check){
	CartHisDAO.getDAO().updateDelCart(user, his);
}
%>

<style type="text/css">
.pagetitle1 {
	font-family: 'Noto Sans KR';
	font-size: 26px;
	font-weight: 500;
	color: #555;
	text-align: center;
    margin-top: 100px;
}

.new-privercy-contract textarea {height:150px !Important;}

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

.MS_input_txt.w137 {min-width:180px;}

.xans-member-join h3 {
	float:left;
}
.xans-member-join .chkAdd {
	float:right;
	margin:34px 0 0;
	color:#34a7b3;
	font-size:12px;
}
.xans-member-join div.boardView {
	clear:both;
	margin-top:18px;
}
.xans-member-join table.boardView {
	border-collapse:collapse;
	border:1px solid #ddd;
}
.xans-member-join table.boardView input, .xans-member-join table.boardView textarea {
	border:1px solid #bcbcbc;
	background:#fff;
	color:#202020;
	padding:1px 0 2px 4px;
}
.xans-member-join table.boardView input {
	border:1px solid #ddd;
	height:29px;
	line-height:29px;
	padding:0 5px;
}
.xans-member-join table.boardView select {
	border:1px solid #ddd;
	height:31px;
	line-height:31px;
	padding:0 5px;
}
.xans-member-join table.boardView th {
	width:148px;
	padding:15px;
	text-align:left;
	border-bottom:1px solid #e6e6e6;
	color:#555;
	font-weight:normal;
	background:#f7f7f7;
	font-size:14px;
	font-weight:600;
}
.xans-member-join table.boardView td {
	padding:15px;
	border-bottom:1px solid #e6e6e6;
	font-size:14px;
	color:#8b8b8c;
}
.xans-member-join table.boardView td fieldset {
	width:580px;
}
.xans-member-join table.boardView td.write {
	width:100%;
}
.xans-member-join table.boardView td img {
	vertical-align:middle;
}
.xans-member-join table.boardView thead th {
	border-bottom:1px solid #bfc5c5;
}
.xans-member-join table.boardView thead td {
	border-bottom:1px solid #bfc5c5;
}
.xans-member-join table.boardView tfoot th {
	border-top:1px solid #bfc5c5;
}
.xans-member-join table.boardView tfoot td {
	border-top:1px solid #bfc5c5;
}
.xans-member-join table.boardView .first {
	border-top:0;
	padding-top:20px;
}
.xans-member-join .agree01 {
	width:100%;
}
.xans-member-join .agree02 {
	width:100%;
}
.xans-member-join .agreeWrap {
	content:"";
	display:block;
	clear:both;
	margin:70px 0 0;
}
.xans-member-join .agreeArea {
	clear:both;
	padding:20px;
	background:#f7f7f7;
	border:1px solid #bfc5c5;
	border-top:1px solid #333;
	font-size:12px;
	line-height:2em;
	color:#8f8f8f;
}
.xans-member-join .agreeArea .agreeInner {
	overflow:auto;
	height:140px;
	padding:20px 20px 37px;
	border:1px solid #bcbcbc;
	background:#fff;
}
.xans-member-join .agreeArea .agreement {
	height:500px;
}
.xans-member-join .agreeArea>p {
	font-size:14px;
	font-weight:600;
	color:#444;
	padding:10px 0 0;
}
.xans-member-join .agreeArea p span {
	padding:0 20px 0 0;
}
.xans-member-join #hint_answer {
	width:500px;
}
.xans-member-join #postcode1, .xans-member-join #postcode2 {
	width:40px;
	text-align:center;
	padding:1px 0 2px 0;
}
.xans-member-join #addr1, .xans-member-join #addr2 {
	width:500px;
	margin:3px 0;
}
.xans-member-join #phone1, .xans-member-join #mobile1 {
	width:60px;
	margin:0 4px 0 0;
}
.xans-member-join #phone2, .xans-member-join #phone3, .xans-member-join #mobile2, .xans-member-join #mobile3 {
	width:80px;
	margin:0 4px;
}
.xans-member-join #email1, .xans-member-join #email2 {
	width:150px;
	margin:0 4px 0 0;
}
.xans-member-join #email2 {
	margin:0 4px;
}
.xans-member-join #birth_year, .xans-member-join #marry_year, .xans-member-join #partner_year {
	width:60px;
	margin:0 4px 0 0;
}
.xans-member-join #birth_month, .xans-member-join #marry_month, .xans-member-join #partner_month, .xans-member-join #birth_day, .xans-member-join #marry_day, .xans-member-join #partner_day {
	width:30px;
	margin:0 4px 0 0;
}
.xans-member-join #job, .xans-member-join #job_class, .xans-member-join #school, .xans-member-join #region, .xans-member-join #internet, .xans-member-join #child, .xans-member-join #car, .xans-member-join #earning {
	width:200px;
}
.xans-member-join #add1, .xans-member-join #add2, .xans-member-join #add3, .xans-member-join #add4, .xans-member-join #add5, .xans-member-join #add6, .xans-member-join #add7, .xans-member-join #add8, .xans-member-join #add9 {
	width:500px;
}
.xans-member-join .btnArea {
	clear:both;
	text-align:center;
	overflow:hidden;
	width:100%;
	padding-top:30px;
	margin:20px 0 50px;
}
.xans-member-join .btnArea.miniType {
	margin:10px 0 20px;
	padding:0 15px;
}
.xans-member-join .btnArea img {
	padding:0 1px 0 0;
	cursor:pointer;
}
.xans-member-join .btnArea p.btnRight {
	float:right;
}
.xans-member-join .btnArea p.btnRight img {
	float:left;
	padding:0 0 0 1px;
}
#realNameAuth p span {
	display:inline-block;
	width:80px;
}
#ipinWrap img {
	display:block;
}
.mem_title {
	padding:70px 0 0;
	font-size:19px;
	font-weight:600;
	color:#333;
	padding-bottom:10px;
	background:url(/design/vittz/img/mem_title_bg.gif) no-repeat left bottom
}
.mem_title2 {
	padding:70px 0 0;
	font-size:19px;
	font-weight:600;
	color:#333;
	padding-bottom:10px;
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
.tb-l { text-align: left; }
.tb-c { text-align: center; }
.pl-30 { padding-left: 15px; }
.pl-6 { padding-left: 6px; }

#ord h1.tit-join { margin-bottom: 30px; padding-bottom: 6px; border-bottom: 4px solid #3a4452; font-size: 16px; font-weight: bold; }
#ord h3.cont-tit { margin-top: 30px; margin-bottom: 5px; padding-left: 15px; color: #575757; font-weight: bold; background: url("/images/d3/modern_simple/bull_tit_h11.gif") no-repeat 0 0; }

#ord .red { color: #ff3333 }
#ord .font-n { font-weight: normal; }
#ord .w137 { width : 137px; }
#ord .w415 { width : 415px; }

#ord .ipin-confirm { height: 110px; padding: 15px 0; border: 3px solid #d4d4d4; text-align: center; background-color: #fdfdfd; }
#ord .ipin-confirm .chk-wrap { line-height: 20px; vertical-align: middle; }
#ord .ipin-confirm .chk-wrap i { display: inline-block; vertical-align: middle; }
#ord .ipin-confirm .chk-wrap label { vertical-align: middle; line-height: 1.25; }
#ord .ipin-confirm .chk-wrap .first { margin-right: 20px; }
#ord .ipin-confirm p { margin: 20px 0; line-height: 18px; font-size: 14px;  }

#ord a.ipin-svc { font-size: 14px; font-weight: bold; color: #ff3333; text-decoration: underline; margin :0 10px;}

#ord .btn-area { text-align: center; margin:10px 0;}
#ord .btn-area a { font-size: 0; }
#ord .ftr-btn { margin-top: 55px; }
#ord .ipin-btn { margin-top: 35px; }

/* 회원 정보입력 */
#ord .join-info { margin-top: 40px; margin-bottom: 5px; padding-left: 15px; background: url("/images/d3/modern_simple/bull_terms_h14.gif") no-repeat 0 0; }
#ord .tb-tit { padding: 15px 0 10px 25px; border-width: 1px 1px 2px 1px; border-color: #dedfde #dedfde #3a4452 #dedfde; border-style: solid; color: #575757; font-weight: bold; background: url("/images/d3/modern_simple/bull_tit_h11.gif") no-repeat 10px 14px #f7f7f7; }

h4.tit {
    margin-top: 50px;
    margin-bottom: 5px;
    padding-left: 5px;
    font-size: 19px !Important;
    font-weight: bold;
    color: #333;
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
   


	<h2 class="pagetitle1">
			<span>주문 페이지</span>
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
	
<%-- 상품주문 폼 설정 --%>
<form id="ord" name="ordForm" action="<%=request.getContextPath() %>/index.jsp?workgroup=khd&work=jm_Order_action" method="post">
		
<%-- 테이블 테두리 --%>
<div class="xans-member-join" align="center">

<div class="boardView"></div>

<br> <br>
<div class="boardView">
	<table summary="주문 정보 입력란." class="boardView ordForm">
		<tr>
			<th>
				<div class="tb-l pl-30" id="">
					<span class="red">*</span> 주문 총 금액
				</div>
			</th>
			<td>
				<div class="tb-l pl-6">
					<%=tot_price%>
					<input type="hidden" name="tot_price" id="tot_price" value="<%=tot_price %>"/>
				</div>
				
			</td>
		</tr>
		<tr>
			<th>
				<div class="tb-l pl-30">
					<span class="red" >*</span> 주문 상품
				</div>
			</th>
			<td>
				<div class="tb-l pl-6"  >
					<%=tot_prod %>
					<input type="hidden" name="user" id="user" value="<%=user%>"/>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th>
				<div class="tb-l pl-30">
					<span class="red">*</span> 수령자명
				</div>
			</th>
			<td><div class="tb-l pl-6">
					<input type="text" name="recvNm" id="recvNm"
						class="MS_input_txt w137" value="" size="15" maxlength="20" /> 
					
				<div id="recvNmMsg" class="error">수령자명을 입력해주세요.</div>		
					</div></td>
			</tr>
                         <th>
                            <div class="tb-l pl-30">
                               <span class="red">*</span>배송지 우편번호
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
                                  <div id="basAddrMsg" class="error">배송지 주소를 입력해 주세요.</div>
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
			

		</table>
	</div>
	<br> <br>
	
	<%-- 버튼 / 회원가입, 다시입력, 취소 --%>
	<div id="fs"  style="margin-bottom: 100px;">
		<button type="submit" style="border-left-width: 0px;border-bottom-width: 0px;border-right-width: 0px;border-top-width: 0px;">
			<img src="./img/joinBtn.png" alt="전체주문" width="150px" ></button>

		<a	 href="<%=request.getContextPath() %>/index.jsp " class="cancelBtn"> 
			<img	src="./img/CCBtn.png" alt="취소" width="150px" /></a>
	</div>
</form>

<script type="text/javascript">

$("#recvNm").focus();

$("#ord").submit(function() { 
	var submitResult=true;
	
	$(".error").css("display","none");

	if($("#recvNm").val()=="") {
		$("#recvNmMsg").css("display","block");
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
</script>


