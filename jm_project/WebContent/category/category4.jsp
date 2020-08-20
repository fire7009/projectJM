<%@page import="java.text.DecimalFormat"%>
<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@page import="java.util.List"%>
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
	//PRODUCT 테이블에 저장된 모든 제품정보를 검색하여 반환하는 DAO 
	//클래스의 메소드 호출
	List<ProductInfoDTO> productList
		=ProductInfoDAO.getDAO().selectCategoryProduct("ALL");

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
<h1 class="title"><a href="<%=request.getContextPath() %>/index.jsp?workgroup=category&work=category4">주방/화장실</a></h1>

<table>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category_action4&category=20">&nbsp;주방&nbsp;&nbsp;&nbsp;|</a></th>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category_action4category=30">&nbsp;&nbsp;&nbsp;화장실&nbsp;&nbsp;&nbsp;|</a></th>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category_action4&category=40">&nbsp;&nbsp;&nbsp;바리솔&nbsp;&nbsp;&nbsp;|</a></th>
	
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
