<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductInfoDTO product=ProductInfoDAO.getDAO().selectProductInfo("1");
	int price=product.getProdPrice();
	String prodNm=product.getProdNm();
	String imgPath="assets/img/"+prodNm+".jpg";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8" />
       
    </head>
    <body id="page-top">
    

       <h2><%=prodNm%> 제품 정보</h2>
	<table>
	<tr>
		<td class="title">제품코드</td>
		<td class="value"><%=product.getProdCd()%></td>
	</tr>
	<tr>
		<td class="title">제품명</td>
		<td class="value"><%=product.getProdNm()%></td>
	</tr>
	<tr>
		<td class="title">제품이미지</td>
		<td class="value"><img src="<%=request.getContextPath() %>/<%=imgPath%>" width="200"></td>
	</tr>
	<tr>
		<td class="title">상세설명</td>
		<td class="value"><%=product.getProdDetl().replace("\n", "<br>") %></td>
	</tr>
	<tr>
		<td class="title">제품수량</td>
		<td class="value"></td>
	</tr>
	<tr>
		<td class="title">제품가격</td>
		<td class="value"><%=product.getProdPrice()%></td>
	</tr>
</table>

       
     
        
				
<script type="text/javascript">
$("#cartBtn").click(function() {
	
});

$(".select").change(function(){
	var select=$(this).val();
//action jsp 선언해서 db에서 cart 수량 업데이트
});
</script>
       	
      
      
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>


