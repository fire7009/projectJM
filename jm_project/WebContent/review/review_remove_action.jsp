<%@page import="jm_dao.ProdReviewDAO"%>
<%@page import="jm_dto.ProdReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 게시글번호를 전달받아 BOARD 테이블에 저장된 해당 게시글을 삭제하고
게시글 목록 출력페이지(board_list.jsp)로 이동하는 JSP 문서 --%>
<%@include file = "/kdy/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 처리
	if(request.getParameter("num")==null) {
		out.println("<script type = 'text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	//전달값을 반환받아 저장
	int num = Integer.parseInt(request.getParameter("num"));
	
	//게시글번호를 전달받아 BOARD 테이블에 저장된 해당 게시글을 검색하여
	//반환하는 DAO 클래스의 메소드 호출
	ProdReviewDTO review = ProdReviewDAO.getDAO().selectNumBoard(num);
	
	//검색된 게시글이 없거나 삭제글인 경우 >> 비정상적인 요청
	if(review == null || review.getStatus()==9) {
		out.println("<script type = 'text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//로그인 사용자가 작성자 또는 관리자가 아닌 경우 >> 비정상적인 요청
	if(!loginMember.getUserId().equals(review.getId()) && Integer.parseInt(loginMember.getUserDv()) != 1) {
		out.println("<script type = 'text/javascript'>"); 
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}
	
	//게시글번호를 전달받아 BOARD 테이블에 저장된 해당 게시글을 삭제
	//처리하는 처리행의 갯수를 반환하는 메소드 
	// => 게시글의 상태 컬럼값을 삭제 상태로 변경
	ProdReviewDAO.getDAO().deleteReview(num);
	
	//게시글 목록 출력페이지 이동
	out.println("<script type = 'text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=review&work=jm_review';");
	out.println("</script>");
	
%>


