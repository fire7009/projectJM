<%@page import="jm_dto.NoticeDTO"%>
<%@page import="jm_dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String noticeNo=request.getParameter("notice_no");
	
	int number=Integer.parseInt(noticeNo);
	
	NoticeDTO notice=NoticeDAO.getDAO().selectNumNotice(number);
	
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

table {
	margin: 0 auto;
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


				<div class="bbs-table-view">
					<table summary="게시글 보기">
						<caption>게시글 보기</caption>
						<tbody>
							<tr class="">
								<th scope="row">제목</th>
								<td><%=notice.getNoticeTitle() %></td>
							</tr>
							<tr>
								<th scope="row">작성자</th>
								<td>관리자</td>
							</tr>
							<tr class="etcArea ">
								<td colspan="2"><ul>
										<li class=""><strong class="th">작성일</strong> <span
											class="td"><%=notice.getNoticeDate() %></span></li>
										<li class=""><strong class="th">조회수</strong> <span
											class="td"><%=notice.getNoticeReadcount() %></span></li>
									</ul></td>
							</tr>

							<tr>
								<td colspan="2" style="padding: 0px;">
									<div class="data-bd-cont">

											<a><%=notice.getNoticeContents() %></a>
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
								<a href="#" class="none"><img src="../img/btn_wModify2.gif" alt="수정"></a> 
								<a href="#"><img src="../img/btn_delete2.gif" alt="삭제"></a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="write" href="#"><img src="../img/btn_wWrite2.gif" alt="글쓰기"></a> 
								<a href="#"><img src="../img/btn_list2.gif" alt="목록"></a>
							</dd>
						</dl>
				</div>
			</div>
			<!-- .page-body -->
		</div>
		<!-- #bbsData -->
	</div>
</div>