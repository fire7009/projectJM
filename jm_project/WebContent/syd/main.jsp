<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
			<h2>신상품</h2>
			<a href="#">
				<div class="goods_box">
					<div class="goods_img01">
						<img src="img/조명1.jpg" alt="" />
					</div>
					<div class="goods_info">
						<p class="strong">노오란 전구</p>
						<p>18,000</p>
					</div>
				</div>
			</a> <a href="#">
				<div class="goods_box">
					<div class="goods_img02">
						<img src="img/조명2.png" alt="" />
					</div>
					<div class="goods_info">
						<p class="strong">조명이 세개있는거같은 조명</p>
						<p>48,000</p>
					</div>
				</div>
			</a> <a href="#">
				<div class="goods_box">
					<div class="goods_img03">
						<img src="img/조명3.jpg" alt="" />
					</div>
					<div class="goods_info">
						<p class="strong">사전구</p>
						<p>32,500</p>
					</div>
				</div>
			</a> <a href="#">
				<div class="goods_box">
					<div class="goods_img04">
						<img src="img/조명4.jpg" alt="" />
					</div>
					<div class="goods_info">
						<p class="strong">드래곤볼에서 두개 모자라는 전구</p>
						<p>56,000</p>
					</div>
				</div>
			</a>
		</div>

		<!-- id="contents_top" -->

		<!-- 레시피 상품 슬라이드 만들기 -->
		<div id="recomend">
			<h3>추천상품</h3>
			<div class="animation_canvas">
				<div class="slider_panel">
					<a href="#"> <img src="img/조명18.jpg" class="slider_image"
						alt="" /></a> <a href="#"><img src="img/조명19.jpg"
						class="slider_image" alt="" /></a> <a href="#"><img
						src="img/조명20.png" class="slider_image" alt="" /></a> <a href="#"><img
						src="img/조명21.jpg" class="slider_image" alt="" /></a> <a href="#"><img
						src="img/조명22.jpg" class="slider_image" alt="" /></a>
				</div>
				<div class="control_panel">
					<div class="control_button"></div>
					<div class="control_button"></div>
					<div class="control_button"></div>
					<div class="control_button"></div>
					<div class="control_button"></div>
				</div>
			</div>
		</div>
		<!-- id="recipe" -->
		<!-- 자동슬라이드 배너를 이용한 베스트 상품 영역 만들기 -->
		<div id="bestgoods_zone">
			<h3>인기상품</h3>
			<div id="best_bg">
				<ul>
					<li><a href="#"><img src="img/조명7.jpg" alt="" /><span>별별무슨별
								조명</span></a></li>
					<li><a href="#"><img src="img/조명8.jpg" alt="" /><span>조개모양이네
								조명</span></a></li>
					<li><a href="#"><img src="img/조명9.jpg" alt="" /><span>화려한불빛이
								날 비추네 조명</span></a></li>
					<li><a href="#"><img src="img/조명10.jpg" alt="" /><span>이게
								더 조개같네 조명</span></a></li>
					<li><a href="#"><img src="img/조명11.jpg" alt="" /><span>태양열대신
								조명</span></a></li>
					<li><a href="#"><img src="img/조명12.jpg" alt="" /><span>흰색검정색
								깔맞춤 조명</span></a></li>
					<li><a href="#"><img src="img/조명13.jpg" alt="" /><span>배게같아서
								눕고싶지 조명</span></a></li>
					<li><a href="#"><img src="img/조명14.jpg" alt="" /><span>선앤문
								조명</span></a></li>
					<li><a href="#"><img src="img/조명16.jpg" alt="" /><span>동남아st
								조명</span></a></li>
					<li><a href="#"><img src="img/조명17.jpg" alt="" /><span>네일
								조명아닌 조명</span></a></li>
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

		<div id="contents_bottom"></div>
		<!-- id="map_wrap" -->

		<!-- id="online_wrap" -->
	</div>
	<!-- id="contents_bottom" -->


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