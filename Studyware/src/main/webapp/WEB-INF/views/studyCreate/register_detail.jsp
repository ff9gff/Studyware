<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>같이가자</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style>
.main-header{
 top: 30px;
 z-index:98;
}
.menu{
  width:800px;
  margin: 0 auto;
  color: #F4511E;
  border-bottom:3px solid #F4511E;
  font-size: 17px;
  font-weight: bold;
  margin-bottom: 20px;
}
#content{
  width:800px;
  margin: 0 auto;
}
#content_title{
 width:670px;
  color: #F4511E;
  font-size: 30px;
  font-weight: bold;
}
#content_smalltitle{
 width:670px;
   font-size: 15px;
}
#content_condition{
	width:800px;
 	margin: 0 auto;
 	border-top: 1px solid lightgray;
 	border-bottom: 1px solid lightgray;
 	text-align: center;
}
.reply_panel,.apply_panel{
  width:800px;
  margin: 0 auto;
}
#replies{
	margin:0;
	padding:0;
	list-style:none;
}
#replies li{
	margin-bottom:10px;
	padding-bottom:5px;
	border-bottom:1px dotted #999999;
	
}

.reply_body{
	margin-left:20px;
}
.re_reply_body{
	margin-left:60px;
}
.btns{
	float: right;
	margin-right: 20px;
}

.reply_commit,.update_commit{
	vertical-align: middle;
	margin-top: 20px;
}
.regdate,.btn_div,.btn_reply,.btn_update,.btn_delete{
	font-size: 10pt;
	color:#757575;
	font-weight: normal;
}
.btn_reply,.btn_update,.btn_delete{
	text-decoration:none;
}
#rcontent{
	width: 700px;
	height: 50px;
	padding:0;
}
#btn_Create{
	width: 90px;
	height: 50px;
		font-weight:bold;

}
.applicant_panel,.applicant_button{
	display: inline-block;
	vertical-align: middle;
}
.applicant_panel{
	width: 100%;
	height: 100%;
	padding:0;
	overflow: auto;
	overflow-x:hidden;
	margin: 0;
}
.applicant_button{
width: 95%;
	height: 100%;
	font-weight:bold;
	padding:0;
	margin: 0;
	 border:0;
}

#applicants{
    width:100%;
    margin:0;
    border:0;
    padding:0;
    padding: 0;
}
#applicants th {
    background-color:#6d6f70;
    color:#FFFFFF
}
#applicants,#applicants th,#applicants td {
    font-size:0.95em;
    text-align:center;
    padding:4px;
    border-collapse:collapse;
}
#applicants th,#applicants td {
    border: 1px solid #6d6f70;
    border-width:1px 0 1px 0
}
#applicants tr {
	background-color:#fdfdfd;
    border: 1px solid #6d6f70;
}
.apply_notdata{
	background-color: lightgray;
	border: 1px solid lightgray;
}

