<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String userNm=request.getParameter("name");
	String emailAddr=request.getParameter("find_id_email");
	
	
	UserInfoDTO userInfo=UserInfoDAO.getDAO().selectfindIdUserinfo(userNm);
	if(userInfo==null) {
		out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('입력한 사용자 이름이 존재하지 않습니다'); </script>");
		return;
	}	

	//비밀번호에 대한 인증 처리
	if(!userInfo.getEmailAddr().equals(emailAddr)) {//비밀번호에 대한 인증 실패
			out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('입력한 사용자 이름이 존재하지 않거나 이메일이 맞지 않습니다.'); </script>");
			return;
	}
	
	
	if(userInfo!=null || userInfo.getEmailAddr().equals(emailAddr)){
		out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('입력한 회원 아이디는 "+userInfo.getUserId()+" 입니다.'); </script>");
	}
	
	%> 
	
	<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
<style type="text/css">

div {
	text-align: center;
	margin: 10px;
}

.id { color: red; }

</style>
</head>
<body>
<!-- <form action="index.jsp?workgroup=kdy/login&work=jm_login"> -->
<%-- 		<div style="width: 300px;margin: 0 auto;">입력한 회원의 아이디는 <span class="memId">[<%=userInfo.getUserId() %>]</span>입니다. --%>
<!-- 		<button type="submit" style="margin-top: 15px; "><img src="./member/fine_id/savech.png"></button></div> -->
<!-- </form> -->
</body>
</html>
