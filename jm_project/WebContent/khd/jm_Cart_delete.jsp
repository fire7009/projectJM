<%@page import="jm_dao.CartHisDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 학번을 전달받아 STUDENT 테이블에 저장된 해당 학번의 학생정보를
삭제하고 학생정보 검색 출력페이지(displayStudent.jsp)로 이동하는 JSP 문서 --%>    
<%

	String his=request.getParameter("his");
	String prodCd=request.getParameter("prodCd");
	String user=request.getParameter("user");


	int rows=CartHisDAO.getDAO().delCart(user,his);

	//비정상적인 요청에 대한 응답 처리
	if(rows<=0) {//삭제된 학생정보가 없는 경우
		session.setAttribute("message", "삭제하고자 하는 장바구니 목록이 없습니다.");
	}
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khd&work=jm_Cart&prodCd="+prodCd+"&user="+user+"';");
	out.println("</script>");
%>


