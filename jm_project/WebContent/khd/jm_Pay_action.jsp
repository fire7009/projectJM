<%@page import="java.util.List"%>
<%@page import="jm_dto.CartHisDTO"%>
<%@page import="jm_dto.OrdProdHisDTO"%>
<%@page import="jm_dao.OrdProdHisDAO"%>
<%@page import="jm_dao.CartHisDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	


	String[] his=request.getParameterValues("ckeck");
	String user=request.getParameter("user");
	OrdProdHisDTO order=new OrdProdHisDTO();
	List<CartHisDTO> cartList=CartHisDAO.getDAO().selectCartList("user");

	for(CartHisDTO cart:cartList){
		for(int i=0;i<his.length;i++){
			order.setFrstRgsrUsrno(user);
			order.setHisSeqno(his[i]);
			order.setOrdQty(cart.getProdQty());
			order.setProdCd(cart.getProdCd());
			OrdProdHisDAO.getDAO().insertOrdProdHis(user, order);
		}
	}
	
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=jm_Pay&user="+user+"';");
	out.println("</script>");

		
%>