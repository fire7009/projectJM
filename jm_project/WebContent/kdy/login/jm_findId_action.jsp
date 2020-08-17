<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String userNm=request.getParameter("name");
	String emailAddr=request.getParameter("find_id_email");
	
	//아이디 찾기
	UserInfoDTO userInfo=UserInfoDAO.getDAO().selectfindIdUserinfo(userNm);
	if(userInfo==null) {
		out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('입력한 사용자 이름이 존재하지 않습니다'); </script>");
		return;
	}	

	if(!userInfo.getEmailAddr().equals(emailAddr)) {  
			out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('입력한 사용자의 이메일이 맞지 않습니다.'); </script>");
			return;
	}
	
	if(userInfo!=null || userInfo.getEmailAddr().equals(emailAddr)){
		out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=kdy/login&work=jm_findId';alert('입력한 회원 아이디는 "+userInfo.getUserId()+" 입니다.'); </script>");
	}
	
%>

<style type="text/css">

div {
	text-align: center;
	margin: 10px;
}

.id { color: red; }

</style>

