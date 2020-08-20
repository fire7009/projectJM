<%@page import="jm_dao.OrderInfoDAO"%>
<%@page import="jm_dto.OrderInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//비정상적인 요청에 대한 응답 처리 - 에러페이지 이동
if(request.getMethod().equals("GET")) {
	//Content 영역에 포함되는 JSP 문서이므로 리다이텍트 이동 불가능
	// => 자바스트립트를 이용하여 페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp';");
	out.println("</script>");
	return;
}

	
	String recvNm=request.getParameter("recvNm");
	String totPrice=request.getParameter("tot_price");
	String postCd=request.getParameter("postCd");
	String basAddr=request.getParameter("basAddr");
	String detlAddr=request.getParameter("detlAddr");
	String user=request.getParameter("user");
	
	int price=Integer.parseInt(totPrice);
			
	
	
	OrderInfoDTO order=new OrderInfoDTO();
	order.setRcvrNm(recvNm);
	order.setOrdSumAmt(price);
	order.setDlvrPostCd(postCd);
	order.setDlvrBasAddr(basAddr);
	order.setDlvrDetlAddr(detlAddr);
	order.setFrstRgsrUsno(user);
	
	
	OrderInfoDAO.getDAO().insertOrderInfo(order);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=jm_orderComplete';");
	out.println("</script>");
	
%>