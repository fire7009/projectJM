<%@page import="jm_dao.NoticeDAO"%>
<%@page import="jm_dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//전달값을 반환받아 저장
	int noticeNo=Integer.parseInt(request.getParameter("noticeNo"));
	String pageNum=request.getParameter("pageNum");
	String search=request.getParameter("search");
	String keyword=request.getParameter("keyword");
	
	//게시글 번호를 전달받아 BOARD 테이블에 저장된 게시글을 검색하여 반환하는 DAO 클래스의 메소드 호출
	NoticeDTO board=NoticeDAO.getDAO().selectNumBoard(noticeNo);
	
	NoticeDAO.getDAO().updateReadCount(noticeNo);
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
<div class="cs_title"> 공지사항</div>	
<div
	class="xans-element- xans-board xans-board-read-4 xans-board-read xans-board-4">
	<div class="boardView">
		<div id="bbsData">
			<div class="page-body">


				<div class="bbs-table-view">
					<table summary="게시글 보기">
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
							<tr class="etcArea ">
								<td colspan="2"><ul>
										<li class=""><strong class="th">작성일</strong> <span
											class="td"><%=board.getNoticeDate().substring(0, 19) %></span></li>
										<li class=""><strong class="th">조회수</strong> <span
											class="td"><%=board.getNoticeReadcount() %></span></li>
									</ul></td>
							</tr>

							<tr>
								<td colspan="2" style="padding: 0px;">
									<div class="data-bd-cont">

											<a><%=board.getNoticeContents() %></a>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<hr size="1" color="#E5E5E5">
					<div class="view-link">
						<dl class="bbs-link con-link">
							<dt></dt>
							<dd>
								<a
									href="<%=request.getContextPath() %>/index.jsp?workgroup=noticeBoard&work=jm_noticeUpdate"
									class="none"><img src="../img/btn_wModify2.gif"
									alt="수정"></a> <a
									href="/board/board.html?code=vittz_board1&amp;page=1&amp;board_cate=&amp;num1=999968&amp;num2=00000&amp;type=q&amp;type2=d"><img
									src="../img/btn_delete2.gif" alt="삭제"></a>
							</dd>
						</dl>
						<dl class="bbs-link">
							<dt></dt>
							<dd>
								<a class="write"
									href="<%=request.getContextPath() %>/index.jsp?workgroup=noticeBoard&work=jm_noticeWrite"><img
									src="../img/btn_wWrite2.gif" alt="글쓰기"></a> <a
									href="<%=request.getContextPath() %>/index.jsp?workgroup=noticeBoard&work=jm_noticeList">
									<img src="../img/btn_list2.gif" alt="목록">
								</a>
							</dd>
						</dl>
					</div>

				</div>
			</div>
			<!-- .page-body -->
		</div>
		<!-- #bbsData -->
	</div>
</div>