<%@page import="jm_dto.UserInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//세션에 저장된 권한 관련 정보를 반환받아 저장
	UserInfoDTO loginMember=(UserInfoDTO)session.getAttribute("loginMember");
%>    


<div id="wrap">

	</div>

	<div id="header">
		<h1>
			<a href="<%=request.getContextPath() %>/index.jsp"><img src="img/JM_02.png" alt="vittz" style="width: 100px;"/></a>
		</h1>
		<dl id="util_menu">
			<dt class="hide">유틸메뉴</dt>
			<dd class="util_first">
				<ul>
				<% if(loginMember==null) {//비로그인 사용자 %>	
				  	<li class="login_wrap logtxt"><a href="<%=request.getContextPath() %>/index.jsp?workgroup=kdy/login&work=jm_login" >로그인</a> 
				
					<li class="logtxt"><a href="<%=request.getContextPath() %>/index.jsp?workgroup=kdy/join&work=jm_join" >|&nbsp;&nbsp;&nbsp;회원가입</a></li>
				</ul>
				<% } else {//로그인 사용자 %>
			
				<ul>	
			<li><%=loginMember.getUserNm() %>님 환영합니다.&nbsp;&nbsp;	</li>
					<li class="logout"><a href="<%=request.getContextPath() %>/index.jsp?workgroup=kdy/login&work=jm_logout_action">|&nbsp;&nbsp;&nbsp;로그아웃</a></li>
					
					<li calss="mypage"><a href="<%=request.getContextPath() %>/index.jsp?workgroup=khm&work=jm_myPage">|&nbsp;&nbsp;&nbsp;내정보</a></li>
				</ul>
			<% if(loginMember.getUserDv()=="9") { //관리자인 경우 %>
			
		<a href="index.jsp?workgroup=admin&work=admin_main">관리자</a>&nbsp;&nbsp;
			<% } %>
			<% } %>	
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
				<li class="fir"><a href="<%=request.getContextPath() %>/index.jsp?workgroup=category&work=category1">거실조명</a>
					<ul class="sub1">
						<li><a href="index.jsp?workgroup=khd&work=jm_Shopping">20평대</a></li>
						<li><a href="#">30평대</a></li>
						<li><a href="#">40평대</a></li>
						<li><a href="#">50평대</a></li>
						<li><a href="#">대형/복층/샹들리에</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath() %>/index.jsp?workgroup=category&work=category2">식탁/포인트 조명</a>
					<ul class="sub2">
						<li><a href="#">2인 식탁</a></li>
						<li><a href="#">4인 식탁</a></li>
						<li><a href="#">6인 식탁</a></li>
						<li><a href="#">대형 식탁</a></li>
						<li><a href="#">포인트</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath() %>/index.jsp?workgroup=category&work=category3">방조명</a>
					<ul class="sub3">
						<li><a href="#">큰방</a></li>
						<li><a href="#">안방</a></li>
						<li><a href="#">작은방</a></li>
						<li><a href="#">드레스룸</a></li>
						<li><a href="#">JM오리진</a></li>
					</ul></li>
					
				<li><a href="<%=request.getContextPath() %>/index.jsp?workgroup=category&work=category4">주방/화장실 조명</a>
					<ul class="sub4">
						<li><a href="#">주방</a></li>
						<li><a href="#">화장실</a></li>
						<li><a href="#">바리솔</a></li>
						
					</ul></li>
				<li><a href="<%=request.getContextPath() %>/index.jsp?workgroup=category&work=category5">스탠드</a>
					<ul class="sub5">
						<li><a href="#">침실</a></li>
						<li><a href="#">거실조명</a></li>
						<li><a href="#">책상</a></li>
						<li><a href="#">무드등/수유등</a></li>
						<li><a href="#">JM오리진</a></li>
					</ul></li>
				<li><a href="<%=request.getContextPath() %>/index.jsp?workgroup=category&work=category6">실외조명</a>
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
						<li><a href="#">JM오리진</a></li>
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
						<li><a href="#">JM오리진</a></li>
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