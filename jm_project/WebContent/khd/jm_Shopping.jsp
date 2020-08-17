<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
%>


<style type="text/css">
table.shop {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
}
table.shop thead th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #e7708d;
    margin: 20px 10px;
}
table.shop tbody th {
    width: 150px;
    padding: 10px;
}
table.shop td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}
table.shop .even {
    background: #fdf3f5;
}
.shopping{
	width: 500px;
	margin: auto;
	padding: 50px 20px;
	text-align:center;
}
</style>

<form id="shoppingForm">
  <div class="shopping">
       <h2> 제품 정보</h2>
	<table class="shop">

	<tr>
		<th class="title">제품명</td>
		<td class="value"></td>
	</tr>
	<tr>
		<th class="title">제품이미지</td>
		<td class="value">		<img class="img-fluid" src="assets/img/portfolio/01-thumbnail.jpg"alt="" /></td>
	</tr>
	<tr>
		<th class="title">상세설명</td>
		<td class="value"></td>
	</tr>
	<tr>
		<th class="title">상품수량선택</td>
		<td class="prod_select">
			<select class="select" name="select" >
        		<option value="1" >1</option>
         		<option value="2" >2</option>
         		<option value="3">3</option>
         		<option value="4">4</option>
        		<option value="5">5</option>
        	 </select>
        	 </td>
	</tr>
	<tr>
		<th class="title">제품가격</td>
		<td class="value"></td>
	</tr>
</table>

	<div id="btnDiv">
		<button type="button"  id="cartBtn" style="float:right" >장바구니</button>		
	</div>
	
</div>
</form>
     
        
<%-- $("#cartBtn").click(function() {
	var select=$("select[name=select]").val();
	var price=<%=product.getProdPrice()%>;
	
	$("#shoppingForm").attr("method","post");
	$("#shoppingForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=khd&work=jm_Cart_Insert&select="+select+"&pcode=<%=product.getProdCd()%>");
	$("#shoppingForm").submit();
}); --%>
				
<script type="text/javascript">


</script>


