<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="jm_dto.ProdReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="jm_dao.ProdReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//검색 관련 정보를 반환받아 저장
	String search = request.getParameter("search");
	if (search == null) search = "";
	String keyword = request.getParameter("keyword");
	if (keyword == null) keyword = "";
	
	//전달된 페이지 번호를 반환받아 저장 
	// => 전달값이 존재하지 않을 경우 첫번째 페이지 검색 (pageNum -> 페이지번호)
	int pageNum = 1;
	if (request.getParameter("pageNum") != null) {//전달값이 있는 경우
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//하나의 페이지에 출력될 게시글 갯수 설정
	int pageSize = 10;
	
	//BOARD 테이블에 저장된 전체 게시글의 갯수를 검색하여 반환하는 DAO 클래스의 메소드 호출
	//int totalBoard=BoardDAO.getDAO().selectBoardCount();
	//리뷰 테이블에 저장된 전체 게시글 중 카테고리를 검색하여 반환
	int totalReviewBoard = ProdReviewDAO.getDAO().selectReviewCount(search, keyword);
	
	//검색 게시글에 대한 페이지의 갯수를 계산하여 저장
	//int totalPage = totalBoard/pageSize+(totalBoard%pageSize==0?0:1);
	int totalReviewPage = (int) Math.ceil((double) totalReviewBoard / pageSize);
	
	//전달된 페이지 번호에 대한 검증
	if (pageNum <= 0 || pageNum > totalReviewPage) {//페이지 번호가 잘못된 경우
		pageNum = 1;
	}
	
	//현재 페이지에 대한 게시글 시작 행번호를 계산하여 저장 (오라클은 1부터 시작함(endrow 필요)/mySql은 limit을 계산할 필요 X)
	// ex) 1 Page : 1, 2 Page :11, 3 Page : 21, 4 Page : 31,...
	int startRow = (pageNum - 1) * pageSize + 1;
	
	//현재 페이지에 대한 게시글 종료 행번호를 계산하여 저장
	// ex) 1 Page : 10, 2 Page : 20, 3 Page : 30, 4 Page : 40,... 
	int endRow = pageNum * pageSize;
	
	//마지막 페이지에 대한 게시글 종료형 번호를 검색 게시글의 갯수로 변경 
	if (endRow > totalReviewBoard) {
		endRow = totalReviewBoard;
	}
	
	//게시글의 시작 행번호와 종료 행번호를 전달받아 BOARD 테이블에 
	//저장된 게시글에서 시작과 종료 범위에 포함된 게시글만 검색하여 반환하는 DAO 클래스의 메소드 호출
	//List<BoardDTO> boardList = BoardDAO.getDAO().selectBoard(startRow, endRow);
	List<ProdReviewDTO> boardReviewList = ProdReviewDAO.getDAO().selectReviewBoard(startRow, endRow, search, keyword);
	
	//현재 페이지의 게시글 목록에 출력될 시작 글번호를 계산하여 저장
	int number = totalReviewBoard - (pageNum - 1) * pageSize;
	
	//세션에 저장된 권한 관련 정보를 반환받아 저장
	// => 로그인 사용자에게만 글쓰기 권한 부여
	// => 비밀글인 경우 게시글 작성자와 관리자에게 상세보기 권한 부여 
	UserInfoDTO loginMember = (UserInfoDTO) session.getAttribute("loginMember");
	
	//시스템의 현재 날짜를 반환받아 저장
	// => 게시글 작성일자를 현재 날짜와 비교하여 출력
	String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>JM 리뷰</title>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/css_02.css" rel="stylesheet" type="text/css" />
<link href="khm/css/mp_main.css" rel="stylesheet" type="text/css" />
<link href="khm/css/info.css" rel="stylesheet" type="text/css" />
<link href="css/nanumsquareround.css" rel="stylesheet" type="text/css" />

<style type="text/css">
.mem_title {
    padding: 70px 0 0;
    font-size: 35px;
    font-family: 'Nanum Gothic';
    color: #87a1c4;
    padding-bottom: 5px;
}
.table-d2-list {
    border-left: 1px solid #ddd;
    border-right: 1px solid #ddd;
}
.table-d2-list thead th {
    padding: 13px 0 11px;
    font-weight: 600;
    vertical-align: middle;
    background: #f7f7f7;
    font-size: 14px;
    color: #353535;
}

body, h1, h2, h3, h4, h5, h6, table, input, select, textarea, a {
    font-size: 12px;
    line-height: 1.25;
    color: #777;
}
.tb-center {
    text-align: center;
}
.tb-left, .tb-center, .tb-right {
    padding: 0 10px;
}
.table-d2-list tbody td {
    padding: 10px 0 7px;
    border-top: 1px solid #e9e9e9;
    text-align: center;
    vertical-align: middle;
}
</style>

</head>
<body id="page-top">
	<div id="content" class="container" style="margin-left: 230px; margin-top: 50px; margin-bottom: 100px;">

		<div class="mem_title">내 게시물 관리</div>

		<div id="myHistory">
			<div class="page-body">
					<% if(loginMember != null) {//로그인 사용자인 경우 %>
						<div id="btn" align="right" style="margin-right: 610px; margin-bottom: 10px;">
						<button type="button" id="writeBtn">글쓰기</button>
						</div>
					<% } %>
				<div class="table-d2-list">
					<table border="1px solid black;" style="font-size: 15px;">
						<tr>
							<th width="100">번호</th>
							<th width="100">상품코드</th>
							<th width="500">제목</th>
							<th width="100">날짜</th>
							<th width="100">작성자</th>
							<th width="100">조회수</th>
						</tr>

						<% 	if (totalReviewBoard == 0) { %>
						<tr>
							<td colspan="6">검색된 게시글이 하나도 없습니다.</td>
						</tr>
						<% } else { %>
							<%-- 게시글 목록 출력 - 반복처리 --%>
							<% for (ProdReviewDTO review : boardReviewList) {%>
							<tr>
							<%-- 글번호 --%>
							<td><%= number %></td>
							
							<%-- 상품코드 --%>
							<td><%=review.getProdCd()%> </td>
							
							<%-- 제목 --%>
							<td class="subject">
							<%-- 게시글 상태에 대한 제목 출력과 하이퍼 링크 설정--%>
							<% if(review.getStatus()== 0) {//일반 게시글인 경우%>
								<a href="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_reviewDetail&num=<%=review.getPostNo()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=review.getSubject()%></a>
							<% } else if(review.getStatus() == 1) {//비밀 게시글인 경우 %>
								<span class="secret">비밀글</span>
									<% if(loginMember != null && (loginMember.getUserId().equals(review.getId()) || Integer.parseInt(loginMember.getUserDv())==1)) {%>
										<a href = "<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_reviewDetail&num=<%=review.getPostNo()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=review.getSubject() %></a>
									<% } else { %>
										작성자 또는 관리자만 확인 가능합니다.
									<% } %>
							<% } else if(review.getStatus()==9){//삭제 게시글인 경우 %>
								<span class="remove">삭제글</span>
								작성자 또는 관리자에 의해 삭제된 게시글입니다.
							<% } %>
							</td>
							<% if(review.getStatus() != 9) {//삭제글이 아닌 경우 %>
								<%-- 날짜 --%>
								<td>
									<%-- 오늘 작성된 게시글은 시간만 출력되어 과거에 작성된 경우 날짜와 시간 출력 --%> 
									<% if (currentDate.equals(review.getFrstRgstDttm().substring(0, 10))) { %>
									<%=review.getFrstRgstDttm().substring(11, 19)%>
									<% } else {%>
									<%=review.getFrstRgstDttm().substring(0, 19)%>
									<% } %>
								</td>
								<%-- 작성자 --%>
								<td><%=review.getWriter()%></td>
								<%-- 조회수 --%>
								<td><%=review.getReadcount()%></td>
								
							<% } else { //삭제글인 경우(아무것도 출력되지 않도록 함) %>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							<% } %>
						</tr>
						<%	number--; %>
					<%	} %>
				<%	} %>
					</table>

					<%-- 페이지 번호와 하이퍼 링크 설정 --%>
					<%
						//블럭에 출력될 페이지 번호의 갯수 설정
					int blockSize = 5;

					//블럭에 출력될 시작 페이지 번호를 계산하여 저장
					// => 1 Block : 1, 2 Block : 6, 3 Block : 11, 4 Block : 16,...
					int startPage = (pageNum - 1) / blockSize * blockSize + 1;

					//블럭에 출력될 종료 페이지 번호를 계산하여 저장
					// => 1 Block : 5, 2 Block : 10, 3 Block : 15, 4 Block : 20,...
					int endPage = startPage + blockSize - 1;

					//마지막 블럭에 종료 페이지 번호 변경
					if (endPage > totalReviewPage) {
						endPage = totalReviewPage;
					}
					%>
					<div>
						<% if (startPage > blockSize) { %>
						<a
							href="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_review&pageNum=1&search=<%=search%>&keyword=<%=keyword%>">[◀◀]</a>
						<a
							href="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_review&pageNum=<%=startPage-blockSize%>&search=<%=search%>&keyword=<%=keyword%>">[◀]</a>
						<%	} else { %>
						[◀◀][◀]
						<% }	%>

						<% for (int i = startPage; i <= endPage; i++) {	%>
							<% if (pageNum != i) {	%>
							<a href="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_review&pageNum=<%=i%>&search=<%=search%>&keyword=<%=keyword%>">[<%=i%>]
							</a>
							<%	} else { %>
							<span style="font-size: 18px; font-weight: bold">[<%=i%>]</span>
							<%	}	%>
						<% } %>

						<%if (endPage != totalReviewPage) { %>
						<a
							href="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_review&pageNum=<%=startPage + blockSize%>&search=<%=search%>&keyword=<%=keyword%>">[▶]</a>
						<a
							href="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_review&pageNum=<%=totalReviewPage%>&search=<%=search%>&keyword=<%=keyword%>">[▶▶]</a>
						<% } else {	%>
						[▶][▶▶]
						<% } %>
					</div>
					<br>
				</div>
				<form action="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_review" method="post">
					<select name="search">
						<option value="writer" selected="selected">&nbsp;작성자&nbsp;
						</option>
						<option value="subject">&nbsp;제목&nbsp;</option>
						<option value="content">&nbsp;내용&nbsp;</option>
					</select> <input type="text" name="keyword">
					<button type="submit">검색</button>\
				<input type="hidden" name="pageNum" value="<%=pageNum%>">
				</form>
				<ol class="paging">
				</ol>
			</div>
			<!-- .page-body -->
		</div>
	</div>

              <!-- Footer-->
<script type="text/javascript">
$("#writeBtn").click(function() {
	location.href = "<%=request.getContextPath()%>/index.jsp?workgroup=review&work=review_write";
});
</script>


	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="assets/mail/jqBootstrapValidation.js"></script>
	<script src="assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
</body>
</html>
