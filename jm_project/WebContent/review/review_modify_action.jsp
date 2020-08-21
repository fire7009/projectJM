<%@page import="jm_dao.ProdReviewDAO"%>
<%@page import="jm_dto.ProdReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 변경값을 전달받아 BOARD 테이블에 저장된 게시글을 변경하고 게시글 상세 출력페이지(board_detail.jsp) 이동하는 JSP 문서 --%>
<%@include file="/kdy/security/login_check.jspf"%>
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type = 'text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달값을 반환받아 저장
	String postNo = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	String keyword = request.getParameter("keyword");
	
	String subject = request.getParameter("subject").replace("<", "&lt;").replace("<", "&gt;");
	int status = 0;
	if(request.getParameter("secret")!=null) {
		status = Integer.parseInt(request.getParameter("secret"));
	}			
	String content = request.getParameter("content").replace("<", "&lt;").replace("<", "&gt;");
	
	//DTO 인스턴스를 생성하고 필드값 변경
	ProdReviewDTO review = new ProdReviewDTO();
	review.setPostNo(postNo);
	review.setSubject(subject);
	review.setContent(content);
	review.setStatus(status);
	
	//게시글을 전달받아 BOARD 테이블에 저장된 해당 게시글을 변경하는 DAO 클래스의 메소드 호출
	ProdReviewDAO.getDAO().updateReview(review);
	
	//게시글 상세 출력페이지 이동
	out.println("<script type = 'text/javascript'>");
	out.println("location.href='"+request.getContextPath()
		+"/index.jsp?workgroup=review&work=jm_reviewDetail&num="+postNo
		+"&pageNum="+pageNum+"&search="+search+"&keyword"+keyword+"';");
	out.println("</script>");
	
%>

