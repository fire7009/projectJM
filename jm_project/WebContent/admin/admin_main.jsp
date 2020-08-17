<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" >
        <!--[if IE 10]><meta http-equiv="X-UA-Compatible" content="IE=8" /><![endif]-->
                <title>Cafe24-Echosting Admin</title>
        <!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-NBS7Z7L');</script>
<!-- End Google Tag Manager -->        <link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/mode/influencer/common.css" media="all" charset="utf-8" />


    <script type="text/javascript">function getMultiShopUrl(sUrl)
        {
           if (SHOP.isMultiShop() === false) {
               return sUrl;
           } else if (/^\/((?:disp|exec)\/admin|admin\/php)(\/shop\d+)\//.test(sUrl) === true) {
               return sUrl;
           } else {
               return sUrl.replace(/\/((?:disp|exec)\/admin|admin\/php)(\/shop\d+)?\//, "/$1/shop" + EC_SDE_SHOP_NUM + "/");
           }
        }
var EC_SDE_SHOP_NUM = 1;var SHOP = {getLanguage : function() { return "ko_KR"; },getCurrency : function() { return "KRW"; },getFlagCode : function() { return "KR"; },getTimezone: function() { return "Asia/Seoul" },isMultiShop : function() { return false; },isDefaultShop : function() { return true; },isDefaultLanguageShop : function(sLanguageCode) { return SHOP.isDefaultShop() && SHOP.isLanguageShop(sLanguageCode); },isKR : function() { return true; },isUS : function() { return false; },isJP : function() { return false; },isCN : function() { return false; },isTW : function() { return false; },isES : function() { return false; },isPT : function() { return false; },isVN : function() { return false; },isPH : function() { return false; },isLanguageShop : function(sLanguageCode) { return sLanguageCode === "ko_KR"; },getDefaultShopNo : function() { return 1; },getProductVer : function() { return 2; },isSDE : function() { return true; },isMode : function() {return true; },getModeName : function() {return true; },isMobileAdmin : function() {return false; },isExperienceMall : function() { return true; },getAdminID : function() {return 'neomart'},getMallID : function() {return 'neomart'},getCurrencyFormat : function(sPriceTxt, bIsNumberFormat) { 
        sPriceTxt = String(sPriceTxt);

        var aCurrencySymbol = ["","\uc6d0",false];

        if (typeof SHOP_PRICE !== 'undefined' && isNaN(sPriceTxt.replace(/[,]/gi, '')) === false && bIsNumberFormat === true) {
            // bIsNumberFormat 사용하려면 Ui(':libUipackCurrency')->plugin('Currency') 화폐 라이브러리 추가 필요
            sPriceTxt = SHOP_PRICE.toShopPrice(sPriceTxt.replace(/[,]/gi, ''), true, EC_SDE_SHOP_NUM);
        }

        return aCurrencySymbol[0] + sPriceTxt + aCurrencySymbol[1];
        }};var EC_COMMON_UTIL = {convertSslForString : function(sString) { return sString.replace(/http:/gi, '');},convertSslForHtml : function(sHtml) { return sHtml.replace(/((?:src|href)\s*=\s*['"])http:(\/\/(?:[a-z0-9\-_\.]+)\/)/ig, '$1$2');},getProtocol : function() { return 'https'; },moveSsl : function() { if (EC_COMMON_UTIL.getProtocol() === 'http') { var oLocation = jQuery(window.location); var sUrl = 'https://' + oLocation.attr('host') + oLocation.attr('pathname') + oLocation.attr('search'); window.location.replace(sUrl); } },setEcCookie : function(sKey, sValue, iExpire) {var exdate = new Date();exdate.setDate(exdate.getDate() + iExpire);var setValue = escape(sValue) + "; domain=." + EC_GLOBAL_INFO.getBaseDomain() + "; path=/;expires=" + exdate.toUTCString();document.cookie = sKey + "=" + setValue;}};var EC_SHOP_LIB_INFO = {getBankInfo : function() { 
            var oBankInfo = "";
            $.ajax({
                type: "GET",
                url: "/exec/front/Shop/Bankinfo",
                dataType: "json",
                async: false,
                success: function(oResponse) {
                    oBankInfo = oResponse;
                }
             });
             return oBankInfo; }};if (typeof SHOP !== 'undefined' && SHOP.isMobileAdmin() === false) {window.addEventListener('beforeunload', function (e) {if ((typeof INFLUENCER_MENU_NAVIGATION_GNB !== 'undefined' && INFLUENCER_MENU_NAVIGATION_GNB.bIsChaneMode === true) || (typeof parent.INFLUENCER_MENU_NAVIGATION_GNB !== 'undefined' && parent.INFLUENCER_MENU_NAVIGATION_GNB.bIsChaneMode === true)) { } else {EC_COMMON_UTIL.setEcCookie('is_mode', SHOP.getModeName(), 30);}});window.open = function (open) {return function (url, name, features) {EC_COMMON_UTIL.setEcCookie('is_mode', SHOP.getModeName(), 30);name = name || '';features = (typeof features === 'undefined') ? '' : features;return open.call(window, url, name, features);};}(window.open);}
            var EC_ROOT_DOMAIN = "cafe24.com";
            var EC_TRANSLATE_LOG_STATUS = "F";
            var EC_GLOBAL_INFO = (function() {
                var oData = {"base_domain":"neomart.cafe24.com","root_domain":"cafe24.com","is_global":false,"country_code":"KR","language_code":"ko_KR","admin_language_code":"ko_KR"};
                
                return {
                    getBaseDomain: function() {
                        return oData['base_domain'];
                    },

                    getRootDomain: function() {
                        return oData['root_domain'];
                    },

                    isGlobal: function() {
                        return oData['is_global'];
                    },

                    getCountryCode: function() {
                        return oData['country_code'];
                    },

                    getLanguageCode: function() {
                        return oData['language_code'];
                    },
                    
                    getAdminLanguageCode: function() {
                        return oData['admin_language_code'];
                    }
                };
            })();</script></head>
    <body class="ECInfluencer">
                <!-- jQUERY 3.4.1 -->
        <script type="text/javascript">
            var _jQuery = (window.jQuery !== undefined) ? window.jQuery : undefined;
            var _$ = (window.$ !== undefined) ? window.$ : undefined;
        </script>
        <script type="text/javascript" src="/admin/js/jquery-3.4.1.min.js" charset="utf-8"></script>
        <script type="text/javascript" src="/admin/js/smarthelper-ui.js" charset="utf-8"></script>
        <script type="text/javascript">
            var EC_JQUERY_3_4_1 = (function (jQuery, _jQuery, _$ ) {
                var prefix = 'EC_JQ3';
                if (window.hasOwnProperty(prefix) && window[prefix].ui) return ;
                window.EC_JQ3 = jQuery.noConflict();
                window.jQuery = _jQuery;
                window.$ = _$;
            })(jQuery, _jQuery, _$);
        </script>        <!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NBS7Z7L"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->        <div id="wrap" class="">
            <div id="header">

            <!-- GNB Start -->
            <script type="text/javascript">
    function shop_admin_icon()
    {
        if (confirm('바탕화면에 쇼핑몰 관리자 바로가기를 생성하시겠습니까?')) {
            DesktopIconObj.addIcon('http://echosting.cafe24.com/Shop/','쇼핑몰 관리 어드민','//img.cafe24.com/images/ec_admin/etc/EC_quick_02.ico');
            alert('생성되었습니다.');
        } else {
            alert('취소되었습니다.');
        }
    }

    function addFavorite(){
        var title = "쇼핑몰 관리 어드민";
        var url = "http://echosting.cafe24.com/Shop/";
        if(window.sidebar && window.sidebar.addPanel){    //firefox
            window.sidebar.addPanel(title, url,"");
        }else if(window.opera && window.print){    //opera
            var elem = document.createElement('a');
            elem.setAttribute('href',url);
            elem.setAttribute('title',title);
            elem.setAttribute('rel','sidebar');
            elem.click();
        }else if(document.all){    //msie
            window.external.AddFavorite( url, title);
        }else{
            alert("죄송합니다.\n\n사용하시는 브라우저는 즐겨찾기 추가 기능이 지원되지 않습니다.\n\n수동으로 즐겨찾기를 추가해 주셔야 합니다.");
            return true;
        }
    }

    function ep_purge()
    {
        // 구상품 퍼지 url
        var msg = '서버상의 이미지 및 기타 설정 등의 임시 저장소 파일을 갱신하여\n';
        msg += '최신정보로 적용합니다.\n\n';
        msg += '※  해당 기능을 자주 사용하시면 서버부하의 원인이 될 수 있습니다.\n';
        msg += '각종 수정작업 등을 완료한 후에 실행하여 주세요.\n\n';
        msg += '사이드캐시 삭제를 실행하시겠습니까?';

        if (confirm(msg)) {
            MENU_NAVIGATION_GNB.sendRequest(ep_purge_msg, '',    'GET', '/admin/php/shop1/m/ep_purge.php', true, true);
        }
    }

    function setEpPurgeUrl()
    {
        var sOption = 'toolbar=no location=no scrollbars=yes status=yes resizable=no width=760 height=450';
        window.open('/disp/admin/shop1/varnish/PurgePage','setEpPurgeUrl', sOption);

    }

    function ep_purge_msg(oj)
    {
        var  res = oj.responseText;
        if(res == 'SUCCESS'){
            alert('정상적으로 처리되었습니다.');
        } else if(res == 'ERR1') {
            alert('EP 서버리스트가 없습니다.');
        } else {
            alert('정상적으로 처리되지 않았습니다.\n\n확인 후 다시 시도하여 주십시오.');
        }
    }

    function addCafe24CustomerId()
    {
        $.ajax({
            url: '/admin/php/shop1/m/addCafe24CustomerId.php',
            success: function(oResponse) {
                var jResponse = JSON.parse(oResponse);
                alert(jResponse.message);
            },
            beforeSend: function(){
                $("#eAddcafe24CustomerIdBtn").css("display", "none");
                $("#cafe24CustomerIdLoading").css("display", "inline-block");
            },
            complete: function(){
                $("#cafe24CustomerIdLoading").css("display", "none");
                $("#eAddcafe24CustomerIdBtn").css("display", "");
            }
        });
    }
</script>

<div class="header">
    <div class="head">
        <h1 class="logo">
            <a href="/disp/admin/shop1/mode/dashboard">
                <img src="//img.echosting.cafe24.com/ec/mode/influencer/common/h1_logo.png" alt="cafe24" />
            </a>
        </h1>
        <div class="changeModeToggle">
            <strong class="mode now" id="ec-influencer-gnb-mode-smart">스마트모드</strong>
            <label class="toggle ec-influencer-gnb-mode-change">
                <input type="checkbox" class="check" id="ec-influencer-gnb-mode-change-checkbox">
                <span class="label"></span>
            </label>
            <strong class="mode ec-influencer-gnb-mode-change" id="ec-influencer-gnb-mode-pro" style="cursor: pointer;">프로모드</strong>
        </div>
    </div>
    <ul class="util" id="gnb">
        <li class="shop">
            <a href="#none">쇼핑몰 바로가기</a>
            <div class="dropLayer">
                <div class="mall">
                    <a href="/admin/php/shop1/m/goto_front.php" target="_blank" class="btnPc">PC쇼핑몰 바로가기</a>
                    <a href="/admin/php/shop1/m/goto_front.php?type=mobile" target="_blank" class="btnMobile">모바일쇼핑몰 바로가기</a>
                </div>
            </div>
        </li>

        <li class="setting"><a href="/disp/admin/shop1/Mode/Setting">설정</a></li>
        
    </ul>
    <div class="member ec-influencer-gnb-member-area">
        <span class="ec-influencer-gnb-member">
            <strong class="name"><span class="icoUser"></span>대표운영자님</strong>
            <button type="button" class="btnMore eClick">회원정보 보기</button>
        </span>
        <div class="dropLayer ec-influencer-gnb-member-info" style="display: none">
            <div class="userInfo">
                <span class="icoUser"></span>
                <strong class="mall">neomart</strong>
                <span class="user">대표운영자님</span>
                                <div class="cs">
                    <a href="#none" id="eAddcafe24CustomerIdBtn" class="btnCS" onclick="addCafe24CustomerId(); return false;">CS전용 계정생성</a>
                    <span id="cafe24CustomerIdLoading" style="display:none; vertical-align: middle;">
                        <img src="//img.echosting.cafe24.com/suio/ico_loading.gif" alt="loading">
                    </span>
                    <a href="//ecsupport.cafe24.com/board/free/read.html?no=2322&board_no=5&category_no=1&cate_no=1&category_no=1&category_no=1" class="btnFaq" target="_blank" title="새창 열림">FAQ</a>
                </div>
                            </div>
            <div class="button">
                                <a href="/disp/admin/shop1/Mode/SettingStore">내쇼핑몰정보</a>
                                <a href="/admin/php/shop1/log_out.php">로그아웃</a>
            </div>
            <button type="button" class="btnClose eClose" id="ec-influencer-gnb-member-area-close">닫기</button>
        </div>
    </div>
    <div class="add ec-influencer-gnb-add-menu-area">
        <button type="button" class="btnMore eClick ec-influencer-gnb-more-view">더보기</button>
        <div class="dropLayer ec-influencer-gnb-add-menu" style="display: none">
            <div class="divide">
                <strong class="title">바로가기</strong>
                <ul class="link">
                                        <li><a href="https://ecsupport.cafe24.com/" target="_blank">자주 묻는 질문</a></li>
                    <li><a href="https://service-api.echosting.cafe24.com/Shopboard/index.php?bbs_no=5&country_code=KR" target="_blank">공지사항</a></li>
                    <li><a href="javascript:alert('사용할 수 없습니다.')" >1:1 문의</a></li>
                    <li><a href="https://store.cafe24.com/common/auth?mall_id=neomart&menu_id=1&language=ko" target="_blank">앱스토어</a></li>
                    <li><a href="/admin/php/shop1/AutoLogin/request.php?uri=https%3A%2F%2Fechosting.cafe24.com%2F" target="_blank">쇼핑몰센터</a></li>
                    <li><a href="/admin/php/shop1/AutoLogin/request.php?menu_code=9&uri=http://cmc.cafe24.com" target="_blank">마케팅센터</a></li>
                    <li><a href="http://edu.cafe24.com" target="_blank">교육센터</a></li>
                    <li><a href="https://d.cafe24.com/home/home_main.php" target="_blank">디자인센터</a></li>
                                    </ul>
            </div>
                        <div class="divide">
                <strong class="title">편의기능</strong>
                <ul class="link">
                                        <li><a href="#none" class="link" onclick="addFavorite();">즐겨찾기 추가</a></li>
                    <li><a href="#none" class="link" onclick="shop_admin_icon();">바탕화면 추가</a></li>
                                                        </ul>
            </div>
                    </div>
    </div>
</div>

<script language='Javascript'>
    function showLmMessage ()
    {
        $('#wrap').attr('class','lm');

        $('<div/>', {
            class: 'alert',
            text: '접속하신 쇼핑몰은 정상적으로 접근한 쇼핑몰이 아닙니다. 등록/수정/삭제 업무 시 주의하세요. 민감정보 유출 시 법적 제재를 받을 수 있습니다.'
        }).prependTo('#header');

        $('#header > .header > h1').addClass('logo');
    }

    function montionControlDisable ()
    {
        document.onselectstart = document.oncopy = document.oncut = document.onpaste = document.oncontextmenu = new Function('return false');
    }

    function motionControl ()
    {
        //Parent Menu No값 가져오기
        var pMenu = $('#gnb .selected a');
        var pMenuNo = Number(pMenu.attr('menuno'));

        //Tab Menu No값 가져오기
        var tMenu = $('.tabArea .selected a');
        var tMenuNo = Number(tMenu.attr('menuno'));

        //Child Menu No값 가져오기
        var cMenu = $('.menu .selected a');
        var cMenuNo = Number(cMenu.attr('menuno'));

        var aMenuList = [2060,5];
        var aMotionControlNoList = [pMenuNo,tMenuNo,cMenuNo];

        for (var key in aMotionControlNoList) {
            if (aMenuList.indexOf(aMotionControlNoList[key]) !== -1) {
                $('<div/>', {
                class: 'check_use_motion',
                id: 'check_use_motion'
                }).prependTo('#header');

                montionControlDisable();

                break;
            }
        }
    }
</script>
<script type="text/javascript">
    /* jQUERY 3.4.1 */
    var _jQuery = (window.jQuery !== undefined) ? window.jQuery : undefined;
    var _$ = (window.$ !== undefined) ? window.$ : undefined;
</script>
<script type="text/javascript" src="/admin/js/jquery-3.4.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/admin/js/smarthelper-ui.js" charset="utf-8"></script>
<script type="text/javascript">
    var EC_JQUERY_3_4_1 = (function (jQuery, _jQuery, _$ ) {
        var prefix = 'EC_JQ3';
        if (window.hasOwnProperty(prefix) && window[prefix].ui) return ;
        window.EC_JQ3 = jQuery.noConflict();
        window.jQuery = _jQuery;
        window.$ = _$;
    })(jQuery, _jQuery, _$);
</script>
            <!-- GNB End -->

            </div><!-- //header -->
            <hr class="layout" />
            <div id="container" class=""><!--  class="snbHidden" -->
                <div id="sidebar">

                    <!-- LNB Start -->
                    <div class="snbArea">
            <ul id="snb">
                          <li class=" depth1 expandable ">
                <a id="QA_Lnb_Menu2486" href="#none" menuno="2486" treeno="2703" class="product" targetframe="F">
                                            상품관리                                    </a>
                <ul>
                                                                                                    <li class="">
                                <a id="QA_Lnb_Menu2033" href="/disp/admin/shop1/Mode/ProductRegister" menuno="2033" treeno="2705" class="" targetframe="F">
                                                                    상품 등록                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu2037" href="/disp/admin/shop1/product/productmanage" menuno="2037" treeno="2704" class="" targetframe="F">
                                                                    상품 목록                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu2136" href="/disp/admin/shop1/product/categorymanage" menuno="2136" treeno="2706" class="" targetframe="F">
                                                                    상품분류 관리                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu2464" href="javascript:MENU_NAVIGATION_GNB.openShowInfoMainPlus();" menuno="2464" treeno="2736" class="" targetframe="F">
                                                                    메인진열 관리                                                                </a>
                            </li>
                                                                                        </ul>
            </li>
                                        <li class=" depth1 expandable ">
                <a id="QA_Lnb_Menu2487" href="#none" menuno="2487" treeno="2707" class="order" targetframe="F">
                                            주문관리                                    </a>
                <ul>
                                                                                                    <li class="">
                                <a id="QA_Lnb_Menu74" href="/admin/php/shop1/s_new/order_list.php" menuno="74" treeno="2708" class="" targetframe="F">
                                                                    전체주문목록                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu71" href="/admin/php/shop1/s/payment_list.php" menuno="71" treeno="2709" class="" targetframe="F">
                                                                    배송 관리                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu76" href="/admin/php/shop1/s/order_cancel.php" menuno="76" treeno="2710" class="" targetframe="F">
                                                                    취소/교환/반품/환불                                                                </a>
                            </li>
                                                                                        </ul>
            </li>
                                            <li class="">
                    <a id="QA_Lnb_Menu2488" href="/admin/php/shop1/c/member_admin_l.php" menuno="2488" treeno="2711" class="member" targetframe="F">
                                            고객관리                                        </a>
                </li>
                                        <li class=" depth1 expandable ">
                <a id="QA_Lnb_Menu2489" href="#none" menuno="2489" treeno="2712" class="board" targetframe="F">
                                            게시판관리                                    </a>
                <ul>
                                                                                                    <li class="">
                                <a id="QA_Lnb_Menu106" href="/admin/php/shop1/b/board_admin_l.php" menuno="106" treeno="2713" class="" targetframe="F">
                                                                    게시판 설정                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu390" href="/admin/php/shop1/b/board_admin_bulletin_l.php" menuno="390" treeno="2714" class="" targetframe="F">
                                                                    게시물 관리                                                                </a>
                            </li>
                                                                                        </ul>
            </li>
                                        <li class=" depth1 expandable ">
                <a id="QA_Lnb_Menu2490" href="#none" menuno="2490" treeno="2715" class="design" targetframe="F">
                                            디자인관리                                    </a>
                <ul>
                                                                                                    <li class="">
                                <a id="QA_Lnb_Menu1562" href="/disp/admin/shop1/skin/list" menuno="1562" treeno="2716" class="" targetframe="F">
                                                                    디자인 보관함                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu1563" href="/disp/admin/shop1/skin/add" menuno="1563" treeno="2717" class="" targetframe="F">
                                                                    디자인 추가                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu2014" href="/disp/admin/shop1/backup/backup?type=PC" menuno="2014" treeno="2718" class="" targetframe="F">
                                                                    디자인 백업/복구                                                                </a>
                            </li>
                                                                                        </ul>
            </li>
                                        <li class=" depth1 expandable ">
                <a id="QA_Lnb_Menu2491" href="#none" menuno="2491" treeno="2719" class="promotion" targetframe="F">
                                            프로모션                                    </a>
                <ul>
                                                                                                    <li class="">
                                <a id="QA_Lnb_Menu2011" href="/disp/admin/shop1/promotion/benefitlist" menuno="2011" treeno="2720" class="" targetframe="F">
                                                                    혜택 관리                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu284" href="/disp/admin/shop1/newcoupon/onlineIssueInquiry" menuno="284" treeno="2721" class="" targetframe="F">
                                                                    쿠폰 관리                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu1603" href="/disp/admin/shop1/Mileage/ManageAvail" menuno="1603" treeno="2722" class="" targetframe="F">
                                                                    적립금 관리                                                                </a>
                            </li>
                                                                                        </ul>
            </li>
                                        <li class=" depth1 expandable ">
                <a id="QA_Lnb_Menu2492" href="#none" menuno="2492" treeno="2723" class="calculate" targetframe="F">
                                            통계분석                                    </a>
                <ul>
                                                                                                    <li class="">
                                <a id="QA_Lnb_Menu2063" href="/disp/admin/shop1/report/DailyList" menuno="2063" treeno="2724" class="" targetframe="F">
                                                                    매출 분석                                                                </a>
                            </li>
                                                                                                                                                        <li class="">
                                <a id="QA_Lnb_Menu2069" href="/disp/admin/shop1/report/ProductPrdchart" menuno="2069" treeno="2725" class="" targetframe="F">
                                                                    상품 분석                                                                </a>
                            </li>
                                                                                        </ul>
            </li>
                                            <li class="">
                    <a id="QA_Lnb_Menu2441" href="/disp/admin/shop1/myapps/list" menuno="2441" treeno="2729" class="appstore" targetframe="F">
                                            앱스토어                                        </a>
                </li>
                                            <li class="">
                    <a id="QA_Lnb_Menu2504" href="javascript:MENU_NAVIGATION_GNB.openMarketManage();" menuno="2504" treeno="2742" class="market" targetframe="F">
                                            마켓통합관리                                        </a>
                </li>
                  </ul>
    
            <div class="customer">
    <strong class="title">고객센터 <span class="info">(평일 9~18시)</span></strong>
    <div class="tel">1588<span class="dot">.</span>3413</div>
</div>

        <div class="ftp "><!-- 참고: 80% 초과한 경우 over class 추가 -->
            <strong class="title">파일 업로드 사용 용량</strong>
            &nbsp;<a href="#none" class="btnUploader" id="ec-smartmode-lnb-file-uploader">업로더</a>
            <div class="info">
                <div class="gauge">
                    <span class="value" style="width:22%"></span>
                </div>
                <div class="data">
                    <strong class="value">22%</strong>
                    <span class="capacity"><strong class="value">43MB</strong> / 200MB</span>
                </div>
            </div>
                    </div>
    </div>

                    <!-- LNB End -->

                </div>

                <hr class="layout" />

                <!-- Content Start -->
                <!-- [ content ] -->
<div id="content">
    <div class="gridSet nowrap">
            <div class="grid">
                <div class="dashArea">
                    <div class="mTitle">
                        <h2>오늘 매출 현황</h2>
                        <span class="desc">(08월 17일 18:10 기준)</span>
                        <span class="cManual eSmartMode" code="MN"></span>
                    </div>
                    <div class="mDashSales">
                        <a href="/admin/php/shop1/s_new/order_list.php?initSearchFlag=T&year1=2020&month1=08&day1=17&year2=2020&month2=08&day2=17&start_date=2020-08-17&end_date=2020-08-17&start_time=00:00&end_time=23:59&rows=20&searchSorting=order_desc&btnDate=9999&date_type=order_date&searchSorting=order_desc&memberType=1&shop_no_order=1&orderStatusPayment=all&orderStatusNotPayCancel=N&orderStatusCancel=N&orderSearchCancelStatus=all&orderStatusExchange=N&orderSearchExchangeStatus=all&orderStatusReturn=N&orderStatusRefund=N&orderSearchRefundStatus=all&orderSearchShipStatus=all&orderStatus[]=all&orderStatus[]=N10&orderStatus[]=N20&orderStatus[]=N22&orderStatus[]=N21&orderStatus[]=N30&orderStatus[]=N40&incoming=T&realclick=T" class="item order">
                            <strong class="title">주문 <span id="orderCount" class="count">(**건)</span></strong>
                            <span class="data">
                                        <strong id="orderPrice" class="value">**</strong>
                                        <span class="unit">원</span>
                                </span>
                        </a>
                        <a href="/disp/admin/shop1/report/DailyList?sStartDate=2020-08-17&sEndDate=2020-08-17&searchDateRange=0&&inflow=dashboard" class="item payment">
                            <strong class="title">결제 <span id="payedCount" class="count">(**건)</span></strong>
                            <span class="data">
                                        <strong id="payedPrice" class="value">**</strong>
                                        <span class="unit">원</span>
                            </span>
                        </a>
                        <a href="/disp/admin/shop1/report/DailyList?sStartDate=2020-08-17&sEndDate=2020-08-17&searchDateRange=0&&inflow=dashboard" class="item refund">
                            <strong class="title">환불 <span id="refundCount" class="count">(**건)</span></strong>
                            <span class="data">
                                        <strong id="refundPrice" class="value">**</strong>
                                        <span class="unit">원</span>
                            </span>
                        </a>
                    </div>

                    <div class="mTitle">
                        <h2>주문현황</h2>
                        <span class="desc">(최근 1개월 기준)</span>
                    </div>
                    <div class="gridSet">
                        <div class="mDashStatus order">
                            <a href="/admin/php/shop1/s/payment_list.php?rows=20&btnDate=9999&searchSorting=order_desc&date_type=order_date&payed[]=1&payed_sql_version=1&bank_info=0&memberType=1&shop_no_order=1&incoming=T&realclick=T&year1=2020&month1=07&day1=17&year2=2020&month2=08&day2=17&start_date=2020-07-17&end_date=2020-08-17&start_time=00:00&end_time=23:59" id="no_pay_cnt" class="item">
                                <strong class="title">입금전</strong>
                                <span class="count">**</span>
                            </a>
                        </div>
                        <div class="mDashStatus order">
                            <a href="/admin/php/shop1/s_new/shipped_begin_list.php?rows=20&btnDate=9999&searchSorting=pay_date_asc&date_type=order_date&memberType=1&shop_no_order=1&incoming=T&realclick=T&year1=2020&month1=07&day1=17&year2=2020&month2=08&day2=17&start_date=2020-07-17&end_date=2020-08-17&start_time=00:00&end_time=23:59" id="is_shipped_f" class="item">
                                <strong class="title">배송준비중</strong>
                                <span class="count">**</span>
                            </a>
                        </div>
                        <div class="mDashStatus order">
                            <a href="/admin/php/shop1/s_new/shipped_standby_list_ord_num.php?rows=20&btnDate=9999&searchSorting=order_desc&MSK[]=order_id&MSV[]=&order_id=Array&date_type=order_date&find_option=product_code&order_product_name=&order_product_code=&payed=&payed_sql_version=&bank_info=&memberType=1&group_no=&isMemAuth=&shipment_type=all&bunch=&shipmentMessage=&paystandard=choice&product_total_price1=&product_total_price2=&item_count=all&mkSaleType=M&mkSaleTypeChg=&paymentMethod=&is_eguarantee=&discountMethod=&shop_no_order=1&delvReady=&delvCancel=&orderStatusPayment=&orderStatusNotPayCancel=&orderStatusCancel=&orderSearchCancelStatus=&orderStatusExchange=&orderSearchExchangeStatus=&orderStatusReturn=&orderStatusRefund=&orderSearchRefundStatus=&orderSearchShipStatus=&orderStatus=&RefundType=&incoming=T&realclick=T&year1=2020&month1=07&day1=17&year2=2020&month2=08&day2=17&start_date=2020-07-17&end_date=2020-08-17&start_time=00:00&end_time=23:59" id="is_shipped_w" class="item">
                                <strong class="title">배송대기</strong>
                                <span class="count">**</span>
                            </a>
                        </div>
                        <div class="mDashStatus order">
                            <a href="/admin/php/shop1/s/shipped_end_list.php?rows=20&btnDate=9999&searchSorting=order_desc&MSK[]=order_id&MSV[]=&order_id=Array&date_type=shipbegin_date&find_option=product_code&order_product_name=&order_product_code=&payed=&payed_sql_version=&bank_info=&memberType=1&group_no=&isMemAuth=&shipment_type=all&bunch=&shipmentMessage=&paystandard=choice&product_total_price1=&product_total_price2=&item_count=all&mkSaleType=M&mkSaleTypeChg=&paymentMethod=&is_eguarantee=&discountMethod=&shop_no_order=1&delvReady=&delvCancel=&orderStatusPayment=&orderStatusNotPayCancel=&orderStatusCancel=&orderSearchCancelStatus=&orderStatusExchange=&orderSearchExchangeStatus=&orderStatusReturn=&orderStatusRefund=&orderSearchRefundStatus=&orderSearchShipStatus=&orderStatus=&RefundType=&incoming=T&realclick=T&year1=2020&month1=07&day1=17&year2=2020&month2=08&day2=17&start_date=2020-07-17&end_date=2020-08-17&start_time=00:00&end_time=23:59" id="is_shipped_m" class="item">
                                <strong class="title">배송중</strong>
                                <span class="count">**</span>
                            </a>
                        </div>
                    </div>

                    <div class="mTitle">
                        <h2>취소 / 교환 / 반품 / 환불현황</h2>
                        <span class="desc">(최근 1개월 기준)</span>
                    </div>
                    <div class="gridSet">
                        <div class="mDashStatus cs">
                            <a href="/admin/php/shop1/s/order_cancel.php?realclick=T&tabclick=F&tabStatus=all&memberType=1&sSearchDetailView=F&sIsOrderSearchNotAllowed=F&date_type=order_date&start_date=2020-07-17&year1=2020&month1=07&day1=17&end_date=2020-08-17&year2=2020&month2=08&day2=17&today=2020-08-17&searchPage=order_cancel&orderStatus[]=all" id="cancel_count" class="item">
                                <strong class="title">취소</strong>
                                <span class="count">**</span>
                            </a>
                        </div>
                        <div class="mDashStatus cs">
                            <a href="/admin/php/shop1/s/order_change.php?realclick=T&tabclick=F&tabStatus=all&memberType=1&sSearchDetailView=F&sIsOrderSearchNotAllowed=F&date_type=order_date&start_date=2020-07-17&year1=2020&month1=07&day1=17&end_date=2020-08-17&year2=2020&month2=08&day2=17&today=2020-08-17&searchPage=order_change&cs_type=exchange&orderStatus[]=all" id="change_count" class="item">
                                <strong class="title">교환</strong>
                                <span class="count">**</span>
                            </a>
                        </div>
                        <div class="mDashStatus cs">
                            <a href="/admin/php/shop1/s_new/order_returns.php?realclick=T&tabclick=F&tabStatus=all&memberType=1&sSearchDetailView=F&sIsOrderSearchNotAllowed=F&date_type=order_date&start_date=2020-07-17&year1=2020&month1=07&day1=17&end_date=2020-08-17&year2=2020&month2=08&day2=17&today=2020-08-17&cs_type=return&searchPage=order_returns&orderStatus[]=all&mode=return_post_req" id="return_count" class="item">
                                <strong class="title">반품</strong>
                                <span class="count">**</span>
                            </a>
                        </div>
                        <div class="mDashStatus cs">
                            <a href="/admin/php/shop1/s_new/order_cash_refund_f.php?realclick=T&tabclick=F&tabStatus=all&listName=orderCashRefundselectedAll&searchPage=order_cash_refund_f&&sSearchDetailView=F&sIsOrderSearchNotAllowed=F&date_type=all_return_date&start_date=2020-07-17&year1=2020&month1=07&day1=17&end_date=2020-08-17&year2=2020&month2=08&day2=17&today=2020-08-17&orderStatus[]=all&RefundType=all&bank_info=0&RefundSubType=all&memberType=1" id="before_refund" class="item">
                                <strong class="title">환불</strong>
                                <span class="count">**</span>
                            </a>
                        </div>
                    </div>

                    <div class="gridSet nowrap notify">
                        <div class="grid notice">
                            <div class="mDashNotice">
                                <div class="tab eTab">
                                    <ul>
                                        <li class="eTab_notice selected"><a href="#tabContent1">공지사항</a></li>
                                        <li class="eTab_update"><a href="#tabContent2">업그레이드</a></li>
                                        <li class="eTeb_market"><a href="#tabContent3">오픈마켓 소식</a></li>
                                        <li class="eTab_faq"><a href="#tabContent4">자주묻는 질문</a></li>
                                    </ul>
                                </div>
                                <div class="tabContent" id="tabContent1">
                                    <div class="news">
                                                                                <ul class="list">
                                                                                        <li>
                                                                                                    <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardView&no=344822&bbs_no=5&version=1.9&class=local&sne=dWUwMDAz"><strong>[안내] 2020년 8월17일(월요일) 임시공휴일 휴무안내</strong></a>
                                                                                                                                                    <span class="icoNoticeNew">New</span>
                                                                                                <span class="date">2020-08-14</span>
                                            </li>
                                                                                        <li>
                                                                                                    <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardView&no=344833&bbs_no=5&version=1.9&class=local&sne=dWUwMDAz"><strong>[안내] 온라인쇼핑몰의무보험(개인정보배상책임보험) 가입점검 강화에 따른 안내</strong></a>
                                                                                                                                                    <span class="icoNoticeNew">New</span>
                                                                                                <span class="date">2020-08-10</span>
                                            </li>
                                                                                        <li>
                                                                                                    <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardView&no=344741&bbs_no=5&version=1.9&class=local&sne=dWUwMDAz"><strong>[안내] 해외운영대행 서비스 개편 오픈 안내</strong></a>
                                                                                                                                                <span class="date">2020-07-28</span>
                                            </li>
                                                                                        <li>
                                                                                                    <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardView&no=344415&bbs_no=5&version=1.9&class=local&sne=dWUwMDAz"><strong>[필독] 전자상거래 소매업자 현금영수증 의무발급 관련 안내</strong></a>
                                                                                                                                                <span class="date">2020-05-11</span>
                                            </li>
                                                                                        <li>
                                                                                                    <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardView&no=344858&bbs_no=5&version=1.9&class=local&sne=dWUwMDAz">[안내] 8월 16일(일) 신용카드사 시스템 작업 안내</a>
                                                                                                                                                    <span class="icoNoticeNew">New</span>
                                                                                                <span class="date">2020-08-14</span>
                                            </li>
                                                                                    </ul>
                                                                                <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardList&bbs_no=5&version=1.9&class=local&sne=dWUwMDAz" class="btnMore">더보기</a>
                                    </div>
                                </div>
                                <div class="tabContent" id="tabContent2" style="display:none;">
                                    <div class="news">
                                                                                <ul class="list">
                                                                                        <li>
                                                <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardView&no=344717&bbs_no=12&version=1.9&class=local&sne=dWUwMDAz">[마켓통합관리] [사전공지] 8월 19일 브리치 상품 일부 항목 정책 변경 안내</a>
                                                                                                <span class="icoNoticeNew">New</span>
                                                                                                <span class="date">2020-08-14</span>
                                            </li>
                                                                                        <li>
                                                <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardView&no=344827&bbs_no=12&version=1.9&class=local&sne=dWUwMDAz">[상품관리] [사전 공지] 상품 엑셀등록 기능 사용성 업그레이드</a>
                                                                                                <span class="icoNoticeNew">New</span>
                                                                                                <span class="date">2020-08-12</span>
                                            </li>
                                                                                        <li>
                                                <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardView&no=344810&bbs_no=12&version=1.9&class=local&sne=dWUwMDAz">[주문관리] 멀티쇼핑몰별 매출 메뉴 추가</a>
                                                                                                <span class="icoNoticeNew">New</span>
                                                                                                <span class="date">2020-08-12</span>
                                            </li>
                                                                                        <li>
                                                <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardView&no=344808&bbs_no=12&version=1.9&class=local&sne=dWUwMDAz">[상품관리] 리뷰톡톡 '세트상품 리뷰연동' 기능 추가</a>
                                                                                                <span class="icoNoticeNew">New</span>
                                                                                                <span class="date">2020-08-12</span>
                                            </li>
                                                                                        <li>
                                                <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardView&no=344821&bbs_no=12&version=1.9&class=local&sne=dWUwMDAz">[마켓통합관리] 상품보내기 후 메뉴이동 설정 추가</a>
                                                                                                <span class="date">2020-08-06</span>
                                            </li>
                                                                                    </ul>
                                                                                <a href="#none" data-url="//service-api.echosting.cafe24.com/Shopboard/index.php?url=BoardList&bbs_no=12&version=1.9&class=local&sne=dWUwMDAz" class="btnMore">더보기</a>
                                    </div>
                                </div>
                                <div class="tabContent" id="tabContent3" style="display:none;">
                                    <div class="news">
                                        <ul class="list">
                                                                                        <li>
                                                <img src="//img.echosting.cafe24.com/icon/ico_route_sk11st.gif" alt="11번가" />
                                                <a href="#none" data-url="http://neomart.shopcafe.cafe24.com/mp/board/notice/front/popview?board_no=2493 ?>" > [셀러존] Live 교육 안내 </a>
                                                <span class="date">2020-08-14</span>
                                            </li>
                                                                                        <li>
                                                <img src="//img.echosting.cafe24.com/icon/ico_route_sk11st.gif" alt="11번가" />
                                                <a href="#none" data-url="http://neomart.shopcafe.cafe24.com/mp/board/notice/front/popview?board_no=2494 ?>" > ‘11번가 전 국민 세일’ 프로모션 (재공지) </a>
                                                <span class="date">2020-08-14</span>
                                            </li>
                                                                                        <li>
                                                <img src="//img.echosting.cafe24.com/icon/ico_route_sk11st.gif" alt="11번가" />
                                                <a href="#none" data-url="http://neomart.shopcafe.cafe24.com/mp/board/notice/front/popview?board_no=2495 ?>" > 판매자 정보 보호를 위한 비밀번호 변경 안내 </a>
                                                <span class="date">2020-08-14</span>
                                            </li>
                                                                                        <li>
                                                <img src="//img.echosting.cafe24.com/icon/ico_route_sk11st.gif" alt="11번가" />
                                                <a href="#none" data-url="http://neomart.shopcafe.cafe24.com/mp/board/notice/front/popview?board_no=2496 ?>" > 해외직구 ‘중고상품’ 등록안내 </a>
                                                <span class="date">2020-08-14</span>
                                            </li>
                                                                                        <li>
                                                <img src="//img.echosting.cafe24.com/icon/ico_route_inpark.gif" alt="인터파크" />
                                                <a href="#none" data-url="http://neomart.shopcafe.cafe24.com/mp/board/notice/front/popview?board_no=2492 ?>" >[위해상품] 볶음콩가루 외 8건</a>
                                                <span class="date">2020-08-12</span>
                                            </li>
                                                                                    </ul>
                                        <a href="#none" data-url="//shopcafe.cafe24.com/mp/board/notice/front/poplist?" class="btnMore">더보기</a>
                                    </div>
                                </div>
                                <div class="tabContent" id="tabContent4" style="display:none;">
                                    <div class="news">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
        </div>

        <div class="grid gFlex1">
            <div class="bannerArea">
                <div class="mAdBanner">
                    <span id="admngDebug"></span><span id="admngSide_5"></span><script id="admng" type="text/javascript" src="//ad.cafe24.com/adManager/logic/WebAnalysis.js?siteType=malladmin&userID=neomart&groupIdx=5815"></script>
                </div>
                <div class="mAdBanner">
                    <span id="admngDebug"></span><span id="admngSide_3"></span><script id="admng" type="text/javascript" src="//ad.cafe24.com/adManager/logic/WebAnalysis.js?siteType=malladmin&userID=neomart&groupIdx=5792"></script>
                </div>
                <!-- 참고: 결제수단 사용대기 상태인 경우 -->
                <!--<div class="mDashBanner card notice">
                    <a href="#none">
                        <span class="summary">쇼핑몰운영의 필수 서비스</span>
                        <strong class="title">통합결제 PG가 있습니다.</strong>
                        <p class="desc">매출 상승의 필수조건,<br />고객에게 편리한 결제수단을 제공해주세요.</p>
                    </a>
                    <span class="noticeMsg">결제수단 사용 대기상태 입니다.</span>
                </div>-->
                <div class="mAdBanner card">
                    <a href="#" name="ec-mode-dashboard-pg" data-ispgwait="F">
                        <img src="//m-img.cafe24.com/images/event/2020/01/smartmode_banner2.jpg" id="ec-mode-pg-status-banner-ok" style="">
                        <img src="//m-img.cafe24.com/images/event/2020/01/smartmode_banner3.jpg" id="ec-mode-pg-status-banner-wait" style="display:none;">
                    </a>
                    <input type="hidden" id="ec-mode-pg-need-status-refresh" value="F" />
                </div>
                <div class="mDashService">
                    <a href="https://edu.cafe24.com/" target="_blank" title="새창 열림" class="service edu">교육센터</a>
                    <a href="/admin/php/shop1/AutoLogin/request.php?uri=https://soho.cafe24.com/" target="_blank" title="새창 열림" class="service soho">창업센터</a>
                    <a href="/admin/php/shop1/AutoLogin/request.php?menu_code=9&uri=https://cmc.cafe24.com" target="_blank" title="새창 열림" class="service cmc">마케팅센터</a>
                    <a href="/admin/php/shop1/AutoLogin/request.php?uri=https://d.cafe24.com/home/home_main.php" target="_blank" title="새창 열림" class="service design">디자인센터</a>
                </div>
            </div>
        </div>

    </div>

</div>
<!-- [ content ] -->
<span id="admngDebug"></span><span id="admngSide_2"></span><script id="admng" type="text/javascript" src="//ad.cafe24.com/adManager/logic/WebAnalysis.js?siteType=malladmin&userID=neomart&groupIdx=5766"></script>



            </div>
        </div>

    <script type="text/javascript" src="//neomart.cafe24.com/admin/js/jslb_ajax.js" charset="utf-8"></script>
<script type="text/javascript" src="/ind-script/i18n.php?lang=ko_KR&domain=admin&v=2008121152" charset="utf-8"></script>
<script type="text/javascript" src="//img.echosting.cafe24.com/js/ec/mode/influencer_suio.min.js" charset="utf-8"></script>
<script type="text/javascript" src="//img.echosting.cafe24.com/js/ec/mode/influencer_ui.js" charset="utf-8"></script>

<script type="text/javascript" src="/ind-script/optimizer.php?filename=rZLPUsQgDMYfoFx9jlj_zHjfixcvzvgAKQ1bWiBsAJ2-vTjuYfdQXVmHA2TI70v4CEzsCfo7ASPo6YNlAaHERTTBnMD2T0HN6QZ-yis2ol5gPhSS9bjdq0d120Qq0iqw5mCc1blJolcPdTUVj-xWY507p6PwvgqcWZOi2JDN74k4ehsg4LvdY7YcIHNsoFIYGihPoXSov84NtMGFkha-xI-N0iXXv_TRUaZWjeRR8kQukrRKDMxLVVku5Z9rtR2PGy1jjPBSb-H1BKyv9FsmOzvA2_e4nSK7IkJBr5Amjl2dJ01X8PoYdYbFY762k_-SKdm6P9g4YpoGRhkr8wk&type=js&k=6f3c9d98c4608a20b5c7731dcae5f84687dbd8b2&t=1595960257"></script>
<script type="text/javascript">
var sServiceApiDomain = "service-api.echosting.cafe24.com";
var IS_SHOW_CHECKLIST = "F";
localStorage.setItem('EC_JQUERY_VERSION','1.4.4');
sessionStorage.setItem('SERAJwtToken', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJuZW9tYXJ0LmNhZmUyNC5jb20iLCJhdWQiOiJuZW9tYXJ0LmNhZmUyNC5jb20iLCJpYXQiOjE1OTc2NTY2MjUsIm1hbGxfaWQiOiJuZW9tYXJ0IiwibG9naW5faWQiOiJuZW9tYXJ0In0.DT2NoTdI-ML_sOGLQEkQ6CHrQ0O7pEBi4l0r1Xj898zNQkclRwOgv2pwsWUSO2uSg46xBs3hUni1fLhm25EhBA')
var SHOP_CURRENCY_INFO = {"1":{"aShopCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"aShopSubCurrencyInfo":null,"aBaseCurrencyInfo":{"currency_code":"KRW","currency_no":"410","currency_symbol":"\uffe6","currency_name":"South Korean won","currency_desc":"\uffe6 \uc6d0 (\ud55c\uad6d)","decimal_place":0,"round_method_type":"F"},"fExchangeRate":1,"fExchangeSubRate":null,"aFrontCurrencyFormat":{"head":"","tail":"\uc6d0"},"aFrontSubCurrencyFormat":{"head":"","tail":""}}};
var EC_GLOBAL_DATETIME = (function() {
var oConstants = {"STANDARD_DATE_REGEX":"\/([12]\\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01]))\/","IN_ZONE":"inZone","OUT_ZONE":"outZone","IN_FORMAT":"inFormat","OUT_FORMAT":"outFormat","IN_DATE_FORMAT":"inDateFormat","IN_TIME_FORMAT":"inTimeFormat","OUT_DATE_FORMAT":"outDateFormat","OUT_TIME_FORMAT":"outTimeFormat","IN_FORMAT_DATE_ONLY":1,"IN_FORMAT_TIME_ONLY":2,"IN_FORMAT_ALL":3,"OUT_FORMAT_DATE_ONLY":1,"OUT_FORMAT_TIME_ONLY":2,"OUT_FORMAT_ALL":3,"DATE_ONLY":"YYYY-MM-DD","TIME_ONLY":"HH:mm:ss","FULL_TIME":"YYYY-MM-DD HH:mm:ss","ISO_8601":"YYYY-MM-DD[T]HH:mm:ssZ","YEAR_ONLY":"YYYY","MONTH_ONLY":"MM","DAY_ONLY":"DD","WEEK_ONLY":"e","TIME_H_I_ONLY":"HH:mm","TIME_HOUR_ONLY":"HH","TIME_MINUTE_ONLY":"mm","POSTGRE_FULL_TIME":"YYYY-MM-DD HH24:MI:SS","POSTGRE_TIME_ONLY":" HH24:MI:SS","MICRO_SECOND_ONLY":"u","SEOUL":"Asia\/Seoul","TOKYO":"Asia\/Tokyo","SHANGHAI":"Asia\/Shanghai","TAIPEI":"Asia\/Taipei","HANOI":"Asia\/Bangkok","LOS_ANGELES":"America\/Los_Angeles","LISBON":"Europe\/Lisbon","MADRID":"Europe\/Madrid","MANILA":"Asia\/Manila","UTC":"Etc\/UTC","MAX_DATETIME":"9999-12-31 23:59:59"};
var oOptions = {"inZone":"Asia\/Seoul","inFormat":"YYYY-MM-DD HH:mm:ss","inDateFormat":"YYYY-MM-DD","inTimeFormat":"HH:mm:ss","outZone":"Asia\/Seoul","outFormat":"YYYY-MM-DD HH:mm:ss","outDateFormat":"YYYY-MM-DD","outTimeFormat":"HH:mm:ss"};
var oPolicies = {"shop":{"outZone":"Asia\/Seoul","outFormat":"YYYY-MM-DD HH:mm:ss","outDateFormat":"YYYY-MM-DD","outTimeFormat":"HH:mm:ss"}};
var sOverrideTimezone = '';
var sMomentNamespace = 'moment';
var fMomentLoaded = function() {
var bMomentLoaded = !!window[sMomentNamespace];
var bMomentTZLoaded = false;
if (bMomentLoaded) {
bMomentTZLoaded = !!window[sMomentNamespace].tz;
}
return bMomentLoaded && bMomentTZLoaded;
};
var fMomentWrapper = function() {
return window[sMomentNamespace];
};
var fShallowMerge = function(oTarget, oSource) {
oSource = oSource || {};
for (var sKey in oSource) {
if (oSource.hasOwnProperty(sKey)) {
oTarget[sKey] = oSource[sKey];
}
}
return oTarget;
};
var getFormatFromFlag = function(oOptions, iFlag, bOpposite) {
if (bOpposite) {
switch (iFlag) {
case 1:
return oOptions[oConstants.IN_DATE_FORMAT];
case 2:
return oOptions[oConstants.IN_TIME_FORMAT];
default:
return oOptions[oConstants.IN_FORMAT];    
}
}
switch (iFlag) {
case 1:
return oOptions[oConstants.OUT_DATE_FORMAT];
case 2:
return oOptions[oConstants.OUT_TIME_FORMAT];
default:
return oOptions[oConstants.OUT_FORMAT];
}
};
return {
'const': oConstants,
init: function(fCallback) {
if (fMomentLoaded()) {
if (typeof fCallback === 'function') {
fCallback();
}
return;
}
var oScript = document.createElement('script');
oScript.type = 'text/javascript';
oScript.async = true;
oScript.src = '/ind-script/moment.php?convert=F';
oScript.onload = oScript.onreadystatechange = function () {
fMomentWrapper().defaultFormat = oOptions[oConstants.OUT_FORMAT];
fMomentWrapper().tz.setDefault(oOptions[oConstants.IN_ZONE]);
if (typeof fCallback === 'function') {
fCallback();
}
};
var oFirstScript = document.getElementsByTagName('script')[0];
oFirstScript.parentNode.insertBefore(oScript, oFirstScript);
},
initPromise: function() {
if (!window.Promise) {
return;
}
return new Promise(function(resolve) {
this.init(resolve);
}.bind(this));
},
isLoaded: function() {
return fMomentLoaded();
},
setOptions: function(oNewOptions) {
if (typeof oNewOptions === 'object') {
for (var sKey in oNewOptions) {
if (oNewOptions.hasOwnProperty(sKey) && oOptions.hasOwnProperty(sKey)) {
oOptions[sKey] = oNewOptions[sKey];
}
}
}
return this;
},
now: function(mOptions, iFlag) {
if (fMomentLoaded() === false) {
return Math.floor(new Date().getTime() / 1000);
}
var oFormatOptions = this.getOptions(mOptions);
return fMomentWrapper()()
.tz(oFormatOptions.outZone)
.format(getFormatFromFlag(oFormatOptions, iFlag));
},
format: function(sTime, mOptions, iFlag) {
if (fMomentLoaded() === false) {
return sTime;
}
var oFormatOptions = this.getOptions(mOptions);
return fMomentWrapper()
.tz(sTime, oFormatOptions.inZone)
.tz(oFormatOptions.outZone)
.format(getFormatFromFlag(oFormatOptions, iFlag));
},
parse: function(sTime, mOptions) {
if (fMomentLoaded() === false) {
return sTime;
}
var oParseOptions = this.getOptions(mOptions);
return fMomentWrapper().tz((sTime || new Date()), oParseOptions.inZone).tz(oParseOptions.outZone);
},
getOptions: function(mOptions, iFlag) {
mOptions = mOptions || {};
var oMergedOptions = fShallowMerge({}, oOptions);
if (typeof mOptions === 'string' && oPolicies[mOptions]) {
oMergedOptions = fShallowMerge(oMergedOptions, oPolicies[mOptions]);
} else if (typeof mOptions === 'object') {
oMergedOptions = fShallowMerge(oMergedOptions, mOptions);
}
if (sOverrideTimezone) {
if ((typeof mOptions === 'string' && mOptions === 'shop') || (typeof mOptions === 'object' && !mOptions[oConstants.OUT_ZONE])) {
oMergedOptions[oConstants.OUT_ZONE] = sOverrideTimezone;
}
}
return oMergedOptions;
},
getRevertOptions: function(mOptions) {
var oCurrentOptions = this.getOptions(mOptions);
var oMergedOptions = fShallowMerge({}, oOptions);
oMergedOptions[oConstants.IN_ZONE] = oCurrentOptions[oConstants.OUT_ZONE];
oMergedOptions[oConstants.IN_FORMAT] = oCurrentOptions[oConstants.OUT_FORMAT];
oMergedOptions[oConstants.IN_DATE_FORMAT] = oCurrentOptions[oConstants.OUT_DATE_FORMAT];
oMergedOptions[oConstants.IN_TIME_FORMAT] = oCurrentOptions[oConstants.OUT_TIME_FORMAT];
return oMergedOptions;
},
today: function(sTime, mOptions, iFlag) {
if (fMomentLoaded() === false) {
throw new Error('MomentJS didnt initialize');
}
mOptions = mOptions || 'shop';
var oRevertOptions = this.getRevertOptions(mOptions);
var oToday;
if (!sTime || sTime === 'now') {
oToday = this.parse('', mOptions);
} else {
iFlag = iFlag || oConstants.IN_FORMAT_ALL || 3;
oToday = fMomentWrapper().tz(sTime, getFormatFromFlag(oRevertOptions, iFlag, true), oRevertOptions[oConstants.IN_ZONE]);
if (oToday.isValid() === false) {
var oStandardDateRegex = new RegExp(oConstants.STANDARD_DATE_REGEX.replace(/\//g, ''));
if (oStandardDateRegex.test(sTime) === true) {
oToday = fMomentWrapper().tz(sTime, oRevertOptions[oConstants.IN_ZONE]);
} else {
oToday = fMomentWrapper()();
}
}
}
var oStartOfDay = oToday.clone().startOf('day');
var oEndOfDay = oToday.clone().endOf('day');
var sStartOfDayInSeoul = oStartOfDay.tz(oConstants.SEOUL).format(oConstants.FULL_TIME);
var sEndOfDayInSeoul = oEndOfDay.tz(oConstants.SEOUL).format(oConstants.FULL_TIME);
return [sStartOfDayInSeoul, sEndOfDayInSeoul];
},
parseFromFormat: function(sTime, mOptions, iFlag) {
if (fMomentLoaded() === false) {
return sTime;
}
mOptions = mOptions || 'shop';
iFlag = iFlag || oConstants.IN_FORMAT_ALL || 3;
var oRevertOptions = {};
if (typeof mOptions === 'string') {
oRevertOptions = this.getRevertOptions(mOptions);
} else {
oRevertOptions = this.getOptions(mOptions);
}
return fMomentWrapper()(sTime, getFormatFromFlag(oRevertOptions, iFlag, true));
}
};
})();
var EC_ADMIN_SERVICE_URL = {"sBmScvDomain":"https:\/\/bm-svc.cafe24.com"};
var EC_ADMIN_JS_CONFIG_MODE = {"isSubAdmin":false,"b_has_view_main_smart_today_sales":true,"b_has_view_main_smart_order_proc":true,"b_has_view_main_smart_order_cancel":true,"sEcHostingUrl":"echosting.cafe24.com","sBmDvcDomain":"https:\/\/bm-svc.cafe24.com"};
</script>    </body>
</html>
