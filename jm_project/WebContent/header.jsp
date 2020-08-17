<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://maps.googleapis.com/maps/api/js"></script>
<style>
#map-canvas {
	width: 450px;
	height: 222px;
	margin-top: 1px;
	background-color: #ffffff;
	border: 1px solid #e0e0e0;
}
</style>
<div id="wrap">
	<div id="top_event">
		<div class="event">
			<div class="close_btn"></div>
		</div>
	</div>

	<div id="header">
		<div class="head_info">
			<img src="img/7_clock.png" class="fl" alt="clock" />
			<p class="txt fl">여기는</p>
			<p class="txt2 fl">
				<span>비츠</span>헤더 입니다.
			</p>
		</div>
		<h1>
			<a href="#"><img src="img/logo.png" alt="vittz" /></a>
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
				<li class="fir"><a href="#">거실조명</a>
					<ul class="sub1">
						<li><a href="#">20평대</a></li>
						<li><a href="#">30평대</a></li>
						<li><a href="#">40평대</a></li>
						<li><a href="#">50평대</a></li>
						<li><a href="#">대형/복층/샹들리에</a></li>
					</ul></li>
				<li><a href="#">식탁/포인트 조명</a>
					<ul class="sub2">
						<li><a href="#">2인 식탁</a></li>
						<li><a href="#">4인 식탁</a></li>
						<li><a href="#">6인 식탁</a></li>
						<li><a href="#">대형 식탁</a></li>
						<li><a href="#">포인트</a></li>
					</ul></li>
				<li><a href="#">방조명</a>
					<ul class="sub3">
						<li><a href="#">큰방</a></li>
						<li><a href="#">안방</a></li>
						<li><a href="#">작은방</a></li>
						<li><a href="#">드레스룸</a></li>
						<li><a href="#">비츠오리진</a></li>
					</ul></li>
				<li><a href="#">주방/화장실 조명</a>
					<ul class="sub4">
						<li><a href="#">주방</a></li>
						<li><a href="#">화장실</a></li>
						<li><a href="#">바리솔</a></li>
					</ul></li>
				<li><a href="#">스탠드</a>
					<ul class="sub5">
						<li><a href="#">침실</a></li>
						<li><a href="#">거실조명</a></li>
						<li><a href="#">책상</a></li>
						<li><a href="#">무드등/수유등</a></li>
						<li><a href="#">비츠오리진</a></li>
					</ul></li>
				<li><a href="#">실외조명</a>
					<ul class="sub6">
						<li><a href="#">실외벽등</a></li>
						<li><a href="#">문주등</a></li>
						<li><a href="#">정원등</a></li>
						<li><a href="#">지중등</a></li>
					</ul></li>
			</ul>
		</div>
		<p id="total_btn">
			<a href="#"><img src="img/btn_all_menu.png" alt="전체 메뉴" /></a>
		</p>
		<div id="total_menu">
			<dl>
				<dt>거실조명</dt>
				<dd>
					<ul>
						<li><a href="#">20평대</a></li>
						<li><a href="#">30평대</a></li>
						<li><a href="#">40평대</a></li>
						<li><a href="#">50평대</a></li>
						<li><a href="#">대형/복층/샹들리에</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dt>식탁/포인트 조명</dt>
				<dd>
					<ul>
						<li><a href="#">2인 식탁</a></li>
						<li><a href="#">4인 식탁</a></li>
						<li><a href="#">6인 식탁</a></li>
						<li><a href="#">대형 식탁</a></li>
						<li><a href="#">포인트</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dt>방조명</dt>
				<dd>
					<ul>
						<li><a href="#">큰방</a></li>
						<li><a href="#">안방</a></li>
						<li><a href="#">작은방</a></li>
						<li><a href="#">드레스룸</a></li>
						<li><a href="#">비츠오리진</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dt>주방/화장실 조명</dt>
				<dd>
					<ul>
					<li><a href="#">주방</a></li>
						<li><a href="#">화장실</a></li>
						<li><a href="#">바리솔</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dt>스탠드</dt>
				<dd>
					<ul>
					<li><a href="#">침실</a></li>
						<li><a href="#">거실조명</a></li>
						<li><a href="#">책상</a></li>
						<li><a href="#">무드등/수유등</a></li>
						<li><a href="#">비츠오리진</a></li>
					</ul>
				</dd>
			</dl>
			<dl>
				<dt>실외조명</dt>
				<dd>
					<ul>
						<li><a href="#">실외벽등</a></li>
						<li><a href="#">문주등</a></li>
						<li><a href="#">정원등</a></li>
						<li><a href="#">지중등</a></li>
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