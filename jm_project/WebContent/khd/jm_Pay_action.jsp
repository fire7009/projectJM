<%@page import="java.util.List"%>
<%@page import="jm_dto.CartHisDTO"%>
<%@page import="jm_dto.OrdProdHisDTO"%>
<%@page import="jm_dao.OrdProdHisDAO"%>
<%@page import="jm_dao.CartHisDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	String[] check=request.getParameterValues("check");
	String user=request.getParameter("user");
	
	System.out.println(user);
	

	for(String his:check){
		CartHisDAO.getDAO().delCart(user, his);
	}
	
   
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=jm_Pay&user="+user+"';");
	out.println("</script>");

		
%>