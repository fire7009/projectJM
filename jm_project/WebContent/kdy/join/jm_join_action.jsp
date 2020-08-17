<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 회원정보를 전달받아 userInfo 테이블에 저장하고 로그인 입력페이지 (jm_joinComplete.jsp)로 이동하는 JSP 문서 --%>    
<%

	//비정상적인 요청에 대한 응답 처리 - 에러페이지 이동
	if(request.getMethod().equals("GET")) {
		//Content 영역에 포함되는 JSP 문서이므로 리다이텍트 이동 불가능
		// => 자바스트립트를 이용하여 페이지 이동
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp';");
		out.println("</script>");
		return;
	}

	//Content 영역에 포함되는 JSP 문서이므로 입력값에 대한 캐릭터셋 변경 불가능
	// => 템플릿 페이지에서 입력값에 대한 캐릭터셋 변경

	//전달된 회원정보(입력값)를 반환받아 저장
	String userId=request.getParameter("userId");
	//반환받은 입력값을 암호화 처리하여 저장
	String password=Utility.encrypt(request.getParameter("password"));
	//반환받은 입력값에서 태그 관련 문자열을 제거하여 저장
	String userNm=Utility.stripTag(request.getParameter("userNm"));
	String postCd=request.getParameter("postCd");
	String basAddr=request.getParameter("basAddr");
	String detlAddr=request.getParameter("detlAddr");
	//String contAddr=Utility.stripTag(request.getParameter("contAddr"));
	String contAddr=request.getParameter("etcphone1")
			+"-"+request.getParameter("etcphone2")
			+"-"+request.getParameter("etcphone3");
	String emailAddr=request.getParameter("email");
	System.out.println("address2 = "+detlAddr);
	System.out.println("postCd = "+postCd);
	System.out.println("email = "+emailAddr);
	
	//DTO 인스턴스를 생성하여 입력값으로 필드값 변경
	UserInfoDTO userInfo=new UserInfoDTO();
	userInfo.setUserNm(userNm); //이름
	userInfo.setUserId(userId); //아이디
	userInfo.setPassword(password); //비번
	userInfo.setPostCd(postCd); //우편번호
	userInfo.setBasAddr(basAddr);// 주소1
	userInfo.setDetlAddr(detlAddr); // 주소2-
	userInfo.setContAddr(contAddr); // 휴대폰
	userInfo.setEmailAddr(emailAddr);  // 이메일
	
	//MEMBER 테이블에 회원정보를 삽입하는 DAO 클래스의 메소드 호출
	UserInfoDAO.getDAO().insertUserInfo(userInfo);
	
	//회원가입 완료 페이지로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/join&work=jm_joinComplete';");
	out.println("</script>");
%>
