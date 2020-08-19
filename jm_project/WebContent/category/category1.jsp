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
}	


table {
	font-size: 1.5em;
	border: 1px solid black;
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
	padding: 10px 5px;
	border: 1px solid black;
	width: 300px;
	margin: 10px;
	text-align: center;
	float: left;
}
</style>
<div>
<br>
</div>
<h1 class="title"><a href="#">거실조명</a></h1>

<table>
	<td>20평대&nbsp;|</td>
	<td>&nbsp;30평대&nbsp;|</td>
	<td>&nbsp;40평대&nbsp;|</td>
	<td>&nbsp;50평대&nbsp;|</td>
	<td>&nbsp;대형/복층/샹들리에</td>
	
</table>
<div id="productList">
	<% for(ProductInfoDTO product:productList) { %>
	<div class="product">
		<div><%=product.getProdNm() %></div>
		<div>[<%=product.getProdCd() %>]</div>
		<div>
			<a href="<%=request.getContextPath() %>/index.jsp?workgroup=khd&work=jm_Shopping&" >
				<img src="<%=request.getContextPath()%>/image/<%=product.getBasFileNm()%>" width="250">
			</a>
		</div>
		<div>
			<%=DecimalFormat.getCurrencyInstance().format(product.getProdPrice()) %>
		</div>
	</div>
	<% } %>
</div>

<div style="clear: both;"></div>