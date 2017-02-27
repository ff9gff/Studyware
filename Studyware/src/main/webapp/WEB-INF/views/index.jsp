<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>Home</title>
</head>
<body>

	<a href="member/register">회원가입</a>

	<a href="member/login">로그인</a>
	
	<a href="msgbox?member_no=1">쪽지함</a>
	
	<a href="studyCreate/register">스터디 등록</a>
	
	<a href="search">검색</a> <br><br><br>
	
	<a href="studyCreate/studyLevelTest">공부수준 등록 연습</a>
	
	<form action=""> </form>
	
	<div
		style="text-align: center; vertical-align: middle; background-color: white; height: 100%">

		<div
			style="display: inline-block; vertical-align: middle; background-color: white; width: 50%; height: 100%; text-align: center;">

			<!-- <br/> -->
			<div style="width: 100%; text-align: center;">

				<form action="search_study" method="post">

					<div style="margin-left: 5%; margin-right: 5%">

						<input type="text" id="title" name="title" placeholder="검색어를 입력하세요" style="width: 60%;" required />
						<button type="button" id="btn_search" name="btn_search" style="width: 12%;">검색</button>
						<a href="">상세검색</a>
						
						<hr />

					</div>

					<br />

				</form>

			</div>

		</div>

	</div>

	

</body>
</html>
