<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String prodCd=request.getParameter("prodCd");
	//String user="1";
	//String prodCd="1";
	
	ProductInfoDTO product=ProductInfoDAO.getDAO().selectProductInfo(prodCd);
	int price=product.getProdPrice();
	String prodNm=product.getProdNm();
	String basFileNm=product.getBasFileNm();
	String basFilePath=product.getBasFilePath();
	String detlFileNm=product.getDetlFileNm();
	String detlFilePath=product.getDetlFilePath();
	String prodDetl=product.getProdDetl();
	
%>


<style type="text/css">
table.shop {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 5px solid #ccc;
    border-bottom: 4px solid #ccc;
    margin: 20px 10px;
}
table.shop thead th {
    width: 150px;
    padding: 10px;
    font-weight: bold;

    color: #fff;
    background: #e7708d;
    margin: 20px 10px;
}
table.shop tbody th {
    width: 20px;
    padding: 10px;
    text-align:center;
}
table.shop td {
    width: 350px;
    padding: 10px;
    text-align:center;
    vertical-align: center;
}
table.shop .even {
    background: #fdf3f5;
}
.shopping{
	width: 1000px;
	margin: 0 auto;
	margin-top : 50px;
	margin-bottom : 100px;
	padding: 50px 20px;
	text-align:center;
}
h2{
	text-align: center;
    font-size: xx-large;
}
</style>

<form id="shoppingForm">
  <div class="shopping">
       <h2 style="margin-bottom: 10px;"><%=prodNm%></h2>
	<table class="shop" style="width : 1100px; margin: 0 auto;" >

	<tr>
		<th class="title">제품명</td>
		<td class="value"><%=prodNm%></td>
	</tr>
	<tr>
		<th class="title">제품이미지</td>
		<td class="value"><img src="<%=request.getContextPath()%>/<%=basFilePath%>" width="250"></td>
	</tr>
	<tr>
		<th class="title">상세설명</td>
		<td class="value"><%=prodDetl%></td>
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
		<td class="value"><%=price %></td>
	</tr>
</table>
<button type="submit" id="cartBtn"
 style="border: none; margin-top: 20px; float:right;"><img src="<%=request.getContextPath()%>/khd/img/cart.gif" alt="장바구니" width="150px" ></button>

</div>
</form>
     
        

				
<script type="text/javascript">
$("#cartBtn").click(function(){
var select=$("select[name=select]").val();
	$("#shoppingForm").attr("method","post");
	$("#shoppingForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=khd&work=jm_Cart_Insert&select="+select+"&prodCd=<%=prodCd%>");
	$("#shoppingForm").submit();
});
</script>


