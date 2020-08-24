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
	margin-top: 20px;
	margin-bottom: 100px;
	width: 800px;
	 border-top: 1px solid gray;
	 border-collapse: collapse;
	}
	
	th {
	width: 70px;
	font-weight: bold;'
	font: sans-serif;
	font-size : 16px;
	padding: 20px 10px 10px 20px;
	
	}
	
	td {
	text-align: left;
	font: sans-serif;
	font-size : 16px;
	padding: 20px 10px 10px 20px;
	}
	

</style>


<div class="title1" style="margin-left:30%; margin-top:100px; font-size:20px; font-weight:bold; color:#333;">게시글 작성</div>

<form action="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=review_write_action" method="post" id="boardForm">

<table>
   <tr>
      <th style="">제목</th>
      <td>
         <input type="text" name="subject" id="subject" size="40" style="height: 20px; ">
         <input type="checkbox" name="secret" value="1" style="height: 15px; width: 15px;">비밀글 
      </td> 
   </tr>
   
   <tr>
      <th>내용</th>
      <td style="margin-bottom: 20px;">
         <textarea rows="7" cols="60" name="content" id="board_content"></textarea>
      </td>
   </tr>
   
   <tr>
   </tr>
   
   <tr>
      <th colspan="2">
         <button type="submit" style="border: none;"><img src="./img/btn_wWrite.gif" alt="등록"></button>
         <button type="reset" id="resetBtn" style="border: none;"><img src="./img/btn_Reset.gif" alt="다시입력"></button>
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

