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
		out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('�Է��� ����� �̸��� �������� �ʽ��ϴ�'); </script>");
		return;
	}	

	//��й�ȣ�� ���� ���� ó��
	if(!userInfo.getEmailAddr().equals(emailAddr)) {//��й�ȣ�� ���� ���� ����
			out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('�Է��� ����� �̸��� �������� �ʰų� �̸����� ���� �ʽ��ϴ�.'); </script>");
			return;
	}
	
	
	if(userInfo!=null || userInfo.getEmailAddr().equals(emailAddr)){
		out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('�Է��� ȸ�� ���̵�� "+userInfo.getUserId()+" �Դϴ�.'); </script>");
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
<%-- 		<div style="width: 300px;margin: 0 auto;">�Է��� ȸ���� ���̵�� <span class="memId">[<%=userInfo.getUserId() %>]</span>�Դϴ�. --%>
<!-- 		<button type="submit" style="margin-top: 15px; "><img src="./member/fine_id/savech.png"></button></div> -->
<!-- </form> -->
</body>
</html>
