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
	<input hidden type="number" name="mno" id="context_mno"/>
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
	<input hidden type="number" name="mno" id="profile_mno"/>
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
	<input type="hidden" id="msg_setter" name="msg_setter" value="${mno }"/>
	<input type="hidden" id="msg_getter" name="msg_getter" value="${mno }"/>
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
		<div id=content_smalltitle>${recruitVO.recruit_content}</div>
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
			<form action="TourBoardUpdateRequest" method="post" id="frm1" style="display: inline-block;">
				<input type="hidden" name='recruit_no' value='${recruitVO.recruit_no}'/>
				<input type="button" id='updateButton' class="content_btns" value='수정' />
			</form>
		</c:if>
		
		<c:if test="${member_no eq recruitVO.member_no or member_auth_no >= 2}" >
			<form action="TourBoardDelete" method="post" id="frm2" style="display: inline-block;">
				<input type="hidden" name='recruit' value='${recruitVO.recruit_no}'/>
				<input type="button" id='deleteButton' class="content_btns" value='삭제' />
			</form>
		</c:if>
		<button type="button" id="tourBoardButton" class="content_btns">목록</button>
	</div>
</div>
<input type="hidden" id="end_date" value="${recruitVO.recruit_date}"/>

<div id="content">
${tourVO.content}
</div>

<div class="menu">Comment</div>

<c:if test="${not empty id && member_auth_no ne 0 }">
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
<c:if test="${not empty id && member_auth_no eq 0 }">
	<div class="reply_panel">
		<p class="reply_panel_under">승인된 사용자만 사용가능합니다.</p>
	</div>
</c:if>
<div class="reply_panel">
	<ul id="replies"></ul>
</div>

