<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>JM 조명 회원탈퇴</title>

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

<!-- Core theme CSS (includes Bootstrap)-->

<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<link href="css/css_02.css" rel="stylesheet" type="text/css" />
<link href="css/new_join.css" rel="stylesheet" type="text/css" />
<link href="css/nanumsquareround.css" rel="stylesheet" type="text/css" />

</head>

<style type="text/css">
fieldset {
	width: 500px;
	height: 256px;
}
#contentWrap {
	width: 450px;
	height: 300px;
	border: 1px solid aqua;
}

</style>
<div id="content" align="center" class="container">

	<script type="text/javascript"
		src="/shopimages/vittz/template/work/24129/header.1.js?t=202007211018"></script>
	<div id="contentWrapper">
		<div id="contentWrap">

				<div class="mem_title" style="color: #87a1c4">회원탈퇴</div>
				<div id="mySecede">

					<div class="page-body">
						<div class="dbox-wrap">

							<div class="d-box">
								<ul>
									<li>앞으로 더 나은 모습으로 고객님을 다시 만날 수 있도록 노력하겠습니다.
									<br />그동안 이용해주신 것을 진심으로 감사드립니다.
									</li>
								</ul>
							</div>
							<div class="box-t">
								<img src="/images/d3/modern_simple/bg_secede_box_b.gif" alt="" />
							</div>
						</div>
						<!-- .dbox-wrap -->
						<div class="scede-frm">
							<fieldset>
								<div class="btn-foot">
									<a href="<%=request.getContextPath() %>/index.jsp?workgroup=khm&work=jm_deleteInfo_confirm"><img
										src="img/btn_h32_secede.gif" alt="회원탈퇴" /></a> <a
										href="<%=request.getContextPath() %>/index.jsp?workgroup=khm&work=jm_updateInfo"><img src="img/btn_h32_cancel.gif"
										alt="탈퇴취소" /></a>
								</div>
							</fieldset>
						</div>
						<!-- .scede-frm -->
					</div>
					<!-- .page-body -->
				</div>
				<!-- #mySecede -->

		</div>
		<!-- #contentWrap -->
	</div>
	<!-- #contentWrapper-->
	</div>
	<hr />
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
