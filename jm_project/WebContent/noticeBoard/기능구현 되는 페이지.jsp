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
    <!--allStore_contents-->
<div id="allStore_contents">
<div class="allStore_layout">
            
<!--타이틀, 현재위치-->
<div class="ec-base-table typeWrite ">
            <table border="1" summary="">
<caption>게시판 상세<%=board.getNoticeReadcount()+1 %></caption>
            <colgroup>
<col style="width:130px;">
<col style="width:auto;">
</colgroup>
<tbody>
<tr>
<th scope="row">제목</th>
                    <td><%=board.getNoticeTitle() %></td>
                </tr>
<tr>
 <tr class="">
<td  colspan="2">
<textarea style="width: 1200px;" rows="15" cols="200" name="contents" readonly="readonly" ><%=board.getNoticeContents() %> </textarea>
</td>
</tr>
</tbody>
</table>
<div class="ec-base-button ">
<a href="<%=request.getContextPath()%>/index.jsp?workgroup=board&work=boardNotice"><img src="./board/viewnotice/btn_list.gif" alt="목록" style="float:left; margin-left: 40px; "></a>
</div>

</div></div></div>

