<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%-- 클라이언트의 모든 요청에 대한 응답 결과를 제공하기 위한 JSP 문서 - 템플릿 페이지 --%>
<%-- => Content 영역에 요청에 대한 JSP 문서의 결과를 동적으로 포함 --%>    
<%
	request.setCharacterEncoding("utf-8");

	String workgroup=request.getParameter("workgroup");
	//String workgroup2=request.getParameter("workgroup2");
	
	if(workgroup==null) workgroup="syd";
	///if(workgroup2==null) workgroup="header";
	
	String headerPath="/header.jsp";
	if(workgroup.equals("admin")) {
		headerPath="/admin/layout/adminHeader.jsp";
	}
	
	String work=request.getParameter("work");
	if(work==null) work="main";

	String contentPath=workgroup+"/"+work+".jsp";
	
%>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="Generator" content="Notepad++"/>
<meta name="Author" content="강형동"/>
<meta name="keywords" content="Market Kurly" />
<meta name="Description" content="JM 조명 메인 페이지에 오신 것을 환영합니다"/>
<link rel="shortcut icon" href="favicon/favicon.ico"> <!-- 파비콘 -->
<link rel="apple-touch-icon-precomposed" href="apple-icon.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-icon-114x114.png">
<title>JM조명</title>
<link rel="stylesheet" type="text/css" href="css/base.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/main.css" media="all" />
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script> <!-- 제이쿼리 라이이브러리 연동 -->
<script type="text/javascript" src="js/jquery.easing.1.3.min.js"></script> 
<script type="text/javascript" src="js/swipe.js"></script> <!-- 터치 슬라이드 플러그인 연동 -->
<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>  <!-- bxSlider 플러그인 연동 -->
<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script> <!-- UI 플러그인 연동 -->
<script type="text/javascript" src="js/jquery.cookie.js"></script>  <!-- 쿠키 플러그인 연동 -->
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script src="js/DB_springMove_fn.js"></script>	

<html>

    <body>
	<%-- Header 영역 : 회사로고,메뉴,슬라이더등 --%>
	<div id="header">
		<jsp:include page="<%=headerPath%>"/>
	</div>
	<%--test --%>
	<%-- Content 영역 : 요청에 대한 결과 출력 --%>
	<div id="content">
		<jsp:include page="<%=contentPath%>"/>		
	</div>
	
	<%-- Footer 영역 : 저작권,약관,개인정보 보호정책,회사주소등 --%>
	<div id="footer">
		<jsp:include page="/footer.jsp"/>
	</div>
    </body>
</html>








