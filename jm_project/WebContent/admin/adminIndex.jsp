<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<title>JM > 관리자</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<!-- CSS only-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

 <!--JS, Popper.js, and jQuery-->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script> 
<!-- CSS 디자인 -->
<link href="../khm/css/common.css" rel="stylesheet" type="text/css" />
<link href="../khm/css/css.css" rel="stylesheet" type="text/css" />
<link href="../khm/css/css_02.css" rel="stylesheet" type="text/css" />
<link href="../khm/css/header.css" rel="stylesheet" type="text/css" />
<link href="../khm/css/footer.css" rel="stylesheet" type="text/css" />
<link href="../khm/css/mp_main.css" rel="stylesheet" type="text/css" />
<link href="../khm/css/nanumsquareround.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" source = "js/header.js"></script>

<style type="text/css">

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
<body id="page-top" align="center">
<h2 class="pagetitle1"> <span>관리자</span>
<div class="xans-element- xans-myshop xans-myshop-benefit">
    <div class="inner">      
    </div>
  </div>
	<div id="shopMain">
		<div class="shopMain" >
			<a href="#">
				<img class="img-fluid" src="../khm/img/mP/order.png"/>
				<div class="order">
					<h3>상품관리</h3>					
				</div>
			</a>
		</div>
		<div class="shopMain">
			<a href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=adminUserList">
			<img class="img-fluid" src="../khm/img/mP/info.png"/>
				<div class="profile">
					<h3>회원관리</h3>					
				</div>
			</a>
		</div>
		<div class="shopMain">
			<a href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=niticeList">
			<img class="img-fluid" src="../khm/img/mP/review.png"/>
				<div class="board">
					<h3>공지사항</h3>					
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
