<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/kdy/security/login_check.jspf" %>
<%
	//비정상적인 요청에 대한 응답 처리 - 에러페이지 이동
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//전달된 회원정보(입력값)를 반환받아 저장
	String userId=request.getParameter("userId");
	String password=request.getParameter("password");
	//비밀번호가 입력된 경우 - 새로운 비밀번호로 변경
	if(password != null && !password.equals("")) {
		password = Utility.encrypt(password);
	} else {//비밀번호가 입력되지 않은 경우 - 기존 비밀번호 사용
		password = loginMember.getPassword();
	}
	String userNm= Utility.stripTag(request.getParameter("userNm")) ;
	String postCd=request.getParameter("postCd");
	String basAddr=request.getParameter("basAddr");
	String detlAddr= Utility.stripTag(request.getParameter("detlAddr"));
	String contAddr=request.getParameter("etcphone1")
			+"-"+request.getParameter("etcphone2")
			+"-"+request.getParameter("etcphone3");
	String emailAddr=request.getParameter("email");
	System.out.println("address2 = "+detlAddr);
	System.out.println("postCd = "+postCd);
	System.out.println("email = "+emailAddr);
	
	//DTO 인스턴스를 생성하여 입력값으로 필드값 변경
	UserInfoDTO userInfo=new UserInfoDTO();
	userInfo.setUserId(userId);
	userInfo.setPassword(password);
	userInfo.setUserNm(userNm);
	userInfo.setEmailAddr(emailAddr);
	userInfo.setContAddr(contAddr);
	userInfo.setPostCd(postCd);
	userInfo.setBasAddr(basAddr);
	userInfo.setDetlAddr(detlAddr);
	
	//회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하는 DAO 메소드
	UserInfoDAO.getDAO().updateUserInfo(userInfo);
	
	//세션에 저장된 권한 관련 정보 변경
	session.setAttribute("loginMember", UserInfoDAO.getDAO().selectIdUserinfo(userId));
	
	//회원정보 상세페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=khm&work=jm_myPage';");
	out.println("</script>");
%>
