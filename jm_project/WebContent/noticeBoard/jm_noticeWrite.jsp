<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   

<style>
#bbsData .bbs-link { position: relative; }
#bbsData .bbs-link-top { margin-top: 10px; margin-bottom: -40px;margin-right: 400px; text-align: left; margin-left: 18px; }
#bbsData .bbs-link-btm { margin-top: 10px; margin-bottom: 0px; text-align: right; }
.bbs-table-write .btn-area {margin-top:5px !Important;}

/* global rest */
html, body {
    height: 100%;
}
html, body, pre,
h1, h2, h3, h4, h5, h6,
dl, dt, dd, ul, li, ol,
th, td, p, blockquote,
form, fieldset, legend,
menu, nav, section, hgroup, article, header, aside, footer,
input, select, textarea, button {
    margin: 0;
    padding: 0;
}



h1, h2, h3, h4, h5, h6, table,
input, select, textarea, a {
    font-size: 18px;
    line-height: 1.25;
    color: #777;
    font-family: sans-serif;
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
    margin-left: 20%;
    margin-right: 20%;
    
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

/* 게시판 총게시글,PAGE */
.total-page { zoom: 1; overflow: hidden; }
.total-page .total { float: left; width: auto; }
.total-page .page { float: right; width: auto;}



</style>

 <div class="cs_title" style="margin-left:20%; margin-top:100px; font-size:23px; font-weight:600;	color:#333;">공지사항 작성</div>
<!--게시판상단-->

<div id="bbsData">
    <div class="page-body">
        <div class="bbs-table-write">
        
        
<form id="form1"  name='form1' action="<%=request.getContextPath() %>/index.jsp?workgroup=noticeBoard&work=jm_noticeWrite_action"  method='post'  style="position:relative;" autocomplete="off">
<fieldset>
       <legend>공지사항 쓰기</legend>
       <table summary="">
           <caption>공지사항 글쓰기</caption>
           <colgroup>
               <col width="160" />
               <col width="*" />
           </colgroup>
           <tbody>
          		<tr>
                   <th><div>제목</div></th>
                   <td colspan="">
                       <div class="title">
                     	 <input id="subject"class="MS_input_txt input_style2" type='text' name='subject' value='' 
                     	 	style="height: 35px;   width: 400px; border-color: lightgray" />                                                    
                     	</div>
                   </td>
               </tr>
               <tr>
                   <th><div>내용</div></th>
                   <td colspan="">
                <div>
              	 <textarea id="content2" name='content' wrap="off" onfocus='clear_content()'  class="MS_input_txt"  style="height: 400px;" ></textarea>
                </div>
                </td>
            </tr>
           </tbody>
       </table>
   </fieldset>
   <dl class="bbs-link bbs-link-btm">
       <dt></dt>
       <dd style="margin-bottom: 100px;">
       	<button type="submit" style="border: none;"><img src="./img/btn_wWrite.gif" alt="등록"></button>
         	<a href="<%=request.getContextPath() %>/index.jsp?workgroup=noticeBoard&work=jm_noticeList">
         	<img src="./img/btn_list.gif" alt="목록"></a>
       </dd>
   </dl>
</form>
             
</div>
</div>
</div>
<!-- .page-body -->

<script type="text/javascript">

$("#subject").focus();

$("#form1").submit(function() {
	   if($("#subject").val()=="" ) {
	      $("#message").text("제목을 입력해 주세요.");
	      $("#subject").focus();
	      $("#subject").focus();
	      return false;
	   }
	   
	   if($("#content2").val()=="") {
	      $("#message").text("내용을 입력해 주세요.");
	      $("#content2").focus();
	      return false;
	   }
	});

</script>

           

