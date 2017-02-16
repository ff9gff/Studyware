<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<title>같이가자</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 
Flex Template 
http://www.templatemo.com/tm-406-flex
-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>



<style>
.searchRegion {
	display: none;
}

a:link {
	color: red;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: blue;
	text-decoration: underline;
}
<!--
a:link : 클릭하지 않은 링크

a:visited : 한번 클릭했던 혹은 다녀갔던 링크

a:hover : 링크를 클릭하려고 마우스를 가져갔을 때

decoration : 밑 줄 

none : 없는 상태

underline : 있는 상태

-->
</style>
</head>
<body>

	<div style="text-align: center; vertical-align: middle; background-color: white; height: 100%">
		
		<div style="display: inline-block; vertical-align: middle; background-color: white; width: 50%; height: 100%; text-align: center;">

			<div style="width: 100%; text-align: center;">

				<h2>로그인</h2>
				<br /> <br />

				<form action="../member/login-post" method="post">

					<div style="margin: 5px;">
						<input type="text" name="id" id="id" placeholder="아이디" required />
					</div>

					<br />

					<div style="margin: 5px;">
						<input type="password" name="pwd" id="pwd" placeholder="비밀번호" 	required />
					</div>

					<br /> <br /> 
					
					<input type="submit" value="로그인" />

					<%-- "로그인" 버튼을 클릭했을 때 서버로 ff쿼리 스트링을 보내기 위해서 --%>
					<%
						System.out.println(request.getQueryString());
					%>
					
					<input type="hidden" name="query" value="<%=request.getQueryString()%>" />
					
				</form>

				<a href="find_id">아이디</a>·<a href="find_password">비밀번호 찾기</a>&nbsp;&nbsp;<a 	href="register">회원가입</a>

			</div>
			
		</div>
		
	</div>

</body>
</html>