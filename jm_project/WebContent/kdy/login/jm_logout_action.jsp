<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그아웃 처리 후 메인페이지로 이동하는 JSP 문서 --%>    
<%
	//session.removeAttribute("loginMember");
	session.invalidate();
	
	out.println("<script type='text/javascript'>");
	out.println("<script>location.href='"+request.getContextPath()+"/index.jsp?workgroup=syd&work=main'; </script>");
	out.println("</script>");
	
%>