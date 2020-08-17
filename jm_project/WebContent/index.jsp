<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 클라이언트의 모든 요청에 대한 응답 결과를 제공하기 위한 JSP 문서 - 템플릿 페이지 --%>
<%-- => Content 영역에 요청에 대한 JSP 문서의 결과를 동적으로 포함 --%>    
<%
	request.setCharacterEncoding("utf-8");

	String workgroup=request.getParameter("workgroup");
	if(workgroup==null) workgroup="syd";
	
	String work=request.getParameter("work");
	if(work==null) work="jm_Mainlayout";
	

	String contentPath=workgroup+"/"+work+".jsp";
	
	//String
%>    

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title></title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:
        400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
	<%-- Header 영역 : 회사로고,메뉴,슬라이더등 --%>
	<div id="header">
		<jsp:include page="/jm_Header.jsp"/>
	</div>
	<%--test --%>
	<%-- Content 영역 : 요청에 대한 결과 출력  --%>
	<div id="content">
		<jsp:include page="<%=contentPath%>"/>		
	</div>
	
	<%-- Footer 영역 : 저작권,약관,개인정보 보호정책,회사주소등 --%>
	<div id="footer">
		<jsp:include page="/jm_Footer.jsp"/>
	</div>
    </body>
</html>
