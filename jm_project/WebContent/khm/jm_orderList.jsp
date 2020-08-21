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

int pageNum=1;
if(request.getParameter("pageNum")!=null) {//전달값이 있는 경우.
	pageNum=Integer.parseInt(request.getParameter("pageNum"));
}

int pageSize=4;

int totalOrd=OrderInfoDAO.getDAO().selectOrdCnt(user);
int totalPage=(int)Math.ceil((double)totalOrd/pageSize);

if(pageNum<=0 || pageNum>totalPage) {//페이지 번호가 잘못된 경우
	pageNum=1;
}
int startRow=(pageNum-1)*pageSize+1;

int endRow=pageNum*pageSize;

if(endRow>totalOrd) {
	endRow=totalOrd;
}

List<OrderInfoDTO> ordList=OrderInfoDAO.getDAO().selectOrderInfoTwo(startRow, endRow, user);

int number=totalOrd-(pageNum-1)*pageSize;
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

			<form name="ordForm" id="ordForm">
				<table>
					<tr>
						<th>번호</th>
						<th>주문총금액</th>
						<th>수령자명</th>
						<th>배송지우편번호</th>
						<th>배송지주소</th>
						<th>주문취소</th>
					</tr>
					<%if(totalOrd==0){ %>
					<tr>
				<td colspan="6">주문한 제품이 하나도 없습니다.</td>
		<% } else { %>
			<% for(OrderInfoDTO ord:ordList){ %>
				<% if(ord.getOrdCnclYn().equals("N")) {%>
					<tr>
						<th><%=number%></th>
						<th><%=ord.getOrdSumAmt()%></th>
						<th><%=ord.getRcvrNm()%></th>
						<th><%=ord.getDlvrPostCd()%></th>
						<th><%=ord.getDlvrBasAddr()%><%=ord.getDlvrDetlAddr() %></th>
						<th><input type="image" value="삭제" onclick="removeOrd(<%=ord.getOrdNo()%>); return false;" src="<%=request.getContextPath()%>/img/CCBtn.png" style="width: 130px;"></th>
					</tr>
					<%number--; %>
				<%} %>	
			<%} %>
		<%} %>
		</table>
		<%
			int blockSize=5;
			int startPage=(pageNum-1)/blockSize*blockSize+1;
			int endPage=startPage+blockSize-1;
			if(endPage>totalPage) {
				endPage=totalPage;
			}
		%>
		<div class="paging">
		<% if(startPage>blockSize) { %>
	<a href="<%=request.getContextPath()%>/index.jsp?workgroup=khm&work=jm_orderList&pageNum=<%=startPage-blockSize%>">[이전]</a>
	<% } else { %>
	[이전]
	<% } %>
	
	<% for(int i=startPage;i<=endPage;i++) { %>
		<% if(pageNum!=i) { %>
		<a href="<%=request.getContextPath()%>/index.jsp?workgroup=khm&work=jm_orderList&pageNum=<%=i%>">[<%=i %>]</a>
		<% } else { %>
		<span style="font-size: 18px; font-weight: bold;">[<%=i %>]</span>
		<% } %>
	<% } %>
	
	<% if(endPage!=totalPage) { %>
	<a href="<%=request.getContextPath()%>/index.jsp?workgroup=khm&work=jm_orderList&pageNum=<%=startPage+blockSize%>">[다음]</a>
	<% } else { %>
	[다음]
	<% } %>
		</div>
		<div class="btnArea">
			<a	 href="<%=request.getContextPath() %>/index.jsp " class="mainBtn"> 
			<img	src="<%=request.getContextPath()%>/khd/img/go.gif" alt="메인버튼" width="150px" style="float:right;"></a>
		<input type="hidden" name="user" value="<%=user%>">
		</div>
		
		</form>
	</div>
	
	<script type="text/javascript">
	function removeOrd(ord) {
		location.href="khm/jm_Order_delete.jsp?ord="+ord+"&user=<%=user%>";
	}
	</script>
	  