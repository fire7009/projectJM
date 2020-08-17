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
<body>
	<div id="visual">
		<div id="mySwipe" class="swipe">
			<ul class="touch_banner swipe-wrap">
				<li><a href="#"><img src="img/visual01.jpg" alt="" /></a></li>
				<li><a href="#"><img src="img/visual02.jpg" alt="" /></a></li>
				<li><a href="#"><img src="img/visual03.jpg" alt="" /></a></li>
				<li><a href="#"><img src="img/visual04.jpg" alt="" /></a></li>
				<li><a href="#"><img src="img/visual05.jpg" alt="" /></a></li>
			</ul>
		</div>
		<ul class="touch_bullet">
			<li><img src="img/visual_bullet_on.png" class="active" /></li>
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

	<div id="contents">
		<div id="main_goods">
			<h2>인기상품</h2>
			<a href="#">
				<div class="goods_box">
					<div class="goods_img01">
						<img src="img/main_goods_op.png" alt="" />
					</div>
					<div class="goods_info">
						<p class="strong">[콜린스그린] 원데이 클렌즈(1일)</p>
						<p>41,000</p>
					</div>
				</div>
			</a> <a href="#">
				<div class="goods_box">
					<div class="goods_img02">
						<img src="img/main_goods_op.png" alt="" />
					</div>
					<div class="goods_info">
						<p class="strong">GAP 양광사과</p>
						<p>8,000</p>
					</div>
				</div>
			</a> <a href="#">
				<div class="goods_box">
					<div class="goods_img03">
						<img src="img/main_goods_op.png" alt="" />
					</div>
					<div class="goods_info">
						<p class="strong">[MEYER] 한우 채끝등심</p>
						<p>32,500</p>
					</div>
				</div>
			</a> <a href="#">
				<div class="goods_box">
					<div class="goods_img04">
						<img src="img/main_goods_op.png" alt="" />
					</div>
					<div class="goods_info">
						<p class="strong">유기농 베이비 채소</p>
						<p>2,600</p>
					</div>
				</div>
			</a>
		</div>
		<!-- id="main_goods" -->
		<div id="contents_top">
			<div id="roll_banner_wrap">
				<h3>신상품</h3>
				<dl>
					<dt class="roll_btn1">
						<a href="#" class="active"><img src="img/pop_btn_1_over.png"
							alt="버튼1" /></a>
					</dt>
					<dd>
						<a href="#"><img src="img/new_goods01.jpg" alt="배너1" /></a>
					</dd>
					<dt class="roll_btn2">
						<a href="#"><img src="img/pop_btn_2_out.png" alt="버튼2" /></a>
					</dt>
					<dd>
						<a href="#"><img src="img/new_goods02.jpg" alt="배너2" /></a>
					</dd>

					<dt class="roll_btn3">
						<a href="#"><img src="img/pop_btn_3_out.png" alt="버튼3" /></a>
					</dt>
					<dd>
						<a href="#"><img src="img/new_goods03.jpg" alt="배너3" /></a>
					</dd>
					<dt class="roll_btn4">
						<a href="#"><img src="img/pop_btn_4_out.png" alt="버튼4" /></a>
					</dt>
					<dd>
						<a href="#"><img src="img/new_goods04.jpg" alt="배너4" /></a>
					</dd>
					<dt class="roll_btn5">
						<a href="#"><img src="img/pop_btn_5_out.png" alt="버튼5" /></a>
					</dt>
					<dd>
						<a href="#"><img src="img/new_goods05.jpg" alt="배너5" /></a>
					</dd>
					<dt class="roll_btn6">
						<a href="#"><img src="img/pop_btn_6_out.png" alt="버튼6" /></a>
					</dt>
					<dd>
						<a href="#"><img src="img/new_goods06.jpg" alt="배너6" /></a>
					</dd>
					<dt class="roll_btn7">
						<a href="#"><img src="img/pop_btn_7_out.png" alt="버튼7" /></a>
					</dt>
					<dd>
						<a href="#"><img src="img/new_goods07.jpg" alt="배너7" /></a>
					</dd>
				</dl>
				<!-- 총 7개 -->
				<p class="ctl_btn">
					<a href="#" class="playBtn"><img src="img/pop_btn_play_on.gif"
						alt="재생 버튼" /></a> <a href="#" class="stopBtn"><img
						src="img/pop_btn_stop_off.gif" alt="정지 버튼" /></a>
				</p>
			</div>
			<!-- id="roll_banner_wrap" -->
			<!-- 탭 메뉴를 이용해 최근 게시물 리스트 만들기 -->
			<dl id="tabmenu">
				<dt class="tab_btn1">
					<a href="#"><img src="img/tab_btn_1_over.jpg" alt="무료배송" /></a>
				</dt>
				<dd>
					<img src="img/banner01.jpg" alt="kulry lovers" class="fl" />
					<p class="tab_more">
						<a href="#"><img src="img/tab_more_btn.png" alt="더보기" /></a>
					</p>
				</dd>
				<dt class="tab_btn2">
					<a href="#"><img src="img/tab_btn_2_out.jpg" alt="회원혜택" /></a>
				</dt>
				<dd>
					<img src="img/banner02.jpg" alt="kulry lovers" class="fl" />
					<p class="tab_more">
						<a href="#"><img src="img/tab_more_btn.png" alt="더보기" /></a>
					</p>
				</dd>
				<dt class="tab_btn3">
					<a href="#"><img src="img/tab_btn_3_out.jpg" alt="무료배송" /></a>
				</dt>
				<dd>
					<img src="img/banner03.jpg" alt="kulry lovers" class="fl" />
					<p class="tab_more">
						<a href="#"><img src="img/tab_more_btn.png" alt="더보기" /></a>
					</p>
				</dd>
			</dl>
			<!-- id="tabmenu" -->
			<div id="event_wrap" class="fl">
				<div id="brandVisual">
					<ul>
					
						<li class="visual_1"><a href="#">베너이미지2</a></li>
						<li class="visual_2"><a href="#">베너이미지3</a></li>
						<li class="visual_3"><a href="#">베너이미지4</a></li>
						<li class="visual_4"><a href="#">베너이미지5</a></li>
						<li class="visual_5"><a href="#">베너이미지6</a></li>
					</ul>
				</div>
				<div id="buttonList">
					<li class="on"><a href="#">배너1</a></li>
					<li><a href="#">배너2</a></li>
					<li><a href="#">배너3</a></li>
					<li><a href="#">배너4</a></li>
					<li><a href="#">배너5</a></li>
					<li><a href="#">배너6</a></li>
				</div>
			</div>
			<!-- id="event_wrap" -->
		</div>
		<!-- id="contents_top" -->

		<!-- 레시피 상품 슬라이드 만들기 -->
		<div id="recipe">
			<h3>레시피</h3>
			<a href="#" class="r_more">레시피 전체보기</a>
			<div class="animation_canvas">
				<div class="slider_panel">
					<a href="#"><img src="img/recipe01.png" class="slider_image"
						alt="" /></a> <a href="#"><img src="img/recipe02.png"
						class="slider_image" alt="" /></a> <a href="#"><img
						src="img/recipe03.png" class="slider_image" alt="" /></a> <a href="#"><img
						src="img/recipe04.png" class="slider_image" alt="" /></a> <a href="#"><img
						src="img/recipe05.png" class="slider_image" alt="" /></a>
				</div>
				<div class="control_panel">
					<div class="control_button"></div>
					<div class="control_button"></div>
					<div class="control_button"></div>
					<div class="control_button"></div>
					<div class="control_button"></div>
				</div>
			</div>
			<!-- class="animation_canvas" -->
			<div class="slider_text_panel">
				<div class="slider_text">
					<h2>레시피상품</h2>
					<p class="line"></p>
					<a href="#"><img src="img/r_goods01.png" alt="" /></a>
					<p>[데치코] 엑스트라버진 올리브 오일</p>
					<p>10,800</p>
				</div>
				<div class="slider_text">
					<h2>레시피상품</h2>
					<p class="line"></p>
					<a href="#"><img src="img/r_goods02.png" alt="" /></a>
					<p>[선솔트] 머레이리버 고메 핑크솔트</p>
					<p>18,800</p>
				</div>
				<div class="slider_text">
					<h2>레시피상품</h2>
					<p class="line"></p>
					<a href="#"><img src="img/r_goods03.png" alt="" /></a>
					<p>[소프트] 카망베르 치즈 2종</p>
					<p>14,900</p>
				</div>
				<div class="slider_text">
					<h2>레시피상품</h2>
					<p class="line"></p>
					<a href="#"><img src="img/r_goods04.png" alt="" /></a>
					<p>[그림치즈] 마담로익 4종</p>
					<p>11,900</p>
				</div>
				<div class="slider_text">
					<h2>레시피상품</h2>
					<p class="line"></p>
					<a href="#"><img src="img/r_goods05.png" alt="" /></a>
					<p>[프루네티] 레제로 프리미엄 엑스트라 버진 오일</p>
					<p>32,900</p>
				</div>
			</div>
		</div>
		<!-- id="recipe" -->
		<!-- 자동슬라이드 배너를 이용한 베스트 상품 영역 만들기 -->
		<div id="bestgoods_zone">
			<h3>신선 계절 상품</h3>
			<div id="best_bg">
				<ul>
					<li><a href="#"><img src="img/fruit01.png" alt="" /><span>바나나</span></a></li>
					<li><a href="#"><img src="img/fruit02.png" alt="" /><span>레몬</span></a></li>
					<li><a href="#"><img src="img/fruit03.png" alt="" /><span>참외</span></a></li>
					<li><a href="#"><img src="img/fruit04.png" alt="" /><span>샐러드</span></a></li>
					<li><a href="#"><img src="img/fruit05.png" alt="" /><span>블루베리</span></a></li>
					<li><a href="#"><img src="img/fruit06.png" alt="" /><span>포도</span></a></li>
					<li><a href="#"><img src="img/fruit07.png" alt="" /><span>가지</span></a></li>
					<li><a href="#"><img src="img/fruit08.png" alt="" /><span>블로콜리</span></a></li>
					<li><a href="#"><img src="img/fruit09.png" alt="" /><span>귤</span></a></li>
					<li><a href="#"><img src="img/fruit10.png" alt="" /><span>사과</span></a></li>
				</ul>
				<!-- 총 10개 -->
				<p class="prev_btn">
					<a href="#"><img src="img/slide-sub-left-button-black.png"
						alt="이전으로 이동" /></a>
				</p>
				<p class="next_btn">
					<a href="#"><img src="img/slide-sub-right-button-black.png"
						alt="다음으로 이동" /></a>
				</p>
			</div>
		</div>
		<!-- id="bestgoods_zone" -->

		<div id="contents_bottom">
			<div id="map_wrap">
				<h3>오시는 길</h3>
				<div id="map-canvas" title="찾아오는 길">
					<div id="map"></div>
					<script>
						var map;
						function initMap() {
							map = new google.maps.Map(document
									.getElementById('map'), {
								center : {
									lat : -34.397,
									lng : 150.644
								},
								zoom : 8
							});
						}
					</script>
					<script
						src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap"
						async defer></script>

				</div>
			</div>
			<!-- id="map_wrap" -->
			<div id="online_wrap">
				<h3>Kurly Loves</h3>
				<p>| Partners</p>
				<ul>
					<!-- 총 6개 -->
					<li class="fl"><a href="#"><img
							src="img/online_banner01.png" alt="배너1" title="커피리브레" /></a></li>
					<li class="fl"><a href="#"><img
							src="img/online_banner02.png" alt="배너2" title="커피리브레" /></a></li>
					<li class="fl"><a href="#"><img
							src="img/online_banner03.png" alt="배너3" title="커피리브레" /></a></li>
					<li class="fl"><a href="#"><img
							src="img/online_banner04.png" alt="배너4" title="커피리브레" /></a></li>
					<li class="fl"><a href="#"><img
							src="img/online_banner05.png" alt="배너5" title="커피리브레" /></a></li>
					<li class="fl"><a href="#"><img
							src="img/online_banner06.png" alt="배너6" title="커피리브레" /></a></li>
				</ul>
			</div>
			<!-- id="online_wrap" -->
		</div>
		<!-- id="contents_bottom" -->

		<div id="quick_menu">
			<h3>
				<a href="#">배송안내<img src="img/icon-truck.png" alt="배송안내" /></a>
			</h3>
			<ul>
				<li><a href="#">신상품</a></li>
				<li><a href="#">알뜰쇼핑</a></li>
				<li><a href="#">베스트 구매후기</a></li>
				<li><a href="#">늘 사는것</a></li>
				<li><a href="#">장바구니(0)</a></li>
				<li><a href="#">Kurly Loves</a></li>
				<li><a href="#">Kurly Recipe</a></li>
				<li class="last"><a href="#top" class="fl quick_btn"><img
						src="img/quick_up.png" alt="위로" /></a> <a href="#footer_wrap"
					class="fl quick_btn"><img src="img/quick_down.png" alt="아래로" /></a>
				</li>
			</ul>
		</div>
		<!-- id="quick_menu" -->

		<p id="pop_wrap">
			<img src="img/popup.png" alt="컬리를 가장 쉽고 편하게 이용하는 방법" usemap="#pop" />
			<map name="pop" id="pop">
				<area shape="rect" coords="322,397,359,413" href="창닫기" />
				<area shape="rect" coords="161,396,289,418" href="하루동안 창 닫기" />
			</map>
		</p>
	</div>
	<!-- id="contents" -->
	</div>
	<!-- id="wrap" -->
	<hr />

	<script>
		$('.DB_etc10_1').DB_springMove({
			key : 'e24102', //라이센스키
			dir : 'x', //방향축('x','y')
			mirror : 1, //반대방향이동(1,-1)
			radius : 10, //반경
			motionSpeed : 0.1
		//속도(0~1)
		})
	</script>
</body>