<%@page import="jm_dao.ProdReviewDAO"%>
<%@page import="jm_dto.ProdReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달된 게시글(새글 또는 답글)을 반환받아 BOARD 테이블에 저장하고 게시글 목록 출력페이지(board_list.jsp)로 이동하는 JSP 문서 --%>
<%-- => 로그인 사용자만 게시글 쓰기 기능 제공 --%>
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
	/* 답글 안함
	int ref = Integer.parseInt(request.getParameter("ref"));
	int reStep = Integer.parseInt(request.getParameter("reStep"));
	int reLevel = Integer.parseInt(request.getParameter("reLevel"));
	*/
	//String pageNum = request.getParameter("pageNum");
	
	//입력값에서 태그 관련 기호를 Escape 문자로 변환하여 저장
	// => XSS 공격에 대한 방어법
	String subject = request.getParameter("subject").replace("<", "&lt;").replace("<", "&gt;");
	int status = 0;//0(초기값) - 일반글
	if(request.getParameter("secret")!=null) { //비밀글인 경우
		status = Integer.parseInt(request.getParameter("secret"));//1 - 비밀글
	}			
	String content = request.getParameter("content").replace("<", "&lt;").replace("<", "&gt;");
	
	//글번호 다음값을 검색하여 반환하는 DAO 클래스의 메소드 호출 - 글번호
	String num = request.getParameter("prodNo");
	//ProdReviewDTO review = ProdReviewDAO.getDAO().selectNumBoard(num);
	//int num = Integer.parseInt(review.getPostNo());
	
	
	//클라이언트의 IP 주소를 반환받아 저장
	//request.getRemoteAddr() : 클라이언트의 IP 주소를 반환하는 메소드
	// => 이클립스에 의해 동작되는 WAS는 IPV6의 128bit 형태의 IP 주소 제공
	// => Run >> Run Configurations... >> Apache Tomcat >> Tomcat Name 
	//	>> Arguments >> VM Arguments >> [-Djava.net.preferIPv4Stack=true] 추가
	String ip = request.getRemoteAddr();
	//System.out.println("ip = "+ip);

	
	//DTO 인스턴스를 생성하고 필드값 변경
	ProdReviewDTO review = new ProdReviewDTO();
	review.setPostNo(review.getPostNo());
	review.setId(loginMember.getUserId());
	review.setWriter(loginMember.getUserNm());
	review.setSubject(subject);
	review.setContent(content);
	review.setIp(ip);
	review.setStatus(status);

	
	//게시글을 전달받아 BOARD 테이블에 저장하는 DAO 클래스의 메소드 호출
	ProdReviewDAO.getDAO().insertReview(review);
	
	//게시글 목록 출력페이지 이동
		out.println("<script type = 'text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=review&work=jm_review';");
		out.println("</script>");
%>
