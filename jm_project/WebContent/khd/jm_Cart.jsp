<%@page import="jm_dao.CartHisDAO"%>
<%@page import="jm_dto.CartHisDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pcode=request.getParameter("pcode");
	List<CartHisDTO>cartList=CartHisDAO.getDAO().selectCartList(pcode);
%>

<style type="text/css">
table {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 3px solid #369;
	margin: 20px 10px;
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
</head>
<body id="page-top">
	
	<div class="container">
		<div class="text-center">
			<h3 class="section-subheading text-muted">장바구니 목록</h3>
		</div>
			<div>

				<table>
					<tr>
						<th>수량</th>
						<th>총상품 금액</th>
						<th>상품취소</th>
					</tr>
					<%if(cartList.isEmpty()){ %>
					<tr>
				<td colspan="3">등록된 제품이 하나도 없습니다.</td>
		<% } else { %>
			<% for(CartHisDTO cart:cartList){ %>
					<tr>
						<th><%=cart.getProdQty()%><br>
						<button>수정</button></th>
						<th><%=cart.getHisSeqno() %></th>
						<th><button>삭제</button></th>
					</tr>
			<%} %>
		<%} %>
		</table>
 	
	</div>

