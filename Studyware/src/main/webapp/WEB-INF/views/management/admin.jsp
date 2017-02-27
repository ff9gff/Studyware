<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#member_list{
	border-collapse:collapse;
	text-align:center;
}
#member_list th,td{
	 border: 1px solid #6d6f70;
	 border-width:1px 0 1px 0
}
#member_list tr{
	border: 1px solid #6d6f70;
}

#context_menu{
	width: 80px;
	position: absolute;
	background-color: #FFFFFF;
	border-bottom: 1px solid #d8d6d6;
}
#context_menu ul{
	list-style:none;
	padding: 0;
	margin: 0;
}
#context_menu ul li{
	padding: 5px 0px 5px 5px;
    margin: 0px;
    border: 1px solid #d8d6d6;
    border-bottom: 1px solid #FFFFFF;
    font-size: 12px;
}
#context_menu ul li a{
	text-decoration:none;
	color: #000000;
}
</style>

<title>Insert title here</title>
</head>
<body>


<!-- 쪽지 보내기 -->
<form id="msg_form" action="admin/msg" method="post" target="testpop">
	<input type="hidden" id="msg_setter" name="msg_setter" value="1"/>
	<div id ="msg_getter"></div>
</form>

<!-- 이력 보기 -->
<form id="history_form" action="admin/history" method="post" target="history_popup">
	<input type="hidden" id="history_member_no" name="history_member_no"/>
</form>

<!-- 권한 수정 -->
<form id="auth_form" action="admin/auth" method="post">
	<input type="hidden" id="auth_member_no" name="auth_member_no"/>
	<input type="hidden" id="auth_update_no" name="auth_update_no"/>
</form>

<!-- Context Menu -->
<div id="context_menu" hidden>
	<input type="hidden" type="number" id="context_member_no"/>
	<input type="hidden" type="text" id="context_auth"/>
	<ul>
		<li id="context_msg"><a href="#this">쪽지보내기</a></li>
		<li id="context_history"><a href="#this">이력보기</a></li>
		<li id="context_auth_manager"><a href="#this">회원권한</a></li>
		<li id="context_delete"><a href="#this">강퇴하기</a></li>
	</ul>
</div>

<button id="btn_msg">쪽지보내기</button>

<hr>

<table id ="member_list">
	<tr>
		<th><input id="allCheck" type="checkbox"></th>
		<th>아이디</th>
		<th>이름</th>
		<th>닉네임</th>
		<th>연락처</th>
		<th>이메일</th>
		<th>지역1</th>
		<th>지역2</th>
		<th>가입일</th>
		<th>권한</th>
	</tr>
	<c:forEach var="member" items="${memberList}">
		<tr class="member">
			<td><input class="rowCheck" name="rowCheck" type="checkbox" value="${member.member_no}"></td>
			<td><a href="#this" class="btn_id" data-mno="${member.member_no}" data-auth="${member.name_auth}">${member.id}</a></td>
			<td>${member.name}</td>
			<td>${member.nick}</td>
			<td>${member.phone}</td>
			<td>${member.email}</td>
			<td>${member.depth1}</td>
			<td>${member.depth2}</td>
			<td><fmt:formatDate value="${member.joindate}" pattern="yyyy-MM-dd"/></td>
			<td>${member.name_auth}</td>
	
		</tr>
	</c:forEach>
