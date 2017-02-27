<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>여기는 쪽지함입니다.</h1>

<h1>받은쪽지함</h1>
<table id ="msg_list">
	<tr>
		<th><input id="allCheck" type="checkbox"></th>
		<th>보낸사람</th>
		<th>내용</th>
		<th>날짜</th>
		<th>상태</th>
	</tr>
	<c:forEach var="msg" items="${msgList}">
		<tr class="msg">
			<td><input class="rowCheck" name="rowCheck" type="checkbox" value="${msg_no}"></td>
			<td><c:out value="${nickMap[msg.se_member_no]}"/></td>
			<td>${msg.content}</td>
			<td><fmt:formatDate value="${msg.reg_date}" pattern="yyyy-MM-dd"/></td>
			<td>${msg.state}</td>
	
		</tr>
	</c:forEach>
</table>

</body>
</html>