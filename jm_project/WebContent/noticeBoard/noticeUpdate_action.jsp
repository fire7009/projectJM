<%@page import="jm_dao.NoticeDAO"%>
<%@page import="jm_dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	int num=0;
	int readCount=NoticeDAO.getDAO().updateReadCount(num);
     
	//전달된 입력값을 반환받아 저장
	String noticeTitle=request.getParameter("subject");
	String noticeContents=request.getParameter("content");
	
	System.out.print(noticeTitle);
	System.out.print(noticeContents);
	
	
	//DTO 인스턴스를 생성하여 입력값으로 필드값 변경
	NoticeDTO notice=new NoticeDTO();
	notice.setNoticeTitle(noticeTitle); //제목
	notice.setNoticeContents(noticeContents); //내용
	notice.setNoticeReadcount(readCount);// 조회수
	
	NoticeDAO.getDAO().insertNotice(notice);
	
	//공지사항 목록으로 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=noticeBoard&work=jm_noticeList';");
	out.println("</script>");
%>

    
