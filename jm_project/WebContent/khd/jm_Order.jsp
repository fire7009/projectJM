<%@page import="jm_dao.CartHisDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] check=request.getParameterValues("check");
String user=request.getParameter("user");

System.out.println(user);


for(String his:check){
	CartHisDAO.getDAO().updateDelCart(user, his);
}
%>
