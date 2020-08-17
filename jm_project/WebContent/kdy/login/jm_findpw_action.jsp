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
	session.setAttribute("message", "�Է��� ����� ���̵� �������� �ʽ��ϴ�.");
	session.setAttribute("userId", userId);
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';");
	out.println("</script>");
	return;
}

//�̸��� ���� ���� ó��
if(!userInfo.getUserNm().equals(userNm)) {//�̸��� ���� ���� ����
		session.setAttribute("message", "�Է��� ����� ���̵� �������� �ʰų� �̸��� ���� �ʽ��ϴ�.");
		session.setAttribute("userId", userId);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';");
		out.println("</script>");
		return;
	}
//�̸��Ͽ� ���� ���� ó��
if(!userInfo.getEmailAddr().equals(emailAddr)) {//�̸��Ͽ� ���� ���� ����
		session.setAttribute("message", "�Է��� ������� �̸����� ���� �ʽ��ϴ�.");
		session.setAttribute("userId", userId);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';");
		out.println("</script>");
		return;
	}
//Ż��ȸ�� �α��ν� false ó��
if(userInfo.getUserDv()==""){
	session.setAttribute("message", "Ż���� ȸ�� �Դϴ�.");
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
		<div style="width: 300px;margin: 0 auto;">�Է��� ȸ���� ��й�ȣ�� <span class="memId">[<%=passwd %>]</span>�Դϴ�.
		<button type="submit" style="margin-top: 15px; " onclick="location.href='index.jsp?workgroup=member&work=login'">
		<img src="./member/fine_id/savech.png"></button></div>
</body>
</html>