.table_check{
	width: 8%;
}
.table_name,.table_com{
	width: 30%;
}
.table_sex,.table_age{
	width: 16%;
}
.apply_panel_table{
	width: 490px;
	height: 100%;
	background-color: lightgray;
	padding: 0;

}
.apply_panel_btns{
	width: 80px;
	text-align: center;

}
.apply_panel{
	width: 700px;
	height: 180px;
}
.join{
	font-weight: 800;
}
#context_profile,#context_board{
	padding: 5px 0px 5px 5px;
    margin: 0px;
    border: 1px solid #d8d6d6;
    border-bottom: 1px solid #FFFFFF;
    font-size: 12px;
}
#context_msg{
	padding: 5px 0px 5px 5px;
    margin: 0px;
    border: 1px solid #d8d6d6;
    font-size: 12px;
}
#contextmenu{
	width: 90px;
	position: absolute;
	background-color: #FFFFFF;
}
#context_ul{
list-style:none;
padding: 0;
margin: 0;
}
.btn_nickname{
	color: #000000;
	text-decoration:none;
	font-weight: 800;
	font-size: 15px;
}
.btn_context{
text-decoration:none;
color: #000000;
}
#profilemenu{
	width: 430px;
	height: 150px;
	position: absolute;
	background-color: #FFFFFF;
	border:solid 1px #ccc; 
	box-shadow: 0px 1px 20px #333;
	z-index:100; 
	text-align: center;
	vertical-align: middle;

}
#profilemenu table{
	width: 410px;
	height: 130px;
	margin: 10px;
	
}
#profile_image{
	width: 30%;
	padding-right: 5px;
	padding-bottom: 0;
	padding-left: 0;
	padding-top: 0;
	vertical-align: middle;
}
#profile_button1{
border:#FFFFFF;
background-color: #FFFFFF;
color: #686767;
font-size: 12px;
}
#profile_button2{
	border: #FFFFFF;
	background-color: #FFFFFF;
	color: #686767;
	font-size: 10px;
	font-weight: bold;
}
#profile_nickname{
	text-align: left;
	color: #444343;
	font-weight: 800;
	font-size: 20px;
}
#profile_introduce{
text-align: left;
color: #a8a6a6;
font-size: 12px;
}
#overlay{
	background-color: #000;
 	bottom: 0; left: 0;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	position: fixed;
	right: 0; top: 0;
	z-index: 99; display:none;
}
#overlay2{
	background-color: #b7b7b7;
 	bottom: 0; left: 0;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	position: fixed;
	right: 0; top: 0;
	z-index: 99; display:none;
	color: #FFFFFF;
	font-size: 50px;
	font-weight: bold;
	text-align: center;
	vertical-align: middle;
}
#span_join{
	color:#6d6f70;
	font-weight: bold;
}
.condition_img{
	width: 40px;
	height: 40px;
	vertical-align: middle;
	display: inline-block;
	margin-top: 10px;
}
.condition_text{
	margin-bottom: 10px;
}
.content_profile_img{
	width: 80px;
	height: 80px;
	vertical-align: middle;
	display: inline-block;
	border-radius: 70px;
	-moz-border-radius: 70px;
	-khtml-border-radius: 70px;
	-webkit-border-radius: 70px;
}
.content_profile_text{
	color: gray;
	font-weight: bold;
}
#profile_profile_img{
	width: 120px;
	height: 120px;
	vertical-align: middle;
	display: inline-block;
	border-radius: 70px;
	-moz-border-radius: 70px;
	-khtml-border-radius: 70px;
	-webkit-border-radius: 70px;
}

#joinmenu{
	background-color: #FFFFFF;
	border: 2px dotted lightgray;
	width: 200px;
	height: 110px;
	text-align: center;
	vertical-align: middle;
	display: inline-block;
	  position: fixed;
  margin: 0 auto;
  top: 400px;
  right: 20px;
}
#joinmenu_apply{
	width: 170px;
	height: 50px;
	background-color: #ec523f;
  color: white;
  font-weight: 700;
}
#joinmenu_count{
	margin-top: 10px;
	width: 200px;
	height: 40px;
	text-align: center;
	vertical-align: middle;
}
.reply_panel_under{
	width: 100%;
	height: 100%;
	background-color: lightgray;
	text-align: center;
}
.content_btns{
	width: 60px;
	height: 20px;
	font-size: 12px;
	padding: 0;
	background-color: #F4511E;
	color: white;
}
</style>
</head>
<body>

<div id="contextmenu" hidden>
	<input hidden type="number" name="member_no" id="context_mno"/>
	<input hidden type="text" name="context_nickname" id="context_nickname"/>
	<input hidden type="number" name="listno" id="context_listno"/>
	<input hidden type="text" id="context_type"/>
	<ul id="context_ul">
		<li id="context_profile"><a href="#this" class="btn_context">프로필보기</a></li>
		<li id="context_board"><a href="#this" class="btn_context">게시글보기</a></li>
		<li id="context_msg"><a href="#this" class="btn_context">쪽지보내기</a></li>
	</ul>
</div>


<div id="profilemenu" hidden>
	<input hidden type="number" name="member_no" id="profile_mno"/>
	<table>
		<tr>
			<td rowspan="3" id="profile_image">프로필 사진</td>
			<td id="profile_nickname">닉네임</td>
			<td colspan="2" style="text-align: right;"><button id="profile_button1">X</button></td>
		</tr>
		<tr><td colspan="2" id="profile_introduce" style="padding-top: 0;">자기소개</td></tr>
		<tr><td colspan="2" style="text-align: right;vertical-align: middle;"><button id="profile_button2">자세히▶</button></td></tr>
	</table>
</div>

	
<div style="height: 150px;"></div>

