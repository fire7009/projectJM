<%@page import="jm.util.Utility"%>
<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");


String userId=request.getParameter("userId");
String emailAddr=request.getParameter("email");

System.out.println(userId);
System.out.println(emailAddr);

UserInfoDTO userInfo=UserInfoDAO.getDAO().selectIdUserinfo(userId);
if(userInfo==null) {
	out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findPw';alert('�Է��� ����� ���̵� �������� �ʽ��ϴ�'); </script>");
	out.println(userInfo.getUserNm());
	return;
}

//�̸��Ͽ� ���� ���� ó��
if(!userInfo.getEmailAddr().equals(emailAddr)) {//�̸��Ͽ� ���� ���� ����
	out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findPw';alert('�Է��� ������� �̸����� ���� �ʽ��ϴ�.'); </script>");
	return;
	}


//Ż��ȸ�� �α��ν� false ó��
if(userInfo.getUserDv()==""){
	out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findPw';alert('Ż���� ȸ�� �Դϴ�.'); </script>");
	return;
}

	String passwd= UserInfoDAO.getDAO().randomPassword(6);
	String pwd=Utility.encrypt(passwd);
	UserInfoDTO userInfo1=new UserInfoDTO();
	userInfo.setUserId(userId);
	userInfo.setPassword(passwd);
	UserInfoDAO.getDAO().updatePwdUserInfo(userInfo);
	
	
	//���̵�� �̸����� ��ġ�� ���
	if(userInfo!=null || userInfo.getEmailAddr().equals(emailAddr)){
		out.println("<script>location.href='"+request.getContextPath()+
				"/index.jsp?workgroup=kdy/login&work=jm_findPw';alert('�Է��� ȸ�� �ӽ� ��й�ȣ�� " + passwd +" �Դϴ�.'); </script>");
	}
		
	//out.println("<script type='text/javascript'>");
	//out.println("location.href='"+request.getContextPath()+"/coffee/index.jsp?workgroup=member&work=login';");
	//out.println("</script>");
%>
