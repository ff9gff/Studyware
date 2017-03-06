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
<form id="msg_form" method="post" action="../insertMsg">
	<span>보내는이</span>
	<input name="msg_setter" value="${msg_setter }"/>
	<br>
	<span>받는이</span>
	<c:forEach items="${msg_getter }" var="getter">
		<input name="msg_getter" value="${getter }"/>
		<br>
	</c:forEach>
	<textarea name="msg_content"></textarea>
	
</form>

<button id="send_button">보내기</button>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>


$('#send_button').click(function(){
	var f = document.getElementById('msg_form');
	f.submit();

});

if ('${insert_result}' == 'success') {
	alert('쪽지 보내기 성공!');
	self.close();
	
} else if ('${insert_result}' == 'fail') {
	alert('쪽지 보내기 실패!');
	self.close();
}


</script>

</body>
</html>