<form id="msg_form" method="post" action="toggle_msg" target="msg">
	<input type="hidden" id="msg_setter" name="msg_setter" value="${member_no }"/>
	<input type="hidden" id="msg_getter" name="msg_getter" value="${member_no }"/>
	<div id="msg_getterList">
		<input type="hidden" id="msg_getnick" name="msg_getnick"/>
	</div>
	<input type="hidden" id="msg_address" name="msg_address" value="tour/toggle_msg"/>
</form>

<c:if test="${member_no ne recruitVO.member_no && not empty id}">
	<div id="joinmenu">
		<p id="joinmenu_count">몇명이 참여중이다</p>
		<button id="joinmenu_apply">신청하기</button>
	</div>
</c:if>

<div style="width: 800px;  margin: 0 auto; vertical-align: middle;">
	<div style=" display: inline-block; vertical-align: middle;">
		<div id=content_title>${recruitVO.recruit_title}</div>
		<div id=content_smalltitle></div>
	</div>
	<div id="content_profile" style="width: 110px; height: 100px; display: inline-block;text-align:center; vertical-align: middle;">
	
	</div>
</div>

<c:if test="${member_no eq recruitVO.member_no}">
	<div class="menu">Apply for</div>
	<table class="apply_panel">
		<tr style="padding: 0; height: 30px; text-align: center;"><td colspan="3" ><span id="span_join"></span></td></tr>
		<tr style="padding: 0;height: 150px;">
			<td class="apply_panel_table">
				<div class="applicant_panel">
					<table id="applicants"></table>
				</div>
			</td>
			<td class="apply_panel_btns"><button type="button" class="applicant_button" id="apply_ok">수락하기</button></td>
			<td class="apply_panel_btns"><button type="button" class="applicant_button" id="trip_end">마감</button></td>
		</tr>	
	</table>
</c:if>

<div class="menu" style="margin-top: 20px;"><p style="display: inline-block;">Content</p> 
	<div style="display: inline-block; float: right;">
		<c:if test="${member_no eq recruitVO.member_no}">
			<form action="updateRecruit" method="post" id="frm1" style="display: inline-block;">
				<input type="hidden" name='recruit_no' value='${recruitVO.recruit_no}'/>
				<input type="button" id='updateButton' class="content_btns" value='수정' />
			</form>
		</c:if>
		
		<c:if test="${member_no eq recruitVO.member_no}" >
			<form action="deleteRecruit" method="post" id="frm2" style="display: inline-block;">
				<input type="hidden" name='recruit_no' value='${recruitVO.recruit_no}'/>
				<input type="button" id='deleteButton' class="content_btns" value='삭제' />
			</form>
		</c:if>
		<button type="button" id="contentButton" class="content_btns">목록</button>
	</div>
</div>
<input type="hidden" id="end_date" value="${recruitVO.recruit_date}"/>

<div id="content">
${recruitVO.recruit_content}
</div>

<div class="menu">Comment</div>

<c:if test="${not empty id }">
	<div class="reply_panel">
		<input type="text" name="rcontent" id="rcontent" placeholder="댓글을 입력하세요" required/>
		<input hidden type="number" name="mno" id="mno" value="${member_no}" required/>
		<button type="button" id="btn_Create">댓글 입력</button>
	</div>
</c:if>
<c:if test="${empty id }">
	<div class="reply_panel">
		<p class="reply_panel_under">로그인 사용자만 사용가능합니다.</p>
	</div>
</c:if>
<c:if test="${not empty id }">
	<div class="reply_panel">
		<p class="reply_panel_under">승인된 사용자만 사용가능합니다.</p>
	</div>
</c:if>
<div class="reply_panel">
	<ul id="replies"></ul>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%-- 댓글 부분 script --%>
<script>
$(document).ready(function(){
	
$('#updateButton').click(function() {
	alert("여행 정보 수정하러 갑니다");
	$('#frm1').submit();
});

$('#deleteButton').click(function() {
	alert("여행 정보 삭제하러 갑니다");
	$('#frm2').submit();
});

$('#contentButton').click(function() {
	alert('여행 게시판으로 돌아갑니다');
	location = '../';
});


var end = ${recruitVO.expire};

$(function(){
	if(end == 1){
		$('#overlay2').show();
	}
});



}); // end document.ready();
</script>


</body>
</html>