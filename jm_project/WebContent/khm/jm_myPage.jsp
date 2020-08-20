<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<title>JM 마이페이지</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />

<!-- CSS 디자인 -->
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="khm/css/css.css" rel="stylesheet" type="text/css" />
<link href="css/css_02.css" rel="stylesheet" type="text/css" />
<link href="css/header.css" rel="stylesheet" type="text/css" />
<link href="css/footer.css" rel="stylesheet" type="text/css" />
<link href="khm/css/mp_main.css" rel="stylesheet" type="text/css" />
<link href="css/nanumsquareround.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" source = js/header.js"></script>

<style type="text/css">

h2 {
	font-size: 30px;
	color: #87a1c4;
	margin : 30px;
}

.shopMain{
	float: left;
	width: 298px;
	height: 241px;
	border: 1px solid #ddd;
	margin: 30px 26px 26px 30px;
	font-family: 'Noto Sans KR';
}

.shopMain h3 {
    display: inline-block;
    font-size: 16px;
    color: #333;
    font-weight: 600;
    margin-bottom: 10px;
	font-family: 'Noto Sans KR';
    !important;
}

.img-fluid {
	margin-top: 40px;
	border: 40px;
	width: 60px;
	height: 60px;
	!important;
}

.shopMain .order {
	padding-top:30px;
	
}
.shopMain .profile {
	padding-top:30px;
}

.shopMain .board {
	padding-top:30px;
}

</style>
</head>
<body id="page-top">
<h2 class="pagetitle1"> <span>마이페이지</span> MYPAGE</h2>
<div class="xans-element- xans-myshop xans-myshop-benefit">
    <div class="inner">
      <p class="myInfo"> 저희 쇼핑몰을 이용해 주셔서 감사합니다. 즐거운 쇼핑하시길 바랍니다.</p>
    </div>
  </div>
	<div id="shopMain">
		<div class="shopMain" >
			<a href="#">
				<img class="img-fluid" src="./khm/img/mP/order.png"/>
				<div class="order">
					<h3>주문내역 조회</h3>
					<p>
						고객님께서 주문하신 상품의 주문내역을<br> 확인하실 수 있습니다.
					</p>
				</div>
			</a>
		</div>
		<div class="shopMain">
			<a href="<%=request.getContextPath()%>/index.jsp?workgroup=khm&work=jm_updateInfo">
			<img class="img-fluid" src="./khm/img/mP/info.png"/>
				<div class="profile">
					<h3>회원 정보</h3>
					<p>
						회원이신 고객님의 개인정보를<br> 관리하는 공간입니다.
					</p>
				</div>
			</a>
		</div>
		<div class="shopMain">
			<a href="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_review">
			<img class="img-fluid" src="./khm/img/mP/review.png"/>
				<div class="board">
					<h3>게시물 관리</h3>
					<p>
						고객님께서 작성하신 게시물을<br> 관리하는 공간입니다.
					</p>
				</div>
			</a>
		</div>
		<div class="shopMain">
			<a href="<%=request.getContextPath()%>/index.jsp?workgroup=khd&work=jm_Cart&prodCd=0">
			<img class="img-fluid" src="./khm/img/mP/cart.jpg"/>
				<div class="profile">
					<h3>장바구니</h3>
					<p>
						 고객님의 장바구니 목록을<br> 관리하는 공간입니다.
					</p>
				</div>
			</a>
		</div>
	</div>
	<br>
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
</body>
</html>
