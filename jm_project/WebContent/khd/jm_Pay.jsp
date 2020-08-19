<%@page import="jm_dao.OrdProdHisDAO"%>
<%@page import="jm_dto.OrdProdHisDTO"%>
<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@page import="jm_dao.CartHisDAO"%>
<%@page import="jm_dto.CartHisDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user=request.getParameter("user");
	List<OrdProdHisDTO> orderList=OrdProdHisDAO.getDAO().selectOrdList(user);
	ProductInfoDTO product=ProductInfoDAO.getDAO().selectProductInfo(user);
%>

<style type="text/css">
.content{
	width: 1000px;
	margin: auto;
	padding: 50px 20px;
	text-align:center;
}
table {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	border-top: 10px solid #ccc;
	border-left: 10px solid #4C0B5F;
	border-bottom: 10px;
	margin: auto;
	width: 60%;
}

th {
	width: 147px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

td {
	width: 349px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}
</style>

<form name="pay" method="post" action="jm_Pay_action.jsp">

	
		<div class="content">

				<table>
					<tr>
						<th>상품사진</th>
						<th>상품이름</th>
						<th>수량</th>
						<th>총상품 금액</th>
					</tr>
		<%if(orderList.isEmpty()){ %>
					<tr>
					<td colspan="4">등록된 제품이 하나도 없습니다.</td>
					</tr>
		<% } else { %>
			<% for(OrdProdHisDTO ord:orderList){ %>
					<tr>
						<th></th>
						<th><%=ord.getOrdNo()%></th>
						<th><%=ord.getOrdQty()%></th>
						<th></th>
					</tr>	
			<%}%>
				<br>
		<h1>상품 구매 완료!</h1>
		<%} %>
					
		</table>
	
		<br>

	</div>
	
	<script type="text/javascript">

	</script>
	

