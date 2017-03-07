<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지</title>
</head>
<body>

<h1>쪽지보기</h1>
<form id="msg_form" method="post" action="/studyware/popupMsg" target="popupMsg">
	<span>보내는이</span>
	<input name="msg_getter" value="${msgVO.se_member_no }"/>
	<br>
	<span>받는이</span>
		<input name="msg_setter" value="${msgVO.re_member_no }"/>
	<textarea name="msg_content">${msgVO.content}</textarea>
	
</form>

<c:if test="${readType eq 'getter' }">
<button id="send_button">답장하기</button>
</c:if>
<button id="close_button">닫기</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>


$('#send_button').click(function(){
	var f = document.getElementById('msg_form');
	var popOption = "width=400, height=300, resizble=no, scrollbars=no, status=no";

	window.open('',"popupMsg" ,popOption);
	f.submit();
	self.close();


});

$('#close_button').click(function(){
	self.close();
});


</script>

</body>
</html>