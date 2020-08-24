<%@page import="jm_dao.OrderInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user=request.getParameter("user");
	String ord=request.getParameter("ord");
	System.out.println("ord="+ord);
	
	int rows=OrderInfoDAO.getDAO().delOrd(user, ord);
	
	//비정상적인 요청에 대한 응답 처리
	if(rows<=0) {//삭제된 주문정보가 없는 경우
		session.setAttribute("message", "삭제하고자 하는 주문이 없습니다.");
	}
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khm&work=jm_orderList';");
	out.println("</script>");
%>