</table>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

	// 체크박스 전체 선택
	$('#member_list').on('click','#allCheck',function(){
		var chkObj = document.getElementsByName("rowCheck");
		var check = $(this).context.checked;
		if(check){
			for(var i=0; i<chkObj.length; i++){
				chkObj[i].checked = true;
				var styletr = chkObj[i].parentNode.parentNode;
				styletr.style.backgroundColor = '#DBD9D9';
			}// end for
		}else{
			for(var i=0; i<chkObj.length; i++){
				chkObj[i].checked = false;
				var styletr = chkObj[i].parentNode.parentNode;
				styletr.style.backgroundColor = '#FFFFFF';
			}// end for
		}// end if
	});
	


	// 체크박스 선택시 색깔 바꾸기
	$('#member_list').on('click','tr td .rowCheck', function(){
		var chkObj = document.getElementsByName("rowCheck");
		for(var i=0; i<chkObj.length; i++){
			if(chkObj[i].checked == true){
				var styletr = chkObj[i].parentNode.parentNode;
				styletr.style.backgroundColor='#DBD9D9';
			}else{
				var styletr = chkObj[i].parentNode.parentNode;
				styletr.style.backgroundColor='#FFFFFF';
			}
		}
	});
	
	// member_list table 마우스오버시 색 바꾸기
	$('#member_list').on('mouseover','.member',function(){
		$(this).context.style.backgroundColor='#DBD9D9';
	});
	$('#member_list').on('mouseout','.member',function(){
		var chk = $(this).children().children();
		if(chk[0].checked == false){
			$(this).context.style.backgroundColor='#FFFFFF';
		}
	});
	
	// context_menu 마우스오버시 색 바꾸기
	$('#context_menu').on('mouseover','ul li',function(){
		$(this).context.style.backgroundColor='#DBD9D9';
	});
	$('#context_menu').on('mouseout','ul li',function(){
		$(this).context.style.backgroundColor='#FFFFFF';
	});
	

	// 쪽지 보내기 - form 실행
	function sendMsgForm(){
		var f = document.getElementById('msg_form');
		var popOption = "width=400, height=500, resizble=no, scrollbars=no, status=no";
	
		window.open('',"testpop" ,popOption);
		f.submit();  

		$('#msg_getter').html('');
	}// end sendMsgForm()

	// 쪽지보내기 - 버튼클릭
	$('#btn_msg').click(function(){
		// msg_getter 세팅
		var chkObj = document.getElementsByName("rowCheck");
		var blank = 0;
		
		for(var i = 0; i < chkObj.length; i++){
			if(chkObj[i].checked == true){
				$('#msg_getter').append('<input type="hidden" name="msg_getter" value="'+chkObj[i].value+'">');
			}else{
				blank++;
			}
		}// end for

		// 쪽지 보내기 실행
		if(blank == chkObj.length){
			alert('보낼사람을 선택하세요');
		}else{
			sendMsgForm();
		}
	});
	
	// 쪽지보내기 - contextMenu클릭
	$('#context_msg').click(function(){
		var mno = $('#context_member_no').val();
		$('#msg_getter').append('<input type="hidden" name="msg_getter" value="'+mno+'">');
		sendMsgForm();
	});

	// 아이디 클릭시 contextmenu 보이기
	$('#member_list').on('click','.member .btn_id',function(){
		var amno = $(this).attr('data-mno');
		$('#context_member_no').val(amno);
		$('#auth_member_no').val(amno);
		
		var auth = $(this).attr('data-auth');
		$('#context_auth').val(auth);
		
		var atag = $(this).offset();
		var menubox = $('#context_menu');
		menubox.css("left", (atag.left+30) +"px");
		menubox.css("top", (atag.top+10) +"px");
		menubox.show();
	});
	
	// 다른 곳 클릭시 contextmenu 사라지기
	$(document).click(function(e){		
		if(!$('#member_list .member').has(e.target).length &&
		   !$('#member_list .member .btn_id').has(e.target).length){
				$('#context_menu').hide();
		} 
	});
	
	// 이력보기 - contextMenu클릭
	$('#context_history').click(function(){
		var mno = $('#context_member_no').val();
		$('#history_member_no').val(mno);

		var f = document.getElementById('history_form');
		var popOption = "width=400, height=300, resizble=no, scrollbars=no, status=no";
	
		window.open('',"history_popup" ,popOption);
		f.submit();  

	});
	
	// 회원 권한 - contextMenu클릭
	$('#context_auth_manager').click(function(){	
		var auth = $('#context_auth').val();	
		
		var check ;
		
		if(auth == '회원'){
			$('#auth_update_no').val(1);
			check = confirm('관리자 권한을 부여하시겠습니까?');
		}else{
			$('#auth_update_no').val(0);
			check = confirm('관리자 권한을 해제하시겠습니까?');
		}// end if(auth=='회원')
		
		if(check){
			var f = document.getElementById('auth_form');
			f.submit();
		}// end if(check)
		
	});
	
	if ('${update_auth_result}' == 'success') {
		alert('권한 수정이 완료되었습니다.');
	} else if ('${update_auth_result}' == 'fail') {
		alert('권한 수정이 실패되었습니다.');
	}
	

</script>

</body>
</html>