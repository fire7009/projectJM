<%@page import="jm_dto.OrderInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="jm_dao.OrderInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
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

int qty=0;
int price=0;
int tot=0;


List<OrderInfoDTO> ordList=OrderInfoDAO.getDAO().selectOrdList(user);
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


				<table>
					<tr>
						<th>주문총금액</th>
						<th>수령자명</th>
						<th>배송지우편번호</th>
						<th>배송지주소</th>
						<th>주문취소</th>
					</tr>
					<%if(ordList.isEmpty()){ %>
					<tr>
				<td colspan="6">주문한 제품이 하나도 없습니다.</td>
		<% } else { %>
			<% for(OrderInfoDTO ord:ordList){ %>
				<% if(ord.getOrdCnclYn().equals("N")) {%>
					<tr>
						<th><%=ord.getOrdSumAmt()%></th>
						<th><%=ord.getRcvrNm()%></th>
						<th><%=ord.getDlvrPostCd()%></th>
						<th><%=ord.getDlvrBasAddr()%><%=ord.getDlvrDetlAddr() %></th>
						<th><input type="image" value="삭제" onclick="removeOrd(<%=ord.getOrdNo()%>);" src="<%=request.getContextPath()%>/img/CCBtn.png" style="width: 130px;"></th>
					</tr>
				<%} %>	
			<%} %>
		<%} %>
		</table>

		</div>
		<div class="btnArea">
			<a	 href="<%=request.getContextPath() %>/index.jsp " class="mainBtn"> 
			<img	src="<%=request.getContextPath()%>/khd/img/go.gif" alt="메인버튼" width="150px" style="float:right;"></a>
		<input type="hidden" name="user" value="<%=user%>">
		</div>
		
	
	</div>
	
	<script type="text/javascript">
	function removeOrd(ord) {
		location.href="khm/jm_Order_delete.jsp?ord="+ord;
	}
	</script>
	  