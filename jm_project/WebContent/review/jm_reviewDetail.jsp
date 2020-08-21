<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm_dao.ProdReviewDAO"%>
<%@page import="jm_dto.ProdReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getParameter("num")==null) {
		out.println("<script type = 'text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	String keyword = request.getParameter("keyword");
	
	//게시글 번호를 전달받아 BOARD 테이블에 저장된 게시글을 검색하여
	//반환하는 DAO 클래스의 메소드 호출
	ProdReviewDTO review = ProdReviewDAO.getDAO().selectNumBoard(num);
	
	//검색된 게시글이 없거나 삭제글인 경우 >> 비정상적인 요청
	if(review == null || review.getStatus()==9) {
		out.println("<script type = 'text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//세션에 저장된 권한 관련 정보를 반환받아 저장
	UserInfoDTO loginMember = (UserInfoDTO)session.getAttribute("loginMember"); 
	
	//검색된 게시글이 비밀글인 경우
	if(review.getStatus()==1) {
		//로그인 상태의 사용자가 작성자이거나 관리자가 아닌 경우 >> 비정상적인 요청
		if(loginMember==null || !loginMember.getUserId().equals(review.getId())
			&& Integer.parseInt(loginMember.getUserDv()) != 1) {
			out.println("<script type = 'text/javascript'>");
			out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
			out.println("</script>");
			return;
		}
	}
	
	//게시글번호를 전달받아 BOARD 테이블에 저장된 해당 게시글의 조회수를 
	//1 증가되도록 변경하고 변경행의 갯수를 반환하는 메소드
	ProdReviewDAO.getDAO().updateReadCount(num);
	
%>
<style type="text/css">
.cs_title {
	font-size:23px;
	font-weight:600;
	color:#333;
	margin-bottom:15px;
}
.xans-board-read table {
	font-size:13px;
}
.xans-board-read table input {
	border:1px solid #ddd;
	background:#fff;
	color:#202020;
	padding:1px 0 2px 4px;
}

.xans-board-read table th {
	width:80px;
	padding:15px;
	text-align:left;
	line-height:2em;
	border-bottom:1px solid #e6e6e6;
	color:#000;
	font-weight:600;
	font-size:14px;
	background:#f7f7f7;
}

.xans-board-read table td {
	padding:15px;
	border-bottom:1px solid #e6e6e6;
	line-height:2em;
	color:#8b8b8c;
	text-align:left;
	font-weight:normal;
	font-size:13px;
}

.xans-board-read table td img {
	vertical-align:middle;
}

.bbs-table-view {
    margin-top: 10px;
    border-top: 2px solid #333;
}

</style>
<div class="cs_title" style="margin: 50px;">게시글</div>	
<div
	class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">
	<div class="boardView">
		<div id="bbsData">
			<div class="page-body">
				<div class="bbs-table-view"  style="margin: 50px;">
					<table summary="게시글 보기">
						<caption>게시글 보기</caption>
						<tbody>
							<tr class="">
								<th scope="row">제목</th>
								<td class="subject">
								<% if(review.getStatus()==1) { %>[비밀글]<% } %>
								<%=review.getSubject() %>
								</td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td><%=review.getWriter() %></td>
							</tr>
							<tr class="etcArea" >
								<td colspan="2"><ul>
										<li class=""><strong class="th">작성일</strong> <span
											class="td"><%=review.getFrstRgstDttm().substring(0,19) %></span></li>
										<li class=""><strong class="th">조회수</strong> <span
											class="td"><%=review.getReadcount()+1 %></span></li>
								</ul></td>
							</tr>

							<tr>
								<td colspan="2" style="padding: 0px; height: 300px;" >
									<div class="content">
										<a><%= review.getContent().replace("\n", "<br>") %> </a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<hr size="1" color="#E5E5E5">
					<div class="view-link">
							<div id="board_menu" align="right" style="margin-right: 50px;">
							<%-- 로그인 사용자가 작성자이거나 관리자인 경우 --%>
							<% if(loginMember != null && (loginMember.getUserId().equals(review.getId()) || Integer.parseInt(loginMember.getUserDv()) == 1)) { %>
							<button type="button" id="removeBtn" style="border:none;">
							<img src="img/btn_delete2.gif"" alt="삭제" width="130px" >
							</button>
							<button type="button" id="modifyBtn" style="border:none;">
							<img src="img/btn_wModify2.gif" alt="수정" width="130px" >
							</button>
							<% } %>
							<button type="button" id="listBtn" style="border:none;">
							<img src="img/btn_list2.gif" alt="목록" width="130px" >
							</button>
							</div>
					</div>

				</div>
			</div>
			<!-- .page-body -->
		</div>
		<!-- #bbsData -->
	</div>
</div>

<form id="boardForm" method="post">
	<%-- 게시글 변경 입력페이지와 삭제 처리페이지를 요청하여 전달하기 위한 값 --%>
	<input type="hidden" name="num" value="<%=review.getPostNo()%>">
	<%-- 게시글 목록 출력페이지를 요청하여 전달하기 위한 값 --%>
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	<input type="hidden" name="search" value="<%=search%>">
	<input type="hidden" name="keyword" value="<%=keyword%>">
</form>

<script type="text/javascript">
$("#removeBtn").click(function() {
	if(confirm("정말로 삭제하시겠습니까?")) {
		$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=review&work=review_remove_action");
		$("#boardForm").submit();
	}
});

$("#modifyBtn").click(function() {
	$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=review&work=review_modify");
	$("#boardForm").submit();
});

$("#listBtn").click(function() {
	$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_review");
	$("#boardForm").submit();
});
</script>
