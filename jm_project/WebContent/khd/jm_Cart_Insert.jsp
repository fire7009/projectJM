<%@page import="jm_dao.CartHisDAO"%>
<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.CartHisDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//비정상적인 요청에 대한 응답 처리 - 쇼핑페이지 이동
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=jm_Shopping';");
		out.println("</script>");
		return;
	}

	int select=Integer.parseInt(request.getParameter("select"));
	String pcode=request.getParameter("pcode");
	
	ProductInfoDAO product=new ProductInfoDAO();
	product.selectProductInfo(pcode);
	
	CartHisDTO cart=new CartHisDTO();

	cart.setProdCd(pcode);
	cart.setProdQty(select);
	cart.setOrdYn("1");
	cart.setDelYn("1");
	CartHisDAO.getDAO().insertCart(cart);
	

	//장바구니 페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=jm_Cart&pcode="+pcode+"';");
	out.println("</script>");
	
%>