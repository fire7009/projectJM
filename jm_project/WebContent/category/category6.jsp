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

	
	text-align: center;
	margin: 0 auto;
	margin-bottom: 50px;
	
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
<h1 class="title"><a href="#">실외조명</a></h1>
<table>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category6&category=401">&nbsp;실외벽등&nbsp;&nbsp;&nbsp;|</a></th>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category6&category=402">&nbsp;&nbsp;&nbsp;문주등&nbsp;&nbsp;&nbsp;|</a></th>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category6&category=403">&nbsp;&nbsp;&nbsp;정원등&nbsp;&nbsp;&nbsp;|</a></th>
	<th><a href="<%=request.getContextPath()%>/index.jsp?workgroup=category&work=category6&category=404">&nbsp;&nbsp;&nbsp;지중등&nbsp;&nbsp;&nbsp;|</a></th>
	
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

<div class="bottom" style="clear: both;"></div>
