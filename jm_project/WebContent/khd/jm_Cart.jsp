<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@page import="jm_dao.CartHisDAO"%>
<%@page import="jm_dto.CartHisDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String user=request.getParameter("user");
	List<CartHisDTO>cartList=CartHisDAO.getDAO().selectCartList(user);
	ProductInfoDTO product=ProductInfoDAO.getDAO().selectProductInfo(user);
	
%>

<style type="text/css">
table {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	border-top: 10px solid #ccc;
	border-left: 10px solid #369;
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

	
	<div class="container">
		<div class="text-center">
		</div>
			<div>

				<table>
					<tr>
						<th>상품사진</th>
						<th>상품이름</th>
						<th>수량</th>
						<th>총상품 금액</th>
						<th>목록삭제</th>
					</tr>
					<%if(cartList.isEmpty()){ %>
					<tr>
				<td colspan="5">등록된 제품이 하나도 없습니다.</td>
		<% } else { %>
			<% for(CartHisDTO cart:cartList){ %>
				<% if(cart.getDelYn().equals("N")) {%>
					<tr>
						<th></th>
						<th><%=product.getProdNm()%></th>
						<th><%=cart.getProdQty()%><br>
						<select id="select" name="select">
        				<option value="1" >1</option>
         				<option value="2" >2</option>
         				<option value="3">3</option>
         				<option value="4">4</option>
        				<option value="5">5</option>
        				</select>
						<input type="button" value="수정" onclick="updateCart(<%=cart.getHisSeqno()%>);"></th>
						<th><%=cart.getProdQty()%>x<%=product.getProdPrice()%></th>
						<th><input type="button" value="삭제" onclick="removeCart(<%=cart.getHisSeqno()%>);"></th>
					</tr>
				<%} %>	
			<%} %>
		<%} %>
		</table>
 	<input type="button" value="구매페이지로 이동""></button>
	</div>
	
	<script type="text/javascript">
	function removeCart(his) {
			location.href="khd/jm_Cart_delete.jsp?his="+his+"&user=<%=user%>";
	}
	
	function updateCart(his) {
		var select=document.getElementById("select");
		select=select.options[select.selectedIndex].value;
		location.href="khd/jm_Cart_Update.jsp?his="+his+"&user=<%=user%>&qty="+select;

	}
	</script>
	

