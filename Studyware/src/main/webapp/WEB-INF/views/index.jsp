<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>



	<c:if test="${empty id }">
		<a href="member/register">회원가입</a>
		<a href="member/login">로그인</a>
		<a href="search">검색</a>
	</c:if>
	
	<c:if test="${not empty id }">
		${ name } 님 방가워용.. 
		회원번호: ${ member_no }
		<a href="logout">로그아웃</a>
		<a href="search">검색</a>
		<a href="msgbox?member_no=1">쪽지함</a>
		<a href="studyCreate/register">스터디 등록</a>
		<a href="studyCreate/quickOpen">바로개설</a>
	</c:if>
	
	<br><br>	
	
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
	
	<div id="RecruitDetail">

	</div>
	
	<script>
	
	$(document).ready(function() {
		
		get_default_recruit();
	
		// 디폴트로 나오는 후기 게시글 데이터를 가져오기
		function get_default_recruit() {
			
			DefaultRecruit = [];
			
			$.ajax({
				type : 'GET',
				url : '/studyware/index/defaultRecruit',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'GET'
				},	
				success : function(data){	
					$(data).each(function() {	
						DefaultRecruit.push({recruit_title: this.recruit_title, recruit_no: this.recruit_no});	
					});	
					push_default_recruit(DefaultRecruit);
				}
			});
				
		};//end of getThumnails()
		
		// 가져온 데이터를 뿌려주자
		function push_default_recruit(DefaultRecruit) {
						
			var list = '';
			
			var length = 0;
			
			if (DefaultRecruit.length < 4) {
				length = DefaultRecruit.length;
			} else {
				length = 4;
			}
			// 무조건 4개만 뿌린다!
			
			for(var i = 0; i < length; i++){
		
				list += '<div>'
					  + '<a href="/studyware/studyCreate/register_re?recruit_no=' + DefaultRecruit[i].recruit_no + '">'
					  + DefaultRecruit[i].recruit_title
					  + '</a>'
					  + '</div>';
			}

			$('#RecruitDetail').html(list);
		};
		
	});
		
	</script>

</body>
</html>
