<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm_dao.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String userNo = request.getParameter("userNo");

	UserInfoDAO.getDAO().deleteAdminUserInfo(userNo);
	
	System.out.println("deleteAdminUserInfo - userNo = " + userNo);
	
	String resultMsg = "";
	
	resultMsg += "<script type='text/javascript'>";
	resultMsg += "alert('삭제가 완료되었습니다.');";	
	resultMsg += "</script>";
	
	out.print(resultMsg);

	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=admin&work=adminUserList';");
	out.println("</script>");
	
%>