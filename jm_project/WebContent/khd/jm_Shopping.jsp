<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductInfoDTO product=ProductInfoDAO.getDAO().selectProductInfo("1");
	int price=product.getProdPrice();
	String prodNm=product.getProdNm();
	
	
	String imgPath="assets/img/shopping"+prodNm+".jpg";
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
       <h2><%=prodNm%> 제품 정보</h2>
	<table class="shop">

	<tr>
		<th class="title">제품명</td>
		<td class="value"><%=product.getProdNm()%></td>
	</tr>
	<tr>
		<th class="title">제품이미지</td>
		<td class="value"><img src="<%=request.getContextPath() %>/assets/img/shopping/TEST.jpg" width="200"></td>
	</tr>
	<tr>
		<th class="title">상세설명</td>
		<td class="value"><%=product.getProdDetl().replace("\n", "<br>") %></td>
	</tr>
	<tr>
		<th class="title">상품수량선택</td>
		<td class="prod_select">
			<select class="select" name="prodCnt" >
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
		<td class="value"><%=product.getProdPrice()%></td>
	</tr>
</table>
<%--<a href="index.jsp?workgroup=khd&work=jm_Cart"> ss--%>
	<div id="btnDiv">
		<button type="button"  id="cartBtn" style="float:right" >장바구니</button>		
	</div>
	
</div>
</form>
     
        
				
<script type="text/javascript">
$("#cartBtn").click(function() {
	$("#shoppingForm").attr("method","post");
	$("#shoppingForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=khd&work=jm_Cart");
	$("#shoppingForm").submit();
});

$(".select").change(function() {
	//엘리먼트 속성값을 반환받아 저장
	var select=$(this).val();//변경값
	//location.href="<%=request.getContextPath()%>/index.jsp?workgroup=khd&work=jm_Cart&"&select="+select; 
});

</script>


        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <%-- <script src="js/scripts.js"></script> --%>

