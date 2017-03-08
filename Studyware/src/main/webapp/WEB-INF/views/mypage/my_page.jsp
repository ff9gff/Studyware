<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이페이지 메인</h1>

<button id="btn_progress">진행중인스터디</button>
<div id="progress">
	<jsp:include page="../studyCreate/progress.jsp" flush="false">
		<jsp:param name="data" value="1"/>
	</jsp:include>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

</script>

</body>
</html>