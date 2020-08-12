<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 인증정보를 전달받아 MEMBER 테이블에 저장된 회원정보를 이용하여
인증 처리후 페이지를 이동하는 JSP 문서 --%>
<%-- => 인증성공 : 세션에 권한 관련 정보를 저장하고 기존 요청페이지로 이동 --%>
<%--    (기존 요청페이지가 없는 경우 메인페이지로 이동) --%>    
<%-- => 인증실패 : 세션에 메세지와 아이디를 저장하고 로그인 입력페이지로 이동 --%>
<%
	//비정상적인 요청에 대한 응답처리
	if(request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=error&work=error400';");
		out.println("</script>");
		return;
	}

	//입력값을 반환받아 저장
	String id=request.getParameter("id");
	String passwd=Utility.encrypt(request.getParameter("passwd"));
	
	//인증처리 - 아이디와 비밀번호 비교
	
	//아이디에 대한 인증 처리
	//아이디를 전달받아 userInfo 테이블에 저장된 회원정보를 검색하여 반환하는 DAO 클래스의 메소드 호출
	// => null 반환 : 회원정보 미검색 - 아이디에 대한 인증 실패
	// => 회원정보 반환 : 회원정보 검색 - 아이디에 대한 인증 성공
	UserInfoDTO userInfo=UserInfoDAO.getDAO().selectIdIdUserinfo(userId);
	if(userInfo==null) {
		session.setAttribute("message", "입력한 아이디가 존재하지 않습니다.");
		session.setAttribute("id", id);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=member&work=member_login';");
		out.println("</script>");
		return;
	}
	
	//비밀번호에 대한 인증 처리
	if(!userInfo.getPassword().equals(password)) {//비밀번호에 대한 인증 실패
		session.setAttribute("message", "입력한 아이디가 없거나 비밀번호가 맞지 않습니다.");
		session.setAttribute("id", id);
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=member&work=member_login';");
		out.println("</script>");
		return;
	}
	
	//아이디를 전달받아 MEMBER 테이블에 저장된 회원정보 중 마지막 로그인
	//날짜를 변경하는 DAO 클래스의 메소드 호출
	UserInfoDAO.getDAO().updateLastLogin(id);
	
	//세션에 권한 관련 정보(회원정보) 저장
	session.setAttribute("loginMember", UserInfoDAO.getDAO().selectIdIdUserinfo(userId);
	
	//세션에 저장된 기존 요청페이지의 URL 주소를 반환받아 저장
	String url=(String)session.getAttribute("url");
	
	//페이지 이동
	if(url==null) {//기존 요청페이지가 없는 경우 - 메인페이지 이동
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/site/index.jsp?workgroup=product&work=product_list';");
		out.println("</script>");
	} else {//기존 요청페이지가 있는 경우 - 기존 요청페이지 이동
		session.removeAttribute("url");
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+url+"';");
		out.println("</script>");
	}
%>











