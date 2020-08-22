<%@page import="jm_dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String noticeNo=request.getParameter("noticeNo");
int num=Integer.parseInt(noticeNo);
System.out.println(num);
NoticeDAO.getDAO().delelteNotice(num);

out.println("<script type='text/javascript'>");
out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=noticeBoard&work=jm_noticeList';");
out.println("</script>");

%>