<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
     <meta charset="UTF-8">
      <title>살림살이</title>
      
<!-- IE 호환을 위한 mata 태그  -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- 반응형 웹을 만들기 위한 mata 태그 선언  -->
<meta name="viewport" content="width=device-width,initial-scale=1.0">

<!-- 파비콘 link 태그 -->
<link rel="shortcut icon" href="/jojo/images/common/favicon.ico" type="image/x-icon">

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- 부트스트랩 css 스타일 -->
<link rel="stylesheet" href="/jojo/css/bootstrap.css">
<link rel="stylesheet" href="/jojo/css/bootstrap-responsive.css">

<!-- 공통(초기화, header, footer) 스타일 -->
<link rel="stylesheet" href="/jojo/css/common.css">

      <link rel="stylesheet" href="/jojo/store/store.css" />
   </head>
<body id="store">
   <div id="header">
      




<nav class="navbar navbar-fixed-top nav">
  <div class="container">
    <h1><a href="/jojo/index.jsp"><img src="/jojo/images/common/logo.png" alt="logo">살림살이</a></h1>

    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </a>

    <ul class="nav-collapse collapse">
      <li><a href="/jojo/introduce/introduce.jsp">소개</a></li>
      <li><a href="/jojo/store/store.jsp">상점</a></li>
      <li><a href="/jojo/news/brandnews.jsp">브랜드 소식</a></li>
      
         <li><a href="/jojo/login.jsp">로그인</a></li>
      
      <li><a href="/jojo/cart/shopping_cart.jsp">장바구니</a></li>
      
    </ul>
  </div>
</nav><!-- nav end -->

   </div>
   <div id="visual"></div>
   
   <div id="product">
      <h2>스토어</h2>
      <div class="list">
         <ul class="category_btn">
            <li><a href="/jojo/store/store.jsp?category=all"  class="selected" >전체</a></li>
            <li><a href="/jojo/store/store.jsp?category=가구" >가구</a></li>
            <li><a href="/jojo/store/store.jsp?category=데코·조명" >데코·조명</a></li>
            <li><a href="/jojo/store/store.jsp?category=패브릭" >패브릭</a></li>
         </ul>
      </div>
         
      <div class="container">
         <ul>
         
            <li class="first">
               <a href="">
                  <img src="/jojo/images/storeImages/storedeco01.PNG" alt="상품 리스트" >
                  <p>선인장 화분장식장</p>
                  <p>￦34,700</p>
               </a>
            </li>   
         </ul>
      </div> <!-- container end -->
      <!--    
      <div class="number">
         <ul>
            <li><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">4</a></li>
         </ul>
      </div> <!-- number end -->
       -->   
   </div><!-- product end -->
   <div id="footer">
      
<div class="container">
  <div class="row">
    <div class="span12">
      <ul>
        <li><a href="/jojo/board/boardMain.jsp">문의</a></li>
        <li><a href="/jojo/policy.jsp">이용약관</a></li>
        <li><a href="/jojo/private_info_policy.jsp">개인정보처리방침</a></li>
      </ul>
      <p>상호: 살림살이 | 대표: 이규민 | 개인정보관리책임자: 이규민 | 전화: 010-8282-8282 | 이메일: white@hair.com</p>
      <p>주소: 서울 강남구 테헤란로 123 (역삼동, 여삼빌딩) 15층 | 사업자등록번호: 02-6255-8002 | 통신판매: 제 2020-서울강남-00001호 | 팩스 : 02-566-1460</p>
      <p>Copyright © Plate All rights reserved.</p>
    </div>
  </div>
</div>

<!-- move_top_btn -->
<span class="move_top_btn">
   <a></a>
</span>

<!-- 제이쿼리 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- 부트스트랩 js 파일 -->
<script src="/jojo/js/bootstrap.min.js"></script>
<script src="/jojo/js/modernizr.js"></script>

<!-- 공통 js 파일 -->
<script src="/jojo/js/common.js"></script>
   </div>
   <script src="store.js"></script>
   </body>
</html>