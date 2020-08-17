<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#map-canvas {
	width: 450px;
	height: 222px;
	margin-top: 1px;
	background-color: #ffffff;
	border: 1px solid #e0e0e0;
}
</style>
<div id="header">
	<div class="head_info">
		<img src="img/7_clock.png" class="fl" alt="clock" />
		<p class="txt fl">전국에 계시는 발 빠른 미식가</p>
		<p class="txt2 fl">
			<span>샛별배송</span>을 소개합니다!
		</p>
	</div>
	<h1>
		<a href="khd/jm_Shopping.jsp"><img src="img/kurly_logo.png" alt="마켓 컬리" /></a>
	</h1>
	<dl id="util_menu">
		<dt class="hide">유틸메뉴</dt>
		<dd class="clickme fl DB_etc10_1" style="width: 128px">
			<img src="img/login_click.png" />
		</dd>
		<dd class="util_first">
			<ul>
				<li class="login_wrap logtxt"><a href="#">로그인</a>
					<form action="#" id="login_f" method="post" name="log_f">
						<fieldset>
							<legend>로그인</legend>
							<p class="user_id">
								<label for="user_id"><img src="img/login_title_id.gif"
									alt="아이디" /></label> <input type="text" name="user_id" id="user_id" />
							</p>
							<p class="user_pw">
								<label for="user_pw"><img src="img/login_title_pw.gif"
									alt="패스워드" /></label> <input type="text" name="user_pw" id="user_pw" />
							</p>
							<p>
								<input type="checkbox" name="save_id" id="save_id" /> <label
									for="save_id">비밀번호 저장</label>
							</p>
							<p class="log_btn">
								<input type="image" src="img/login_btn.png" alt="login" />
							</p>
							<p class="join_btn_wrap">
								<a href="#">회원가입</a> <a href="#" class="sch_id_btn">아이디/비밀번호찾기</a>
							</p>
							<p class="login_close_btn">
								<a href="#"><img src="img/login_close_btn.png" alt="닫기버튼" /></a>
							</p>
						</fieldset>
					</form></li>
				<li class="logtxt"><a href="#">|&nbsp;&nbsp;&nbsp;회원가입</a></li>
			</ul>
		</dd>
		<dd>
			<ul id="zoom">
				<li><img src="img/util_zoom_1.gif" /></li>
				<li><a href="#" class="zoom_in"><img
						src="img/util_zoom_2.gif" /></a></li>
				<li><a href="#" class="zoom_return"><img
						src="img/util_zoom_3.gif" /></a></li>
				<li><a href="#" class="zoom_out"><img
						src="img/util_zoom_4.gif" /></a></li>
			</ul>
		</dd>
		<dd>
			<a href="#" class="print_btn"><img src="img/util_print.gif" /></a>
		</dd>

	</dl>
	<form action="#" method="get" name="sch_f" id="sch_f">
		<fieldset>
			<legend>검색폼</legend>
			<p>
				<input type="text" name="keyword" id="keyword" title="검색어입력" /> <input
					type="image" src="img/search-button.png" class="sch_btn" alt="검색" />
			</p>
		</fieldset>
	</form>
	<h2 class="hide">메인메뉴</h2>
	<div id="gnb_wrap">
		<ul id="gnb">
			<li class="fir"><a href="#">신선식품</a>
				<ul class="sub1">
					<li><a href="#">채소</a></li>
					<li><a href="#">과일 및 견과</a></li>
					<li><a href="#">곡류</a></li>
					<li><a href="#">수산</a></li>
					<li><a href="#">Premium</a></li>
				</ul></li>
			<li><a href="#">정육/달걀</a>
				<ul class="sub2">
					<li><a href="#">소고기</a></li>
					<li><a href="#">돼지고기</a></li>
					<li><a href="#">닭고기/달걀</a></li>
					<li><a href="#">양고기/기타</a></li>
					<li><a href="#">Premium</a></li>
				</ul></li>
			<li><a href="#">가공식품</a>
				<ul class="sub3">
					<li><a href="#">간식/식사대용</a></li>
					<li><a href="#">면류</a></li>
					<li><a href="#">물,음료,유제품</a></li>
					<li><a href="#">건강식품</a></li>
					<li><a href="#">Premium</a></li>
				</ul></li>
			<li><a href="#">양념/반찬</a>
				<ul class="sub4">
					<li><a href="#">장,소스,초</a></li>
					<li><a href="#">오일</a></li>
					<li><a href="#">가루,향신료</a></li>
					<li><a href="#">반찬</a></li>
					<li><a href="#">Premium</a></li>
				</ul></li>
			<li><a href="#">Home Dining</a>
				<ul class="sub5">
					<li><a href="#">혼신마켓</a></li>
				</ul></li>
			<li><a href="#">Deli/Bakery</a>
				<ul class="sub6">
					<li><a href="#">빵류</a></li>
					<li><a href="#">디저트</a></li>
					<li><a href="#">치즈/버터</a></li>
					<li><a href="#">유제품</a></li>
				</ul></li>
			<li><a href="#">Daily</a></li>
			<li><a href="#">이벤트/기획전</a></li>
			<li><a href="#">Best</a></li>
		</ul>
	</div>
	<p id="total_btn">
		<a href="#"><img src="img/btn_all_menu.png" alt="전체 메뉴" /></a>
	</p>
	<div id="total_menu">
		<dl>
			<dt>신선식품</dt>
			<dd>
				<ul>
					<li><a href="#">채소</a></li>
					<li><a href="#">과일 및 견과</a></li>
					<li><a href="#">곡류</a></li>
					<li><a href="#">수산</a></li>
					<li><a href="#">Premium</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>정육/달걀</dt>
			<dd>
				<ul>
					<li><a href="#">소고기</a></li>
					<li><a href="#">돼지고기</a></li>
					<li><a href="#">닭고기/달걀</a></li>
					<li><a href="#">양고기/기타</a></li>
					<li><a href="#">Premium</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>가공식품</dt>
			<dd>
				<ul>
					<li><a href="#">간식/식사대용</a></li>
					<li><a href="#">면류</a></li>
					<li><a href="#">물,음료,유제품</a></li>
					<li><a href="#">건강식품</a></li>
					<li><a href="#">Premium</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>양념/반찬</dt>
			<dd>
				<ul>
					<li><a href="#">장,소스,초</a></li>
					<li><a href="#">가루,향신료</a></li>
					<li><a href="#">오일</a></li>
					<li><a href="#">반찬</a></li>
					<li><a href="#">Premium</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>Home Dining</dt>
			<dd>
				<ul>
					<li><a href="#">혼신마켓</a></li>
				</ul>
			</dd>
		</dl>
		<dl>
			<dt>Deli/Bakery</dt>
			<dd>
				<ul>
					<li><a href="#">빵류</a></li>
					<li><a href="#">디저트</a></li>
					<li><a href="#">치즈/버터</a></li>
					<li><a href="#">유제품</a></li>
				</ul>
			</dd>
		</dl>
		<!-- 총6개 -->
		<p id="total_close">
			<a href="#"><img src="img/allmenu_close_btn.png" alt="전체메뉴 닫기" /></a>
		</p>
	</div>
	<p id="date_wrap">
		<span class="year">0000</span> 년 <span class="month">00</span> 월 <span
			class="date">00</span> 일
	</p>
