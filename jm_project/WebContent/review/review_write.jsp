<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글(새글 또는 답글)을 입력받기 위한 JSP 문서 --%>
<%-- => 로그인 사용자만 게시글 쓰기 기능 제공 --%>
<%-- => [글저장]을 클릭한 경우 게시글 저장 처리페이지(board_write_action.jsp) 요청 - 입력값 전달--%>
<%@include file = "/kdy/security/login_check.jspf" %>
<%
	String pageNum = "1";
	pageNum = request.getParameter("pageNum");
%>
<style type="text/css">
table {
	margin: 0 auto;
}

th {
	width: 70px;
	font-weight: normal;
	font-size: 15px;
}

td {
	text-align: left;
}
</style>

<form action="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=review_write_action" method="post" id="boardForm">
	
	<table style="margin: 30px;">
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="subject" id="subject" size="60">
				<input type="checkbox" name="secret" value="1">비밀글 
			</td> 
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea rows="7" cols="60" name="content" id="board_content"></textarea>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit">글저장</button>
				<button type="reset" id="resetBtn">다시쓰기</button>
			</th>
		</tr>
	</table>	
</form>
<div id="message" style="color: red;"></div>

<script type="text/javascript">
$("#subject").focus();

$("#boardForm").submit(function() {
	if ($("#subject").val()=="") {
		$("#message").text("제목을 입력해주세요.");
		$("#subject").focus();
		return false;
	}
	
	if ($("#board_content").val()=="") {
		$("#message").text("내용을 입력해주세요.");
		$("#board_content").focus();
		return false;
	}
});

$("#resetBtn").click(function() {
	$("#subject").focus();
	$("#message").text("");
	
});
</script>

