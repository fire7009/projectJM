<%@page import="jm_dao.CartHisDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 학번을 전달받아 STUDENT 테이블에 저장된 해당 학번의 학생정보를
삭제하고 학생정보 검색 출력페이지(displayStudent.jsp)로 이동하는 JSP 문서 --%>    
<%

	String his=request.getParameter("his");
	String prodCd=request.getParameter("prodCd");
	String user=request.getParameter("user");

	int qty=Integer.parseInt(request.getParameter("qty"));

	int rows=CartHisDAO.getDAO().updateQtyCart(qty, his, user);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=jm_Cart&prodCd="+prodCd+"&user="+user+"';");
	out.println("</script>");
%>


