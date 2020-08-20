<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css" >
.title {text-align: center;
	
	font-size: 3em;
	margin-top: 50px;
	margin-bottom: 50px;
	color: #2e2e2e;
	
}	


table {

	
	text-align: center;
	margin: 0 auto;
	margin-bottom: 50px;
	font: sans-serif;
}

th {

	font-size: 1.5em;
}

.bottom {
	margin-bottom: 30px;
}
</style>   

<%
String category=request.getParameter("category");
List<ProductInfoDTO> productList=ProductInfoDAO.getDAO().selectCategoryProduct(category);
%>

<style type="text/css">
#productList {
	width: 1000px;
	margin: 0 auto;
}

.product {
	padding: 10px 10px;
	border: 1px solid lightgray;
	width: 250x;
	margin: 10px;
	text-align: center;
	float: left;
	font: sans-serif;
}
.productnm{
	margin-top: 10px;
	margin-bottom: 10px;
	font-weight: bold;
	font-size:1.4em;
	color: #2e2e2e;
	font: sans-serif;
}

.productprice{
	color: #110352;
	font-weight: bold;
	font-size:1.2em;
}
</style>
<div>
<br>
</div>
<h1 class="title"><a href="#">거실조명</a></h1>

<table>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category_action6&category=20">&nbsp;실외벽등&nbsp;&nbsp;&nbsp;|</a></th>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category_action6&category=30">&nbsp;&nbsp;&nbsp;문주등&nbsp;&nbsp;&nbsp;|</a></th>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category_action6&category=40">&nbsp;&nbsp;&nbsp;정원등&nbsp;&nbsp;&nbsp;|</a></th>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category_action6&category=50">&nbsp;&nbsp;&nbsp;지중등&nbsp;&nbsp;&nbsp;|</a></th>
	
</table>

<div id="productList">
	
		<% for(ProductInfoDTO product:productList) { %>
	<div class="product">
		<div>
			<a href="<%=request.getContextPath() %>/index.jsp?workgroup=khd&work=jm_Shopping&prodCd=<%=product.getProdCd() %>" >
				<img src="img/<%=product.getBasFileNm()%>.jpg" width="250">
			</a>
		</div>
		<div><%=product.getProdNm() %></div>
		<div>
			<%=DecimalFormat.getCurrencyInstance().format(product.getProdPrice()) %>
		</div>
	</div>
		<% } %>

	
	
</div>




<div class="bottom" style="clear: both;"></div>