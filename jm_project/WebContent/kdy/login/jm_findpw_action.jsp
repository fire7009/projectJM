<%@page import="jm.util.Utility"%>
<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
String userId=request.getParameter("userId");
String userNm=request.getParameter("name");
String emailAddr=request.getParameter("email");


UserInfoDTO userInfo=UserInfoDAO.getDAO().selectIdUserinfo(userId);
if(userInfo==null) {
	session.setAttribute("message", "입력한 사용자 아이디가 존재하지 않습니다.");
	session.setAttribute("userId", userId);
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';");
	out.println("</script>");
	return;
}

//이름에 대한 인증 처리
if(!userInfo.getUserNm().equals(userNm)) {//이름에 대한 인증 실패
		session.setAttribute("message", "입력한 사용자 아이디가 존재하지 않거나 이름이 맞지 않습니다.");
		session.setAttribute("userId", userId);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';");
		out.println("</script>");
		return;
	}
//이메일에 대한 인증 처리
if(!userInfo.getEmailAddr().equals(emailAddr)) {//이메일에 대한 인증 실패
		session.setAttribute("message", "입력한 사용자의 이메일이 맞지 않습니다.");
		session.setAttribute("userId", userId);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';");
		out.println("</script>");
		return;
	}
//탈퇴회원 로그인시 false 처리
if(userInfo.getUserDv()==""){
	session.setAttribute("message", "탈퇴한 회원 입니다.");
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';");
	out.println("</script>");
	return;
}

	String passwd= UserInfoDAO.getDAO().randomPassword(6);
	String pwd=Utility.encrypt(passwd);
	UserInfoDTO userInfo1=new UserInfoDTO();
	userInfo.setUserId(userId);
	userInfo.setPassword(passwd);
	UserInfoDAO.getDAO().updatePwdUserInfo(userInfo);

	
	//out.println("<script type='text/javascript'>");
	//out.println("location.href='"+request.getContextPath()+"/coffee/index.jsp?workgroup=member&work=login';");
	//out.println("</script>");
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
		<div style="width: 300px;margin: 0 auto;">입력한 회원의 비밀번호는 <span class="memId">[<%=passwd %>]</span>입니다.
		<button type="submit" style="margin-top: 15px; " onclick="location.href='index.jsp?workgroup=member&work=login'">
		<img src="./member/fine_id/savech.png"></button></div>
</body>
</html>
