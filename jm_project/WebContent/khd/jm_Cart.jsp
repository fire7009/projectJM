<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm_dao.ProductInfoDAO"%>
<%@page import="jm_dto.ProductInfoDTO"%>
<%@page import="jm_dao.CartHisDAO"%>
<%@page import="jm_dto.CartHisDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	UserInfoDTO loginMember=(UserInfoDTO)session.getAttribute("loginMember");


	if(loginMember==null) {
   	out.println("<script type='text/javascript'>");
   	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=error400';");
   	out.println("</script>");
   	return;
	}
	
	String user=loginMember.getFrstRgsrUsrno();
	
	String prodCd=request.getParameter("prodCd");

	int qty=0;
	int price=0;
	int tot=0;
	

	List<CartHisDTO> cartList=CartHisDAO.getDAO().selectCartList(user);
	

%>

<style type="text/css">
.content{
	width: auto;
	margin: 0 auto;
	padding: 50px 20px;
}
.btnArea{
	width: 1000px;
	margin: 0 auto;
	margin-top : 40px;
	padding: 50px 20px;
}
.paging{
	width: auto;
	margin: 0 auto;
	padding: 50px 20px;
	text-align : center;
}
table {
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
	border-top: 10px solid #ccc;
	border-left: 10px solid #4C0B5F;
	border-bottom: 10px;
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
	
		
		<div class="content">

			<form name="cartForm" id="cartForm">
				<table>
					<tr>
						<th>상품사진</th>
						<th>상품이름</th>
						<th>수량</th>
						<th>총상품 금액</th>
						<th>목록삭제</th>
						<th>주문선택</th>
					</tr>
					<%if(cartList.isEmpty()){ %>
					<tr>
				<td colspan="6">등록된 제품이 하나도 없습니다.</td>
		<% } else { %>
			<% for(CartHisDTO cart:cartList){ %>
				<% if(cart.getDelYn().equals("N")) {%>
					<%
						ProductInfoDTO product=ProductInfoDAO.getDAO().selectProductInfo(cart.getProdCd());
					%>	
					<tr>
						<th><img src="<%=request.getContextPath()%>/<%=product.getBasFilePath()%>" width="100"></th>
						<th><%=product.getProdNm()%></th>
						<th><%=cart.getProdQty()%><br>
						<select class="selected" name="<%=cart.getHisSeqno()%>">
						<option value="">갯수선택</option>
        				<option value="1" >1</option>
         				<option value="2" >2</option>
         				<option value="3">3</option>
         				<option value="4">4</option>
        				<option value="5">5</option>
        				</select>
        				</th>
        				
						<th>
						<%qty=cart.getProdQty();%>
						<%price=product.getProdPrice();%>
						<%tot=qty*price;%>
						<%=tot%>
						</th>
						<th><input type="image" value="삭제" onclick="removeCart(<%=cart.getHisSeqno()%>); return false;" src="<%=request.getContextPath()%>/khd/img/cartClear.gif"></th>
						<th>
						<input type="checkbox" name="check" value="<%=cart.getHisSeqno()%>">
					
						</th>
					</tr>
				<%} %>	
			<%} %>
		<%} %>
		</table>

		

		</div>
		<div class="btnArea">
			<button type="submit" id="orderBtn" style="border: 0; float: right;">
			<img src="<%=request.getContextPath()%>/khd/img/selOrder.gif" alt="선택구매" width="150px" ></button>
			<a	 href="<%=request.getContextPath() %>/index.jsp " class="mainBtn"> 
			<img	src="<%=request.getContextPath()%>/khd/img/go.gif" alt="취소" width="150px" style="float:right;"></a>
		<input type="hidden" name="user" value="<%=user%>">
		</div>
		
		</form>
	</div>
	
	<script type="text/javascript">
	
	$(".selected").change(function() {
		//엘리먼트 속성값을 반환받아 저장
		var his=$(this).attr("name");//고유값
		var qty=$(this).val();//변경값
		location.href="khd/jm_Cart_Update.jsp?his="+his+"&user=<%=user%>&prodCd=<%=prodCd%>&qty="+qty;
	});
	
	function removeCart(his) {
		location.href="khd/jm_Cart_delete.jsp?his="+his+"&user=<%=user%>&prodCd=<%=prodCd%>";
	}
	
	$("#orderBtn").click(function(){
		if($("input[type=checkbox]").filter(":checked").size()==0) {
			//$("#message").text("선택한 상품이 하나도 없습니다.");
			alert("선택한 상품이 하나도 없습니다.");
			return;
		}
		
		$("#cartForm").attr("method","post");
		$("#cartForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=khd&work=jm_Order");
		$("#cartForm").submit();
	});

	</script>
	

