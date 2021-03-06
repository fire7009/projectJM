<%@page import="jm_dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%--회원가입 완료 페이지 --%>
<%
	UserInfoDTO loginMember=(UserInfoDTO)session.getAttribute("loginMember");
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 에러</title>
<style type="text/css">

#join-complete h1.tit-join-complete {
    margin-top: 40px;
    margin-bottom: 15px;
    padding-bottom: 6px;
    border-bottom: 4px solid #3a4452;
    font-size: 16px;
    font-weight: bold;
}
#join-complete .complete-box {
    padding: 40px;
    background-color: #fefefe;
    border: 3px solid #d4d4d4;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
}

html, body, pre, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, menu, nav, section, hgroup, article, header, aside, footer, input, select, textarea, button {
    margin: 0;
    padding: 0;
}

#wrap {
    max-width: 1920px;
    min-width: 1280px;
    width: 100%;
    margin: 0 auto;
    font-family: 'Noto Sans KR',sans-serif;
}

dt {
    display: block;
}

#join-complete .complete-box dl {
    line-height: 30px;
}

</style>
</head>
<body>
	<div id="contentWrapper">
		<div id="contentWrap">
			<div id="content">
				<div id="join-complete">

					<h1 class="tit-join-complete">로그인 오류</h1>
					<div class="complete-box">
						<dl>
							<dd>
								<img src="./img/terms_page_tit.png" alt="join us"
									title="join us" />
							</dd>
							<br>

							<dt> 로그인을 하고 장바구니 기능을 이용해주세요.</dt>
							<dd>JM조명 안에서 즐거운 쇼핑 되세요.</dd>
						 
							<dd class="font-b">감사합니다.</dd>
							<br>
							<h2><a href="<%=request.getContextPath() %>/index.jsp?workgroup=syd&work=main" >메인화면으로</a></h2>

						</dl>
					</div>
				</div>
			</div>
			<!-- #content -->
		</div>
		<!-- #contentWrap -->
	</div>
	<!-- #contentWrapper-->
</body>
</html>