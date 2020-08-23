<%@page import="jm_dao.UserInfoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="jm_dto.UserInfoDTO"%>
<%@page import="jm_dto.NoticeDTO"%>
<%@page import="jm_dao.NoticeDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

		UserInfoDTO loginMember=(UserInfoDTO)session.getAttribute("loginMember");

		//검색 관련 정보를 반환받아 저장
     	String search=request.getParameter("search");
     	if(search==null) search="";
     	String keyword=request.getParameter("keyword");
     	if(keyword==null) keyword="";
     	
     	//전달된 페이지 번호를 반환받아 저장
     	// => 전달값이 존재하지 않을 경우 첫번째 페이지 검색
     	int pageNum=1;
     	if(request.getParameter("pageNum")!=null) {//전달값이 있는 경우
     		pageNum=Integer.parseInt(request.getParameter("pageNum"));
     	}
     	
     	//하나의 페이지에 출력될 게시글 갯수 설정
     	int pageSize=10;
     	
     	//BOARD 테이블에 저장된 전체 게시글의 갯수를 검색하여 반환하는 DAO 클래스의 메소드 호출
     	//int totalBoard=BoardDAO.getDAO().selectBoardCount();
     	//BOARD 테이블에 저장된 전체 게시글 중 검색 게시글의 갯수를 검색하여 반환하는 DAO 클래스의 메소드 호출
     	int totalBoard=NoticeDAO.getDAO().selectNoticeCount(search, keyword);
     	
     	//검색 게시글에 대한 페이지의 갯수를 계산하여 저장
     	//int totalPage=totalBoard/pageSize+(totalBoard%pageSize==0?0:1);
     	int totalPage=(int)Math.ceil((double)totalBoard/pageSize);
     	
     	//전달된 페이지 번호에 검증
     	if(pageNum<=0 || pageNum>totalPage) {//페이지 번호가 잘못된 경우
     		pageNum=1;
     	}
     	
     	//현재 페이지에 대한 게시글 시작 행번호를 계산하여 저장
     	//ex) 1 Page : 1, 2 Page : 11, 3 Page : 21, 4 Page : 31,...
     	int startRow=(pageNum-1)*pageSize+1;
     	
     	//현재 페이지에 대한 게시글 종료 행번호를 계산하여 저장
     	//ex) 1 Page : 10, 2 Page : 20, 3 Page : 30, 4 Page : 40,...
     	int endRow=pageNum*pageSize;
     	
     	//마지막 페이지에 대한 게시글 종료 행번호를 검색 게시글의 갯수로 변경
     	if(endRow>totalBoard) {
     		endRow=totalBoard;
     	}
     	
     	//게시글의 시작 행번호와 종료 행번호를 전달받아 BOARD 테이블에 저장된 게시글에서 
     	//시작과 종료 범위에 포함된 게시글만 검색하여 반환하는 DAO 클래스의 메소드 호출
     	//List<BoardDTO> boardList=BoardDAO.getDAO().selectBoard(startRow, endRow);
     	List<NoticeDTO> boardList=NoticeDAO.getDAO().selectNoticeBoard(startRow, endRow, search, keyword);
     	
     	//현재 페이지의 게시글 목록에 출력될 시작 글번호를 계산하여 저장
     	int number=totalBoard-(pageNum-1)*pageSize;
     	int countnum=1;
     	
     	//UserInfoDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
     	
     	//String CurrentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date() );
     	
%>	
	
	
<style>
/* BASIC css start */
.xans-board-paging {
	clear:both;
	padding:13px 0;
	margin:20px 0;
	text-align:center;
}
.xans-board-paging p, .xans-board-paging ol, .xans-board-paging li {
	display:inline-block;
#display:inline;
*zoom:1;
}
.xans-board-paging img {
	vertical-align:middle;
}
.xans-board-paging ol {
	margin:0 7px;
}
.xans-board-paging li {
	font-size:13px;
}
.xans-board-paging p {
	vertical-align:top;
}
.xans-board-paging li:first-child {
	background:none;
}
.xans-board-paging li strong {
	display:block;
	font-size:13px;
	font-weight:600;
	color:#110252;
	text-align:center;
	width:41px;
	height:41px;
	line-height:41px;
	border:1px solid #110252;
	box-shadow:1px 1px 0 #110252 inset, -1px -1px 0 #110252 inset;
}
.xans-board-paging li a {
	vertical-align:top;
	display:block;
	color:#7d7d7d;
	font-size:13px;
	font-weight:600;
	color:#c4c4c4;
	text-align:center;
	width:41px;
	height:41px;
	line-height:41px;
	border:1px solid #ddd;
}
.xans-board-paging li a:hover {
	color:#000;
	text-decoration:underline;
}
.xans-board-paging a.nolink {
	cursor:default;
}


.bbs-sch .key-wrap, .bbs-sch .keyword, .bbs-sch img {
    vertical-align: top !Important;
}

