<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm_dao.CartHisDAO"%>
<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.CartHisDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	UserInfoDTO loginMember=(UserInfoDTO)session.getAttribute("loginMember");
	
	//비정상적인 요청에 대한 응답 처리
	if(loginMember==null) {
   	out.println("<script type='text/javascript'>");
   	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=error400';");
   	out.println("</script>");
   	return;
	}
	
	int select=Integer.parseInt(request.getParameter("select"));
	String prodCd=request.getParameter("prodCd");
	String user=loginMember.getFrstRgsrUsrno();
	
	ProductInfoDAO product=new ProductInfoDAO();
	product.selectProductInfo(prodCd);
	
	CartHisDTO cart=new CartHisDTO();

	cart.setProdCd(prodCd);
	cart.setProdQty(select);
	cart.setFrstRgsrUsrno(user);
	CartHisDAO.getDAO().insertCart(cart);
	

	//장바구니 페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=jm_Cart&prodCd="+prodCd+"&user="+user+"';");
	out.println("</script>");
	
%>