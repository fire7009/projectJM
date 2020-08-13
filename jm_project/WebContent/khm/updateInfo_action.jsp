<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	String name= Utility.stripTag(request.getParameter("name")) ;
	String email=request.getParameter("email");
	String mobile=request.getParameter("mobile1")
		+"-"+request.getParameter("mobile2")
		+"-"+request.getParameter("mobile3");
	String zipcode=request.getParameter("zipcode");
	String address1=request.getParameter("address1");
	String address2= Utility.stripTag(request.getParameter("address2"));

	//DTO 인스턴스를 생성하여 입력값으로 필드값 변경
	UserInfoDTO userInfo=new UserInfoDTO();
	/*
	member.setId(id);
	member.setPasswd(passwd);
	member.setName(name);
	member.setEmail(email);
	member.setMobile(mobile);
	member.setZipcode(zipcode);
	member.setAddress1(address1);
	member.setAddress2(address2);
	*/
	//회원정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 변경하는 DAO 메소드
	UserInfoDAO.getDAO().updateUserInfo(userInfo);
	
	//세션에 저장된 권한 관련 정보 변경
	session.setAttribute("loginMember", UserInfoDAO.getDAO().selectIdUserinfo(userId));
	
	//회원정보 상세페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=member&work=member_detail';");
	out.println("</script>");
%>