.key-wrap .MS_input_txt {
    margin-right: 5px;
    padding: 2px;
    line-height: 25px !Important;
    border: 1px solid #bcbcbc;
    height: 25px ;
    vertical-align:top !Important;
}

.brd-st {
    margin-right: 5px;
    padding: 2px;
    line-height: 30px !Important;
    border: 1px solid #bcbcbc;
    height: 30px !Important;
}

.bd_pname {
    display:inline-block;
}

.bd_pname a {
    font-size:13px;
    color:#000;
}

.bd_subject {
    color: #343434 !important;
    font-size: 13px;
}

.cs_tabs {
	overflow:hidden;
	margin:39px 0 50px;
	border-left:1px solid #ddd;
}
.cs_tabs li {
	float:left;
	width:20%;
}
.cs_tabs li a {
	display:block;
	text-align:center;
	border:1px solid #ddd;
	border-left:0;
	font-size:13px;
	letter-spacing:-1px;
	height:45px;
	line-height:45px;
	font-weight:500
}
.cs_tabs li a.on {
	background:#eee;
	color:#333;
}
.cs_tabs li a.mt1 {
	margin-top:-1px;
}
.cs_tabs2 {
	overflow:hidden;
	margin:39px 0 50px;
	border-left:1px solid #ddd;
}
.cs_tabs2 li {
	float:left;
	width:25%;
}
.cs_tabs2 li a {
	display:block;
	text-align:center;
	border:1px solid #ddd;
	border-left:0;
	font-size:13px;
	letter-spacing:-1px;
	height:45px;
	line-height:45px;
	font-weight:500
}
.cs_tabs2 li a.on {
	background:#eee;
	color:#333;
}
.cs_tabs2 li a.mt1 {
	margin-top:-1px;
}
.cs_title {
	font-size:23px;
	font-weight:600;
	color:#333;
	margin-bottom:15px;
	margin-left: 30px;
}
#bbsData .bbs-link { position: relative; }
#bbsData .bbs-link-top { margin-top: 10px; margin-bottom: -40px;margin-right: 400px; text-align: left; margin-left: 18px; }
#bbsData .bbs-link-btm { margin-top: 10px; margin-bottom: 0px; text-align: right; }

/* BASIC css end */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

/***추가CSS***/
.bbs-table-write .btn-area {margin-top:5px !Important;}

.pagetitle1 {
	font-family:'Noto Sans KR';
	font-size:26px;
	font-weight:500;
	color:#555;
	text-align:center;
	padding:60px 0 30px;
}

.pagetitle1 span {
	font-size:24px;
	color:#87a1c4;
}
#wrap {
    max-width: 1920px;
    min-width: 1280px;
    width: 100%;
    margin: 0 auto;
    font-family: 'Noto Sans KR',sans-serif;
}

.displaynone {
	display: none !important;
}
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
	margin:0;
	padding:0;
}


body, code {
	font:0.75em "돋움", Dotum, AppleGothic, sans-serif;
	color:#333;
	background:#fff;
}
li {
	list-style:none;
}
img, fieldset {
	border:none;
	vertical-align:top;
}
input, select, textarea {
	font-size:100%;
	color:#767676;
	vertical-align:middle;
}
hr.layout {
	display:none;
}
a, a:link, a:visited {
	text-decoration:none;
	color:#858585;
}
a:hover {
	color:#858585;
}
a:active {
	text-decoration:none;
}
table {
	border-spacing:0;
	border:0;
	border-collapse:collapse;
	width:1000px;
}
th, td {
	border:0;
	vertical-align:top;
    border-bottom: 1px solid #f7f7f7;
    padding: 10px;
 }
legend {
	height:0;
	width:0;
	display:block;
	text-indent:-9999em;
}
caption {
	visibility:hidden;
	position:absolute;
	left:-1000px;
	top:-1000px;
	height:0;
	width:0;
	display:none;
}
button {
	padding:0;
	margin:0;
	border:0;
	cursor:pointer;
	overflow:visible;
}
.objHidden {
	visibility:hidden;
	position:absolute;
	left:-1000px;
	top:-1000px;
	height:0;
	width:0;
}
table tr.radioType input, span.noBorder input {
	border:none !important;
	width:auto !important;
	height:auto !important;
	margin:0 3px 0 0 !important;
	vertical-align:middle !important;
	background:none !important;
}

