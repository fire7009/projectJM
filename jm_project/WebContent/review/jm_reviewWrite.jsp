<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file = "/kdy/security/login_check.jspf" %>
<%-- 상품후기 작성 페이지  --%>
<%
	String pageNum = "1";
	pageNum = request.getParameter("pageNum");
%>
<title>상품후기 작성</title>
<style type="text/css">
.displaynone {
	display: none !important;
}

body.eMobilePopup {
	overflow: hidden;
	position: fixed;
}

.ec-base-label {
	display: inline-block;
	margin-right: 5px;
}

.ec-base-label img {
	vertical-align: middle;
}

.gridContainer .gridItem {
	min-width: 0;
}

.ec-solution-box {
	padding: 20px;
	border: 5px solid #e8e8e8;
	color: #404040;
}

.ec-solution-box.gHalf {
	position: relative;
	padding: 20px 0;
}

.ec-solution-box.gHalf:before {
	position: absolute;
	top: 0;
	left: 50%;`	
	display: block;
	content: "";
	width: 1px;
	height: 100%;
	background-color: #e6e6e6;
}

.ec-solution-box.typeBg {
	background-color: #fbfafa;
}

.ec-solution-box.typeThin {
	border-width: 1px;
	border-color: #d7d5d5;
}

.ec-solution-box.typeThinBg {
	border-width: 1px;
	border-color: #d7d5d5;
	background-color: #fbfafa;
}

.ec-solution-box.typeThinBg>.agree {
	padding: 20px;
	border: 1px solid #e6e6e6;
	background: #fff;
}

.ec-solution-box.typeThinBg>.agree p {
	padding: 0 0 17px;
}

.ec-solution-box.typeMember {
	padding: 0;
}

.ec-solution-box.typeMember .information {
	display: table;
	table-layout: fixed;
	padding: 10px 0;
	width: 100%;
	box-sizing: border-box;
}

.ec-solution-box.typeMember .information>.title, .ec-solution-box.typeMember .information>.thumbnail
	{
	display: table-cell;
	padding: 0 15px;
	width: 70px;
	text-align: center;
	vertical-align: middle;
}

.ec-solution-box.typeMember .information>.title {
	vertical-align: middle;
}

.ec-solution-box.typeMember .information>.thumbnail img {
	max-width: 70px;
}

.ec-solution-box.typeMember .information .description {
	display: table-cell;
	padding: 0 10px;
	width: auto;
	line-height: 1.5em;
	border-left: 1px solid #e8e8e8;
	vertical-align: middle;
}

.ec-solution-box.typeMember.gMessage {
	border-width: 1px;
	border-color: #d7d5d5;
}

.ec-solution-box .message {
	display: block;
	padding: 10px 0 10px 35px;
	border-bottom: 1px solid #e8e7e7;
	background: #fbfbfb
		url("//img.echosting.cafe24.com/skin/base/common/ico_info.gif")
		no-repeat 10px center;
}

.ec-solution-box.typeProduct {
	display: table;
	table-layout: fixed;
	padding: 15px 0;
	width: 100%;
	box-sizing: border-box;
}

.ec-solution-box.typeProduct .thumbnail, .ec-solution-box.typeProduct .information
	{
	display: table-cell;
	padding: 0 20px;
	vertical-align: middle;
}

.ec-solution-box.typeProduct .thumbnail {
	width: 100px;
}

.ec-solution-box.typeProduct .thumbnail img {
	max-width: 90px;
	border: 1px solid #d7d5d5;
}

.ec-solution-box.typeProduct .information {
	padding-left: 0;
}

.ec-solution-button {
	padding: 10px 0;
	text-align: center;
}

.ec-solution-button.justify {
	position: relative;
}

.ec-solution-button:after {
	display: block;
	content: "";
	clear: both;
}

.ec-solution-button .gLeft {
	float: left;
	text-align: left;
}

.ec-solution-button .gRight {
	float: right;
	text-align: right;
}

.ec-solution-button.justify .gLeft {
	position: absolute;
	left: 0;
}

.ec-solution-button.justify .gRight {
	position: absolute;
	right: 0;
}

.ec-solution-button .text {
	margin: 0 6px 0 10px;
	color: #353535;
	line-height: 24px;
}

.ec-solution-button.typeBorder {
	margin-top: -1px;
	padding: 10px 20px;
	border: 1px solid #d7d5d5;
}

.ec-solution-button.typeBG {
	padding: 10px 20px;
	border: 1px solid #d7d5d5;
	background: #fbfafa;
}

.ec-solution-layer li {
	list-style: none;
}

.ec-solution-layer table {
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
}

.ec-solution-layer caption {
	display: none;
}

.ec-solution-layer h1, .ec-solution-layer h3 {
	margin: 0;
}

.ec-solution-layer {
	position: absolute;
	z-index: 100;
	border: 1px solid #757575;
	background: #fff;
}

.ec-solution-layer .header {
	padding: 7px 35px 7px 19px;
	color: #fff;
	background: #495164;
}

.ec-solution-layer .header>h1, .ec-solution-layer .header>h3 {
	font-size: 14px;
	line-height: 1.5;
}

.ec-solution-layer .content {
	padding: 20px;
	font-size: 12px;
}

.ec-solution-layer div.ec-solution-help {
	margin-top: 0;
}

.ec-solution-layer .ec-solution-button {
	padding: 9px;
	border-top: 1px solid #d7d5d5;
	text-align: center;
	background: #fbfafa;
}

.ec-solution-layer .close {
	position: absolute;
	right: 0;
	top: 0;
	padding: 11px 20px;
	cursor: pointer;
}

#popup .ec-solution-layer {
	position: relative;
	border: 0;
}

#popup .ec-solution-layer .header {
	padding: 12px 35px 12px 19px;
}

#popup .ec-solution-layer .close {
	top: 5px;
}

.ec-solution-layer .content>.ec-solution-table table:first-child {
	margin-top: 0;
}

.ec-solution-layer .ec-solution-table table {
	line-height: 1.4;
}

.ec-solution-layer .ec-solution-table thead th {
	padding: 9px 0 8px;
}

.ec-solution-layer .ec-solution-table tbody th {
	padding: 9px 0 8px 10px;
}

.ec-solution-layer .ec-solution-table td {
	padding: 9px 10px 8px;
}

.ec-solution-layer .ec-solution-table.typeWrite td {
	padding: 5px 10px 4px;
}

.ec-solution-layer .ec-solution-table.typeList tfoot td {
	padding: 10px 10px 12px;
}

.ec-solution-layer .ec-solution-table.typeBorder tfoot td {
	padding: 10px 10px 12px;
}

.ec-solution-table table {
	position: relative;
	margin: 10px 0 0;
	border: 1px solid #d7d5d5;
	border-top-color: #fff;
	color: #fff;
	line-height: 1.5;
}

.ec-solution-table.gLayoutFixed table {
	table-layout: fixed;
}

.ec-solution-table.gLayoutFixed .gLayoutAuto table {
	table-layout: auto;
}

.ec-solution-table table:before {
	position: absolute;
	top: 1px;
	left: 0;
	display: block;
	content: "";
	width: 100%;
	height: 1px;
	background: #d7d5d5;
}

.ec-solution-table thead th {
	padding: 11px 0 10px;
	border-left: 1px solid #dfdfdf;
	border-bottom: 1px solid #dfdfdf;
	color: #353535;
	vertical-align: middle;
	font-weight: normal;
	background: #fbfafa;
}

.ec-solution-table tbody th {
	padding: 11px 0 10px 18px;
	border: 1px solid #dfdfdf;
	border-bottom-width: 0;
	color: #353535;
	text-align: left;
	font-weight: normal;
	background-color: #fbfafa;
}

.ec-solution-table th:first-child {
	border-left: 0;
}

.ec-solution-table td {
	padding: 11px 10px 10px;
	border-top: 1px solid #dfdfdf;
	color: #353535;
	vertical-align: middle;
}

.ec-solution-table td.clear {
	padding: 0 !important;
	border: 0 !important;
}

.ec-solution-table.typeWrite td {
	padding: 8px 10px 7px;
}

.ec-solution-table.typeList table {
	border-top-color: #d7d5d5;
}

.ec-solution-table.typeList table:before {
	display: none;
}

.ec-solution-table.typeList td {
	padding: 8px 10px 7px;
}

.ec-solution-table.typeList tfoot td {
	padding: 15px 10px 17px;
	background: #fbfafa;
}

.ec-solution-table .message {
	border: 1px solid #d7d5d5;
	padding: 50px 0;
	text-align: center;
	color: #757575;
	font-weight: bold;
}

.ec-solution-table table+.message {
	margin: -1px 0 0;
}

.ec-solution-table table td.message {
	padding: 50px 0;
}

.ec-solution-table .scroll .message {
	border: 0;
}

.ec-solution-table.typeList .head td {
	padding: 11px 0 10px;
	border-left: 1px solid #dfdfdf;
	border-bottom: 1px solid #dfdfdf;
	color: #353535;
	vertical-align: middle;
	text-align: center;
	background: #fbfafa;
}

.ec-solution-table.typeList .head td:first-child {
	border-left: 0;
}

.ec-solution-table.typeList .scroll {
	position: relative;
	overflow-x: hidden;
	overflow-y: scroll;
	max-height: 185px;
	min-height: 100px;
	border: 1px solid #d7d5d5;
	border-top-width: 0;
	margin-top: -1px;
}

.ec-solution-table.typeList .scroll table {
	border: 0;
	margin: 0;
}

.ec-solution-table.typeList .scroll table:before {
	display: none;
}

.ec-solution-table.typeList .scroll .message {
	border: 0;
}

.ec-solution-table thead.blind, .ec-solution-table thead.blind th {
	display: none;
}

.ec-solution-table thead.blind+tbody tr:first-child th,
	.ec-solution-table thead.blind+tbody tr:first-child td {
	border-top-width: 0;
}

.ec-solution-table.typeList.gLine table {
	border-width: 0;
	border-bottom-width: 1px;
}

.ec-solution-table.typeClear table:before {
	display: none;
}

.ec-solution-table.typeClear table, .ec-solution-table.typeClear th,
	.ec-solution-table.typeClear td {
	border: 0 none;
	background: none;
}

.ec-solution-table.typeClear th {
	font-weight: bold;
}

.ec-solution-table.gBorder td {
	border-left: 1px solid #dfdfdf;
}

.ec-solution-table.gBorder td:first-child {
	border-left: 0;
}

.ec-solution-table .left {
	text-align: left;
}

.ec-solution-table .center {
	text-align: center;
}

.ec-solution-table .right {
	text-align: right;
}

.ec-solution-table.typeList .center td, .ec-solution-table.typeList td.center
	{
	padding-left: 0;
	padding-right: 0;
}

.ec-solution-table.typeList .center td.left {
	padding-left: 10px;
}

.ec-solution-table.typeList .center td.right {
	padding-right: 10px;
}

.ec-solution-table .top th, .ec-solution-table th.top,
	.ec-solution-table .top td, .ec-solution-table td.top {
	vertical-align: top;
}

.ec-solution-table .middle th, .ec-solution-table th.middle,
	.ec-solution-table .middle td, .ec-solution-table td.middle {
	vertical-align: middle;
}

.ec-solution-table img {
	vertical-align: middle;
}

@media print {
	.ec-solution-table table:before {
		display: none;
	}
}

.mt15 {
	margin-top: 15px;
}

.clear_both {
	clear: both;
}

.space {
	height: 10px;
	clear: both;
}

.space2 {
	height: 5px;
	clear: both;
}

.list_list {
	width: 100%;
	border: 0;
	border-top: 2px solid #cfcfcf;
	margin: 0 0 20px 0;
	padding: 0;
}

.list_list th div {
	white-space: nowrap;
}

.list_list tr.bg0 {
	background: #fff;
}

.list_list tr.bg1 {
	background: #f8f8f8;
}

.list_list th, .list_list td {
	border: 0;
	padding: 5px 10px;
	text-align: left;
	vertical-align: middle;
}

.list_list th {
	background: #f4f4f4;
}

.list_list tbody th {
	border-bottom: 1px solid #e5e5e5;
}

.list_list td {
	border-bottom: 1px solid #f0f0f0;
}

.list_list th.button, .colTable th.button, .crossTable th.button {
	text-align: right;
}

.list_list td.alert, .colTable td.alert, .crossTable td.alert {
	color: red !important;
}

.list_list td.alert a, .colTable td.alert a, .crossTable td.alert a {
	text-decoration: none;
	color: red !important;
}

.tableRow {
	width: 100%;
	border: 0;
	border-top: 2px solid #cfcfcf;
	margin: 0 0 20px 0;
	padding: 0;
}

.tableRow th div {
	white-space: nowrap;
}

.tableRow tr.bg0 {
	background: #fff;
}

.tableRow tr.bg1 {
	background: #f8f8f8;
}

.tableRow th, .tableRow td {
	border: 0;
	padding: 5px 10px;
	vertical-align: middle;
}

.tableRow th {
	background: #f4f4f4;
	text-align: left;
	padding-left: 20px;
}

.tableRow tbody th {
	border-bottom: 1px solid #e5e5e5;
}

.tableRow td {
	border-bottom: 1px solid #f0f0f0;
}

.tableRow th.button, .colTable th.button, .crossTable th.button {
	text-align: right;
}

.tableRow td.alert, .colTable td.alert, .crossTable td.alert {
	color: red !important;
}

.tableRow td.alert a, .colTable td.alert a, .crossTable td.alert a {
	text-decoration: none;
	color: red !important;
}

.board_pagination {
	margin: 0 auto;
	text-align: center;
	margin-top: 15px;
}

.board_comment_list textarea, .board_comment_write textarea {
	width: 90%;
	font-size: 12px;
}

.board_comment_list .comment_lists {
	height: 25px;
	border-bottom: 1px solid #e8e8e8;
	padding-top: 10px;
}

.displaynone {
	display: none;
}

.board_pagination .current {
	color: #CC0000;
	font-weight: bold;
}

.table01 {
	width: 100%;
	border: 0;
	margin: 0;
	padding: 0;
}

.ipInfo {
	text-align: right;
	width: 100%;
}

.xans-board-title .title {
	min-height: 30px;
	margin: 10px 0 20px;
	border-bottom: 1px solid #e8e8e8;
}

.xans-board-title .title h2 {
	display: inline-block;
	padding: 0 0 0 12px;
	color: #2e2e2e;
	font-size: 16px;
	*display: inline;
	*zoom: 1;
	background:
		url("//img.echosting.cafe24.com/skin/base/layout/ico_heading.gif") 0
		50% no-repeat;
}

.xans-board-title .title p {
	display: inline-block;
	margin: 0 0 0 6px;
	padding: 0 0 0 10px;
	color: #939393;
	vertical-align: bottom;
	background:
		url("//img.echosting.cafe24.com/skin/base/layout/ico_bar.gif")
		no-repeat 0 0;
	*display: inline;
	*zoom: 1;
}

.xans-board-title p.imgArea {
	margin: 0 0 20px;
}

.xans-board-write .ec-base-table tr.agree td textarea {
	width: 560px;
	height: 140px;
	margin: 0 0 10px;
}

.xans-board-write .ec-base-table #subject {
	width: 390px;
}

.xans-board-write .ec-base-table #ucc_width, .xans-board-write table #ucc_height
	{
	width: 40px;
	margin-left: 4px;
}

.xans-board-write .ec-base-table #email1 {
	margin: 0 4px 0 0;
}

.xans-board-write .ec-base-table #email2 {
	margin: 0 4px;
}

.xans-board-write .ec-base-button {
	margin: 10px 0 40px;
}

.xans-board-write .ec-base-box.typeProduct {
	margin: 0 0 20px;
}

.xans-board-write .information h3 {
	margin: 17px 0 5px;
	font-size: 14px;
	color: #2e2e2e;
}

.xans-board-write .information .price {
	font-size: 14px;
	font-weight: bold;
	color: #008bcc;
}

.xans-board-write .information .button {
	margin: 19px 0 0 0;
	padding: 13px 0 0 0;
	border-top: 1px solid #e8e8e8;
}

html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	code, form, fieldset, legend, input, textarea, p, blockquote, th, td,
	img {
	margin: 0;
	padding: 0;
}

html {
	width: 100%;
	height: 100%;
}

body, code {
	font: 0.75em Verdana, Dotum, AppleGothic, sans-serif;
	color: #353535;
	background: #fff;
}

body {
	min-width: 1480px;
}

body#popup {
	min-width: 0;
}

li {
	list-style: none;
}

img, fieldset {
	border: none;
	vertical-align: top;
}

table {
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
}

caption {
	display: none;
}

th, td {
	border: 0;
	vertical-align: top;
}

input, select, textarea {
	font-size: 100%;
	font-family: "돋움", Dotum;
	color: #353535;
	vertical-align: middle;
}

input[type=radio], input[type=checkbox] {
	width: 13px;
	height: 13px;
	border: 0;
}

input[type=text], input[type=password] {
	height: 18px;
	line-height: 20px;
	padding: 2px 4px;
	border: 1px solid #d5d5d5;
	color: #353535;
	font-size: 12px;
}

input[type=radio]+label, input[type=checkbox]+label {
	margin: 0 4px 0 2px;
}

select {
	height: 24px;
	border: 1px solid #d5d5d5;
}

textarea {
	padding: 5px 6px;
	border: 1px solid #d5d5d5;
	line-height: 1.5;
}

input:-ms-input-placeholder, textarea:-ms-input-placeholder {
	color: #c1c1c1;
}

input::-webkit-input-placeholder, textarea::-webkit-input-placeholder {
	color: #c1c1c1;
}

input::-moz-placeholder, textarea::-moz-placeholder {
	color: #c1c1c1;
	opacity: 1;
}

legend {
	visibility: hidden;
	position: absolute;
	left: -9999px;
	top: -9999px;
	width: 0;
	height: 0;
	line-height: 0;
}

button {
	overflow: visible;
	padding: 0;
	margin: 0;
	border: 0;
	cursor: pointer;
}

hr.layout {
	display: none;
}

a {
	text-decoration: none;
	color: #000;
}

a:hover {
	text-decoration: underline;
}

a:active {
	text-decoration: none;
}

.objHidden {
	visibility: hidden;
	position: absolute;
	left: -1000px;
	top: -1000px;
	height: 0;
	width: 0;
}

table tr.radioType input, span.noBorder input {
	border: none !important;
	width: auto !important;
	height: auto !important;
	margin: 0 3px 0 0 !important;
	vertical-align: middle !important;
	background: none !important;
}

#content_CONTAINER table, #bi_inquire_content_CONTAINER table {
	border: 0;
	margin: 0 0 -1px;
}

#content_CONTAINER table:before, #bi_inquire_content_CONTAINER table:before
	{
	display: none;
}

#content_CONTAINER td, #bi_inquire_content_CONTAINER td {
	width: auto !important;
	padding: 0;
}

table.nneditor-table {
	width: auto !important;
}

.gLabel {
	display: inline-block;
}

.gLabel label {
	margin-right: 20px;
	line-height: 22px;
}

.fWidthFull input[type=text] {
	width: 100%;
	height: 24px;
	-webkit-box-sizing: border-box;
	-moz-webkit-box: border-box;
	box-sizing: border-box;
}

.fWidthFull textarea {
	width: 100%;
	-webkit-box-sizing: border-box;
	-moz-webkit-box: border-box;
	box-sizing: border-box;
}

#progressPaybarBackground {
	position: absolute;
	z-index: 99;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

#progressPaybarView {
	position: absolute;
	z-index: 100;
	top: 160px;
	left: 20px;
	width: 471px;
	font-size: 12px;
}

#progressPaybarView .box {
	height: 180px;
	background:
		url(http://img.cafe24.com/images/ec_hosting/popup/layer_guide/bg_layer_box1.gif)
		0 0 no-repeat;
}

#progressPaybarView .box .graph {
	padding: 15px 0 0 0;
	text-align: center;
}

#progressPaybarView .box .graph span {
	display: block;
	text-align: center;
	margin: 20px 0;
}

#progressPaybarView .box .txt {
	text-align: center;
	padding: 15px 0 0;
	color: #555555;
}

div.layerProgress {
	filter: alpha(opacity = 40);
	opacity: 0.4;
	-moz-opacity: 0.4;
	background-color: #999;
}

#skipNavigation {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 100;
	width: 100%;
	height: 0;
}

#skipNavigation p, #skipNavigation ul, #skipNavigation ul li {
	height: 0;
}

#skipNavigation p a {
	position: absolute;
	left: 0;
	top: 0;
	display: block;
	overflow: hidden;
	width: 1px;
	height: 1px;
	margin-left: -1px;
	margin-bottom: -1px;
	text-align: center;
	color: #000;
	white-space: nowrap;
}

#skipNavigation p a:focus, #skipNavigation p a:hover, #skipNavigation p a:active
	{
	width: 100%;
	height: auto;
	padding: 10px 0;
	background: #c4122f;
	color: #fff;
	z-index: 100;
}

.displaynone {
	display: none;
}

.dimmed {
	position: fixed;
	top: 0;
	left: 0;
	z-index: 99;
	width: 100%;
	height: 100%;
	background: #fff;
	opacity: 0.8;
	filter: alpha(opacity = 80);
}

.txtInfo {
	color: #707070;
}

.txtWarn {
	color: #f76560;
}

.txtEm {
	color: #008bcc;
}

.txtDel, .strike, .discount {
	text-decoration: line-through;
	font-weight: normal;
}

.strike strong, .discount strong {
	font-weight: normal;
}

.txtNormal {
	font-weight: normal;
	font-style: normal;
}

.txtNum {
	font-size: 11px;
	color: #939393;
}

.txt11 {
	font-size: 11px;
}

.txt12 {
	font-size: 12px;
}

.txt14 {
	font-size: 14px;
}

.txt16 {
	font-size: 16px;
}

.txt18 {
	font-size: 18px;
	letter-spacing: -1px;
}

.txtIcon {
	font-size: 12px;
	font-style: normal;
}

.txtBreak {
	word-break: break-all;
	word-wrap: break-word;
}

html:lang(ja) .txt11, html:lang(zh) .txt11, html:lang(zh-tw) .txt11 {
	font-size: 12px;
}

.gBlank5 {
	display: block;
	margin-top: 5px;
}

.gBlank10 {
	display: block;
	margin-top: 10px;
}

.gBlank20 {
	display: block;
	margin-top: 20px;
}

.gBlank30 {
	display: block;
	margin-top: 30px;
}

.gIndent10 {
	margin-left: 10px;
}

.gIndent20 {
	margin-left: 20px;
}

.gSpace10 {
	margin-right: 10px;
}

.gSpace20 {
	margin-right: 20px;
}

.gMerge {
	position: relative;
	z-index: 1;
	margin-top: -1px;
}

.ec-base-qty {
	position: relative;
	display: inline-block;
	width: 50px;
	margin: 0 1px 0 0;
	text-align: left;
}

.ec-base-qty input[type="text"] {
	width: 22px;
	height: 23px;
	padding: 0 0 0 5px;
	line-height: 25px;
	border: 1px solid #d4d8d9;
	border-radius: 3px 0 0 3px;
}

.ec-base-qty .up {
	position: absolute;
	left: 27px;
	top: 0;
}

.ec-base-qty .down {
	position: absolute;
	left: 27px;
	bottom: 0;
}

.ec-base-tooltip {
	display: none;
	z-index: 2;
	position: absolute;
	top: 24px;
	padding: 15px;
	border: 1px solid #565960;
	background: #fff;
	-webkit-box-shadow: 3px 3px 3px 0px rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 3px 3px 3px 0px rgba(0, 0, 0, 0.15);
	box-shadow: 3px 3px 3px 0px rgba(0, 0, 0, 0.15);
}

.ec-base-tooltip h3 {
	margin: 0 0 8px;
	padding: 0 10px;
	font-size: 12px;
	border-bottom: 0;
	background:
		url("http://img.echosting.cafe24.com/skin/base/common/ico_layer_title.gif")
		no-repeat 0 50%;
}

.ec-base-tooltip h3+p {
	margin: 0 5px 10px;
}

.ec-base-tooltip h4 {
	margin: 15px 10px 8px 5px;
	font-size: 12px;
}

.ec-base-tooltip h4:before {
	display: inline-block;
	content: "";
	margin: 0 5px 0 0;
	width: 3px;
	height: 3px;
	background: #666;
	vertical-align: middle;
}

.ec-base-tooltip .btnClose {
	position: absolute;
	right: 14px;
	top: 14px;
}

.ec-base-tooltip .edge {
	z-index: 20;
	position: absolute;
	left: 50%;
	top: -6px;
	display: block;
	margin: 0 0 0 -5px;
	width: 10px;
	height: 6px;
}

.ec-base-tooltip .edge:before, .ec-base-tooltip .edge:after {
	display: inline-block;
	content: "";
	position: absolute;
	top: 0;
	width: 0;
	height: 0;
	border: solid transparent;
}

.ec-base-tooltip .edge:before {
	margin: 1px 0 0;
	border-bottom-color: #565960;
	border-width: 0 5px 5px 5px;
}

.ec-base-tooltip .edge:after {
	left: 1px;
	margin: 2px 0 0;
	border-bottom-color: #fff;
	border-width: 0 4px 4px 4px;
}

.ec-base-tooltip table th, .ec-base-tooltip table td {
	padding: 8px 10px 7px 10px;
	border: 1px solid #e8e8e8;
	line-height: 1.5em;
}

.ec-base-tooltip table th {
	padding-right: 0;
	background: #fbf9fa;
}

.ec-base-tooltip table thead th {
	text-align: center;
}

.ec-base-tooltip table tbody th {
	text-align: left;
}

.ec-base-tooltip table .left {
	text-align: left;
}

.ec-base-tooltip table .center {
	text-align: center;
}

.ec-base-tooltip table .right {
	text-align: right;
}

.ec-base-tooltip table .info {
	padding: 0;
	color: #757575;
}

.ec-base-tooltip table p.info:before, .ec-base-tooltip table ul.info li:before
	{
	display: inline-block;
	content: "";
	margin: 0 3px 0 0;
	width: 4px;
	height: 1px;
	background: #757575;
	vertical-align: middle;
}

.ec-base-tooltip .info {
	padding: 10px 10px 0;
	margin: 5px 0 0;
}

.ec-base-tooltip p.bullet, .ec-base-tooltip ul.bullet {
	margin: 8px 10px;
}

.ec-base-tooltip p.bullet:before, .ec-base-tooltip ul.bullet li:before {
	display: inline-block;
	content: "";
	margin: -3px 3px 0 0;
	width: 0;
	height: 0;
	border: solid transparent;
	border-left-color: #333;
	border-width: 2px 0 2px 2px;
	vertical-align: middle;
}

.ec-base-tooltip ul.bullet li {
	line-height: 1.5em;
}

.ec-base-tooltip .txtEm {
	color: #008bcc;
}

.ec-base-tooltip .txtWarn {
	color: #f65b54;
}

.ec-base-tooltip.typeUpper {
	top: auto;
	bottom: 34px;
}

.ec-base-tooltip.typeUpper .edge {
	top: auto;
	bottom: -6px;
}

.ec-base-tooltip.typeUpper .edge:before {
	margin: 0 0 -5px;
	border-top-color: #565960;
	border-width: 5px 5px 0 5px;
}

.ec-base-tooltip.typeUpper .edge:after {
	left: 1px;
	margin: 0 0 -4px;
	border-top-color: #fff;
	border-width: 4px 4px 0 4px;
}

span.ec-base-help, p.ec-base-help, ul.ec-base-help li {
	margin: 2px 9px;
	padding: 1px 0 1px 20px;
	line-height: 1.4;
	background:
		url('http://img.echosting.cafe24.com/skin/base/common/ico_info.gif')
		no-repeat 0 2px;
}

div.ec-base-help {
	margin: 20px 0;
	border: 1px solid #d6d4d4;
	line-height: 18px;
}

div.ec-base-help>h2, div.ec-base-help>h3 {
	padding: 9px 0 6px 10px;
	border-bottom: 1px solid #e8e7e7;
	color: #101010;
	font-size: 12px;
	background: #fbfbfb;
}

div.ec-base-help .inner {
	padding: 0 9px 12px;
}

div.ec-base-help h4 {
	margin: 22px 0 -4px;
	color: #404040;
	font-size: 12px;
	font-weight: normal;
}

div.ec-base-help h4:first-child {
	margin-top: 13px;
}

div.ec-base-help p {
	margin: 15px 0 0 10px;
	color: #707070;
}

div.ec-base-help ul, div.ec-base-help ol {
	margin: 15px 0 0 11px;
}

div.ec-base-help li {
	color: #707070;
}

div.ec-base-help ol li {
	padding: 0 0 0 25px;
	background:
		url('http://img.echosting.cafe24.com/skin/base/common/ico_number.png')
		no-repeat;
}

div.ec-base-help ol .item1 {
	background-position: -484px 0;
}

div.ec-base-help ol .item2 {
	background-position: -434px -100px;
}

div.ec-base-help ol .item3 {
	background-position: -384px -200px;
}

div.ec-base-help ol .item4 {
	background-position: -334px -300px;
}

div.ec-base-help ol .item5 {
	background-position: -284px -400px;
}

div.ec-base-help ol .item6 {
	background-position: -234px -500px;
}

div.ec-base-help ol .item7 {
	background-position: -184px -600px;
}

div.ec-base-help ol .item8 {
	background-position: -134px -700px;
}

div.ec-base-help ol .item9 {
	background-position: -84px -800px;
}

div.ec-base-help ol .item10 {
	background-position: -34px -900px;
}

div.ec-base-help ul li {
	padding: 0 0 0 11px;
	background:
		url('http://img.echosting.cafe24.com/skin/base/common/ico_dash.gif')
		no-repeat 0 7px;
}

.ec-base-paginate {
	margin: 30px 0;
	text-align: center;
	font-size: 0;
	line-height: 0;
}

.ec-base-paginate ol {
	display: inline-block;
	font-size: 0;
	line-height: 0;
	vertical-align: top;
	*display: inline;
	*zoom: 1;
	*margin: 0;
}

.ec-base-paginate li {
	display: inline-block;
	margin: 0 0 0 -1px;
	border: 1px solid #d7d5d5;
	font-size: 12px;
	color: #757575;
	vertical-align: top;
	*display: inline;
	*zoom: 1;
}

.ec-base-paginate li:first-child {
	margin-left: 0;
}

.ec-base-paginate img {
	vertical-align: top;
}

.ec-base-paginate li a {
	display: block;
	width: 33px;
	padding: 9px 0;
	font-weight: bold;
	color: #939393;
	line-height: 14px;
	background: #fff;
}

.ec-base-paginate li a:hover {
	text-decoration: none;
	background: #f0f2f2;
}

.ec-base-paginate li a.this {
	padding-bottom: 6px;
	border-bottom: 3px solid #495164;
	color: #495164;
}

.ec-base-paginate a.nolink {
	cursor: default;
}

.ec-base-paginate.typeSub ol {
	margin: 0 15px;
	vertical-align: middle;
}

.ec-base-paginate.typeSub li {
	font-size: 12px;
	border: 0;
}

.ec-base-paginate.typeSub img {
	vertical-align: middle;
}

.ec-base-paginate.typeSub li a {
	width: auto;
	margin: 0 5px 0;
	padding: 2px;
	color: #353535;
	background: none;
}

.ec-base-paginate.typeSub li a.this {
	color: #008bcc;
	text-decoration: underline;
	border: 0;
}

.ec-base-paginate.typeSub .first {
	margin-right: 3px;
}

.ec-base-paginate.typeSub .last {
	margin-left: 3px;
}

.ec-base-tab {
	position: relative;
}

.ec-base-tab .menu {
	margin: 0 0 20px;
	border: 1px solid #cbcdce;
	border-bottom-color: #202020;
	border-left: 0;
	background: #f2f2f2;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.ec-base-tab .menu:after {
	content: "";
	display: block;
	clear: both;
}

.ec-base-tab .menu li {
	float: left;
	border-left: 1px solid #cbcdce;
	background: #f2f2f2;
}

.ec-base-tab .menu li a {
	display: block;
	min-width: 187px;
	margin: 0 0 0 -1px;
	padding: 12px 5px 11px;
	border-right: 1px solid #cbcdce;
	color: #707070;
	text-decoration: none;
	outline: 0;
	text-align: center;
	background: #f2f2f2;
}

.ec-base-tab .menu li:first-child a {
	margin-left: 0;
}

.ec-base-tab .menu li.selected a {
	position: relative;
	top: -1px;
	left: -1px;
	margin: 0 0 -1px;
	border: 1px solid #202020;
	border-bottom: 0;
	color: #fff;
	font-weight: bold;
	background: #4a5164;
}

.ec-base-tab .right {
	position: absolute;
	top: 8px;
	right: 10px;
	line-height: 24px;
	color: #909090;
}

.ec-base-tab.typeLight .menu li.selected a {
	margin: 0 0 -2px;
	border-bottom: 1px solid #fff;
	color: #404040;
	background: #fff;
}

.ec-base-tab[class*="grid"] .menu {
	display: table;
	table-layout: fixed;
	width: 100%;
}

.ec-base-tab[class*="grid"] .menu li {
	float: none;
	display: table-cell;
	vertical-align: middle;
}

.ec-base-tab[class*="grid"] .menu li a {
	display: inline-block;
	width: 100%;
	min-width: 0;
	margin: 0;
	padding: 11px 0;
	border: 0;
}

.ec-base-tab[class*="grid"] .menu li.selected {
	position: relative;
	top: 0;
	right: -1px;
	border: 1px solid #292929;
	border-bottom: 0;
	background: #4a5164;
}

.ec-base-tab[class*="grid"] .menu li:first-child.selected {
	right: 0;
}

.ec-base-tab[class*="grid"] .menu li.selected a {
	position: static;
	background: none;
}

.ec-base-tab.grid2 .menu li {
	width: 50.5%;
}

.ec-base-tab.grid3 .menu li {
	width: 34%;
}

.ec-base-tab.grid4 .menu li {
	width: 25.5%;
}

.ec-base-tab.grid5 .menu li {
	width: 20.5%;
}

.ec-base-tab.grid6 .menu li {
	width: 17%;
}

.ec-base-tab.grid7 .menu li {
	width: 14.8%;
	width: 15% \0/;
}

.ec-base-tab.grid7 .menu li:first-child {
	width: 13% \0/;
}

.ec-base-button {
	padding: 10px 0;
	text-align: center;
}

.ec-base-button.justify {
	position: relative;
}

.ec-base-button:after {
	display: block;
	content: "";
	clear: both;
}

.ec-base-button .gLeft {
	float: left;
	text-align: left;
}

.ec-base-button .gRight {
	float: right;
	text-align: right;
}

.ec-base-button.justify .gLeft {
	position: absolute;
	left: 0;
}

.ec-base-button.justify .gRight {
	position: absolute;
	right: 0;
}

.ec-base-button .text {
	margin: 0 6px 0 10px;
	color: #353535;
	line-height: 24px;
}

.ec-base-button.typeBorder {
	margin-top: -1px;
	padding: 10px 20px;
	border: 1px solid #d7d5d5;
}

.ec-base-button.typeBG {
	padding: 10px 20px;
	border: 1px solid #d7d5d5;
	background: #fbfafa;
}

.talk {
	bottom: 30px;
	position: fixed;
	z-index: 99;
	right: 260px;
}

.ec-base-box {
	padding: 20px;
	border: 5px solid #e8e8e8;
	color: #404040;
}

.ec-base-box.gHalf {
	position: relative;
	padding: 20px 0;
}

.ec-base-box.gHalf:before {
	position: absolute;
	top: 0;
	left: 50%;
	display: block;
	content: "";
	width: 1px;
	height: 100%;
	background-color: #e6e6e6;
}

.ec-base-box.typeBg {
	background-color: #fbfafa;
}

.ec-base-box.typeThin {
	border-width: 1px;
	border-color: #d7d5d5;
}

.ec-base-box.typeThinBg {
	border-width: 1px;
	border-color: #d7d5d5;
	background-color: #fbfafa;
}

.ec-base-box.typeThinBg>.agree {
	padding: 20px;
	border: 1px solid #e6e6e6;
	background: #fff;
}

.ec-base-box.typeThinBg>.agree p {
	padding: 0 0 17px;
}

.ec-base-box.typeMember {
	padding: 0;
}

.ec-base-box.typeMember .information {
	display: table;
	table-layout: fixed;
	padding: 10px 0;
	width: 100%;
	box-sizing: border-box;
}

.ec-base-box.typeMember .information>.title, .ec-base-box.typeMember .information>.thumbnail
	{
	display: table-cell;
	padding: 0 15px;
	width: 70px;
	text-align: center;
	vertical-align: middle;
}

.ec-base-box.typeMember .information>.title {
	vertical-align: middle;
}

.ec-base-box.typeMember .information>.thumbnail img {
	max-width: 70px;
}

.ec-base-box.typeMember .information .description {
	display: table-cell;
	padding: 0 10px;
	width: auto;
	line-height: 1.5em;
	border-left: 1px solid #e8e8e8;
	vertical-align: middle;
}

.ec-base-box.typeMember.gMessage {
	border-width: 1px;
	border-color: #d7d5d5;
}

.ec-base-box .message {
	display: block;
	padding: 10px 0 10px 35px;
	border-bottom: 1px solid #e8e7e7;
	background: #fbfbfb
		url("http://img.echosting.cafe24.com/skin/base/common/ico_info.gif")
		no-repeat 10px center;
}

.ec-base-box.typeProduct {
	display: table;
	table-layout: fixed;
	padding: 15px 0;
	width: 100%;
	box-sizing: border-box;
}

.ec-base-box.typeProduct .thumbnail, .ec-base-box.typeProduct .information
	{
	display: table-cell;
	padding: 0 20px;
	vertical-align: middle;
}

.ec-base-box.typeProduct .thumbnail {
	width: 100px;
}

.ec-base-box.typeProduct .thumbnail img {
	max-width: 90px;
	border: 1px solid #d7d5d5;
}

.ec-base-box.typeProduct .information {
	padding-left: 0;
}

.ec-base-desc {
	overflow: hidden;
	text-align: left;
}

.ec-base-desc:after {
	content: "";
	display: block;
	claer: both;
}

.ec-base-desc dt, .ec-base-desc .term {
	float: left;
	width: 100px;
	margin: 0 0 2px;
	padding: 0 4px 0 0;
	line-height: 22px;
	-webkit-box-sizing: border-box;
	-moz-webkit-box: border-box;
	box-sizing: border-box;
	font-weight: normal;
}

.ec-base-desc dd, .ec-base-desc .desc {
	display: block;
	margin: 0 0 2px;
	padding: 0 5px 0 100px;
	min-height: 22px;
	line-height: 22px;
	word-wrap: break-word;
}

.ec-base-desc dd:after, .ec-base-desc .desc:after {
	content: "";
	display: block;
	clear: left;
}

.ec-base-desc.gSmall dt, .ec-base-desc.gSmall .term {
	width: 30%;
}

.ec-base-desc.gSmall dd, .ec-base-desc.gSmall .desc {
	padding-left: 30%;
}

.ec-base-desc.gMedium dt, .ec-base-desc.gMedium .term {
	width: 40%;
}

.ec-base-desc.gMedium dd, .ec-base-desc.gMedium .desc {
	padding-left: 40%;
}

.ec-base-desc.gLarge dt, .ec-base-desc.gLarge .term {
	width: 50%;
}

.ec-base-desc.gLarge dd, .ec-base-desc.gLarge .desc {
	padding: 0 0 0 50%;
}

.ec-base-desc.centerDT dt, .ec-base-desc.centerDD dd, .ec-base-desc.centerDT .term,
	.ec-base-desc.centerDD .desc, .ec-base-desc.center, .ec-base-desc .center
	{
	text-align: center;
}

.ec-base-desc.rightDT dt, .ec-base-desc.rightDD dd, .ec-base-desc.rightDT .term,
	.ec-base-desc.rightDD .desc, .ec-base-desc.right, .ec-base-desc .right
	{
	text-align: right;
}

.ec-base-desc.rightDD dd, .ec-base-desc.rightDD .desc {
	padding-right: 0;
}

.ec-base-desc.typeBullet dt, .ec-base-desc.typeBullet .term {
	padding: 0 4px 0 10px;
	background:
		url("http://img.echosting.cafe24.com/skin/base/common/ico_arrow.png")
		no-repeat 0 7px;
}

.ec-base-desc.typeDot dt, .ec-base-desc.typeDot .term {
	padding: 0 4px 0 6px;
	background:
		url("http://img.echosting.cafe24.com/skin/base/common/ico_square3.gif")
		no-repeat left 10px;
}

html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	code, form, fieldset, legend, input, textarea, p, blockquote, th, td,
	img {
	list-style: none;
	margin: 0;
	padding: 0;
}

html {
	width: 100%;
	height: 100%;
}

body, code {
	font: 0.75em Nanum Gothic, Verdana, Dotum, AppleGothic, sans-serif,
		xeicon !important;
	color: #333 !important;
}

body {
	min-width: 1265px !important;
	height: 100%;
	overflow-y: scroll !important;
	background: none !important;
}

@media all and (max-width:1265px) {
	body {
		min-width: 1000px !important;
	}
}

input, select, textarea, button {
	outline: none !important;
}

#header {
	background: none !important;
}

#wrap {
	position: relative;
	width: 100%;
}

#wrap.fixed {
	margin: 60px 0 0;
}

#container {
	position: relative;
	width: 100%;
	*zoom: 1;
}

#container:after {
	content: "";
	display: block;
	clear: both;
}

#contents_main {
	position: relative;
	width: 100%;
}

#contents {
	position: relative;
	width: 1260px;
	margin: 20px auto;
}

@media all and (max-width:1265px) {
	#contents {
		width: 980px;
	}
}

.path ol {
	float: right;
}

#boardArea {
	overflow: hidden;
	margin: 50px 0 0;
	border-top: 1px solid #d8d8d8;
}

#bannerArea {
	margin: 22px 0 0;
}

#bannerArea h2 {
	margin: 0 0 16px;
	font-weight: normal;
	font-size: 20px;
	color: #2e2e2e;
	text-align: center;
}

.path {
	overflow: hidden;
	height: 30px;
	line-height: 30px;
	*zoom: 1;
}

.path span {
	overflow: hidden;
	position: absolute;
	width: 0;
	height: 0;
	white-space: nowrap;
	text-indent: 100%;
}

.path li {
	float: left;
	padding: 0 0 0 12px;
	margin: 0 0 0 8px;
	color: #757575;
	background:
		url("http://img.echosting.cafe24.com/skin/base/layout/ico_path.gif")
		no-repeat 0 10px;
}

.path li:first-child {
	padding-left: 0;
	margin-left: 0;
	background: none;
}

.path li a {
	color: #757575;
}

.path li strong, .path li strong a {
	color: #2e2e2e;
}

.titleArea {
	min-height: 30px;
	margin: 10px 0 20px;
	border-bottom: 1px solid #e8e8e8;
}

.titleArea h2 {
	display: inline-block;
	padding: 0 0 0 12px;
	color: #2e2e2e;
	font-size: 16px;
	*display: inline;
	*zoom: 1;
	background:
		url("http://img.echosting.cafe24.com/skin/base/layout/ico_heading.gif")
		0 50% no-repeat;
}

.titleArea p {
	display: inline-block;
	margin: 0 0 0 6px;
	padding: 0 0 0 10px;
	color: #939393;
	background:
		url("http://img.echosting.cafe24.com/skin/base/layout/ico_bar.gif")
		no-repeat 0 0;
	*display: inline;
	*zoom: 1;
}

.titleArea ul {
	padding: 5px 0;
	color: #939393;
	line-height: 18px;
}

.titleArea ul li {
	padding: 0 0 0 9px;
	background:
		url("http://img.echosting.cafe24.com/skin/base/common/ico_square2.gif")
		no-repeat 4px 7px;
}

.boardMain {
	overflow: hidden;
	*zoom: 1;
}

.boardMain td img {
	vertical-align: middle;
	margin: 1px;
}

.boardMain .board {
	position: relative;
	margin: 0 0 65px;
}

.boardMain .leftArea {
	float: left;
	width: 50%;
}

.boardMain .leftArea .board {
	margin: 0 23px 65px 0;
}

.boardMain .rightArea {
	float: right;
	width: 50%;
}

.boardMain .rightArea .board {
	margin: 0 0 65px 23px;
}

.boardMain .board h3 {
	margin: 0 0 13px;
	height: 28px;
	font-size: 16px;
	color: #2e2e2e;
	border-bottom: 2px solid #626672;
}

.boardMain .board .more {
	position: absolute;
	top: 0;
	right: 0;
	padding: 2px;
}

.boardMain .board .ec-base-table.typeList td {
	color: #a4a4a4;
}

.boardMain .board .ec-base-table.typeList td.title a, .boardMain .board .ec-base-table.typeList td.title a:hover
	{
	color: #4f4f4f;
}

.boardMain .board .galleryList {
	overflow: hidden;
}

.boardMain .board .galleryList ul {
	overflow: hidden;
	margin: 0 -10px;
}

.boardMain .board .galleryList li {
	float: left;
	position: relative;
	width: 20%;
	padding: 0 0 12px 0;
	word-break: break-all;
}

.boardMain .board .galleryList li span {
	display: block;
	margin: 0 10px;
	font-size: 11px;
	color: #a4a4a4;
}

.boardMain .board .galleryList li .imgLink, .boardMain .board .galleryList li .imgLink:hover
	{
	display: block;
	margin: 0 10px 5px;
	font-size: 12px;
}

.boardMain .board .galleryList li .imgLink img {
	width: 100%;
	max-height: 110px;
	border: 1px solid #ededed;
}

#modalBackpanel {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 10000;
	width: 100%;
	height: 100%;
	background: #000;
}

#modalContainer {
	display: none;
	position: absolute;
	top: 100px;
	left: 100px;
	z-index: 10001;
	width: 975px;
	height: 720px;
	border: 1px solid #333;
	background: #fff;
}

#modalContainer #modalContent {
	width: 100%;
	height: 100%;
}

.ec-base-product {
	position: relative;
	width: 1260px;
	margin: 0 auto 80px;
	padding: 0 10px;
	overflow: hidden;
}

@media all and (max-width:1265px) {
	.ec-base-product {
		width: 980px;
	}
}

.ec-base-product h2 {
	display: block;
	margin: 0 auto 40px;
	text-align: center;
	font-size: 20px;
	color: #111;
}

.ec-base-product h2 span {
	display: block;
	margin: 0 0 3px;
	text-align: center;
	font-size: 13px;
	font-weight: 400;
	color: #888;
}

.ec-base-product h2 strong {
	color: #dd2537;
}

.ec-base-product a[href^='/product/detail.html']>img {
	border: 0;
	outline: 1px solid #e5e5e5;
}

.ec-base-product .prdList {
	display: table;
	position: relative;
	left: -10px;
	width: 120%;
	padding: 0 0 0 10px;
	min-width: 756px;
	font-size: 0;
	line-height: 0;
	overflow: hidden;
}

.ec-base-product .prdList>li {
	position: relative;
	display: inline-block;
	*display: inline;
	*zoom: 1;
	color: #333;
	vertical-align: top;
	font-size: 12px;
	line-height: 17px;
}

.ec-base-product ul.grid2>li {
	width: 610px;
	margin: 5px 40px 60px 0;
}

.ec-base-product ul.grid3>li {
	width: 400px;
	margin: 5px 30px 50px 0;
}

.ec-base-product ul.grid4>li {
	width: 300px;
	margin: 5px 20px 40px 0;
}

.ec-base-product ul.grid5>li {
	width: 235px;
	margin: 5px 21.5px 40px 0;
}

.ec-base-product ul.grid6>li {
	width: 190px;
	margin: 5px 24px 40px 0;
}

@media all and (max-width:1265px) {
	.ec-base-product ul.grid2>li {
		width: 470px;
		margin: 5px 40px 60px 0;
	}
	.ec-base-product ul.grid3>li {
		width: 310px;
		margin: 5px 25px 50px 0;
	}
	.ec-base-product ul.grid4>li {
		width: 230px;
		margin: 5px 20px 40px 0;
	}
	.ec-base-product ul.grid5>li {
		width: 180px;
		margin: 5px 20px 40px 0;
	}
	.ec-base-product ul.grid6>li {
		width: 180px;
		margin: 5px 20px 40px 0;
	}
}

.ec-base-product .prdList .chk {
	display: none;
	position: absolute;
	z-index: 10;
	left: 0;
	top: -25px;
	margin: 0;
}

.ec-base-product .prdList .chk input[type="checkbox"] {
	width: 20px;
	height: 20px;
}

.ec-base-product .prdList .thumbnail {
	position: relative;
	width: 100%;
	height: 100%;
	margin: 0 0 10px;
	font-size: 0;
	line-height: 0;
}

.ec-base-product .prdList .thumbnail a img {
	width: 100%;
	max-width: 100%;
	box-sizing: border-box;
}

.thumbnail .list_button {
	position: absolute;
	z-index: 10;
	bottom: 0;
	left: 4px;
	*zoom: 1;
	visibility: hidden;
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
}

.prdList li:hover .list_button {
	bottom: 4px;
	visibility: visible;
	filter: alpha(opacity = 100);
	opacity: 1.0;
	-webkit-opacity: 1.0;
}

.thumbnail .list_button span {
	position: relative;
	width: 25px;
	margin: 2px 0 0;
	cursor: pointer;
	text-align: center;
	font-size: 11px;
}

.thumbnail .list_button img {
	width: 100%;
	outline: none !important;
}

.thumbnail .list_button span:hover {
	background: rgba(255, 255, 255, .80);
	background: #f4f4f4 \9;
}

.thumbnail .list_button span:hover:after {
	position: absolute;
	top: 0px;
	left: 25px;
	width: 60px;
	height: 25px;
	line-height: 25px;
	background: rgba(0, 0, 0, .3);
	background: #aaa \9;
	color: #fff;
}

.thumbnail .list_button .zoom:hover:after {
	content: "새창보기";
}

.thumbnail .list_button .basket:hover:after {
	content: "장바구니";
}

.thumbnail .list_button .option:hover:after {
	content: "옵션보기";
}

.thumbnail .list_button .wishIcon:hover:after {
	content: "관심상품";
}

.ec-base-product .prdList .thumbnail .prdIcon {
	position: absolute;
	z-index: 5;
	top: 0;
	left: -9px;
	width: 80px;
	height: 50px;
	background-repeat: no-repeat;
}

.ec-base-product .prdList .description {
	display: block;
	font-size: 12px;
	line-height: 18px;
}

.ec-base-product .prdList .description .name {
	display: block;
	margin: 0 0 10px 5px;
	word-break: break-all;
	line-height: 20px;
	font-weight: bold;
}

.ec-base-product .prdList .description .name a:hover {
	text-decoration: none;
}

.ec-base-product .prdList .description .line {
	display: block;
	height: 0px;
	line-height: 0;
	margin: 0 0 10px;
	border-top: 1px solid #e5e5e5;
}

.ec-base-product .prdList .description .status {
	position: relative;
	display: block;
	margin: 0 0 0 5px;
	line-height: 0;
	*zoom: 1;
}

.ec-base-product .prdList .description .status:after {
	content: "";
	display: block;
	clear: both;
}

.ec-base-product .prdList .description .colorChip {
	margin: 0 0 0 5px;
}

.ec-base-product .prdList .description .chips {
	float: none !important;
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 14px !important;
	height: 7px !important;
	margin: 5px 2px 8px !important;
	padding: 0;
	border: 0 !important;
	border-radius: 7px;
	font-size: 0;
	line-height: 0;
	letter-spacing: 0;
}

.ec-base-product .prdList .description .chips:first-child {
	margin: 5px -1px 8px !important;
}

.ec-base-product .prdList .description .icon {
	margin: 10px 0 0 0;
	vertical-align: middle;
}

.ec-base-product .prdList .description .icon:after {
	content: "";
	display: block;
	clear: both;
}

.ec-base-product .prdList .description .icon img {
	margin: 0 7px 0 0;
}

.ec-base-product .prdList .description .mileage {
	display: block;
}

.ec-base-product .prdList .description span.grid {
	display: block;
}

.ec-base-product .spec {
	position: relative;
}

.ec-base-product .spec li {
	margin: 0 0 5px 5px;
	line-height: 17px;
}

.ec-base-product .spec li .title {
	font-weight: normal;
	vertical-align: top;
}

.ec-base-product .spec li .title span {
	vertical-align: top;
}

.ec-base-product .discountPeriod {
	display: inline-block;
	z-index: 10;
	position: relative;
	width: 55px;
	height: 19px;
	vertical-align: middle;
}

.ec-base-product .layerDiscountPeriod {
	left: 50%;
	top: 26px;
	width: 247px;
	margin: 0 0 0 -124px;
}

.ec-base-product .layerDiscountPeriod strong.title {
	display: block;
	margin: 0 0 12px;
	padding: 0 35px 0 0;
	font-weight: bold;
	color: #2e2e2e;
}

.ec-base-product .layerDiscountPeriod .content p {
	margin: 2px 0 0;
	font-size: 11px;
	color: #000;
	line-height: 16px;
	color: #757575;
	letter-spacing: -1px;
}

.ec-base-product .layerDiscountPeriod .content p strong {
	font-weight: normal;
	font-size: 12px;
	color: #2e2e2e;
}

.ec-base-product .layerDiscountPeriod .content p strong span {
	font-size: 11px;
}

.ec-base-product .prdList .shippingFee {
	position: relative;
	display: inline-block;
}

.ec-base-product .prdList .shippingFee .button {
	display: inline-block;
	float: none;
}

.ec-base-product .prdList .shippingFee .ec-base-tooltip {
	z-index: 11;
	display: block;
	margin: 0 0 0 -170px;
	width: 360px;
}

.ec-base-product .prdList .shippingFee .ec-base-tooltip table th {
	width: 40px;
}

.ec-base-product .prdList .shippingFee .ec-base-tooltip table th,
	.ec-base-product .prdList .shippingFee .ec-base-tooltip table td {
	padding: 7px 10px 8px 10px;
}

.ec-base-product .btnTooltip {
	position: relative;
	display: inline-block;
}

.differentialShipping {
	display: none;
	overflow: hidden;
	position: absolute;
	left: 50%;
	top: 17px;
	z-index: 100;
	width: 350px;
	margin: 0 0 0 -176px;
}

.differentialShipping h3.title {
	margin: 0;
	height: 35px;
	padding: 0 35px 0 19px;
	border: 0;
	color: #fff;
	font-size: 14px;
	line-height: 35px;
	background: #495164;
}

.differentialShipping .content {
	padding: 12px 18px 14px 18px;
	border: 1px solid #757575;
	border-top: 0;
	text-align: center;
	background: #fff;
}

.differentialShipping .close {
	position: absolute;
	right: 14px;
	top: 12px;
}

.differentialShipping .close img {
	cursor: pointer;
}

.differentialShipping .content ul {
	color: #757575;
	line-height: 25px;
}

.differentialShipping .content li {
	overflow: hidden;
}

.differentialShipping .content li strong {
	float: left;
	font-weight: normal;
}

.differentialShipping .content li span {
	float: right;
	color: #2e2e2e;
}

.differentialShipping .content .info {
	margin: 7px 0 0;
	padding: 7px 0 0;
	border-top: 1px dotted #b0b1b3;
	color: #80aeef;
	text-align: right;
}

.ec-product-bgLT {
	background-position: left top;
}

.ec-product-bgLC {
	background-position: left center;
}

.ec-product-bgLB {
	background-position: left bottom;
}

.ec-product-bgRT {
	background-position: right top;
}

.ec-product-bgRC {
	background-position: right center;
}

.ec-product-bgRB {
	background-position: right bottom;
}

.ec-product-bgCT {
	background-position: center top;
}

.ec-product-bgCC {
	background-position: center center;
}

.ec-product-bgCB {
	background-position: center bottom;
}

.prdList .d_thumb {
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
}

.prdList .d_thumb .img {
	position: relative;
	height: 100%;
	overflow: hidden;
}

.prdList .d_thumb .img li {
	position: absolute;
	width: 100%;
	height: 100%;
	left: 100%;
}

.prdList .d_thumb .img li:first-child {
	left: 0;
}

.prdList .d_thumb .btn {
	position: absolute;
	bottom: 5px;
	width: 100%;
	text-align: center;
	font-size: 0;
	opacity: 0;
	-webkit-opacity: 0;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

.prdList .d_thumb.on .btn {
	bottom: 10px;
	opacity: 1.0;
	-webkit-opacity: 1.0;
}

.prdList .d_thumb .btn li {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 8px;
	height: 8px;
	margin: 0 3px;
	border-radius: 10px;
	background: #aaa;
	cursor: pointer;
	text-indent: -9999px;
}

.prdList .d_thumb .btn li.on {
	background: #111;
}

.prdList .d_thumb .arrow {
	display: none;
	position: absolute;
	top: 50%;
	margin-top: -10px;
	cursor: pointer;
	font-size: 12px;
	opacity: 0;
	transition: opacity .3s ease;
}

.prdList .d_thumb.on .arrow {
	opacity: 1;
}

.prdList .d_thumb .prev {
	left: 5px;
}

.prdList .d_thumb .next {
	right: 5px;
}

.prdList .d_thumb.on .prev {
	left: 2px;
}

.prdList .d_thumb.on .next {
	right: 2px;
}

.xans-product-listrecommend .ranking {
	display: table;
	width: 105%;
	margin-bottom: 10px;
	font-size: 0;
	line-height: 0;
}

.xans-product-listrecommend .ranking li {
	position: relative;
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 252px;
}

.xans-product-listrecommend .ranking li p {
	width: 55px;
	height: 55px;
	margin: 0 auto;
	border-radius: 100%;
	-webkit-border-radius: 100%;
	-ms-border-radius: 100%;
	background: #111;
	font-family: 'arial';
	font-size: 18px;
	font-weight: bold;
	line-height: 20px;
	color: #fff;
	text-align: center;
}

.xans-product-listrecommend .ranking li span {
	display: block;
	padding-top: 7px;
	font-size: 12px;
	line-height: 17px;
	font-weight: normal;
	color: #bbb;
}

@media all and (max-width:1265px) {
	.xans-product-listrecommend .ranking li {
		width: 196px;
	}
}

.ec-base-product.normal, .ec-base-product.special {
	width: 100% !important;
	margin: 0 0 0 -10px;
}

.ec-base-paginate img {
	display: none !important;
}

.ec-base-paginate>a {
	display: inline-block !important;
	width: 34px !important;
	height: 34px;
	background-position: 50% 50%;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

.ec-base-paginate>a:hover {
	filter: alpha(opacity = 30);
	opacity: .3;
	-webkit-opacity: .3;
}

.ec-base-paginate>a:first-child {
	background: url('/_wg/img/btn_page_first.gif') no-repeat;
}

.ec-base-paginate>a:nth-child(100n+2) {
	background: url('/_wg/img/btn_page_prev.gif') no-repeat;
}

.ec-base-paginate>a:nth-child(100n+4) {
	background: url('/_wg/img/btn_page_next.gif') no-repeat;
}

.ec-base-paginate>a:last-child {
	background: url('/_wg/img/btn_page_last.gif') no-repeat;
}

.ec-base-paginate li {
	margin: 0;
	border: 0 !important;
	line-height: 0;
	vertical-align: top;
}

.ec-base-paginate li a:hover {
	background: #fff !important;
}

.ec-base-paginate li a.this {
	padding-bottom: 12px !important;
	border-bottom: 2px solid #333 !important;
	color: #333 !important;
}

.ec-base-paginate.typeSub ol {
	display: inline-block;
	font-size: 0;
	line-height: 0;
	margin: 0 !important;
	vertical-align: top !important;
	*display: inline;
	*zoom: 1;
	*margin: 0;
}

.ec-base-paginate.typeSub li {
	margin: 0;
	border: 0;
	line-height: 0;
	vertical-align: top;
}

.ec-base-paginate.typeSub img {
	vertical-align: top !important;
}

.ec-base-paginate.typeSub li a {
	display: inline-block !important;
	width: 34px !important;
	height: 34px;
	line-height: 34px;
	padding: 0 !important;
	background-position: 50% 50%;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
	color: inherit !important;
}

.ec-base-paginate.typeSub li a.this {
	padding-bottom: 5px !important;
	border-bottom: 2px solid #333 !important;
	color: #333 !important;
	text-decoration: none;
}

.ec-base-paginate.typeSub .first {
	margin-right: 0 !important;
}

.ec-base-paginate.typeSub .last {
	margin-left: 0 !important;
}

.ec-base-table table {
	position: relative;
	margin: 10px 0 0;
	border: 1px solid #d7d5d5;
	border-right: 0;
	border-left: 0;
	border-top-color: #fff;
	color: #fff;
	line-height: 1.5;
}

.ec-base-table.gLayoutFixed table {
	table-layout: fixed;
}

.ec-base-table.gLayoutFixed .gLayoutAuto table {
	table-layout: auto;
}

.ec-base-table table:before {
	position: absolute;
	top: 1px;
	left: 0;
	display: block;
	content: "";
	width: 100%;
	height: 1px;
	background: #d7d5d5;
}

.ec-base-table thead th {
	padding: 11px 0 10px;
	border-left: 1px solid #dfdfdf;
	border-bottom: 1px solid #dfdfdf;
	color: #353535;
	vertical-align: middle;
	font-weight: normal;
	background: #fbfafa;
}

.ec-base-table tbody th {
	padding: 11px 0 10px 18px;
	border: 1px solid #dfdfdf;
	border-right: 0;
	border-bottom-width: 0;
	color: #353535;
	text-align: left;
	font-weight: normal;
	background-color: #fbfafa;
}

.ec-base-table th:first-child {
	border-left: 0;
}

.ec-base-table td {
	padding: 11px 10px 10px;
	border-top: 1px solid #dfdfdf;
	color: #353535;
	vertical-align: middle;
}

.ec-base-table td.clear {
	padding: 0 !important;
	border: 0 !important;
}

.ec-base-table.typeWrite td {
	padding: 10px 10px 9px;
}

.ec-base-table.typeList table {
	border-top-color: #d7d5d5;
}

.ec-base-table.typeList table:before {
	display: none;
}

.ec-base-table.typeList tr:hover {
	background: #fbfbfb;
}

.ec-base-table.typeList th {
	border-left: none;
}

.ec-base-table.typeList td {
	padding: 8px 10px 7px;
}

.ec-base-table.typeList tfoot td {
	padding: 15px 10px 17px;
	background: #fbfafa;
}

.ec-base-table .message {
	border: 1px solid #ddd;
	border-right: 0;
	border-left: 0;
	padding: 50px 0;
	text-align: center;
	color: #555;
	font-weight: bold;
}

.ec-base-table table+.message {
	margin: -1px 0 0;
}

.ec-base-table table td.message {
	padding: 50px 0;
}

.ec-base-table .scroll .message {
	border: 0;
}

.ec-base-table.typeList .head td {
	padding: 11px 0 10px;
	border-left: 1px solid #dfdfdf;
	border-bottom: 1px solid #dfdfdf;
	color: #353535;
	vertical-align: middle;
	text-align: center;
	background: #fbfafa;
}

.ec-base-table.typeList .head td:first-child {
	border-left: 0;
}

.ec-base-table.typeList .scroll {
	position: relative;
	overflow-x: hidden;
	overflow-y: scroll;
	max-height: 185px;
	min-height: 100px;
	border: 1px solid #d7d5d5;
	border-top-width: 0;
	margin-top: -1px;
}

.ec-base-table.typeList .scroll table {
	border: 0;
	margin: 0;
}

.ec-base-table.typeList .scroll table:before {
	display: none;
}

.ec-base-table.typeList .scroll .message {
	border: 0;
}

.ec-base-table thead.blind, .ec-base-table thead.blind th {
	display: none;
}

.ec-base-table thead.blind+tbody tr:first-child th, .ec-base-table thead.blind+tbody tr:first-child td
	{
	border-top-width: 0;
}

.ec-base-table.typeList.gLine table {
	border-width: 0;
	border-bottom-width: 1px;
}

.ec-base-table.typeClear table:before {
	display: none;
}

.ec-base-table.typeClear table, .ec-base-table.typeClear th,
	.ec-base-table.typeClear td {
	border: 0 none;
	background: none;
}

.ec-base-table.typeClear th {
	font-weight: bold;
}

.ec-base-table.gBorder td {
	border-left: none;
}

.ec-base-table.gBorder td:first-child {
	border-left: 0;
}

.ec-base-table .left {
	text-align: left;
}

.ec-base-table .center {
	text-align: center;
}

.ec-base-table .right {
	text-align: right;
}

.ec-base-table.typeList .center td, .ec-base-table.typeList td.center {
	padding-left: 0;
	padding-right: 0;
}

.ec-base-table.typeList .center td.left {
	padding-left: 10px;
}

.ec-base-table.typeList .center td.right {
	padding-right: 10px;
}

.ec-base-table .top th, .ec-base-table th.top, .ec-base-table .top td,
	.ec-base-table td.top {
	vertical-align: top;
}

.ec-base-table .middle th, .ec-base-table th.middle, .ec-base-table .middle td,
	.ec-base-table td.middle {
	vertical-align: middle;
}

.ec-base-table img {
	margin: 0 4px 0 0;
	vertical-align: middle;
}

@media print {
	.ec-base-table table:before {
		display: none;
	}
}

.ec-base-table .subject .product_name {
	margin: 0 0 3px;
	font-size: 11px;
	color: #bbb;
}

.xans-board-listpackage .ec-base-table .thumb img {
	width: 50px !important;
}

.xans-board-read .ec-base-table .detail, .xans-board-commentlist .boardComment li .comment
	{
	line-height: 20px;
}

.xans-board-read .ec-base-table .detail img:first-child {
	
}

.xans-board-read .ec-base-table .detail img {
	margin: 0 0 1px;
}

ul.xans-board-listheader-8 {
	text-align: right;
	margin: 0 0 10px;
}

ul.xans-board-listheader-8 li {
	display: inline;
}

.xans-board-listpackage-8 {
	margin: 0 0 20px;
}

.xans-board-listpackage-8 .gallery_list {
	clear: both;
	overflow: hidden;
}

.xans-board-listpackage-8 .gallery_list ul {
	display: block;
	min-width: 756px;
	margin: -20px 0 0;
	font-size: 0;
	line-height: 0;
	letter-spacing: -5px;
}

.xans-board-listpackage-8 .gallery_list li {
	position: relative;
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 25%;
	margin: 20px 0;
	padding: 10px 0 0;
	font-size: 12px;
	color: #333;
	line-height: 18px;
	vertical-align: top;
	letter-spacing: 0;
}

.xans-board-listpackage-8 .gallery_list li .boardChk {
	position: absolute;
	z-index: 1;
	top: 22px;
	left: 23px;
	width: 22px;
	height: 22px;
	display: block;
}

.xans-board-listpackage-8 .gallery_list li .imgLink {
	position: relative;
	display: block;
	width: 92%;
	max-height: 400px;
	margin: 0 auto 10px;
	outline: 1px solid #ddd;
	overflow: hidden;
	transition: outline .3s ease;
	-webkit-transition: outline .3s ease;
}

.xans-board-listpackage-8 .gallery_list li:hover .imgLink {
	outline: 1px solid #333;
}

.xans-board-listpackage-8 .gallery_list li .imgLink img {
	width: 100%;
}

.xans-board-listpackage-8 .gallery_list li .description {
	width: 90%;
	margin: 0 auto;
	color: #999;
	font-size: 11px;
}

.xans-board-listpackage-8 .gallery_list li .description a {
	color: #333;
	font-size: 12px;
}

.xans-board-listpackage-8 .gallery_list li strong {
	font-weight: normal;
}

.xans-board-listpackage-8 .gallery_list li em {
	display: block;
	font-style: normal;
}

.xans-board-listpackage-8 .xans-board-buttonlist-8 {
	padding: 15px 20px 15px 0;
	text-align: right;
}

.boardListEmpty {
	padding: 0 0 20px;
	text-align: center;
}

#content_IFRAME {
	min-height: 700px !important;
}

.xans-board-product.ec-base-box.typeProduct {
	margin: 0 0 20px;
}

.xans-board-product.ec-base-box.typeProduct .thumbnail {
	width: 150px;
}

.xans-board-product .thumbnail img {
	width: 150px !important;
	max-width: 150px !important;
}

.xans-board-product .information img {
	margin: 0 5px 0 0 !important;
}

.xans-board-product .information h3 {
	margin: 17px 0 5px;
	font-size: 15px;
	color: #555;
	font-weight: normal;
}

.xans-board-product .information .price {
	font-size: 14px;
	font-weight: bold;
	color: #111 !important;
}

.xans-board-product .information .button {
	margin: 19px 0 0 0;
	padding: 13px 0 0 0;
	border-top: 1px solid #e8e8e8;
}

.ec-base-button.typeBorder {
	margin-top: -1px;
	padding: 10px 20px;
	border: 1px solid #e8e8e8 !important;
}

.ec-base-button.typeBG {
	padding: 10px 20px;
	border: 1px solid #e8e8e8 !important;
	background: #f4f4f4 !important;
}

#myshopMain {
	margin: 30px 0 0;
	border-top: 1px solid #333;
	border-bottom: 1px solid #333;
}

#myshopMain .shopMain, #myshopMain .shopMain.order, #myshopMain .shopMain.profile,
	#myshopMain .shopMain.wishlist, #myshopMain .shopMain.mileage,
	#myshopMain .shopMain.deposits, #myshopMain .shopMain.consult,
	#myshopMain .shopMain.coupon, #myshopMain .shopMain.board, #myshopMain .shopMain.address,
	#myshopMain .shopMain.inquiry, #myshopMain .shopMain.likeIt {
	background: url('/_wg/img/arrowR_35.gif') no-repeat 98% 50% !important;
}

.xans-product-optionpreview {
	display: inline;
}

.xans-product-optionpreview .prdOption {
	position: absolute;
	left: 50% !important;
	top: 35px !important;
	z-index: 20;
	width: 240px !important;
	margin: 0 0 0 -14px !important;
}

.xans-product-optionpreview .prdOption::before {
	content: "옵션 미리보기";
	position: absolute;
	z-index: 30;
	top: 20px;
	left: 20px;
	font-size: 13px;
	font-weight: bold;
}

.xans-product-optionpreview .prdOption .inner {
	display: block;
	padding: 40px 15px 15px !important;
	border: 1px solid #333 !important;
	color: #333 !important;
	background: #fff;
}

.xans-product-optionpreview .prdOption ul {
	display: block;
	max-height: 190px;
	overflow-x: none;
	overflow: auto;
}

.xans-product-optionpreview .prdOption li {
	display: block;
	padding: 10px 0 3px 3px !important;
	border-top: 1px solid #eee !important;
	text-align: left !important;
	line-height: 17px !important;
	font-size: 11px !important;
	letter-spacing: -0.05em;
}

.xans-product-optionpreview .prdOption li:first-child {
	border: 0;
}

.xans-product-optionpreview .prdOption .close {
	position: absolute;
	right: 14px;
	top: 14px;
}

.xans-product-optionpreview .prdOption .ico {
	position: absolute;
	left: 50%;
	top: -5px;
	width: 9px;
	height: 7px;
	margin: 0 0 0 -110px !important;
}

.xans-product-optionpreview .prdOption img {
	width: 100% !important;
}

.couponZone {
	position: relative;
	z-index: 2;
	width: 100%;
	margin: 20px 0 50px;
}

.couponZone:after {
	content: "";
	display: block;
	clear: both;
	*zoom: 1;
}

.couponZone #btn_all_coupondown {
	position: absolute;
	top: -55px;
	right: 3px;
}

.couponZone .couponSkinArea ul {
	zoom: 1;
	margin: 0 auto;
	text-align: center;
}

.couponZone .couponSkinArea ul:after {
	content: "";
	display: block;
	clear: both;
}

.couponZone .couponSkinArea ul li {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 280px;
	padding: 0;
	list-style: none;
}

.couponZone .couponSkinArea ul.grid {
	width: 100%;
}

.couponZone .couponSkinArea ul.grid li {
	margin: 0 5px;
}

.couponZone .couponSkinArea .coupon {
	position: relative;
	width: 220px;
	height: 150px;
	font-size: 12px;
	line-height: 1.5;
	text-align: center;
	background-repeat: no-repeat;
	cursor: pointer;
}

.couponZone .couponSkinArea .coupon img {
	border: 0;
}

.couponZone .couponSkinArea .coupon .detail {
	display: block;
	padding: 10px 0 0 0px;
	color: #333;
}

.couponZone .couponSkinArea .coupon .discount {
	display: block;
	font-size: 24px !important;
	font-weight: 400 !important;
	text-decoration: none;
	letter-spacing: -0.03em !important;
	color: #333 !important;
	font-family: 'Nanum Gothic' !important;
}

.couponZone .couponSkinArea .coupon .title {
	display: block;
	margin: 0 0 5px;
	font-size: 14px !important;
	font-weight: 700 !important;
	font-family: 'Nanum Gothic' !important;
}

.couponZone .couponSkinArea .coupon .period {
	display: block;
	font-size: 12px;
	font-weight: 400;
	color: #555 !important;
	font-family: 'Nanum Gothic' !important;
}

.couponZone .couponSkinArea .coupon .button {
	position: absolute;
	bottom: 0 !important;
	left: 50% !important;
	width: 140px !important;
	margin: 0 0 0 -69px !important;
}

.couponZone .couponSkinArea .imgCoupon .title, .couponZone .couponSkinArea .imgCoupon .discount,
	.couponZone .couponSkinArea .imgCoupon .period, .couponZone .couponSkinArea .imgCoupon .button
	{
	display: none;
}

#dCouponDetail {
	overflow: hidden;
	position: relative;
	z-index: 100;
	width: 398px;
	border: 1px solid #757575;
	background: #fff;
	box-shadow: 5px 5px 5px #d3d3d3;
}

#dCouponDetail h3 {
	height: 35px;
	padding: 0 35px 0 19px;
	color: #fff;
	font-size: 14px;
	line-height: 35px;
	background: #333;
}

#dCouponDetail h3+a {
	position: absolute;
	right: 20px;
	top: 10px;
}

#dCouponDetail ul {
	padding: 16px 10px 17px 20px;
	margin: 25px 19px;
	background: #f5f5f5;
}

#dCouponDetail ul li {
	margin: 7px 0 0;
	color: #2e2e2e;
	line-height: 18px;
}

#dCouponDetail ul li:first-child {
	margin-top: 0;
}

#dCouponDetail ul+a {
	display: block;
	padding: 12px 0;
	text-align: center;
	border-top: 1px solid #d7d5d5;
	background: #fbfafa;
}

body#main {
	background: #fff;
}

.-frame {
	position: relative;
	width: 1260px;
	margin: 0 auto;
	*zoom: 1;
}

.-frame:after {
	content: "";
	display: block;
	clear: both;
	*zoom: 1;
}

@media all and (max-width:1265px) {
	.-frame {
		width: 980px;
	}
}

.displaynone {
	display: none;
}

.divClear {
	position: relative;
	display: block;
	clear: both;
}

.divClear:after {
	content: "";
	display: block;
	clear: both;
	*zoom: 1;
}

.-mov {
	-khtml-transition: all 0.3s ease;
	-moz-transition: all 0.3s ease;
	-ms-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.3s ease;
}

.-mov:hover {
	-khtml-transition: all 0.3s ease;
	-moz-transition: all 0.3s ease;
	-ms-transition: all 0.3s ease;
	-o-transition: all 0.3s ease;
	transition: all 0.3s ease;
}

.-spring_x {
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
	animation-name: spring_x;
	animation-duration: 3.5s;
	animation-iteration-count: infinite;
	animation-timing-function: ease-in-out;
	animation-direction: normal;
	-webkit-animation-name: spring_x;
	-webkit-animation-duration: 3.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: ease-in-out;
	-webkit-animation-direction: normal;
}

@
keyframes spring_x { 0%{
	transform: translate(0px, 0px)
}

80
%
{
transform
:
translate(
0px
,
0px
)
}
85
%
{
transform
:
translate(
4px
,
0px
)
}
90
%
{
transform
:
translate(
0px
,
0px
)
}
95
%
{
transform
:
translate(
4px
,
0px
)
}
100
%
{
transform
:
translate(
0px
,
0px
)
}
}
@
-webkit-keyframes spring_x { 0%{
	transform: translate(0px, 0px)
}

80
%
{
transform
:
translate(
0px
,
0px
)
}
85
%
{
transform
:
translate(
0px
,
4px
)
}
90
%
{
transform
:
translate(
0px
,
0px
)
}
95
%
{
transform
:
translate(
0px
,
4px
)
}
100
%
{
transform
:
translate(
0px
,
0px
)
}
}
.-spring_y {
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
	animation-name: spring_y;
	animation-duration: 3.5s;
	animation-iteration-count: infinite;
	animation-timing-function: ease-in-out;
	animation-direction: normal;
	-webkit-animation-name: spring_y;
	-webkit-animation-duration: 3.5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: ease-in-out;
	-webkit-animation-direction: normal;
}

@
keyframes spring_y { 0%{
	transform: translate(0px, 0px)
}

80
%
{
transform
:
translate(
0px
,
0px
)
}
85
%
{
transform
:
translate(
0px
,
4px
)
}
90
%
{
transform
:
translate(
0px
,
0px
)
}
95
%
{
transform
:
translate(
0px
,
4px
)
}
100
%
{
transform
:
translate(
0px
,
0px
)
}
}
@
-webkit-keyframes spring_y { 0%{
	transform: translate(0px, 0px)
}

80
%
{
transform
:
translate(
0px
,
0px
)
}
85
%
{
transform
:
translate(
0px
,
4px
)
}
90
%
{
transform
:
translate(
0px
,
0px
)
}
95
%
{
transform
:
translate(
0px
,
4px
)
}
100
%
{
transform
:
translate(
0px
,
0px
)
}
}
.d_clear {
	clear: both;
}

body i {
	position: relative;
	top: 1px;
}

.discount_rate {
	position: absolute;
	z-index: 5;
	text-align: center;
	vertical-align: middle;
	font-family: 'arial';
	color: #fff;
	font-weight: bold;
	letter-spacing: -0.02em;
	cursor: pointer;
}

.discount_rate.ico01 {
	top: -7px;
	right: -3px;
	width: 40px;
	height: 40px;
	line-height: 40px;
	background: rgba(20, 20, 20, .9);
	background: #333 \9;
	box-shadow: -1px 1px 2px rgba(0, 0, 0, 0.2);
	font-size: 14px;
	filter: alpha(opacity = 0);
	opacity: .0;
	-webkit-opacity: .0;
}

.discount_rate.ico01 span {
	margin-left: 0px;
	font-size: 11px;
	font-weight: normal;
}

.item:hover .discount_rate.ico01 {
	top: -3px;
	filter: alpha(opacity = 100);
	opacity: 1.0;
	-webkit-opacity: 1.0;
}

.discount_rate.ico02 {
	top: -4px;
	left: -4px;
	width: 60px;
	height: 60px;
	line-height: 60px;
	background: rgba(0, 0, 0, .8);
	background: #333;
	font-size: 20px;
	color: #fff;
	cursor: pointer;
}

.discount_rate.ico02 span {
	font-size: 12px;
}

.discount_rate.ico03 {
	top: 10px;
	right: 10px;
	width: 50px;
	height: 50px;
	line-height: 50px;
	border-radius: 100%;
	-webkit-border-radius: 100%;
	background: rgba(239, 45, 45, .9);
	background: #f12c2c;
	font-size: 18px;
	color: #fff;
	cursor: pointer;
}

.discount_rate.ico03 span {
	font-size: 12px;
}

.discount_rate.ico04 {
	top: 0px;
	right: 2px;
	width: 60px;
	line-height: 30px;
	font-size: 30px;
	color: #ef2d2d;
	cursor: pointer;
}

.discount_rate.ico04 span {
	margin-left: 2px;
	font-size: 18px;
}

.discount_rate_detail_wrap {
	position: relative;
	height: 0;
}

.discount_rate.detail {
	top: -11px;
	right: 20px;
	width: 60px;
	height: 60px;
	line-height: 50px;
	background: url('/_wg/img/detail_sale_ico.png') no-repeat;
	font-size: 16px;
	text-indent: -10px;
}

.discount_rate.detail span {
	margin-left: 4px;
	font-size: 11px;
	font-weight: 400;
}

.rate0 {
	display: none !important;
}

.-chk input[type="checkbox"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.-chk input[type="checkbox"]+label {
	position: relative;
	display: inline-block;
	cursor: pointer;
	-webkit-user-select: none;
}

.-chk input[type="checkbox"]+label:before {
	content: '';
	display: inline-block;
	width: 25px;
	height: 25px;
	line-height: 25px;
	text-align: center;
	vertical-align: middle;
	background: #fff;
	border: 1px solid #555;
}

.-chk input[type="checkbox"]+label:active:before, .-chk input[type="checkbox"]:checked+label:active:before
	{
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
		rgba(0, 0, 0, 0.1);
}

.-chk input[type="checkbox"]:checked+label:before {
	content: '\2714';
	color: #111;
	background: #f4f4f4;
	border: 1px solid #555;
}

.-chk label:after {
	content: '오늘하루 열지않음';
	position: absolute;
	left: -116px;
	top: 0;
	width: 105px;
	height: 25px;
	padding: 0 0 0 10px;
	visibility: hidden;
	background: #ddd;
	border: 1px solid #ccc;
	border-right: 0;
	font-size: 12px;
	color: #111;
	line-height: 25px;
}

.-chk input[type="checkbox"]:checked+label:after {
	visibility: visible;
}

.-chk input[type="checkbox"]:hover+label:after {
	visibility: visible;
}

.-likeButton {
	position: absolute;
	z-index: 10;
	bottom: 10px;
	right: -8px;
	max-width: 80px;
	height: 16px;
	padding: 8px 0 0;
	background: url('/_wg/img/like_shadow.gif') no-repeat right top;
	visibility: hidden;
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
}

.item:hover .-likeButton {
	bottom: 15px;
	visibility: visible;
	filter: filter:alpha(opacity = 100);
	opacity: 1.0;
	-webkit-opacity: 1.0;
}

.-likeButton:hover {
	color: #333;
}

.-likeButton button {
	padding: 2px 5px;
	background: #fff;
	border: 1px solid #f4f4f4;
	color: inherit;
	box-shadow: -1px 1px 2px rgba(0, 0, 0, 0.2);
	line-height: 16px;
}

.-likeButton button .likePrdIcon {
	width: 14px !important;
	margin: 1px 3px 0 0;
}

.-likeButton button .likePrdCount {
	font-weight: 400;
	color: inherit;
	font-size: 11px;
}

.-likeButton.selected {
	bottom: 20px !important;
	right: -8px !important;
	visibility: visible;
	filter: alpha(opacity = 100);
	opacity: 1.0;
	-webkit-opacity: 1.0;
}

.-likeButton.selected button {
	background: #333;
	border: 1px solid #222;
	color: #fff;
}

.-likeButton.selected button:before {
	content: 'LIKE';
	position: relative;
	display: inline-block;
	margin: 0 4px 0 0;
	font-size: 10px;
}

.-pTxt {
	display: block;
	position: absolute;
	z-index: 1;
	top:;
	left: 50px;
	padding: 5px 10px;
	background: #333;
	border-radius: 3px;
	font-size: 11px;
	color: #fff;
	letter-spacing: 0;
	white-space: nowrap;
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

li:hover .-pTxt {
	top:;
	filter: alpha(opacity = 100);
	opacity: 1;
	-webkit-opacity: 1;
}

.orderStep {
	display: block;
}

@media all and (max-width:1265px) {
	.orderStep img {
		width: 100%;
	}
}

.xans-board-title p.imgArea img {
	width: 100%;
}

.btn_11_444 {
	display: inline-block;
	line-height: 20px;
	padding: 0 10px;
	background: #444444;
	background-image: -webkit-linear-gradient(top, #444444, #111111);
	background-image: -moz-linear-gradient(top, #444444, #111111);
	background-image: -ms-linear-gradient(top, #444444, #111111);
	background-image: -o-linear-gradient(top, #444444, #111111);
	background-image: linear-gradient(to bottom, #444444, #111111);
	-webkit-border-radius: 4;
	-moz-border-radius: 4;
	border-radius: 4px;
	border: solid #111111 1px;
	color: #ffffff;
	font-size: 11px;
	text-decoration: none;
	text-align: center;
}

.btn_11_444:hover {
	background: #111111;
	background-image: -webkit-linear-gradient(top, #111111, #444444);
	background-image: -moz-linear-gradient(top, #111111, #444444);
	background-image: -ms-linear-gradient(top, #111111, #444444);
	background-image: -o-linear-gradient(top, #111111, #444444);
	background-image: linear-gradient(to bottom, #111111, #444444);
	text-decoration: none;
}

.btn_11_f2 {
	display: inline-block;
	line-height: 20px;
	padding: 0 10px;
	background: #f2f2f2;
	background-image: -webkit-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: -moz-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: -ms-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: -o-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: linear-gradient(to bottom, #f2f2f2, #e5e5e5);
	-webkit-border-radius: 4;
	-moz-border-radius: 4;
	border-radius: 4px;
	border: solid #ddd 1px;
	color: #333333;
	font-size: 11px;
	text-decoration: none;
	text-align: center;
}

.btn_11_f2:hover {
	background: #e5e5e5;
	background-image: -webkit-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: -moz-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: -ms-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: -o-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: linear-gradient(to bottom, #e5e5e5, #f2f2f2);
	text-decoration: none;
}

.btn_11_ff {
	display: inline-block;
	line-height: 20px;
	padding: 0 10px;
	background: #fff;
	background-image: -webkit-linear-gradient(top, #fff, #f8f8f8);
	background-image: -moz-linear-gradient(top, #fff, #f8f8f8);
	background-image: -ms-linear-gradient(top, #fff, #f8f8f8);
	background-image: -o-linear-gradient(top, #fff, #f8f8f8);
	background-image: linear-gradient(to bottom, #fff, #f8f8f8);
	-webkit-border-radius: 4;
	-moz-border-radius: 4;
	border-radius: 4px;
	border: solid #eee 1px;
	color: #333333;
	font-size: 11px;
	text-decoration: none;
	text-align: center;
}

.btn_11_ff:hover {
	background: #f8f8f8;
	background-image: -webkit-linear-gradient(top, #f8f8f8, #fff);
	background-image: -moz-linear-gradient(top, #f8f8f8, #fff);
	background-image: -ms-linear-gradient(top, #f8f8f8, #fff);
	background-image: -o-linear-gradient(top, #f8f8f8, #fff);
	background-image: linear-gradient(to bottom, #f8f8f8, #fff);
	text-decoration: none;
}

.btn_7_444 {
	display: inline-block;
	line-height: 30px;
	padding: 0 15px;
	background: #444444;
	background-image: -webkit-linear-gradient(top, #444444, #111111);
	background-image: -moz-linear-gradient(top, #444444, #111111);
	background-image: -ms-linear-gradient(top, #444444, #111111);
	background-image: -o-linear-gradient(top, #444444, #111111);
	background-image: linear-gradient(to bottom, #444444, #111111);
	-webkit-border-radius: 5;
	-moz-border-radius: 5;
	border-radius: 5px;
	border: solid #111111 1px;
	color: #ffffff;
	font-size: 11px;
	text-decoration: none;
	text-align: center;
}

.btn_7_444:hover {
	background: #111111;
	background-image: -webkit-linear-gradient(top, #111111, #444444);
	background-image: -moz-linear-gradient(top, #111111, #444444);
	background-image: -ms-linear-gradient(top, #111111, #444444);
	background-image: -o-linear-gradient(top, #111111, #444444);
	background-image: linear-gradient(to bottom, #111111, #444444);
	text-decoration: none;
}

.btn_15_444 {
	display: inline-block;
	line-height: 50px;
	padding: 0 20px;
	background: #444444;
	background-image: -webkit-linear-gradient(top, #444444, #111111);
	background-image: -moz-linear-gradient(top, #444444, #111111);
	background-image: -ms-linear-gradient(top, #444444, #111111);
	background-image: -o-linear-gradient(top, #444444, #111111);
	background-image: linear-gradient(to bottom, #444444, #111111);
	-webkit-border-radius: 5;
	-moz-border-radius: 5;
	border-radius: 5px;
	border: solid #111111 1px;
	color: #ffffff;
	font-size: 15px;
	text-decoration: none;
	text-align: center;
}

.btn_15_444:hover {
	background: #111111;
	background-image: -webkit-linear-gradient(top, #111111, #444444);
	background-image: -moz-linear-gradient(top, #111111, #444444);
	background-image: -ms-linear-gradient(top, #111111, #444444);
	background-image: -o-linear-gradient(top, #111111, #444444);
	background-image: linear-gradient(to bottom, #111111, #444444);
	text-decoration: none;
}

.btn_7_f2 {
	display: inline-block;
	line-height: 30px;
	padding: 0 15px;
	background: #f2f2f2;
	background-image: -webkit-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: -moz-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: -ms-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: -o-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: linear-gradient(to bottom, #f2f2f2, #e5e5e5);
	-webkit-border-radius: 5;
	-moz-border-radius: 5;
	border-radius: 5px;
	border: solid #ddd 1px;
	color: #333333;
	font-size: 11px;
	padding: 0 20px;
	text-decoration: none;
	text-align: center;
}

.btn_7_f2:hover {
	background: #e5e5e5;
	background-image: -webkit-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: -moz-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: -ms-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: -o-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: linear-gradient(to bottom, #e5e5e5, #f2f2f2);
	text-decoration: none;
}

.btn_15_f2 {
	display: inline-block;
	line-height: 50px;
	padding: 0 20px;
	background: #f2f2f2;
	background-image: -webkit-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: -moz-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: -ms-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: -o-linear-gradient(top, #f2f2f2, #e5e5e5);
	background-image: linear-gradient(to bottom, #f2f2f2, #e5e5e5);
	-webkit-border-radius: 5;
	-moz-border-radius: 5;
	border-radius: 5px;
	border: solid #ddd 1px;
	color: #333333;
	font-size: 15px;
	text-decoration: none;
	text-align: center;
}

.btn_15_f2:hover {
	background: #e5e5e5;
	background-image: -webkit-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: -moz-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: -ms-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: -o-linear-gradient(top, #e5e5e5, #f2f2f2);
	background-image: linear-gradient(to bottom, #e5e5e5, #f2f2f2);
	text-decoration: none;
}

.btn_40_01c73c {
	display:;
	line-height: 40px;
	padding: 0 15px;
	background: #01c73c;
	background-image: -webkit-linear-gradient(top, #01c73c, #00b235);
	background-image: -moz-linear-gradient(top, #01c73c, #00b235);
	background-image: -ms-linear-gradient(top, #01c73c, #00b235);
	background-image: -o-linear-gradient(top, #01c73c, #00b235);
	background-image: linear-gradient(to bottom, #01c73c, #00b235);
	-webkit-border-radius: 5;
	-moz-border-radius: 5;
	border-radius: 5px;
	border: solid #02a332 1px;
	color: #fff;
	font-size: 13px;
	text-decoration: none;
	text-align: center;
}

.btn_40_01c73c:hover {
	background: #00b235;
	background-image: -webkit-linear-gradient(top, #00b235, #01c73c);
	background-image: -moz-linear-gradient(top, #00b235, #01c73c);
	background-image: -ms-linear-gradient(top, #00b235, #01c73c);
	background-image: -o-linear-gradient(top, #00b235, #01c73c);
	background-image: linear-gradient(to bottom, #00b235, #01c73c);
	text-decoration: none;
}

.btn_40_ffd800 {
	display:;
	line-height: 40px;
	padding: 0 15px;
	background: #ffd800;
	background-image: -webkit-linear-gradient(top, #ffd800, #ecc906);
	background-image: -moz-linear-gradient(top, #ffd800, #ecc906);
	background-image: -ms-linear-gradient(top, #ffd800, #ecc906);
	background-image: -o-linear-gradient(top, #ffd800, #ecc906);
	background-image: linear-gradient(to bottom, #ffd800, #ecc906);
	-webkit-border-radius: 5;
	-moz-border-radius: 5;
	border-radius: 5px;
	border: solid #ddbd0c 1px;
	color: #333;
	font-size: 13px;
	text-decoration: none;
	text-align: center;
}

.btn_40_ffd800:hover {
	background: #ecc906;
	background-image: -webkit-linear-gradient(top, #ecc906, #ffd800);
	background-image: -moz-linear-gradient(top, #ecc906, #ffd800);
	background-image: -ms-linear-gradient(top, #ecc906, #ffd800);
	background-image: -o-linear-gradient(top, #ecc906, #ffd800);
	background-image: linear-gradient(to bottom, #ecc906, #ffd800);
	text-decoration: none;
}

.multiPopup {
	position: relative;
	background: #fff;
}

.multiPopup .DB_img {
	position: relative;
	overflow: hidden;
}

.multiPopup .DB_img ul {
	position: relative;
}

.multiPopup .DB_img ul li {
	position: absolute;
	width: 100%;
	height: 100%;
}

.multiPopup .arrow.DB_prev {
	left: -5px;
	background: url('/_wg/img/arrowL_35.gif') no-repeat 50% 50%
		rgba(255, 255, 255, .5);
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
}

.multiPopup .DB_img:hover .arrow.DB_prev {
	left: 0;
	filter: alpha(opacity = 100);
	opacity: 1;
	-webkit-opacity: 1;
}

.multiPopup .arrow.DB_next {
	right: -5px;
	background: url('/_wg/img/arrowR_35.gif') no-repeat 50% 50%
		rgba(255, 255, 255, .5);
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
}

.multiPopup .DB_img:hover .arrow.DB_next {
	right: 0;
	filter: alpha(opacity = 100);
	opacity: 1;
	-webkit-opacity: 1;
}

.multiPopup .arrow {
	position: absolute;
	top: 50%;
	width: 45px;
	height: 70px;
	margin-top: -35px;
	cursor: pointer;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

.multiPopup .DB_menu {
	position: relative;
}

.multiPopup .DB_menu ul li {
	float: left;
	margin: 0 -1px -1px 0;
	border: 1px solid #ddd;
	background: #eee;
	cursor: pointer;
	color: #999;
	font-size: 11px;
	line-height: 17px;
	text-align: center;
	transition: all .5s ease;
	-webkit-transition: all .5s ease;
}

.multiPopup .DB_menu ul li:hover {
	background: #fafafa;
}

.multiPopup .DB_menu ul li.DB_select {
	background: #fff;
	color: #333;
	font-weight: bold;
}

.multiPopup .DB_menu ul li p {
	position: relative;
}

.multiPopup .DB_menu .DB_box {
	position: absolute;
	top: 0;
	left: 0;
	margin: 0;
	padding: 0;
	border: 1px solid #888;
}

.popup_footer {
	position: fixed;
	bottom: 0;
	width: 100% !important;
}

.popup_footer>div {
	width: 100% !important;
	height: 30px !important;
	padding: 0 !important;
	overflow: hidden !important;
	background: #555 !important;
	font-family: 'Nanum Gothic' !important;
}

.popup_footer>div>span {
	position: relative;
	display: inline-block;
	float: left;
	padding: 0 0 0 15px;
	text-indent: 20px;
	font-size: 11px;
	color: #eee;
	line-height: 30px;
}

.popup_footer>div>span>input {
	position: absolute;
	left: 10px;
	top: 6px;
	line-height: 30px;
	width: 18px;
	height: 18px;
}

.popup_footer>div>span+span {
	display: inline-block;
	float: right;
	padding: 0 15px 0 0;
	background: #333 !important;
	font-size: 11px;
	color: #fff;
	line-height: 30px;
}

.popup_footer>div>span+span:hover {
	background: #000 !important;
	color: #fff;
}

.multiPopup.v61 {
	width: 302px;
	height: 550px;
	padding: 8px;
	border: 1px solid #ccc;
}

.multiPopup.v61 .DB_img {
	width: 299px;
	height: 380px;
	margin-bottom: 5px;
	border: 1px solid #ddd;
}

.multiPopup.v61 .DB_menu ul li {
	width: 99px;
	height: 80px;
}

.multiPopup.v61 .DB_menu ul li p {
	top: 30%;
}

.multiPopup.v61 .DB_menu .DB_box {
	width: 99px;
	height: 80px;
}

.multiPopup.v62 {
	width: 298px;
	height: 543px;
}

.multiPopup.v62 .DB_img {
	width: 298px;
	height: 380px;
}

.multiPopup.v62 .DB_menu ul li {
	width: 98px;
	height: 80px;
}

.multiPopup.v62 .DB_menu ul li p {
	top: 30%;
}

.multiPopup.v62 .DB_menu .DB_box {
	display: none;
	width: 98px;
	height: 80px;
}

.multiPopup.v31 {
	width: 302px;
	height: 469px;
	padding: 8px;
	border: 1px solid #ccc;
}

.multiPopup.v31 .DB_img {
	width: 299px;
	height: 380px;
	margin-bottom: 5px;
	border: 1px solid #ddd;
}

.multiPopup.v31 .DB_menu ul li {
	width: 99px;
	height: 80px;
}

.multiPopup.v31 .DB_menu ul li p {
	top: 30%;
}

.multiPopup.v31 .DB_menu .DB_box {
	width: 99px;
	height: 80px;
}

.multiPopup.v32 {
	width: 298px;
	height: 462px;
}

.multiPopup.v32 .DB_img {
	width: 298px;
	height: 380px;
}

.multiPopup.v32 .DB_menu ul li {
	width: 98px;
	height: 80px;
}

.multiPopup.v32 .DB_menu ul li p {
	top: 30%;
}

.multiPopup.v32 .DB_menu .DB_box {
	display: none;
	width: 98px;
	height: 80px;
}

.multiPopup.c31 {
	width: 302px;
	height: 511px;
	padding: 8px;
	border: 1px solid #ccc;
}

.multiPopup.c31 .DB_img {
	width: 299px;
	height: 380px;
	margin-bottom: 5px;
	border: 1px solid #ddd;
}

.multiPopup.c31 .DB_menu ul li {
	display: block;
	width: 299px;
	height: 40px;
}

.multiPopup.c31 .DB_menu ul li p {
	top: 30%;
}

.multiPopup.c31 .DB_menu .DB_box {
	width: 299px;
	height: 40px;
}

.multiPopup.c32 {
	width: 298px;
	height: 504px;
}

.multiPopup.c32 .DB_img {
	width: 298px;
	height: 380px;
}

.multiPopup.c32 .DB_menu ul li {
	display: block;
	width: 296px;
	height: 40px;
}

.multiPopup.c32 .DB_menu ul li p {
	top: 30%;
}

.multiPopup.c32 .DB_menu .DB_box {
	display: none;
}

.multiPopup.w41 {
	width: 539px;
	height: 301px;
	padding: 8px;
	border: 1px solid #ccc;
}

.multiPopup.w41 .DB_img {
	float: left;
	width: 420px;
	height: 299px;
	margin: 0 5px 0 0;
	border: 1px solid #ddd;
}

.multiPopup.w41 .DB_menu {
	position: relative;
	float: left;
	width: 112px;
}

.multiPopup.w41 .DB_menu ul li {
	display: block;
	width: 110px;
	height: 74px;
}

.multiPopup.w41 .DB_menu ul li p {
	top: 27%;
}

.multiPopup.w41 .DB_menu .DB_box {
	width: 110px;
	height: 74px;
}

.multiPopup.w42 {
	width: 532px;
	height: 297px;
}

.multiPopup.w42 .DB_img {
	float: left;
	width: 420px;
	height: 297px;
}

.multiPopup.w42 .DB_img ul li {
	width: 420px !important;
	height: 300px !important;
}

.multiPopup.w42 .DB_menu {
	position: relative;
	float: left;
	width: 112px;
}

.multiPopup.w42 .DB_menu ul li {
	display: block;
	width: 110px;
	height: 73px;
}

.multiPopup.w42 .DB_menu ul li p {
	top: 27%;
}

.multiPopup.w42 .DB_menu .DB_box {
	display: none;
}

.multiPopup.r51 {
	width: 302px;
	height: 415px;
	padding: 8px;
	border: 1px solid #ccc;
}

.multiPopup.r51 .DB_img {
	width: 299px;
	height: 380px;
	margin-bottom: 5px;
	border: 1px solid #ddd;
}

.multiPopup.r51 .DB_menu ul li {
	width: 25px;
	height: 25px;
	line-height: 24px;
	margin: 0 5px 0 0;
	border-radius: 100%;
}

.multiPopup.r51 .DB_menu .DB_box {
	display: none;
}

.JS_topBnr_roll {
	display: block;
}

.sns_icon {
	display: block;
}

.point_ico {
	display: block;
}

#JS_searchBtn {
	display: block;
}

#brand_list {
	display: block;
}

.JS_headerBnr {
	display: block;
}

.JS_headerBnr2 {
	display: block;
}

#d_full_btn {
	display: block;
}

#category_full_m {
	display: none;
}

.categorySub.brand {
	display: block;
}

.JS_brandLogo {
	display: block;
}

.categorySub.m01 {
	display: none;
}

.new_item {
	display: block;
}

#category-lnb {
	display: block;
}

.categorySub.m02 {
	display: block;
}

.time_sale {
	display: block;
}

.lookbook {
	display: block;
}

.JS_mainBnr {
	display: block;
}

.SD_23165_01 {
	display: block;
}

.SD_23165_02 {
	display: block;
}

.JS_23165_01 {
	display: block;
}

#JS_tabRolling1 {
	display: block;
}

.JS_23165_05 {
	display: block;
}

.JS_wideBnr {
	display: block;
}

.SD_spBnr_01 {
	display: none;
}

.SD_footerBnr {
	display: block;
}

.instafeed_wrap {
	display: block;
}

.footer_ico {
	display: block;
}

.d_etc18.right {
	display: block;
}

.naver.Btn {
	display: block;
}

.JS_quickBnr {
	display: block;
}

.JS_quickNotice {
	display: block;
}

.quickIco {
	display: block;
}

.discount_rate {
	display: block;
}

.-likeButton {
	display: block;
}

.thumbnail .zoom {
	display: block;
}

.thumbnail .basket {
	display: block;
}

.thumbnail .option {
	display: block;
}

.thumbnail .wishIcon {
	display: block;
}

.JS_layerBnr_position {
	left: -9999px;
}

.productRecent {
	display: block;
}

.made {
	display: block;
}

.JS_detailBnr {
	display: block;
}

.p_naverTalk {
	display: block;
}

.p_YellowID {
	display: block;
}

.snsIco {
	display: block;
}

.etcBtn {
	display: block;
}

.detail_img_info {
	display: block;
}

.NaverChk_Button {
	display: none;
}

@font-face {
	font-family: "fontwg";
	src: url('/_wg/library/font/fontawesome-webfont.eot');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: "fontwg";
	src: url('/_wg/library/font/fontawesome-webfont.woff') format('woff'),
		url('/_wg/library/font/fontawesome-webfont.ttf') format('truetype'),
		url('/_wg/library/font/fontawesome-webfont.svg#FontAwesome')
		format('svg');
	font-weight: normal;
	font-style: normal;
}

#header {
	position: relative;
	width: 100%;
	background: none;
}

#header_01 {
	position: relative;
	z-index: 30;
	width: 100%;
	height: 40px;
	background: rgba(255, 255, 255, 0.85);
	border-bottom: 1px solid #ddd;
}

.header_01_inner {
	height: 40px;
}

#header_01.fixed {
	position: fixed;
	top: 0;
	background: rgba(255, 255, 255, 0.97);
	background: #fff \9;
}

#header_01.fixed .header_01_inner {
	border-bottom: none;
}

#slide_home_wrap {
	position: absolute;
	top: 0;
	left: 0;
	width: 52px;
	height: 40px;
	overflow: hidden;
}

#slide_home {
	position: absolute;
	top: -40px;
	left: 0;
	width: 52px;
	height: 40px;
	line-height: 40px;
	font-size: 0;
	cursor: pointer;
	transition: top .3s 0s ease;
	-webkit-transition: top .3s 0s ease;
}

#header_01.fixed #slide_home {
	z-index: 11;
	top: 0px;
	transition-delay: 1s;
	-webkit-transition-delay: 1s;
}

#slide_home a {
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

#slide_home a:hover {
	filter: alpha(opacity = 80);
	opacity: .8;
	-webkit-opacity: .8;
}

#header_02 {
	position: relative;
	height: 188px;
	margin: 0 auto;
}

#header_02.fixed {
	margin: 40px auto 0;
}

#header_02 .logo {
	position: relative;
	z-index: 2;
	top: 50px;
	padding-left: 100px;
	width: 300px;
	height: 150px;
	margin: 0 auto;
	font-size: 0;
	line-height: 0;
}

#header_02 .logo img {
	position: absolute;
}

#header_02 .logo .off {
	top: 0;
	visibility: visible;
	filter: alpha(opacity = 100);
	opacity: 1.0;
	-webkit-opacity: 1.0;
}

#header_02 .logo:hover .off {
	top: 12px;
	visibility: hidden;
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
}

#header_02 .logo .on {
	top: -12px;
	visibility: hidden;
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
}

#header_02 .logo:hover .on {
	top: 0;
	visibility: visible;
	filter: alpha(opacity = 100);
	opacity: 1.0;
	-webkit-opacity: 1.0;
}

#header_02 .wishList {
	position: absolute;
	top: 45px;
	right: 20px;
	z-index: 1;
	width: 80px;
	height: 80px;
	font-size: 0;
}

#header_02 .wishList a .btn_off {
	filter: alpha(opacity = 100);
	opacity: 1.0;
	-webkit-opacity: 1.0;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
	animation-name: heart;
	animation-duration: 4s;
	animation-iteration-count: infinite;
	animation-timing-function: ease-in-out;
	animation-direction: normal;
	-webkit-animation-name: heart;
	-webkit-animation-duration: 4s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: ease-in-out;
	-webkit-animation-direction: normal;
}

@
keyframes heart { 0%{
	transform: scale(1, 1)
}

5
%
{ transform:scale(1.18,1.18) }
10
%
{
transform
:
scale(
1
,
1
)
}
15
%
{
transform
:
scale(
1.18
,
1.18
)
}
20
%
{
transform
:
scale(
1
,
1
)
}
100
%
{
transform
:
scale(
1
,
1
)
}
}
@
-webkit-keyframes heart { 0%{
	transform: scale(1, 1)
}

5
%
{
transform
:
scale(
1.18
,
1.18
)
}
10
%
{
transform
:
scale(
1
,
1
)
}
15
%
{
transform
:
scale(
1.18
,
1.18
)
}
20
%
{
transform
:
scale(
1
,
1
)
}
100
%
{
transform
:
scale(
1
,
1
)
}
}
#header_02 .wishList:hover a .btn_off {
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
	transition-delay: .5s;
	-webkit-transition-delay: .5s;
}

#header_02 .wishList a .btn_on {
	position: absolute;
	left: 0;
	top: 0;
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
	animation-name: heart_on;
	animation-duration: .3s;
	animation-iteration-count: infinite;
	animation-timing-function: ease-in-out;
	animation-direction: normal;
	-webkit-animation-name: heart_on;
	-webkit-animation-duration: .3s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-timing-function: ease-in-out;
	-webkit-animation-direction: normal;
}

@
keyframes heart_on { 0%{
	transform: scale(1, 1)
}

50
%
{
transform
:
scale(
1.22
,
1.22
)
}
100
%
{
transform
:
scale(
1
,
1
)
}
}
@
-webkit-keyframes heart_on { 0%{
	transform: scale(1, 1)
}

50
%
{
transform
:
scale(
1.22
,
1.22
)
}
100
%
{
transform
:
scale(
1
,
1
)
}
}
#header_02 .wishList:hover a .btn_on {
	filter: alpha(opacity = 100);
	opacity: 1.0;
	-webkit-opacity: 1.0;
}

#header_03 {
	position: relative;
	z-index: 28;
	width: 100%;
	height: 50px;
	margin: 0 auto;
	background: rgba(255, 255, 255, .85);
	background: #fff \9;
	box-shadow: none;
	border-top: 1px solid #333;
	border-bottom: 1px solid #ddd;
	transition: box-shadow 1s ease;
	-webkit-transition: box-shadow 1s ease;
}

.header_03_inner {
	height: 50px;
}

#header_03.fixed {
	position: fixed;
	top: 40px;
	left: 0;
	background: rgba(255, 255, 255, .97);
	box-shadow: 0 3px 4px rgba(0, 0, 0, 0.15);
	border-bottom: none;
	border-bottom: 1px solid #333 \9;
}

#header_03.fixed .header_03_inner {
	border-top: none;
	border-bottom: none;
}

.search_section {
	position: relative;
	float: right;
	height: 26px;
	margin: 7px 0 0 5px;
}

.search_section .search_form {
	position: relative;
	z-index: 2;
}

.search_section .search_form #keyword {
	position: relative;
	width: 106px;
	height: 26px;
	line-height: 28px;
	margin: 0 -1px 0 0;
	padding: 0 5px 0 15px;
	border: none;
	border-radius: 5px 0 0 5px;
	background: #eee;
	font-size: 12px;
	color: #333;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

.search_section .search_form:hover #keyword {
	background: #ddd;
}

.search_section .search_form #keyword:focus {
	background: #ddd;
}

.search_section .search_form input[type=image] {
	position: relative;
	border-radius: 0 5px 5px 0;
	background: #eee;
}

.search_section .search_form input[type=image]:hover {
	background: #ddd;
}

#JS_searchBtn {
	position: absolute;
	z-index: 1;
	top: 33px;
	right: 0;
	width: 151px;
	height: 0px;
	line-height: 31px;
	background: url('/_wg/img/bg_slash_w.png') #333;
	color: #fff;
	font-size: 10px;
	letter-spacing: 0.08em;
	text-align: center;
	cursor: pointer;
	overflow: hidden;
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
	transition: all .2s .5s ease;
	-webkit-transition: all .2s .5s ease;
}

.search_section:hover #JS_searchBtn {
	height: 30px;
	filter: alpha(opacity = 100);
	opacity: 1;
	-webkit-opacity: 1;
	transition-delay: 0s;
	-webkit-transition-delay: 0s;
}

#JS_searchBtn:hover {
	background: url('/_wg/img/bg_slash_w.png') #555;
}

#JS_searchBtn i {
	position: relative;
	top: 2px;
	font-size: 13px;
	color: #fff;
}

#JS_searchBox {
	display: none;
	position: fixed;
	z-index: 9999;
	top: 100px;
	width: 880px;
	margin: 0 0 0 -40px;
	padding: 20px 40px;
	border-radius: 5px;
	background: rgba(255, 255, 255, .98);
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);
}

#JS_searchBox .DB_close {
	
}

#d_lightBox {
	display: none;
	position: fixed;
	z-index: 9998;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: url('/_wg/img/trans60.png');
}

@media all and (max-width:1265px) {
	.search_section .search_form #keyword {
		width: 70px;
	}
	#JS_searchBtn {
		width: 115px;
	}
}

#JS_topMenu2 {
	position: relative;
	z-index: 10;
	float: left;
	font-family: 'Nanum Gothic';
}

#header_01.fixed #JS_topMenu2 {
	margin: 0 0 0 50px;
	transition-delay: .5s;
	-webkit-transition-delay: .5s;
}

#JS_topMenu2 a {
	display: block;
	text-decoration: none;
}

#JS_topMenu2 .d1 {
	position: relative;
	float: left;
	background: url("/_wg/img/bar_ddd.gif") 0 17px no-repeat;
}

#JS_topMenu2 .d1:first-child {
	background: none;
}

#JS_topMenu2 .d1>a {
	height: 39px;
	line-height: 39px;
	padding: 0 7px 0 9px;
	border-top: 1px solid #fff;
	font-size: 11px;
	color: #333;
	letter-spacing: 0.08em;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

#JS_topMenu2 .d1>a:hover, #JS_topMenu2 .d1.on>a {
	border-top: 1px solid #111;
	font-weight: bold;
	color: #000;
}

#JS_topMenu2 i {
	position: relative;
	top: 2px;
	margin: 0 3px 0 0;
	font-size: 14px;
}

#JS_topMenu2 .d2_wrap {
	display: none;
	position: absolute;
	top: 40px;
	left: 50%;
	margin: 0 0 0 -58%;
	padding: 7px 0;
	border: 1px solid #ddd;
	background: #fff;
}

#JS_topMenu2 .d2_wrap .d2 {
	position: relative;
	display: block;
}

#JS_topMenu2 .d2_wrap .d2:first-child>a {
	border-top: none;
}

#JS_topMenu2 .d2_wrap .d2>a {
	height: 25px;
	line-height: 25px;
	margin: 0 10px;
	padding: 0 12px;
	border-top: 1px solid #eee;
	color: #555;
	font-size: 11px;
	white-space: nowrap;
}

#JS_topMenu2 .d2_wrap .d2>a:hover, #JS_topMenu2 .d2_wrap .d2.on>a {
	background: #f4f4f4;
	color: #111;
}

#JS_topMenu2 .d3_wrap {
	display: none;
	position: absolute;
	top: 5px;
	left: 90px;
	width: 100px;
	padding: 7px 0;
	border: 1px solid #ddd;
	background: #fff;
}

#JS_topMenu2 .d3_wrap li {
	display: block;
}

#JS_topMenu2 .d3_wrap li:first-child {
	
}

#JS_topMenu2 .d3_wrap li a {
	height: 22px;
	padding: 0 0 0 10px;
	line-height: 23px;
	color: #555;
	font-size: 11px;
}

#JS_topMenu2 .d3_wrap li a:hover, #JS_topMenu2 .d3_wrap li.on a {
	background: #f4f4f4;
	color: #111;
}

#JS_topMenu2 ._multishop img {
	position: relative;
	top: 13px;
	margin: 0 7px 0 0;
}

#JS_topMenu2 ._multishop>.d2_wrap {
	z-index: 10;
	width: 160px !important;
}

#JS_topMenu2 ._multishop>.d2_wrap>li.selected {
	background: url('/_wg/img/dot_notice.gif') no-repeat 15px 9px;
}

#JS_topMenu2 ._multishop>.d2_wrap a img {
	top: 5px !important;
	left: 5px;
}

#JS_topMenu2 ._multishop>.d2_wrap .name {
	display: inline-block;
	width: 70px;
}

#JS_topMenu2 ._multishop>.d2_wrap .unit {
	display: inline-block;
	width: 25px;
	font-size: 10px;
}

#JS_topMenu2 ._multishop>.d2>a {
	padding: 0 10px 0 20px;
}

.sns_icon {
	position: relative;
	float: left;
	top: 6px;
	margin: 0 0 0 5px;
}

.sns_icon li {
	position: relative;
	float: left;
	height: 40px;
	margin: 0 2px;
}

.sns_icon li a {
	display: block;
	width: 27px;
	height: 28px;
	border-radius: 100%;
	background: #eee;
	font-size: 15px;
	text-align: center;
	transition: all .7s ease;
	-webkit-transition: all .7s ease;
}

.sns_icon li:hover a {
	background: #ddd;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
	transform: rotate(30deg);
	-webkit-transform: rotate(30deg);
}

.sns_icon li a i {
	line-height: 27px;
	filter: alpha(opacity = 80);
	opacity: .8;
	-webkit-opacity: .8;
}

#JS_topMenu {
	position: relative;
	float: right;
	z-index: 10;
}

#JS_topMenu a {
	display: block;
	text-decoration: none;
}

#JS_topMenu .d1 {
	position: relative;
	float: left;
	background: url("/_wg/img/bar_ddd.gif") 0 16px no-repeat;
}

#JS_topMenu .d1:first-child {
	background: none;
}

#JS_topMenu .d1>a {
	height: 39px;
	padding: 0 7px 1px 8px;
	border-top: 1px solid #fff;
	font-size: 11px;
	line-height: 39px;
	color: #333;
	letter-spacing: 0.08em;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

#JS_topMenu .d1>a:hover, #JS_topMenu .d1.on>a {
	border-top: 1px solid #111;
	font-weight: bold;
	color: #000;
}

#JS_topMenu .d1 .count {
	margin: 0 0 0 3px;
	padding: 3px 5px;
	background: #777;
	border-radius: 4px;
	text-align: center;
	color: #fff;
	font-size: 10px;
	font-weight: 400;
}

#JS_topMenu .d2_wrap {
	display: none;
	position: absolute;
	top: 40px;
	left: 50%;
	margin: 0 0 0 -65%;
	padding: 7px 0;
	border: 1px solid #ddd;
	background: #fff;
	font-size: 11px;
}

#JS_topMenu .d2_wrap .d2 {
	position: relative;
	display: block;
}

#JS_topMenu .d2_wrap .d2:first-child>a {
	border-top: none;
}

#JS_topMenu .d2_wrap .d2>a {
	height: 25px;
	line-height: 25px;
	margin: 0 10px;
	padding: 0 12px;
	border-top: 1px solid #eee;
	color: #555;
	font-size: 11px;
	white-space: nowrap;
}

#JS_topMenu .d2_wrap .d2>a:hover, #JS_topMenu .d2_wrap .d2.on>a {
	background: #f4f4f4;
	color: #111;
}

#JS_topMenu .d3_wrap {
	display: none;
	position: absolute;
	top: 5px;
	left: 90px;
	width: 100px;
	padding: 7px 0;
	border: 1px solid #ddd;
	background: #fff;
}

#JS_topMenu .d3_wrap li {
	display: block;
}

#JS_topMenu .d3_wrap li:first-child {
	
}

#JS_topMenu .d3_wrap li a {
	height: 22px;
	padding: 0 0 0 10px;
	line-height: 23px;
	color: #555;
	font-size: 11px;
}

#JS_topMenu .d3_wrap li a:hover, #JS_topMenu .d3_wrap li.on a {
	background: #f4f4f4;
	color: #111;
}

#JS_topMenu ._multishop img {
	position: relative;
	top: 12px;
	margin: 0 7px 0 0;
}

#JS_topMenu ._multishop>.d2_wrap {
	z-index: 10;
	width: 150px !important;
}

#JS_topMenu ._multishop>.d2_wrap>li.selected {
	background: #f4f4f4;
}

#JS_topMenu ._multishop>.d2_wrap a img {
	top: 5px !important;
}

#JS_topMenu ._multishop>.d2_wrap .name {
	display: inline-block;
	width: 70px;
}

#JS_topMenu ._multishop>.d2_wrap .unit {
	display: inline-block;
	width: 25px;
	font-size: 10px;
}

#JS_topMenu .point_ico {
	position: absolute;
	top: 32px;
	left: 1px;
	width: 60px;
	height: 23px;
	line-height: 23px;
	background: rgb(51, 51, 51);
	background: url('/_wg/img/mileage_bg.png') no-repeat \9;
	border-radius: 5px;
	font-weight: bold;
	font-size: 10px;
	letter-spacing: 0;
	text-align: center;
	color: #fff;
	filter: alpha(opacity = 100);
	opacity: 1;
	-webkit-opacity: 1;
	transition: all .8s .5s ease !important;
	-webkit-transition: all .8s .5s ease !important;
}

#header_01.fixed #JS_topMenu .point_ico {
	top: 20px;
	filter: alpha(opacity = 0);
	opacity: 0;
	-webkit-opacity: 0;
	transition-delay: .8s;
	-webkit-transition-delay: .8s;
}

.JS_headerBnr {
	position: absolute;
	z-index: 1;
	top: -41px;
	left: 0px;
	width: 210px;
	height: 280px;
}

.JS_headerBnr .img {
	position: relative;
	display: block;
	top: 75px;
	width: 100%;
	height: 100%;
	overflow: hidden;
	text-align: center;
}

.JS_headerBnr .img li {
	position: absolute;
	width: 100%;
}

.JS_headerBnr .img li:first-child {
	z-index: 1;
}

.JS_headerBnr .btn {
	position: absolute;
	z-index: 1;
	bottom: 70px;
	width: 100%;
	text-align: center;
	font-size: 0;
	letter-spacing: -4px;
	opacity: 0;
	-webkit-opacity: 0;
	transition: all .5s ease;
	-webkit-transition: all .5s ease;
}

.JS_headerBnr:hover .btn {
	opacity: 1.0;
	-webkit-opacity: 1.0;
}

.JS_headerBnr .btn li {
	display: inline-block;
	*display: inline;
	*zoom: 1;
	width: 6px;
	height: 6px;
	margin: 0 2px;
	border-radius: 10px;
	background: #aaa;
	cursor: pointer;
	font-size: 0;
	background: #aaa;
	transition: width .3s ease;
	-webkit-transition: width .3s ease;
}

.JS_headerBnr .btn li.on {
	width: 12px;
	height: 6px;
	background: #111;
}

.JS_headerBnr .arrow_wrap {
	position: absolute;
	z-index: 10;
	width: 100%;
	top: 50%;
	margin-top: -23px;
	height: 0;
	cursor: pointer;
	opacity: 0;
	-webkit-opacity: 0;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

.JS_headerBnr:hover .arrow_wrap {
	opacity: 1;
	-webkit-opacity: 1;
}

.JS_headerBnr .arrow {
	position: absolute;
	width: 45px;
	height: 45px;
	transition: all .3s ease;
	-webkit-transition: all .3s ease;
}

.JS_headerBnr .prev {
	left: 5px;
	background: url('/_wg/img/arrowL_21.gif') no-repeat 50% 50%;
}

.JS_headerBnr:hover .prev {
	left: 0px;
}

.JS_headerBnr:hover .prev:hover {
	opacity: .4;
	-webkit-opacity: .4;
}

.JS_headerBnr .next {
	right: 5px;
	background: url('/_wg/img/arrowR_21.gif') no-repeat 50% 50%;
}

.JS_headerBnr:hover .next {
	right: 0px;
}

.JS_headerBnr:hover .next:hover {
	opacity: .4;
	-webkit-opacity: .4;
}
</style>
</head>
<body>
	<hr class="layout" />
	<div id="wrap">
		<div id="container">
			<div id="contents">

				<div class="xans-element- xans-board xans-board-writepackage-4 xans-board-writepackage xans-board-4 ">
					<div
						class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
						<div class="title" style="margin: 30%;">
							<h2>
								<font color="#555555">상품 사용후기</font>
							</h2>
							<p>상품 사용후기입니다. 후기는 주문내역이 있는 상품에 대해서만 작성하실 수 있습니다.</p>
						</div>
					</div>
					<form id="boardWriteForm" name=""
						action="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=review_write_action" method="post" target="_self"
						enctype="multipart/form-data">
						<input id="board_no" name="board_no" value="4" type="hidden" /> 
						<input id="product_no" name="product_no" value="0" type="hidden" /> 
						<input id="move_write_after" name="move_write_after" value="/board/product/list.html?board_no=4" type="hidden" /> 
						<input id="cate_no" name="cate_no" value="" type="hidden" /> 
						<input id="bUsePassword" name="bUsePassword" value="" type="hidden" />
						<input id="order_id" name="order_id" value="" type="hidden" /> 
						<input id="is_post_checked" name="is_post_checked" value="" type="hidden" /> 
						<input id="586" name="586" value="0776c18d8d9cf9daf88b27e2849c8dcd" type="hidden" />
						<div class="xans-element- xans-board xans-board-write-4 xans-board-write xans-board-4">
						
							<!-- 상품정보선택 -->
							<div class="ec-base-box typeProduct">
								<p class="thumbnail">
									<a href=""><img id="iPrdImg"
										src="//boy2.co.kr/web/product/tiny/"
										onerror="this.src='http://img.echosting.cafe24.com/thumb/75x75.gif'"
										alt="" /></a>
								</p>
								<div class="information">
									<span id="sPrdCommonImg"></span>
									<h3>
										<a href="/product/detail.html?product_no=0" id="aPrdNameLink"><span
											id="sPrdName"></span></a>
									</h3>
									<p class="price">
										<span id="sPrdPrice"></span>
									</p>
									<p class="button">
										<span id="iPrdView" class="displaynone"><a
											href="/product/detail.html?product_no=0" id="aPrdLink"
											target="_blank"><img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_prd_detail.gif"
												alt="상품상세보기" /></a></span> <span class=""><a href="#none"
											onclick="BOARD_WRITE.product_popup('/product/search_board_list.html')"><img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_prd_select.gif"
												alt="상품정보선택" /></a></span> <span class=""><a href="#none"
											onclick="BOARD_WRITE.product_popup('/order/search_board_list.html')"><img
												src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_prd_order.gif"
												alt="주문상품선택" /></a></span>
									</p>
								</div>
							</div>
							<div class="ec-base-table typeWrite ">
								<table border="1" summary="">
									<caption>글쓰기 폼</caption>
									<colgroup>
										<col style="width: 130px;" />
										<col style="width: auto;" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">제목</th>
											<td><input id="subject" name="subject"
												fw-filter="isFill" fw-label="제목" 
												value="" type="text"/>
												<input type="checkbox" name="secret" value="1">비밀글 </td>
										</tr>
										<tr class="displaynone">
											<th scope="row">작성자</th>
											<td></td>
										</tr>
										<tr class="displaynone">
											<th scope="row">이메일</th>
											<td></td>
										</tr>
										<tr class="">
											<th scope="row">평점</th>
											<td><input id="point0" name="point" fw-filter=""
												fw-label="평점" fw-msg="" value="5" type="radio"
												checked="checked" /><label for="point0"><span
													class="point5"><em>★★★★★</em></span></label> <input id="point1"
												name="point" fw-filter="" fw-label="평점" fw-msg="" value="4"
												type="radio" /><label for="point1"><span
													class="point4"><em>★★★★</em></span></label> <input id="point2"
												name="point" fw-filter="" fw-label="평점" fw-msg="" value="3"
												type="radio" /><label for="point2"><span
													class="point3"><em>★★★</em></span></label> <input id="point3"
												name="point" fw-filter="" fw-label="평점" fw-msg="" value="2"
												type="radio" /><label for="point3"><span
													class="point2"><em>★★</em></span></label> <input id="point4"
												name="point" fw-filter="" fw-label="평점" fw-msg="" value="1"
												type="radio" /><label for="point4"><span
													class="point1"><em>★</em></span></label></td>
										</tr>
										<tr>
											<td colspan="2" class="clear"><script
													type="text/javascript"
													src="//editor.cafe24.com/js/nneditor.js?c=ko"></script>
													<script type="text/javascript">
														NN.Config.instanceID = "content";
														NN.Config.value = "";
												
														//Editor Height
														NN.Config.height = 400;

														var oNN_content = new NNEditor();
														oNN_content.build();

														if (typeof $Editor != "object") {
															$Editor = {
																_obj : {},

																push : function(
																		obj, id) {
																	this._obj[id] = obj;
																},

																get : function(
																		id) {
																	return this._obj[id];
																},

																reset : function(
																		id) {
																	this._obj[id]
																			.getText().value = "";
																	this._obj[id]
																			.getIFDoc().body.innerHTML = this._obj[id].Config.START_HTML;
																},

																contents : function(
																		id,
																		context) {
																	this._obj[id]
																			.getText().value = context;
																	this._obj[id]
																			.getIFDoc().body.innerHTML = this._obj[id].view
																			.parsing(2);
																}
															};
														}

														$Editor.push(
																oNN_content,
																"content");
													</script> 
													<input type="hidden" id="content_hidden" fw-filter="isSimplexEditorFill" fw-label="내용"
												value="oNN_content" /></td>
											
										</tr>
									</tbody>
									<tbody class="">
										<tr>
											<th scope="row">첨부파일</th>
											<td><input name="attach_file[]" type="file" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="ec-base-button" >
								<span class="gRight"> 
								<button type="submit" style="border:none;";>
								<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_register.gif" alt="등록">
								</button>
								<!-- <a href="#none" onclick="BOARD_WRITE.form_submit('boardWriteForm');" id="rgstBtn">
									<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_register.gif" alt="등록" /></a>  -->
									<a href="<%=request.getContextPath()%>/index.jsp?workgroup=review&work=jm_review" id="cancelBtn">
									<img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/btn_cancel.gif" alt="취소" /></a>
								</span>
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
		<hr class="layout" />
	</div>
	<hr class="layout" />
</body>
</html>
<div id="message" style="color: red;"></div>

<script type="text/javascript">
$("#subject").focus();

$("#boardWriteForm").submit(function() {
	if ($("#subject").val()=="") {
		$("#message").text("제목을 입력해주세요.");
		$("#subject").focus();
		return false;
	}
	
	if ($("#content_hidden").val()=="") {
		$("#message").text("내용을 입력해주세요.");
		$("#content_hidden").focus();
		return false;
	}
});


</script>

