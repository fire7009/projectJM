<%@page import="java.util.List"%>
<%@page import="jm_dto.CartHisDTO"%>
<%@page import="jm_dto.OrdProdHisDTO"%>
<%@page import="jm_dao.OrdProdHisDAO"%>
<%@page import="jm_dao.CartHisDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	request.setCharacterEncoding("utf-8");

	String value=request.getParameter("value");
	String[] spString=value.split("_"); 
	String his=spString[0];
	String user=spString[1];
	
	String[] hisList=request.getParameterValues("his");
	
	List<CartHisDTO>cartList=CartHisDAO.getDAO().selectCartList(user);
	
	for(CartHisDTO cart:cartList){
		
		for(int i=0;i<hisList.length;i++){
			
			OrdProdHisDTO order=new OrdProdHisDTO();
			order.setFrstRgsrUsrno(user);
			order.setOrdQty(cart.getProdQty());
			order.setHisSeqno(hisList[i]);
			CartHisDAO.getDAO().updateDelCart(user,hisList[i]);
			OrdProdHisDAO.getDAO().insertOrdProdHis(user, order);
		}
	
	}
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=jm_Pay&user="+user+"';");
	out.println("</script>");

%>