</div>
<!-- id="header" -->
<hr />

<div id="visual">
	<div id="mySwipe" class="swipe">
		<ul class="touch_banner swipe-wrap">
			<li><a href="#"><img src="img/visual01.jpg" alt="" /></a></li>
			<li><a href="#"><img src="img/visual02.jpg" alt="" /></a></li>
			<li><a href="#"><img src="img/visual03.jpg" alt="" /></a></li>
			<li><a href="#"><img src="img/visual04.jpg" alt="" /></a></li>
			<li><a href="#"><img src="img/visual05.jpg" alt="" /></a></li>
			<li><a href="#"><img src="img/visual06.jpg" alt="" /></a></li>
			<li><a href="#"><img src="img/visual07.jpg" alt="" /></a></li>
		</ul>
	</div>
	<ul class="touch_bullet">
		<li><img src="img/visual_bullet_on.png" class="active" /></li>
		<li><img src="img/visual_bullet_off.png" /></li>
		<li><img src="img/visual_bullet_off.png" /></li>
		<li><img src="img/visual_bullet_off.png" /></li>
		<li><img src="img/visual_bullet_off.png" /></li>
		<li><img src="img/visual_bullet_off.png" /></li>
		<li><img src="img/visual_bullet_off.png" /></li>
	</ul>
	<p class="touch_left_btn">
		<a href="#"><img src="img/slide-left-button.png" alt="이전 배너" /></a>
	</p>
	<p class="touch_right_btn">
		<a href="#"><img src="img/slide-right-button.png" alt="다음 배너" /></a>
	</p>
</div>
<!-- id="visual" -->
<hr />
</head>
<script> 
$('.DB_etc10_1').DB_springMove({
	key:'e24102',          //라이센스키
	dir:'x',               //방향축('x','y')
	mirror:1,              //반대방향이동(1,-1)
	radius:10,             //반경
	motionSpeed:0.1        //속도(0~1)
})
</script>	