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
	if(search == null) search = "";
	String keyword = request.getParameter("keyword");
	if(keyword == null) keyword = "";
	
	//전달된 페이지 번호를 반환받아 저장
	// => 전달값이 존재하지 않을 경우 첫번째 페이지 검색 (pageNum -> 페이지번호)
	int pageNum = 1;//
	if(request.getParameter("pageNum")!=null) {//전달값이 있는 경우
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//하나의 페이지에 출력될 게시글 갯수 설정
	int pageSize = 10;
	
	//BOARD 테이블에 저장된 전체 게시글의 갯수를 검색하여 반환하는 DAO 클래스의 메소드 호출
	//int totalBoard=BoardDAO.getDAO().selectBoardCount();
	//리뷰 테이블에 저장된 전체 게시글 중 카테고리를 검색하여 반환
	int totalReviewBoard=ProdReviewDAO.getDAO().selectReviewCount(search, keyword);
	
	//검색 게시글에 대한 페이지의 갯수를 계산하여 저장
	//int totalPage = totalBoard/pageSize+(totalBoard%pageSize==0?0:1);
	int totalReviewPage = (int)Math.ceil((double)totalReviewBoard/pageSize);
	
	//전달된 페이지 번호에 대한 검증
	if(pageNum<=0 || pageNum>totalReviewPage) {//페이지 번호가 잘못된 경우
		pageNum=1;
	}
	
	//현재 페이지에 대한 게시글 시작 행번호를 계산하여 저장 (오라클은 1부터 시작함(endrow 필요)/mySql은 limit을 계산할 필요 X)
	// ex) 1 Page : 1, 2 Page :11, 3 Page : 21, 4 Page : 31,...
	int startRow = (pageNum-1)*pageSize+1;
	
	//현재 페이지에 대한 게시글 종료 행번호를 계산하여 저장
	// ex) 1 Page : 10, 2 Page : 20, 3 Page : 30, 4 Page : 40,... 
	int endRow = pageNum*pageSize;
	
	//마지막 페이지에 대한 게시글 종료형 번호를 검색 게시글의 갯수로 변경 
	if(endRow>totalReviewBoard) {
		endRow = totalReviewBoard;
	}
	
	//게시글의 시작 행번호와 종료 행번호를 전달받아 BOARD 테이블에 
	//저장된 게시글에서 시작과 종료 범위에 포함된 게시글만 검색하여 반환하는 DAO 클래스의 메소드 호출
	//List<BoardDTO> boardList = BoardDAO.getDAO().selectBoard(startRow, endRow);
	List<ProdReviewDTO> boardReviewList = ProdReviewDAO.getDAO().selectReviewBoard(startRow, endRow, search, keyword);
	
	//현재 페이지의 게시글 목록에 출력될 시작 글번호를 계산하여 저장
	int number = totalReviewBoard-(pageNum-1)*pageSize;
	
	
	//세션에 저장된 권한 관련 정보를 반환받아 저장
	// => 로그인 사용자에게만 글쓰기 권한 부여
	// => 비밀글인 경우 게시글 작성자와 관리자에게 상세보기 권한 부여 
	UserInfoDTO loginMember = (UserInfoDTO)session.getAttribute("loginMember");
	
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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/css_02.css" rel="stylesheet" type="text/css" />
<link href="css/header.css" rel="stylesheet" type="text/css" />
<link href="css/footer.css" rel="stylesheet" type="text/css" />
<link href="css/new_join.css" rel="stylesheet" type="text/css" />
<link href="css/nanumsquareround.css" rel="stylesheet" type="text/css" />

</head>
<body id="page-top">
	<div id="content" class="container">

		<div class="mem_title">내 게시물 관리</div>

		<div id="myHistory">
			<div class="page-body">
				<div class="total-page">
					<p class="total">총 게시글 : 0건</p>
					<p class="page">PAGE 1/1</p>
				</div>
				<div class="table-d2-list">
				
				<!-- 쌤 코드 -->
				
	<table>
		<tr>
			<th width="100">번호</th>
			<th width="100">게시판</th>
			<th width="500">제목</th>
			<th width="100">날짜</th>
			<th width="100">조회수</th>
		</tr>
		
		<% if(totalReviewBoard == 0) { %>
		<tr>
			<td colspan="5">검색된 게시글이 하나도 없습니다.</td>
		</tr>
		<% } else {%>
		<%-- 게시글 목록 출력 - 반복처리 --%>
			<% for(ProdReviewDTO boardReview:boardReviewList) { %>
			<tr>
				<%-- 글번호 --%>
				<td><%=number %></td>
				
				<%-- 제목 --%>
				<td class="subject">
				<% if(boardReview.getReStep() != 0) {//답글인 경우 %>
					<%-- 왼쪽 여백을 답글 깊이에 따라 다르게 출력 --%>
					<span style="margin-left: <%=boardReview.getReLevel()*20%>px;">┗[답글]</span>
				<% } %>
				
				<%-- 게시글 상태에 대한 제목 출력과 하이퍼 링크 설정
				<% if(board.getStatus() == 0) {//일반 게시글인 경우%>
					<a href="<%=request.getContextPath()%>/site/index.jsp?workgroup=board&work=board_detail&num=<%=board.getNum()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=board.getSubject()%></a>
				<% } else if(board.getStatus() == 1) {//비밀 게시글인 경우 %>
					<span class="secret">비밀글</span>
					<% if(loginMember != null && (loginMember.getId().equals(board.getId()) || loginMember.getStatus()==9)) {%>
						<a href = "<%=request.getContextPath()%>/site/index.jsp?workgroup=board&work=board_detail&num=<%=board.getNum()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=board.getSubject() %></a>
					<% } else { %>
						작성자 또는 관리자만 확인 가능합니다.
					<% } %>
				<% } else if(board.getStatus()==9){//삭제 게시글인 경우 %>
					<span class="remove">삭제글</span>
					작성자 또는 관리자에 의해 삭제된 게시글입니다.
				<% } %> --%>
				</td>
				
				<% if(boardReview.getStatus() != 9) {//삭제글이 아닌 경우 %>
				<%-- 작성자 --%>
				<td><%=loginMember.getUserNm() %></td>
				
				<%-- 조회수 --%>
				<td><%=boardReview.getReadcount() %></td>
				
				<%-- 작성일 --%>
				<td>
				<%-- 오늘 작성된 게시글은 시간만 출력되어 과거에 작성된 경우 날짜와 시간 출력 --%>
				<% if(currentDate.equals(boardReview.getFrstRgstDttm().substring(0,10))) { %>
					<%= boardReview.getFrstRgstDttm().substring(11, 19) %>
				<% } else { %>
					<%= boardReview.getFrstRgstDttm().substring(0, 19) %>
				<% } %>
				</td>				
				
				
				<% } else { //삭제글인 경우(아무것도 출력되지 않도록 함) %>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<% } %>
			</tr>
			<% number--; %>
			<% } %>		
		<% } %>
	</table>
				
				<!-- 기존 코드
					<table summary="번호, 게시판, 제목, 날짜, hit수">
						<caption>내 게시글 리스트</caption>
						<colgroup>
							<col width="65">
							<col width="100">
							<col width="*">
							<col width="100">
							<col width="65">
						</colgroup>
						<thead>
							<tr>
								<th scope="row"><div class="tb-center">번호</div></th>
								<th scope="row"><div class="tb-center">게시판</div></th>
								<th scope="row"><div class="tb-center">제목</div></th>
								<th scope="row"><div class="tb-center">날짜</div></th>
								<th scope="row"><div class="tb-center">hit수</div></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="5"><div class="tb-center">작성된 게시글이 없습니다.</div></td>
							</tr>
						</tbody>
					</table>
					 -->
					
					
				</div>
					<form action=""
						method="post">
						<select name="search">
							<option value="writer" selected="selected">&nbsp;작성자&nbsp;
							</option>
							<option value="subject">&nbsp;제목&nbsp;</option>
							<option value="content">&nbsp;내용&nbsp;</option>
						</select> <input type="text" name="keyword">
						<button type="submit">검색</button>
					</form>
				<ol class="paging">
				</ol>
			</div>
			<!-- .page-body -->
		</div>
	</div>
	
	<!-- #myHistory -->
	<!-- crema.me / PC 내 게시글 / 스크립트를 수정할 경우 연락주세요 (support@crema.me) -->
	<!-- <div class="crema-reviews crema-applied" data-type="my-reviews" style="margin-top: 40px;"><iframe id="crema-reviews-1" src="%EB%82%B4%20%EA%B2%8C%EC%8B%9C%EA%B8%80%20%EB%B3%B4%EA%B8%B0_files/reviews.html" scrolling="no" allowtransparency="true" name="crema-reviews-1-1596558827529" style="visibility: visible; height: 393px;" width="100%" height="100%" frameborder="0"></iframe></div>
            </div>
            
              <!-- Footer-->


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