.path {
	position:relative;
}
.path h3 {
	float:left;
	text-indent:-9999em;
	margin:0;
	font-size:0;
	width:0;
	height:0;
}
.path ol {
	position:absolute;
	top:0;
	right:0;
}
.path li {
	padding:0 0 0 22px;
	display:inline;
	font-size:.9em;
	background:url(/design/vittz/img/bg_path.gif) 0 50% no-repeat;
}
.path li.displaynone {
	display:none;
}
.path li.first {
	background:none;
}
.titleArea {
	margin-bottom:30px;
}
.titleArea:after {
	content:"";
	display:block;
	clear:both;
}
.titleArea h2 {
	height:21px;
	zoom:1;
}
.titleArea h2 span {
	height:21px;
	padding:0 5px 0 0;
	color:#272823;
	font-size:16px;
	float:left;
	border-bottom:1px solid #272823;
}
.titleArea h3 {
	margin:0 0 20px;
	font-size:14px;
}
.titleArea p {
	padding:3px 0 0;
	clear:both;
	font-size:.9em;
	line-height:1.5em;
	color:#8f8f8f;
}

/*
========================================================================
RESET
========================================================================
*/
/* global rest */
body, pre,
h1, h2, h3, h4, h5, h6,
dl, dt, dd, ul, li, ol,
th, td, p, blockquote,
form, fieldset, legend,
menu, nav, section, hgroup, article, header, aside, footer,
input, select, textarea, button {
    margin: 0;
    padding: 0;
}
body,
h1, h2, h3, h4, h5, h6, table,
input, select, textarea, a {
    font-size: 12px;
    line-height: 1.25;
    color: #777;
    /*font-family: Dotum, AppleGothic, Helvetica, sans-serif;*/
}
h1, h2, h3, h4, h5, h6 {
    font-weight: normal;
}
img, fieldset,button {
    border:0 none;
}
img {
    vertical-align: top;
}
li {
    list-style: none;
}
hr, caption, legend {
    display: none;
}
a { 
    color: #787878;
    text-decoration: none;
}
a:hover {
}
button {
    overflow: hidden;
    cursor: pointer;
}
button span {
    visibility: hidden;
}
address, em {
    font-style: normal;
}
button, input, select, textarea, a {
    vertical-align: middle;
}
select {
    line-height: 18px;
    height: 18px;
}
input:focus {
    outline: none;
}
table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    /* table-layout: fixed; */
    word-wrap: break-word;
    word-break: keep-all;
}
/*
========================================================================
공통 class
========================================================================
*/
/* image replace, hidden text */
.ir *,
.blind { z-index:-1; position: absolute; display: block; left: 0; top: 0; overflow: hidden; visibility: hidden; width: 0; height: 0; text-indent: -9999px; }
/* block, inline */
.d-block { display: block;}
.d-inline { display: inline;}
/* form */
.txt-right { text-align: right; }
.txt-input1 { padding: 2px 0 0 2px; height: 17px; line-height: 17px; border: 1px solid #e2e9ef; border-top: 1px solid #aaadb2; }
.txt-input2 { padding: 2px 0 0 2px; height: 17px; line-height: 17px; border: 1px solid #dcdcdc; }
.MS_input_txt { margin-right:5px; padding: 2px 0 0 2px; line-height: 17px; border: 1px solid #dcdcdc; }
.txt-disabled { background-color: #f6f6f6; }
.chk-rdo { width: 13px; height: 13px; vertical-align: middle; }
.txt-area1 { overflow-y: scroll; padding: 2px 0 0 2px; line-height: 17px; border: 1px solid #e2e9ef; border-top: 1px solid #aaadb2; }
/* file add trick */
.file-wrap { display: inline-block; overflow: hidden; position: relative; height: 23px; width: 280px; vertical-align: middle; background: url(/images/btn/h20_trick_fileadd.gif) no-repeat right 0; }
.file-wrap .file-txt { float: left; border: 0 none; height: 18px; font-size: 12px; line-height: 18px; width: 198px; border: 1px solid #ccc; }
.file-wrap .file-trick { cursor: pointer; position: absolute; right: 0px; top: 0; right: 0; width: 100px; height: 20px; background: none; border: 0 none; opacity: 0; filter: alpha(opacity=0); }
/* font-color */
.fc-red { color: #bd101b; }
.fc-blue { color: #2c6b9e; }
.MS_option_price { color: #807781; }
/* bold */
.bold { font-weight: bold; }
/* float clear */
.clear {zoom: 1;}
.clear:after {content: ""; display: block; clear: both;}
/* margin */
.mr-5 { margin-right: 5px;}
.mr-10 { margin-right: 10px; }
.mr-15 { margin-right: 15px; }
.mr-20 { margin-right: 20px; }
.ml-5 { margin-left: 5px; }
.ml-10 { margin-left: 10px; }
.ml-15 { margin-left: 15px; }
.ml-20 { margin-left: 20px; }
.mt-5 { margin-top: 5px; }
.mt-10 { margin-top: 10px; }
.mt-15 { margin-top: 15px; }
.mt-20 { margin-top: 20px; }
.mb-5 { margin-bottom: 5px; }
.mb-10 { margin-bottom: 10px; }
.mb-15 { margin-bottom: 15px; }
.mb-20 { margin-bottom: 20px; }
/* padding */
.pr-5 { padding-right: 5px; }
.pr-10 { padding-right: 10px; }
.pr-15 { padding-right: 15px; }
.pr-20 { padding-right: 20px; }
.pl-5 { padding-left: 5px; }
.pl-10 { padding-left: 10px; }
.pl-15 { padding-left: 15px; }
.pl-20 { padding-left: 20px; }
.pl-30 { padding-left: 30px; }
.pt-5 { padding-top: 5px; }
.pt-10 { padding-top: 10px; }
.pt-15 { padding-top: 15px; }
.pt-20 { padding-top: 20px; }
.pb-5 { padding-bottom: 5px; }
.pb-10 { padding-bottom: 10px; }
.pb-15 { padding-bottom: 15px; }
.pb-20 { padding-bottom: 20px; }
/* table */
table img { vertical-align: middle; }
.tb-bold { font-weight: bold; }
.tb-left,
.tb-center,
.tb-right { padding: 0 10px; }
.tb-btn { padding: 0; }
.tb-left { text-align: left; }
.tb-center { text-align: center; }
.tb-right { text-align: right; }
.tb-label-r5 label { margin-right: 5px; }
.tb-label-r10 label { margin-right: 10px; }
.tb-label-r10 label.last,
.tb-label-r5 label.last{ margin-right: 0; }
/* table-type-1 */
.table-type-1 { border-top: 1px solid #b7b7b7; border-bottom: 1px solid #b7b7b7; }
.table-type-1 th,
.table-type-1 td { padding: 8px 0 8px; background: url(/images/d3/modern_simple/common/dot_h1_w10.gif) repeat-x 0 bottom; }
.table-type-1 tr.nbg th,
.table-type-1 tr.nbg td { background-image: none; }
.table-type-1 tr.bg th,
.table-type-1 tr.bg td { background-color: #f8f8f8; }
.table-type-1 th { font-weight: normal; }
/* table-type-2 */
.table-type-2 { border-top: 1px solid #b7b7b7; border-bottom: 1px solid #b7b7b7; }
.table-type-2 th,
.table-type-2 td { padding: 8px 0 8px; background: url(/images/d3/modern_simple/common/dot_h1_w10.gif) repeat-x 0 bottom; }
.table-type-2 th { font-weight: normal; }
.table-type-2 tr.nbg th,
.table-type-2 tr.nbg td { background-image: none; }
/* 상품리스트 (메인/검색/상품리스트) */
.prd-list { margin-top: 10px; }
.prd-list table td { border: 0; }
.prd-list table .tb-center { padding: 0 10px; }
.prd-list table .info { padding: 5px 0; }
.prd-list .thumb { width: 196px; height: 196px; margin-left: auto; margin-right: auto; font-size:0; line-height: 0; border: 2px solid #f2f4f3; }
.prd-list .thumb a,
.prd-list .thumb img { display: block; width: 100%; height: 100%; }
.prd-list .dsc { margin-top: 15px; font-weight: bold; }
.prd-list .price { margin-top: 5px; font-weight: bold; color: #333; }
/* 장바구니 리스트, 주문상품 리스트 */
.table-cart {
    margin-top: 10px;
    margin-bottom: 30px;
    border-left: 1px solid #ddd;
    border-right: 1px solid #ddd;
}
.table-cart thead th {
    font-family: 'Noto Sans KR',sans-serif;
    color: #333;
    border-top: 1px solid #333;
    padding: 15px 0;
    font-size: 14px;
    font-weight: 600;
    background: #f7f7f7;
}
.table-cart tbody td,
.table-cart tfoot { border-bottom:1px solid #ddd; vertical-align:middle; }
.table-cart tbody td { padding:15px 0; }
.table-cart tbody td .thumb { width: 70px; height: 90px; margin-left: auto; margin-right: auto; font-size: 0; line-height: 0; }
.table-cart tbody td .thumb a,
.table-cart tbody td .thumb img { display:block; width:100%; height:100%; }
.table-cart tbody td .thumb a { font-size: 0; line-height: 0; }
.table-cart tbody td .d-block { padding-bottom: 3px; }
.table-cart tbody tr.nbg td { background-image: none; }
.table-cart tfoot td {
    padding: 20px 40px;
    font-weight: normal;
    background: #f7f7f7;
    color:#000;
    font-size: 14px;
}
.table-cart tfoot strong { color: #110252; }
/* 수량 컨트롤 */
.table-cart .opt-spin { position: relative; width: 36px; height: 20px; margin-left: auto; margin-right: auto; padding-bottom: 3px; }
.table-cart .opt-spin .txt-spin,
.table-cart .opt-spin .btns { float: left; }
.table-cart .opt-spin .txt-spin { width: 22px; height: 18px; padding-right: 2px padding-top: 2px; border: 1px solid #acacac; font-size: 11px; text-align: right; }
.table-cart .opt-spin .btns { width: 12px; height: 20px; margin-top: 3px; }
.table-cart .opt-spin .btns img { overflow: hidden; float: left; text-indent: -999px; background: none; }
/* 주문 - 주문정보 테이블 */
.table-order-info {
    margin-top: 10px;
    border-top: 1px solid #333;
    /* border-bottom: 1px solid #ddd; */
    border-left: 1px solid #ddd;
    border-right: 1px solid #ddd;
}
.table-order-info tbody th {width:120px; background:#f7f7f7; color: #333;
    font-size: 14px;
    font-weight: 600;}

.table-order-info tbody th,
.table-order-info tbody td {
    padding: 15px 15px;
    border-bottom: 1px solid #ddd;
    line-height: 2em;
}

.table-order-info tbody td {
    color: #8b8b8c;
    font-size: 14px;
}


.table-order-info tbody th .xans-order-result table.boardView th {
    width: 120px;
    text-align: left;
    line-height: 2em;
    border-bottom: 1px solid #ddd;
    color: #333;
    font-size: 14px;
    font-weight: 600;
    background: #f7f7f7;
    padding: 15px;
}
.table-order-info tbody th .d-block { font-weight: normal; letter-spacing: 0; }
.table-order-info tbody tr.nbg th,
.table-order-info tbody tr.nbg td { background-image: none; }
/* 마이페이지 디자인 타입2 테이블 리스트, 타이틀 */
.tit-tb-list { margin-top: 30px; font-size: 12px; color: #5f5f5f; padding-left: 10px; background: url(/images/d3/modern_simple/common/bull_h3_sqr_gray.gif) no-repeat 0 45%; }
.table-d2-list {
    border-top: 1px solid #333;
    border-bottom: 1px solid #ddd;
    border-left: 1px solid #ddd;
    border-right: 1px solid #ddd;
}
.table-d2-list thead th {
    padding: 13px 0 11px;
    font-weight: 600;
    vertical-align: middle;
    background: #f7f7f7;
    font-size: 14px;
    color:#353535;
}
.table-d2-list tbody td {
    padding: 10px 0 7px;
    border-top: 1px solid #e9e9e9;
    text-align: center;
    vertical-align: middle;
}
/* 마이페이지 디자인 타입2 테이블 뷰 */
.table-d2-view { margin-top: 5px; border: 2px solid #cdcdcd; border-bottom: 1px solid #cdcdcd; }
.table-d2-view th, 
.table-d2-view td { padding: 6px 0 5px; border-bottom: 1px solid #cdcdcd; vertical-align:middle !Important; }
.table-d2-view th { font-weight: bold; border-right: 1px solid #e3e3e3; background-color: #ededed; }
/* paging */
.paging { padding-top: 20px; height: 50px; text-align: center; line-height:50px; vertical-align: top; }
.paging li { display: inline;}
.paging li a { overflow: hidden; width: auto; height: 15px; padding: 0 7px; color: #999; cursor: pointer; }
.paging li a:hover,
.paging li.now a { font-weight: bold; letter-spacing: -1px; }
.paging li.first a,
.paging li.prev a,
.paging li.next a,
.paging li.last a { padding: 0 3px; }
.paging li.prev { margin-right: 10px; }
.paging li.next { margin-left: 10px; }
/* 현재위치 */
.loc-navi { text-align: right; }
.loc-navi,
.loc-navi a { color: #999; text-transform: capitalize; }
/* 페이지 타이틀 */
/* 타입 1*/
#content .tit-page { position: relative; margin-top: 20px; font-size: 0; line-height:0; padding-bottom: 12px; border-bottom: 1px solid #d0d0d0; }
#content .tit-page .dsc { position: absolute; right: 0px; top: 15px; font-size: 11px; color: #a5a5a5; letter-spacing: -1px; }
#content .tit-page .dsc em { color:#333; }
/* 타입 2 */
#content .tit-page-2 { position: relative; margin-top: 15px; padding-bottom: 6px; border-bottom: 1px solid #d0d0d0; }
#content .tit-page-2 .dsc { letter-spacing: -1px; display: inline-block; padding-top: 2px; margin-left: 30px; color: #9b9b9b; }
/* 상품 total/정렬 */
.total-sort { zoom: 1; overflow: hidden; padding-bottom: 5px; border-bottom: 1px solid #e5e5e5; }
/* total */
.total-sort .total { float: left; width: auto; }
.total-sort .total dt,
.total-sort .total dd { display: inline; }
.total-sort .total dd { font-weight: bold; }
.total-sort .total dt { text-transform: capitalize; }
/* sort */
.total-sort .sort { float: right; width: auto; display: inline; margin-right: 20px; }
.total-sort .sort li,
.total-sort .sort li a { float: left; width: auto; }
.total-sort .sort li { display: inline; margin-left: 10px; }
/* 게시판 총게시글,PAGE */
.total-page { zoom: 1; overflow: hidden; }
.total-page .total { float: left; width: auto; }
.total-page .page { float: right; width: auto;}
/* 회원 등급 표시 */
/* 타입 1 */
.mem-lvl { zoom: 1; overflow: hidden; padding: 15px 50px 15px 180px; background-color: #ededed; }
.mem-lvl .lvl-img,
.mem-lvl p { position: relative; float: left; }
.mem-lvl .lvl-img { left: -120px; margin-right: -120px; width: 120px; }
.mem-lvl p { width: 100%; padding-top: 10px; line-height: 16px; }
.mem-lvl p em { color: #be101a; font-weight: bold; }
.mem-lvl span.MS_group_reserve_msg,
.mem-lvl span.MS_group_dc_msg {
    color:#F26622;
}
/* 타입 2 */
.mem-lvl-2 { zoom: 1; overflow: hidden; padding: 15px 50px 15px 150px; border: 5px solid #ededed; }
.mem-lvl-2 .lvl-img,
.mem-lvl-2 p { position: relative; float: left; }
.mem-lvl-2 .lvl-img { left: -130px; margin-right: -130px; width: 120px; border-right: 1px solid #ededed; }
.mem-lvl-2 p { width: 100%; padding-top: 10px; line-height: 16px; }
.mem-lvl-2 p em { color: #be101a; font-weight: bold; }
.mem-lvl-2 span.MS_group_reserve_msg,
.mem-lvl-2 span.MS_group_dc_msg {
    color:#F26622;
}

/* 마이페이지 상단 메시지 박스 */
.t-box-msg { padding: 10px 20px; border: 5px solid #ededed; }
.t-box-msg strong { color: #0178d3; }

/*
========================================================================
공통 - 레이어
========================================================================
*/
/*
========================================================================
공통 - 레아웃
========================================================================

/* 게시판 공통 - 일반, 겔러리, 컨텐츠링크, 자료실, 미니홈피, 방명록, 동영상 */
/* 상단 */
.bbs-hd { padding: 0px 0 20px; background: url(/images/d3/modern_simple/common/dot_bbs_hd.gif) repeat-x 0 bottom; }
.bbs-hd .link { text-align: center; font-size: 0; line-height: 0; }
.bbs-hd .link li { display: inline; }
.bbs-hd .link li a { padding: 0 8px; color: #9c9c9c; letter-spacing: -0.5px; background: url(/images/d3/modern_simple/common/bull_bbs_hd_link.gif) no-repeat left 50%; }
.bbs-hd .link li.last a { background-image: none; }
/* 타이틀 */
.bbs-tit { margin-bottom: 30px; margin-top: 20px; text-align: center; }
.bbs-tit .braket { padding: 0 15px; font-weight: bold; color: #cfcfcf; font-size: 14px; vertical-align: middle; }
.bbs-tit em { margin-left: 10px; font-size: 11px; color: #898989;}
/* 검색 */
.bbs-sch {
    margin-top: 20px;
    margin-bottom: 10px;
    text-align: left;
    background: #f2f2f2;
    padding: 13px 8px;
    color: #888;
    font-size: 12px;
    border: 1px solid #ddd;
}
.bbs-sch label { margin-right: 10px; }
.bbs-sch .key-wrap { font-size: 0; line-height: 0; }
.bbs-sch .key-wrap,
.bbs-sch .keyword,
.bbs-sch img { vertical-align: middle; }
.bbs-sch .keyword { width: 125px; height: 14px; padding: 2px 0 0 2px; margin-right: 3px; line-height: 14px; border: 1px solid #ededed; }
/* 게시판 글쓰기, 목록 이동 링크 */
.bbs-link { font-size: 0; line-height: 0; }
.bbs-link a { display: inline-block; padding: 0 5px; font-size: 11px; line-height: 14px; color: #9b9b9b; /*background: url('/images/d3/modern_simple/common/bull_bbs_hd_link.gif') no-repeat left 45%;*/ }
.bbs-link a.write { /*padding-left: 23px; background: url(/images/d3/modern_simple/common/icon_bbs_write_link.gif) no-repeat 0 45%;*/ }
/* 게시판 글쓰기, 목록 이동 링크 */
.bbs-link a.none { background: url('');}
.bbs-link span { font-size:11px; color:#555; line-height:14px;}
/* 게시판 한줄공지 */
.bbs-online-notice { margin-top: 10px; margin-bottom: -10px; padding: 7px 10px; color: #9d9d9d; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; }
/* 게시판 타입 - 리스트 */
.bbs-table-list { margin-top: 5px; }
.bbs-table-list thead th,
.bbs-table-list tbody td  { padding: 15px 0; vertical-align: middle;} 
.bbs-table-list tbody td div  { color:#000; font-size:13px;} 
.bbs-table-list thead th {
    color: #202020;
    font-weight: bold;
    font-size: 11px;
    border-top: 2px solid #333;
    border-bottom: 1px solid #ddd;
    background: #f7f7f7;
    font-family: 'Noto Sans KR',sans-serif;
    font-size: 14px;
}
.bbs-table-list tbody td { background: url('/images/d3/modern_simple/common/dot_bbs_list.gif') repeat-x 0 bottom;}
/* 게시판 타입 - 보기 */
.bbs-table-view { margin-top: 10px; }
.bbs-table-view thead th,
.bbs-table-view tbody td  { padding: 6px 0;} 
.bbs-table-view thead th { color: #9d9d9d; font-weight: bold; font-size: 11px;  border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; }
.bbs-table-view tbody td.line { background: url('/images/d3/modern_simple/common/dot_bbs_list.gif') repeat-x 0 bottom;}
.bbs-table-view .btn-dwn { margin-top:15px;}
/* 게시판 타입 - 쓰기 */
.bbs-table-write {
    margin-top: 10px;
    border-top: 2px solid #333;
}
.bbs-table-write tbody th {
    width: 60px;
    padding: 15px;
    text-align: left;
    line-height: 2em;
    border-bottom: 1px solid #ddd;
    color: #000;
    font-weight: 600;
    font-size: 14px;
    background: #f7f7f7;
}
.bbs-table-write tbody td {
    padding: 15px;
    border-bottom: 1px solid #e6e6e6;
    line-height: 2em;
    color: #8b8b8c;
}
/* 게시판 타입 - 비밀번호찾기 */
.bbs-table-pwd { margin-top:25px;}
.bbs-table-pwd table { width:260px; margin-left:auto; margin-right:auto;}
.bbs-table-pwd tbody th,
.bbs-table-pwd tbody td  { padding:6px 0;  border-top:1px solid #e5e5e5; border-bottom:1px solid #e5e5e5; color:#9d9d9d; font-weight:normal; font-size:11px;} 
/* 공통으로 쓰는거 */
textarea { width:600px; height:47px; padding:2px; border:1px solid #EDEDED;}        
.input-style { padding:2px; height:14px; line-height:14px; border:1px solid #EDEDED;}

.cont-sub-des { position:relative;}
.cont-sub-des span { margin-right:15px; color:#555;}
.cont-sub-des span em { font-size:11px; color:#9c9c9c;}
.cont-sub-des .hit { position:absolute; top:15px; right:0;}
.cont-sub-des .hit span { margin-right:0;}

.comment-box { border-bottom:1px solid #e5e5e5;}
.bbs-table-view .comment-box td { padding-bottom:20px; border-top:1px solid #e5e5e5; vertical-align:top;}
.comment-box .com-name { margin-right:8px; padding:0 8px; background: url('/images/d3/modern_simple/common/bull_bbs_hd_link.gif') repeat-y 100% 0; font-weight:bold; color:#c5c5c5;}
.bbs-table-view td.com-wrt-box { border:0;}
.com-wrt-box label { padding-left:7px; color:#9d9d9d; background: url('/images/d3/modern_simple/common/bull_join_required.gif') no-repeat 0 50%;}
.com-wrt-box .input-style { margin:0 10px 0 7px; padding:2px; height:14px; line-height:14px; border:1px solid #EDEDED;}
.com-wrt-box .wrt { margin-top:7px;}
.view-link { padding:12px 0;}

/* 게시판 회원 게시글 검색 */
.search_id { background: none repeat scroll 0 0 #FFFFFF; border: 1px solid #DADADA; display: block; padding: 3px; position: absolute; width: 90px; }

/* 개인정보보호정책 동의 */
.new-privercy-contract { text-align: left; padding: 0px; }
.new-privercy-contract p { font-weight: bold; margin: 0; margin-bottom: 10px; margin-top: 20px; text-align: left; }
.privercy-contract-tap { position: relative; height:40px; }
.privercy-contract-tap ul { list-style: none; margin: 0; padding: 0; position: absolute; bottom: -1px; *bottom: -2px; }
.privercy-contract-tap li { border: 1px solid #ccc; border-right: none; background: #F4F4F4; float:left; display: inline-block; }
.privercy-contract-tap li a { display: block; padding: 10px 10px; text-decoration: none; }
.privercy-contract-tap li.end { border-right: 1px solid #ccc; }
.privercy-contract-tap li.sel { background: #FFFFFF; border-bottom: 1px solid #FFFFFF; }
.privercy-contract { clear: both; }
.privercy-contract textarea { clear: both; border: 1px solid #CCC; height: 60px; background: #FFFFFF; padding: 10px; width: 660px; }
.privercy-agree { margin: 10px 0; }
.privercy-agree label{ margin-right: 10px; }


/* MS 추가 */
.w1280{width:1280px;}
.mlrauto{margin-left:auto; margin-right:auto;}
.clear_cont:after{clear:both; display:block; width:100%; content:""; }
.img_ty{overflow:hidden; text-indent:-1000px; font-size:0;}
</style>                    

 <!--                       CSS 끝                         -->
 


<body style="width : 1280px; text-align: center; margin: 0 auto;">

<!-- 상단 이미지 -->
<div style="width: 1280px; margin: 0 0 30px 0;">
	<div style="padding-top: 40px;">
		<img src="./img/bbs_topimg_11.jpg" style="margin-left: 170px; ">
	</div>
</div>

<!--게시판상단-->

<div id="bbsData">
	<div class="page-body">
		<div class="bbs-table-list">
	
	<table summary="No, content,Name,Data,Hits">
		<caption>일반게시판 게시글</caption>
				<colgroup>
					<col width="80" />
					<col width="*" />
					<col width="120" />
					<col width="120" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col"><div class="tb-center">번호</div></th>
						<th scope="col"><div class="tb-center">제목</div></th>
						<th scope="col"><div class="tb-center">작성일</div></th>
						<th scope="col"><div class="tb-center">조회</div></th>
					</tr>
				</thead>
		
		<!-- 테이블 출력-->
		<% if(totalBoard==0) { %>
			<tr align="center">
				<td colspan="4"> 공지사항이 없습니다. </td>
			</tr>
		<% } else { %>
			<% for(NoticeDTO board:boardList) { %>
			<tr>
				<%-- 글번호 --%>
				<td><div class="tb-center">	
					<%=board.getNoticeNo() %>
					<%--  <% int count=countnum++;%>--%>
					</div></td>
					 
				<%-- 제목 --%>
				<td><div class="tb-left"><img src="./img/neo_notice.gif" />
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=noticeBoard&work=viewnotice&noticeNo=<%=board.getNoticeNo()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=board.getNoticeTitle() %></a>
				</div></td>
			
				<%-- 작성일 --%>
				<td><div class="tb-center"><%=board.getNoticeDate().substring(0, 19) %></div></td>
				
				<%-- 조회수 --%>
				<td><div class="tb-center"><%=board.getNoticeReadcount() %></div></td>

			</tr>	
				<% number--; %>
			<% } %>
		<% } %>
	</table>	
	</div>
	
	<%-- 페이지 번호 출력(페이징 처리)과 하이퍼 링크 설정 --%>
	<%
		//블럭에 출력될 페이지 번호의 갯수 설정
		int blockSize=5;
	
		//블럭에 출력될 시작 페이지 번호를 계산하여 저장
		// => 1 Block : 1, 2 Block : 6, 3 Block : 11, 4 Block : 16,...
		int startPage=(pageNum-1)/blockSize*blockSize+1;
		
		//블럭에 출력될 종료 페이지 번호를 계산하여 저장
		// => 1 Block : 5, 2 Block : 10, 3 Block : 15, 4 Block : 20,...
		int endPage=startPage+blockSize-1;
		
		//마지막 블럭의 종료 페이지 번호 변경
		if(endPage>totalPage) {
			endPage=totalPage;
		}
	%>
	
	<dl class="bbs-link bbs-link-btm">	</dl>
		<div class="xans-element- xans-board xans-board-paging-4 xans-board-paging xans-board-4 crema-hide">
		
			<% for (int i = startPage; i <= endPage; i++) {	%>
					<% if (pageNum != i) {	%>
					 <a href="<%=request.getContextPath()%>/index.jsp?workgroup=noticeBoard&work=jm_noticeList&pageNum=<%=i%>">[<%=i%>]
					 </a>
					<%	} else { %>
					<span style="font-size: 18px; font-weight: bold">[<%=i%>]</span>
				<% } %>
			<% } %>
						
	
		</div>
		
	</div>

		<!--  글쓰기 버튼 -->
		 <% if(loginMember != null && loginMember.getUserDv()!="1") { %>
   			<div class="view-link" style="text-align: right; margin-right: 20px;">
            	<dl class="bbs-link con-link"><a class="write" href="<%=request.getContextPath() %>/index.jsp?workgroup=noticeBoard&work=jm_noticeWrite">
                  	<img src="./img/btn_wWrite.gif" alt="글쓰기"></a></dl>                                                                
        	 </div>
        <% } else { %>
       
        <% } %>
		 


<%-- 
   <% if(loginMember != null && (loginMember.getUserId().equals(review.getId()) || Integer.parseInt(loginMember.getUserDv())==1)) {
      <a href = "<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_reviewDetail&num=<%=review.getPostNo()%>&pageNum=<%=pageNum%>&search=<%=search%>&keyword=<%=keyword%>"><%=review.getSubject() %></a>
   <% } else { %>
      작성자 또는 관리자만 확인 가능합니다.
   <% } %>  --%>
                           
                           
         
	<!-- page-body -->
</div>
<hr/>

</body>

