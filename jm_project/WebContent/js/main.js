$(function(){

	/* ���κ��־��� */
	window.mySwipe = $('#mySwipe').Swipe({
		auto: 3000, //��� �̵� �ӵ�
		continuous: true, // �ݺ��ؼ� �Ѹ�
		callback: function(index,element){
			$('.touch_bullet .active')
				.attr('src',$('.touch_bullet .active')
					.attr('src').replace('on.png','off.png'))
				.removeClass('active');
			$('.touch_bullet img').eq(index)
				.attr('src',$('.touch_bullet img').eq(index)
					.attr('src').replace('off.png','on.png'))
				.addClass('active');	
		}
	}).data('Swipe');
    
	/* ���־� ����, ���� ��ư */
	$('.touch_left_btn a').on('click',function(){
		mySwipe.prev();
		return false;
	});
	$('.touch_right_btn a').on('click',function(){
		mySwipe.next();
		return false;
	});
  

	var btnNum = 0;
	function autoPlay(){
		btnNum++;
		if(btnNum>=7) btnNum = 0;
		$('#roll_banner_wrap dt a').eq(btnNum).trigger('click');
		auto1 = setTimeout(autoPlay,3000);
	};
	autoPlay();
	$('.playBtn').on('click',function(){
		clearTimeout(auto1);
		auto1=setTimeout(autoPlay,3000);
		$('img',this).attr('src',$('img',this).attr('src').replace('off.gif','on.gif'));
		$('.stopBtn img').attr('src',$('.stopBtn img').attr('src').replace('on.gif','off.gif'));
		return false;
	});
	$('.stopBtn').on('click',function(){
		clearTimeout(auto1);
		$('img',this).attr('src',$('img',this).attr('src').replace('off.gif','on.gif'));
		$('.playBtn img').attr('src',$('.playBtn img').attr('src').replace('on.gif','off.gif'));
		return false;
	});	
	/* �Ǹ޴� */
	var onTab=$('#tabmenu dt a:first');
	$('#tabmenu dt a').on('mouseover focus click',function(){
		$('#tabmenu dd:visible').hide();
		$('img',onTab).attr('src',$('img',onTab).attr('src').replace('over.jpg','out.jpg'));
		$(this).parent().next().show();
		$('img',this).attr('src',$('img',this).attr('src').replace('out.jpg','over.jpg'));
		onTab=$(this);
		return false;
	});
	
	/* �Ű�����ǰ �����̴� */
	var mySlider = $('#best_bg ul').bxSlider({
		mode:'horizontal', // ����������� �̵�
		speed:300,
		pager:false,
		moveSlides:1,
		slideWidth: 170,
		minSlides:5,
		maxSlides:5,
		slideMargin: 50,
		auto:true,
		autoHover:true,
		controls:false
	});
	$('.prev_btn').on('click',function(){
		mySlider.goToPrevSlide();
		return false;
	});
	$('.next_btn').on('click',function(){
		mySlider.goToNextSlide();
		return false;
	});
	
	
	/* �̺�Ʈ�����̵��� */
	var visual = $('#brandVisual > ul > li');
	var button = $('#buttonList > li');
	var current = 0;
	var setIntervalId;
	button.on({click:function(){
		var tg = $(this);
		var i = tg.index();
		if(current == tg.index()){return;}
		button.removeClass('on');
		tg.addClass('on');
		move(i);
		return false;
	}});
	function move(i){
		var currentEl = visual.eq(current);
		var nextEl = visual.eq(i);
		currentEl.css({left:0}).stop().animate({left:'-100%'});
		nextEl.css({left:'100%'}).stop().animate({left: 0});
		current= i;
	};
	function timer(){
		setIntervalId = setInterval(function(){
			var n = current + 1;
			if(n==visual.size()){n=0}
			button.eq(n).trigger('click');
		},2000);
	};
	timer();
	$('#event_wrap').hover(
		function(){
			clearInterval(setIntervalId);
		},
		function(){
			timer();
		}
	);
	
	/* ������ �����̵� */
	function moveSlider(index){
		var willMoveLeft = -(index*1100);
		$('.slider_panel').animate({left:willMoveLeft},'1100');
		$('.control_button[data-index='+index+']').addClass('active');
		$('.control_button[data-index!='+index+']').removeClass('active');
		$('.slider_text[data-index='+index+']').fadeIn('fast').animate({left:0},'1100');
		$('.slider_text[data-index!='+index+']').fadeOut('fast',function(){$(this).css('left',-1100)});
		/* $('.slider_text[data-index='+index+']').show().animate({left:0},'500');
		$('.slider_text[data-index!='+index+']').hide('500',function(){$(this).css('left',-100)}); */
	};
	$('.slider_text').css('left',-100).each(function(index){
		$(this).attr('data-index',index);
	});
	$('.control_button').each(function(index){
		$(this).attr('data-index',index);
	}).click(function(){
		var index = $(this).attr('data-index');
		moveSlider(index);
	});
	
	var randomNumber = Math.round(Math.random()*4);
	moveSlider(randomNumber);
});









