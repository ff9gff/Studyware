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
</style>

<title>Insert title here</title>
</head>
<body>



<form id="msg_form" action="admin/msg" method="post" target="testpop">
	<input type="hidden" id="msg_setter" name="msg_setter" value="1"/>
	<div id ="msg_getter"></div>
</form>


<button>전체 쪽지보내기</button>
<button id="btn_msg">쪽지보내기</button>
<button>강퇴</button>
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
			<td>${member.id}</td>
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

	// 쪽지 보내기
 	$('#btn_msg').click(function(){
		// msg_getter 세팅
		var chkObj = document.getElementsByName("rowCheck");
		
		for(var i = 0; i < chkObj.length; i++){
			if(chkObj[i].checked == true){
				console.log(chkObj[i].value);
				$('#msg_getter').append('<input type="hidden" name="msg_getter" value="'+chkObj[i].value+'">');
			}
		}// end for
		
 		// 쪽지 보내기 실행
 		var f = document.getElementById('msg_form');
		var popOption = "width=400, height=500, resizble=no, scrollbars=no, status=no";
		
		window.open('',"testpop" ,popOption);
		f.submit();  

		$('#msg_getter').html('');

	}); 


</script>

</body>
</html>