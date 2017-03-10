<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<link rel="stylesheet" href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
<script src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>
<title>Insert title here</title>
</head>
<body>

	<p>${ name } 님 방가워용.. 	회원번호: ${ member_no } <br><br><br>
	
	<input type="text" id="start_date" name="start_date" placeholder="시작일" style="border:none; width:70px">  ~ 
	<input type="text" id="end_date" name="end_date" placeholder="종료일" style="border:none; width:70px"> <br /> <br />
	
	<input type="text" id='start_time' name="start_time" placeholder="시작시간" style="border:none; width:70px"> ~ 
	<input type="text" id='end_time' name="end_time" placeholder="종료시간" style="border:none; width:70px"> <br /> <br />
	
	<label><input type='checkbox' id='check_all' class='input_check' /> <b>전체선택</b></label> <br/>
	<label><input type='checkbox' class='input_check' name='weekday1' value='월' /> <b>월</b></label>
	<label><input type='checkbox' class='input_check' name='weekday2' value='화' /> <b>화</b></label>
	<label><input type='checkbox' class='input_check' name='weekday3' value='수' /> <b>수</b></label>
	<label><input type='checkbox' class='input_check' name='weekday4' value='목' /> <b>목</b></label>
	<label><input type='checkbox' class='input_check' name='weekday5' value='금' /> <b>금</b></label>
	<label><input type='checkbox' class='input_check' name='weekday6' value='토' /> <b>토</b></label>
	<label><input type='checkbox' class='input_check' name='weekday7' value='일' /> <b>일</b></label>	 <br /> <br />
	
	<input type="text" id="study_name" name="study_name" placeholder="스터디 제목"/>	<br /> <br />
	
	<input type="text" id="member_id" name="member_id" placeholder="아이디" style="width: 20%;"/>
	<div id="memberSearch">
		
	</div>
					
	

<script>
	        
////////////////////////////////////////////////////////////////////////////////////////////
			
		// 7. 스터디 모집글을 등록한다
        $('#study_submit_OK').click(function() {
        	alert('일해라');
			$("#register_form").submit();
			
		});
		
		// 8. 스터디 모집글 작성을 취소한다
		$("#study_submit_Cancel").click(function() {
			location = '../../studyware';
		});
		
////////////////////////////////////////////////////////////////////////////////////////////
			
		$(function() { //전역변수선언
			
			$("#start_date, #end_date").datepicker({
				dateFormat : 'yy-mm-dd'
			});
		});
		
		$(function() {
		    $('#start_time, #end_time').timepicker();
		});
		    
		$(function(){
		    $("#check_all").click(function(){
		        var chk = $(this).is(":checked");
		        if(chk) $("input").prop('checked', true);
		        else  $("input").prop('checked', false);
		    });
		});
		
		//////////////////////////////////////////////////////////////////////////////////////
		
		// 2. 아이디를 가지고 회원이 존재하는지 찾아보자
		var member_id;
		var member_check;

		$('#member_id').change(function() {
			
			member_id = $(this).val();
			
			alert(member_id);
		
			if (member_id == '' || member_id == null) {
				alert('아이디를 입력하세요');
			} else {	
				$.ajax({
					type : 'POST',
					url : '../studyCreate/directOpen',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},	
					data : member_id,
					success : function(data){	
						member_check = data;
						if (member_check == 1) {
							alert("찾았습니다!");
							addStudyGroupMember(member_id);
						} else {
							alert("존재하지 않는 회원입니다!");
						}
					}
				});
			}
		});
		
		var list = '';
		function addStudyGroupMember(member_id) {
			list = "<a href='http://www.naver.com'>" + member_id + "</a><br/>";
			$('#memberSearch').append(list);
		};
		
	
		
	</script>



</body>
</html>