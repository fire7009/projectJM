<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String userNm=request.getParameter("name");
	String emailAddr=request.getParameter("find_id_email");
	
	//���̵� ã��
	UserInfoDTO userInfo=UserInfoDAO.getDAO().selectfindIdUserinfo(userNm);
	if(userInfo==null) {
		out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('�Է��� ����� �̸��� �������� �ʽ��ϴ�'); </script>");
		return;
	}	

	if(!userInfo.getEmailAddr().equals(emailAddr)) {  
			out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('�Է��� ������� �̸����� ���� �ʽ��ϴ�.'); </script>");
			return;
	}
	
	if(userInfo!=null || userInfo.getEmailAddr().equals(emailAddr)){
		out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('�Է��� ȸ�� ���̵�� "+userInfo.getUserId()+" �Դϴ�.'); </script>");
	}
	
%>

<style type="text/css">

div {
	text-align: center;
	margin: 10px;
}

.id { color: red; }

</style>

