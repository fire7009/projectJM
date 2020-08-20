<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//UserInfoDTO loginMember=(UserInfoDTO)session.getAttribute("loginMember");
	//String user=loginMember.getFrstRgsrUsrno();
	//String prodCd=request.getParameter("prodCd");
	String user="1";
	String prodCd="1";
	
	ProductInfoDTO product=ProductInfoDAO.getDAO().selectProductInfo(prodCd);
	int price=product.getProdPrice();
	String prodNm=product.getProdNm();
	String ctgr=product.getCtgrCd();
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
    width: 150px;
    padding: 10px;
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
	margin: auto;
	padding: 50px 20px;
	text-align:center;
}
h2{
	text-align: left;
    font-size: xxx-large;
}
</style>

<form id="shoppingForm">
  <div class="shopping">
       <h2><%=prodNm%>제품 정보</h2>
	<table class="shop">

	<tr>
		<th class="title">제품명</td>
		<td class="value"><%=prodNm%></td>
	</tr>
	<tr>
		<th class="title">제품이미지</td>
		<td class="value"><img src="img/JM_03.png"alt="" /></td>
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
	<button type="button"  id="cartBtn">장바구니</button>	

</div>
</form>
     
        

				
<script type="text/javascript">
$("#cartBtn").click(function(){
var select=$("select[name=select]").val();
	$("#shoppingForm").attr("method","post");
	$("#shoppingForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=khd&work=jm_Cart_Insert&select="+select+"&prodCd=<%=prodCd%>&user=<%=user%>");
	$("#shoppingForm").submit();
});
</script>


