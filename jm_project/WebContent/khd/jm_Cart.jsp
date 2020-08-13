<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int select=Integer.parseInt(request.getParameter("select"));
	int price=Integer.parseInt(request.getParameter("price"));
%>

<style type="text/css">
table {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	border-left: 3px solid #369;
	margin: 20px 10px;
}

th {
	width: 147px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #153d73;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

td {
	width: 349px;
	padding: 10px;
	vertical-align: top;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}
</style>
</head>
<body id="page-top">
	


	<section class="page-section bg-light" id="portfolio">
	<div class="container">
		<div class="text-center">
			<h2 class="section-heading text-uppercase">장바구니 페이지</h2>
			<h3 class="section-subheading text-muted">장바구니에 담긴 상품 목록</h3>
		</div>
		<div class="row">

			<div class="col-lg-4 col-sm-6 mb-4">
				<div class="portfolio-item">
					<img class="img-fluid" src="assets/img/portfolio/01-thumbnail.jpg"
						alt="" />
				</div>
			</div>
			<div>

				<table>
					<tr>
						<th>수량</th>
						<th>총상품 금액</th>
						<th>상품취소</th>
					</tr>
					<tr>
						<th><%=select%><br>
						<button>수정</button></th>
						<th><%=price %></th>
						<th><button>삭제</button></th>
					</tr>
				</table>
				<br>
				<br>
 				<input type="image" src="assets/img/shopping/cartClear.gif" align="right">
				&nbsp;
			 <input type="image" src="assets/img/shopping/allOrder.gif" align="right">
				&nbsp;
				 <input type="image" src="assets/img/shopping/selectOrder.gif" align="right">
				&nbsp;
		 <input type="image" src="assets/img/shopping/go .gif" align="right">
			</div>
	</section>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Contact form JS-->
	<script src="assets/mail/jqBootstrapValidation.js"></script>
	<script src="assets/mail/contact_me.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

