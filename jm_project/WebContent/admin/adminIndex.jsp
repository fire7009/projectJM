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

<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
 
<!-- CSS 디자인 -->
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/css_02.css" rel="stylesheet" type="text/css" />
<link href="css/header.css" rel="stylesheet" type="text/css" />
<link href="css/footer.css" rel="stylesheet" type="text/css" />
<link href="admin/css/mp_main.css" rel="stylesheet" type="text/css" />
<link href="css/nanumsquareround.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" source = "js/header.js"></script>

<style type="text/css">

h2 {
   font-size: 30px;
   color: #87a1c4;
   margin : 30px;
}

.adminMain{
	float: left;
	width: 298px;
	height: 241px;
	border: 1px solid #ddd;
	margin: 30px 26px 26px 30px;
	font-family: 'Noto Sans KR';
}

.adminMain h3 {
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

.adminMain .order {
	padding-top:30px;
	
}
.adminMain .profile {
	padding-top:30px;
}

.adminMain .board {
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
	<div id="adminMain">
		<div class="adminMain" >
			<a href="#">
				<img class="img-fluid" src="./admin/img/mP/order.png"/>
				<div class="order">
					<h3>상품관리</h3>					
				</div>
			</a>
		</div>
		<div class="adminMain">
			<a href="<%=request.getContextPath()%>/index.jsp?workgroup=admin&work=adminUserList">
			<img class="img-fluid" src="./admin/img/mP/info.png"/>
				<div class="profile">
					<h3>회원관리</h3>					
				</div>
			</a>
		</div>
		<div class="adminMain">
			<a href="<%=request.getContextPath()%>/index.jsp?workgroup=noticeBoard&work=jm_noticeList">
			<img class="img-fluid" src="./admin/img/mP/review.png"/>
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
