<%@page import="jm.util.Utility"%>
<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");


String userId=request.getParameter("userId");
String emailAddr=request.getParameter("email");

System.out.println(userId);
System.out.println(emailAddr);

UserInfoDTO userInfo=UserInfoDAO.getDAO().selectIdUserinfo(userId);
if(userInfo==null) {
	out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findPw';alert('입력한 사용자 아이디가 존재하지 않습니다'); </script>");
	out.println(userInfo.getUserNm());
	return;
}

//이메일에 대한 인증 처리
if(!userInfo.getEmailAddr().equals(emailAddr)) {//이메일에 대한 인증 실패
	out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findPw';alert('입력한 사용자의 이메일이 맞지 않습니다.'); </script>");
	return;
	}


//탈퇴회원 로그인시 false 처리
if(userInfo.getUserDv()==""){
	out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findPw';alert('탈퇴한 회원 입니다.'); </script>");
	return;
}

	String passwd= UserInfoDAO.getDAO().randomPassword(6);
	String pwd=Utility.encrypt(passwd);
	UserInfoDTO userInfo1=new UserInfoDTO();
	userInfo.setUserId(userId);
	userInfo.setPassword(passwd);
	UserInfoDAO.getDAO().updatePwdUserInfo(userInfo);
	
	
	//아이디와 이메일이 일치할 경우
	if(userInfo!=null || userInfo.getEmailAddr().equals(emailAddr)){
		out.println("<script>location.href='"+request.getContextPath()+
				"/index.jsp?workgroup=kdy/login&work=jm_findPw';alert('입력한 회원 임시 비밀번호는 " + passwd +" 입니다.'); </script>");
	}
		
	//out.println("<script type='text/javascript'>");
	//out.println("location.href='"+request.getContextPath()+"/coffee/index.jsp?workgroup=member&work=login';");
	//out.println("</script>");
%>
