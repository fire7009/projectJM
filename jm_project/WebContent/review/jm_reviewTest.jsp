<%@page import="jm_dao.ProdReviewDAO"%>
<%@page import="jm_dto.ProdReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	for(int i=1;i<=10;i++){
		ProdReviewDTO review = new ProdReviewDTO();
		review.setPostNo(review.getPostNo());
		review.setProdCd("1");
		review.setId("abc123");
		review.setWriter("홍길동");
		review.setSubject("테스트-"+i);
		review.setContent("시범시범-"+i);
		review.setIp("127.0.0.1");
		ProdReviewDAO.getDAO().insertReview(review);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
	<h1>10개의 테스트 게시글을 저장하였습니다.</h1>
</body>
</html>