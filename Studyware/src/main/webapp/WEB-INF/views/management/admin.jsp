<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form id="msg_form1">
	<input type="hidden" id="msg_setter" name="msg_setter" value="1"/>
	<input type="hidden" id="msg_getter" name="msg_getter" value="2"/>
	<input type="hidden" id="msg_address" name="msg_adress" value=""/>
</form>
<button id="button1">한명 팝업</button>

<form id="msg_form2">
	<input type="hidden" id="msg_setter" name="msg_setter" value="1"/>
	<input type="hidden" id="msg_getter" name="msg_getter" value="2"/>
	<input type="hidden" id="msg_getter" name="msg_getter" value="3"/>
	<input type="hidden" id="msg_address" name="msg_adress" value=""/>
</form>
<button id="button2">두명 팝업</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
$('#button1').click(function(){
	var f = document.getElementById('msg_form1');
	
	var url    ="admin/msg";
	var title  = "testpop";
	var popOption = "width=400, height=500, resizble=no, scrollbars=no, status=no";
	
	window.open('',title ,popOption);
	f.target = title;       
	f.action = url;             
	f.method = "post";
	f.submit();  
}); 


 	$('#button2').click(function(){
		var f = document.getElementById('msg_form2');
		
		var url    ="admin/msg";
		var title  = "testpop";
		var popOption = "width=400, height=500, resizble=no, scrollbars=no, status=no";
		
		window.open('',title ,popOption);
		f.target = title;       
		f.action = url;             
		f.method = "post";
		f.submit();  
	}); 


</script>

</body>
</html>