<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm_dao.ProdReviewDAO"%>
<%@page import="jm_dto.ProdReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/css_02.css" rel="stylesheet" type="text/css" />
<link href="css/header.css" rel="stylesheet" type="text/css" />
<link href="css/footer.css" rel="stylesheet" type="text/css" />
<link href="khm/css/new_join.css" rel="stylesheet" type="text/css" />
<link href="css/nanumsquareround.css" rel="stylesheet" type="text/css" />
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
#board_detail {
	width: 500px;
	margin: 0 auto;
}

table {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 5px;
}

th {
	width: 100px;
}

td {
	width: 400px;
}

.subject, .content { text-align: left; }

.content {
	height: 100px;
	vertical-align: middle;
}

#board_menu {
	text-align: right;
	margin: 5px;
}
</style>

<div id="board_detail">
	<h2>게시글</h2>
	<table>
		<tr>
			<th>작성자</th>
			<td>
				<%=review.getWriter() %>
				<%-- 로그인 사용자가 관리자인 경우 
				<% if(loginMember!= null && Integer.parseInt(loginMember.getUserDv()) == 1)  {%>
					[<%=review.getIp() %>]
				<% } %>--%>
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><%=review.getFrstRgstDttm().substring(0,19) %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=review.getReadcount()+1 %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td class="subject">
				<% if(review.getStatus()==1) { %>[비밀글]<% } %>
				<%=review.getSubject() %>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td class="content">
				<%= review.getContent().replace("\n", "<br>") %> 
			</td>
		</tr>
	</table>

	<div id="board_menu">
		<%-- 로그인 사용자가 작성자이거나 관리자인 경우 --%>
		<% if(loginMember != null && (loginMember.getUserId().equals(review.getId()) || Integer.parseInt(loginMember.getUserDv()) == 1)) { %>
		<button type="button" id="removeBtn">글삭제</button>
		<button type="button" id="modifyBtn">글변경</button>
		<% } %>
		<button type="button" id="listBtn" >글목록</button>
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

$("#replyBtn").click(function() {
	$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=review&work=review_write");
	$("#boardForm").submit();
});

$("#listBtn").click(function() {
	$("#boardForm").attr("action","<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_review");
	$("#boardForm").submit();
});
</script>