<input hidden id="introval" value="'${inserterIntro}'"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<%-- 댓글 부분 script --%>
<script>
$(document).ready(function(){
	var recruit_no = ${recruitVO.recruit_no};

	var sessionmno = '<%=(String)session.getAttribute("member_no")%>';
	var sessionaut= '<%=(String)session.getAttribute("member_auth_no")%>';
	var sessionnick='<%=(String)session.getAttribute("nick")%>';
	
	<%-- 신청부분 --%>
	// wm_tour_join 리스트
	var applylist = [];
	// wm_personal 리스트
	var personlist = [];
	// 수락한 인원
	var joincount=0;

	getAlldata();
	
	// DB에서 해당 글번호(trip_no)의 모든 신청자들을 읽어오는 함수 정의
	function getAlldata(){
		// wm_tour_join 리스트
		applylist = [];
		// wm_personal 리스트
		personlist = [];
		joincount=0;
		
		var url1 = '/project03/tour/detail/apply/all/'+trip_no;
		$.getJSON(url1, function(data){
			$(data).each(function(){
				applylist.push({list_no: this.list_no, mno: this.mno, approval: this.approval, person:{}});	
				
			});
			
			var url2 = '/project03/tour/detail/apply/person/'+trip_no;
			$.getJSON(url2, function(data){
				$(data).each(function(){
					personlist.push({mno: this.mno, name: this.name, sex: this.sex, age: this.age, nickname: this.nickname, introduce:this.introduce})
				
				
				});
				for(var i=0; i<applylist.length; i++){
					for(var j=0; j<personlist.length; j++){
						if(applylist[i].mno == personlist[j].mno){
							applylist[i].person = personlist[j];	
						}
					}// end for(j)
				}// end for(i)
				getAllApply();
			}); // end getJSON
		}); // end getJSON
	}// end getAlldata()
	
	function getAllApply(){
		$('#joinmenu_count').text("현재까지 "+applylist.length+"명 신청중입니다.");
		var tr ='<tr class="apply_th">'
					+'<th class="table_check"><input id="allCheck" type="checkbox"/></th>'
					+'<th class="table_name">신청자</th>'
					+'<th class="table_sex">성별</th>'
					+'<th class="table_age">나이</th>'
					+'<th class="table_com">수락여부</th>'
				+'</tr>' 
		if(applylist[0] == null){
			tr+= '<tr class="apply_notdata" style="height:130px;"><td colspan="5" class="apply_notdata">신청자가 없습니다.</td></tr>';
		}else{
		for(var i=0; i<applylist.length; i++){
			if(applylist[i].approval == 0){
					tr+= '<tr class="apply_td">';
					tr+='<td class="table_check"><input class="check" name="rowCheck" type="checkbox" value="'+applylist[i].list_no+'"></td>';
			}else{
				joincount++;
				tr+= '<tr class="apply_td" style="background-color:#DBD9D9 ">';
				tr+='<td class="table_check"><input class="test" name="comCheck" type="checkbox" checked="checked" onclick="return false;" value="'+applylist[i].list_no+'"></td>';
			}
					tr+='<td class="table_name"><a href="#this" class="btn_nickname" data-rno="'+applylist[i].mno+'" data-listno="'+i+'">'+applylist[i].person["nickname"]+'</a></td>'
					+'<td class="table_sex">';
					if(applylist[i].person["sex"] == 0){
						tr+='여자'+'</td>';
					}else{
						tr+='남자'+'</td>';
					}
					tr+='<td class="table_age">'+applylist[i].person["age"]+'</td>';
					if(applylist[i].approval == 0){
						tr+='<td class="table_com"></td></tr>';
					}else{
						tr+='<td class="table_com"><span class="join">수락완료</span></td></tr>';
					}
		}// end for(i)
		}
		$('#applicants').html(tr);
		$('#span_join').html("현재까지 "+joincount+"명 수락완료");
				
	}// end getAllApply()
	
	
	// 체크박스 전체 선택
	$('#applicants').on('click','#allCheck',function(){
		var chkObj = document.getElementsByName("rowCheck");
	      var rowCnt = chkObj.length - 1;
	      var check = $(this).context.checked;
	  
	      if (check) {﻿
	          for (var i=0; i<=rowCnt; i++){
	           if(chkObj[i].type == "checkbox")
	               chkObj[i].checked = true; 
	           var styletr = chkObj[i].parentNode.parentNode;
	           styletr.style.backgroundColor='#DBD9D9';
	          }
	      } else {
	          for (var i=0; i<=rowCnt; i++) {
	           if(chkObj[i].type == "checkbox"){
	               chkObj[i].checked = false;
	               var styletr = chkObj[i].parentNode.parentNode;
		           styletr.style.backgroundColor='#FFFFFF';
	           }
	          }
	      }
	 
	}); // 체크박스 전체선택 끝
	
	
	// 체크박스 선택시 색깔바꾸기 
	$('#applicants').on('click','.apply_td .table_check .check',function(){
		var obj = document.getElementsByName("rowCheck");
		for(var i=0; i<obj.length; i++){
			if(obj[i].checked == true){
				var styletr = obj[i].parentNode.parentNode;
				styletr.style.backgroundColor='#DBD9D9';
			}else{
				var styletr = obj[i].parentNode.parentNode;
				styletr.style.backgroundColor='#FFFFFF';
			}
		}
	});
		
	
	// 수락하기
	$('#apply_ok').on('click',$(this),function(){
		var chkObj = document.getElementsByName("rowCheck");
		var rowCnt = chkObj.length - 1;
		var success= false;
		var fail = 0;
		for(var i=0; i<=rowCnt; i++){
			if(chkObj[i].checked == true){
				var no = chkObj[i].value;
				$.ajax({
					type:'put',
					url:'/project03/tour/detail/apply/'+1+'/'+no,
					headers:{
						'Content-Type':'application/json',
						'X-Http-Method-Ovveride':'PUT'
					},
				/* 	data: JSON.stringify({
						approval: 1,
						list_no: no
					}), */
					success: function(result){
							if(result == 'success'){
								
							}
					}
				});// end ajax
				success = true;
			}// end if
			if(chkObj[i].checked == false){
				fail++;
			}
		}// end for

		if(success){
			alert('수락이 완료되었습니다.');
			getAlldata();
		}
		if(fail > rowCnt){
			alert('신청자를 체크해주세요');
		}

	}); // end apply_ok click

	


// menu에 마우스가 올라갔을때 색 바꾸기
$('#context_ul').on('mouseover','li',function(){
	$(this).context.style.backgroundColor='#ffdfaf';
});
$('#context_ul').on('mouseout','li',function(){
	$(this).context.style.backgroundColor='#FFFFFF';
});

// 다른 곳 클릭시 메뉴 사라지기
$(document).click(function(e){		
	if(!$('#applicants .apply_td .table_name ').has(e.target).length &&
		!$('#applicants .apply_td .table_name .btn_nickname').has(e.target).length &&
		!$('#replies .reply_list .nickname').has(e.target).length &&
		!$('#replies .reply_list .nickname .btn_nickname').has(e.target).length &&
		!$('#content_profile').has(e.target).length){
			$('#contextmenu').hide();
			$('#context_mno').val(null);
	} 
});

<c:if test="${not empty id}">

// 수락에서 - 닉네임 클릭시 메뉴 보이기
$('#applicants').on('click','.apply_td .table_name .btn_nickname',function(){
	// e.pageX
	// a 태그안의 mno 불러오기
	var amno = $(this).attr('data-rno');
	var alistno = $(this).attr('data-listno');
	// 메뉴 input에 mno숨겨넣기
	$('#context_mno').val(amno);
	$('#context_listno').val(alistno);
	$('#context_type').val("apply");
	$('#context_nickname').val($(this).text());
	// a 태그의 위치
	var atag = $(this).offset();
	var menubox = $('#contextmenu');
	menubox.css("left", (atag.left+30) +"px");
	menubox.css("top", (atag.top+10) +"px");
	menubox.show();
			 
});	

// 댓글에서 - 닉네임 클릭시 메뉴 보이기
$('#replies').on('click','.reply_list .btn_nickname',function(){
	// e.pageX
	// a 태그안의 mno 불러오기
	var amno = $(this).attr('data-rno');
	var alistno = $(this).attr('data-listno');
	// 메뉴 input에 mno숨겨넣기
	$('#context_mno').val(amno);
	$('#context_listno').val(alistno);
	$('#context_type').val("reply");
	$('#context_nickname').val($(this).text());
	// a 태그의 위치
	var atag = $(this).offset();
	var menubox = $('#contextmenu');
	menubox.css("left", (atag.left+30) +"px");
	menubox.css("top", (atag.top+10) +"px");
	menubox.show();
			 
});	

// 작성자 - 클릭시 메뉴 보이기
$('#content_profile').on('click',$(this),function(){
	// e.pageX
	// a 태그안의 mno 불러오기
	var amno = ${tourVO.mno};
	var anick = '${inserterNickname}';
	console.log("amno: "+amno);
	
	
	var alistno = 0;
	// 메뉴 input에 mno숨겨넣기
	$('#context_mno').val(amno);
	$('#context_listno').val(alistno);
	$('#context_type').val("inserter");
	$('#context_nickname').val(anick);
	// a 태그의 위치
	var atag = $(this).offset();
	var menubox = $('#contextmenu');
	menubox.css("left", (atag.left+30) +"px");
	menubox.css("top", (atag.top+10) +"px");
	menubox.show();
			 
});	

</c:if>

// 여행 신청하기
$('#joinmenu_apply').click(function(){
	// 승인된 인간만 누를 수 있도록
	if(sessionaut != 0 ){
		// 중복 안되게
		var apply_value = false;
		var length = 0;
		
		if(applylist.length==0){
			apply_value = true;
		}
		for(var i=0; i<applylist.length; i++){
			if(applylist[i].mno != sessionmno){
				length++;
				if(length == applylist.length){
					apply_value = true;
				}	
			}
		}
		console.log(apply_value + ", " + length + ", " + applylist.length);
		
		if(apply_value){
			var mnoString = $('#mno').val();
			$.ajax({
				type:'post',
				url:'/project03/tour/detail/apply/insert/'+trip_no+'/'+mnoString,
				headers:{
					'Content-Type':'application/json',
					'X-HTTP-Method-Override':'POST'
				},
				data: JSON.stringify({
					trip_no: trip_no,
					mno: mnoString
				}),
				success: function(result){
					if(result == 1){
						alert('여행 신청 성공');
						getAlldata();
					}
				}
			});// end ajax;
		}else{
			alert("이미 신청한 여행입니다");
		}	
	}else{
		alert("승인된 회원만 신청이 가능합니다.");
	}
});


$('#context_profile').on('click','.btn_context',function(){
	
	var alistno = $('#context_listno').val();
	var atype = $('#context_type').val();
	var amno = $('#context_mno').val();
	var anick =$('#context_nickname').val();
	var intro = $('#introval').val();
	
	$('#profile_mno').val(amno);
	
	var src = '';
	
	var url3 = '/project03/tour/detail/apply/profile/'+amno;
	
	$.ajax({
		type:'Get',
		url: '/project03/tour/detail/apply/profile/'+amno,
		headers:{
			'Content-Type':'application/json',
			'X-HTTP-Method-Override':'GET'
			},
			success: function(result){
					src = result;

					 $('#profile_image').html('<img src="../'+src+'" id="profile_profile_img"/>');

				
			}
	});
		
		
	
	
	
	if(atype=='reply'){
		$('#profile_nickname').text(replylist[alistno].person["nickname"]);
		$('#profile_introduce').text(replylist[alistno].person["introduce"]);
	}else if(atype=='contextmenu'){
		$('#profile_nickname').text(applylist[alistno].person["nickname"]);
		$('#profile_introduce').text(applylist[alistno].person["introduce"]);
	}else{
		$('#profile_nickname').text(anick);
		$('#profile_introduce').text(intro);
	}
	
	

	$('#overlay, #profilemenu').show();

	$('#profilemenu').css("top",  Math.max(0, (($(window).height() - $('#profilemenu').outerHeight()) / 2) + $(window).scrollTop())+ "px"); 
	$('#profilemenu').css("left", Math.max(0, (($(window).width() - $('#profilemenu').outerWidth()) / 2) + $(window).scrollLeft())+ "px");
	
	
});

$('#profile_button2').click(function(){
	var amno = $('#profile_mno').val();
	var url = '/project03/mypage/UserPage/'+amno;
	location.href  = url;
});

// 프로필 창 닫기
$('#overlay, #profile_button1').click(function(e){ 
    e.preventDefault(); 
    $('#profilemenu, #overlay').hide(); 
}); 


$('#context_board').on('click','.btn_context',function(){
	var amno = $('#context_mno').val();
	var url = '/project03/mypage/UserPage/'+amno;
	location.href  = url;
});

$('#context_msg').on('click','.btn_context',function(){
	var msg_nickname = $('#context_nickname').val();
	var amno = $('#context_mno').val();
	var msg_setter =  $('#msg_setter').val();
	$('#msg_getter').val(amno);
	$('#msg_getnick').val(msg_nickname);
	var f = document.getElementById('msg_form');
	var popOption = "width=400, height=500, resizble=no, scrollbars=no, status=no";
	window.open('',"msg" ,popOption);
	f.submit();
	
});

// 날짜 계산
var date1 = $('#start_date').val();
var date2 = $('#end_date').val();

var dateArray1 = date1.split(" ");
var dateArray2 = date2.split(" ");



var startArray = dateArray1[0].split("-");
var endArray = dateArray2[0].split("-");

var startObj = new Date(startArray[0], Number(startArray[1])-1, startArray[2]);
var endObj = new Date(endArray[0], Number(endArray[1])-1, endArray[2]);

var betweenDay = (endObj.getTime() - startObj.getTime())/1000/60/60/24;

// 조건 띄우기
var con_sex = ${tourVO.condition_sex};
var con_age = ${tourVO.condition_age};

$('#condition_date').html('<img src="../resources/theme/images/date.png" class="condition_img"/><div class="condition_text">'+betweenDay+'박 '+(betweenDay+1)+'일'+'</div>');
switch(con_sex){
	case 0: $('#condition_sex').html('<img src="../resources/theme/images/female.png" class="condition_img"/><div class="condition_text">여자 만</div>');
			break;
	case 1: $('#condition_sex').html('<img src="../resources/theme/images/male.png" class="condition_img"/><div class="condition_text">남자 만</div>');
			break;
	case 2: $('#condition_sex').html('<img src="../resources/theme/images/people.png" class="condition_img"/><div class="condition_text">누구나</div>');
			break;
	default: break;
}// end switch

switch(con_age){
	case 1: $('#condition_age').html('<img src="../resources/theme/images/20age.png" class="condition_img"/><div class="condition_text">20대 만</div>');
		break;
	case 2: $('#condition_age').html('<img src="../resources/theme/images/30age.png" class="condition_img"/><div class="condition_text">30대 만</div>');
		break;
	case 3: $('#condition_age').html('<img src="../resources/theme/images/40age.png" class="condition_img"/><div class="condition_text">40대 이상 만</div>');
		break;
	case 4: $('#condition_age').html('<img src="../resources/theme/images/freeage.png" class="condition_img"/><div class="condition_text">누구나</div>');
		break;
	default: break;
}// end switch

var mno_nickname = '${inserterNickname}';
var mno_intro = $('#introval').val();
var mno_img = '${inserterImg}';
var trip_region='';


$('#content_profile').html('<img src="../'+mno_img+'" class="content_profile_img"/><div class="content_profile_text">'+mno_nickname+'</div>');

var trip_region_name = '${inserterRegion}';
$(function(){
		var mno_region = trip_region_name.split(",");
	for(var i=0; i<mno_region.length; i++){
		trip_region+='#'+mno_region[i]+" ";
	}

	$('#content_smalltitle').html("&nbsp;&nbsp;"+trip_region+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+dateArray1[0]+" ~ "+dateArray2[0]);
});

$('#updateButton').click(function() {
	alert("여행 정보 수정하러 갑니다");
	$('#frm1').submit();
});

$('#deleteButton').click(function() {
	alert("여행 정보 삭제하러 갑니다");
	$('#frm2').submit();
});

$('#tourBoardButton').click(function() {
	alert('여행 게시판으로 돌아갑니다');
	location = '../tour/TourBoard';
});

var allend;
$('#trip_end').click(function(){
	var check = confirm('정말 마감하시겠습니까?');
	if(check == true){
		$.ajax({
			type:'put',
			url:'/project03/tour/detail/apply/end/'+trip_no,
			headers:{
				'Content-Type':'application/json',
				'X-Http-Method-Ovveride':'PUT'
			},
			success: function(result){
				if(result == 'success'){
					
					allend = confirm('전체 쪽지를 보내시겠습니까?');
					
					if(allend == true){
						var chkObj = document.getElementsByName("comCheck");
						var divlist = '';
						for(var i=0; i<chkObj.length; i++){
							console.log(chkObj[i].parentNode.parentNode.childNodes[1].firstChild);
							var chkatag = chkObj[i].parentNode.parentNode.childNodes[1].firstChild;
							var chknick = chkatag.innerText;
							var chkmno = chkatag.attributes.getNamedItem("data-rno").value;
							divlist += '<input type="hidden" id="msg_getnick" name="msg_getnick" value="'+chknick+'"/>';
						}// end for
						$('#msg_getterList').html(divlist);	
						console.log("새로운거");
						var f = document.getElementById('msg_form');
						var popOption = "width=400, height=500, resizble=no, scrollbars=no, status=no";
						window.open('',"msg" ,popOption);
						f.submit();
					}// end if
				}// end if
			}// end success
		}); // end ajax
	}// end if
});

var end = ${tourVO.expire};

$(function(){
	if(end == 1){
		$('#overlay2').show();
	}
});



}); // end document.ready();
</script>


</body>
</html>