<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/kdy/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//입력값을 반환받아 저장
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	
	//로그인 사용자의 비밀번호와 입력 비밀번호 비교
	if(!loginMember.getPassword().equals(password)) {//비밀번호가 틀린 경우
		session.setAttribute("message", "비밀번호가 맞지 않습니다.");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khm&work=jm_deleteInfo_confirm';");
		out.println("</script>");
		return;
	}
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 해당 아이디의 회원정보를
	//삭제하는 DAO 클래스의 메소드 호출
	UserInfoDAO.getDAO().deleteMember(loginMember.getUserId());
	
	
	//로그아웃 처리페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=member&work=member_logout_action';");
	out.println("</script>");
%>    