<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>JM 주문 목록</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />

        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/common.css" rel="stylesheet" type="text/css"/>
		<link href="css/css.css" rel="stylesheet" type="text/css"/>
		<link href="css/css_02.css" rel="stylesheet" type="text/css"/>
		<link href="css/header.css" rel="stylesheet" type="text/css"/>
		<link href="css/footer.css" rel="stylesheet" type="text/css"/>
		<link href="css/nanumsquareround.css" rel="stylesheet" type="text/css"/>
		
<style type="text/css">
#myOrder .table-d2-list {
  	margin-top: 30px;
  	margin-left: 30px;
  	margin-right: 30px;
}	
.table-d2-list {
    border-top: 1px solid #333;
    border-bottom: 1px solid #ddd;
    border-left: 1px solid #ddd;
    border-right: 1px solid #ddd;
}
</style>
    </head>
    <body id="page-top">
	<div class="mem_title"> 주문조회 </div>
                <div id="myOrder">
                    <div class="page-body">
                        <div class="table-d2-list">
                            <table summary="번호, 주문일자, 상품명, 결제금액, 주문상세, 배송현황" border ="1">
                                <caption>주문내역</caption>
                                <colgroup>
                                    <col width="70">
                                    <col width="95">
                                    <col width="*">
                                    <col width="100">
                                    <col width="75">
                                    <col width="75">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="row"><div class="tb-center">번호</div></th>
                                        <th scope="row"><div class="tb-center">주문일자</div></th>
                                        <th scope="row"><div class="tb-center">상품명</div></th>
                                        <th scope="row"><div class="tb-center">결제금액</div></th>
                                        <th scope="row"><div class="tb-center">주문상세</div></th>
                                        <th scope="row"><div class="tb-center">배송현황</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="6"><div class="tb-center">주문내역이 없습니다.</div></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
  