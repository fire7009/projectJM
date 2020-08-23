<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm_dto.NoticeDTO"%>
<%@page import="jm_dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String noticeNo=request.getParameter("noticeNo");

	int num=Integer.parseInt(noticeNo);
	
	NoticeDTO board=NoticeDAO.getDAO().selectNumBoard(num);
	
	//세션 받아오기
	UserInfoDTO loginMember=(UserInfoDTO)session.getAttribute("loginMember");
	
%>

<style type="text/css">
.cs_title {
	text-align: center;
	font-size:23px;
	font-weight:600;
	color:#333;
	margin-top: 15px;
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
	border-bottom:1px solid #2e2e2e;
	color:#000;
	font-weight:600;
	font-size:14px;
	background: lightgray;
}

.xans-board-read table td {
	padding:15px;
	border-bottom:1px solid #2e2e2e;
	line-height:2em;
	color:#2e2e2e;
	text-align:left;
	font-weight:normal;
	font-size:13px;
}

.bbs-table-hh-view {
    margin-top: 10px;
    border-top: 2px solid #333;
}

table {
	margin: 0 auto;
	width: 1000px;
	font: sans-serif;
	
}

.view-link {
	margin-left: 450px;
}


</style>
<div class="cs_title"> 공지사항</div>	
<div
	class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">
	<div class="boardView">
		<div id="bbsData">
			<div class="page-body">


				<div class="bbs-table-hh-view">
					<table summary="게시글 보기">
						<br>
						<br>
						<br>
						<caption>게시글 보기</caption>
						<tbody>
							<tr class="">
								<th scope="row">제목</th>
								<td><%=board.getNoticeTitle() %></td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>관리자</td>
							</tr>
							<tr class="etcArea " >
							<th class="">작성일</th>
								<td colspan="2">
										<%=board.getNoticeDate() %>
									</td>
									</tr>
									<tr>
										<th>조회수 </th>
									<td>	<%=NoticeDAO.getDAO().updateReadCount(num) %></td> 
							</tr>

							<tr>
								<td colspan="2" style="padding: 0px;">
									<div class="data-bd-cont">

											<a><br><%=board.getNoticeContents() %></a>
									</div>
									<br>
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<br>
					<br>	
					<hr size="1" color="#E5E5E5">
					<div class="view-link">
						<dl class="bbs-link con-link">
							<dt></dt>
							<dd style="margin-bottom: 100px;">
							
									<a href="<%=request.getContextPath() %>/index.jsp?workgroup=noticeBoard&work=jm_noticeUpdate&noticeNo=<%=noticeNo %>" class="none"><img src="./img/btn_wModify2.gif" alt="수정"></a> 
									<a href="<%=request.getContextPath() %>/index.jsp?workgroup=noticeBoard&work=delete_action&noticeNo=<%=noticeNo %>"><img src="./img/btn_delete2.gif" alt="삭제"></a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a class="write" href="<%=request.getContextPath() %>/index.jsp?workgroup=noticeBoard&work=jm_noticeWrite"><img src="./img/btn_wWrite2.gif" alt="글쓰기"></a> 
									<a href="<%=request.getContextPath() %>/index.jsp?workgroup=noticeBoard&work=jm_noticeList"><img src="./img/btn_list2.gif" alt="목록"></a>
 
 							</dd>
						</dl>
				</div>
			</div>
			<!-- .page-body -->
		</div>
		<!-- #bbsData -->
	</div>
</div>

