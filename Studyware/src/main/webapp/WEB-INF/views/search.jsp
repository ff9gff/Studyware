<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	검색페이지 
	<a href="../studyware">홈으로</a>

	<div
		style="text-align: center; vertical-align: middle; background-color: white; height: 100%">

		<div
			style="display: inline-block; vertical-align: middle; background-color: white; width: 50%; height: 100%; text-align: center;">

			<!-- <br/> -->
			<div style="width: 100%; text-align: center;">

				<form action="search_study" method="post">

					<div style="margin-left: 5%; margin-right: 5%">

						<input type="text" id="title" name="title" placeholder="검색어를 입력하세요" style="width: 60%;" required />
						<button type="button" id="btn_search" name="btn_search" style="width: 30%;">검색</button>
						
						<hr />

					</div>

					<br />

				</form>

			</div>

		</div>

	</div>

	<script>
			
			$('#btn_search').click(function() {
				
				var success_code;
				
				var title = $('#title').val();

				if (title == '') {
					alert('검색어를 입력해주세요');
				} else {
					alert('검색어가 전송되었습니다.');
					$.ajax({
						type : 'post',
						url : 'search_study',
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'POST'
						},
						/*           data: JSON.stringify({
						            email: $('#email').val()
						         }), */
						data : title,
						success : function(response) {
							if (response != null) {
								success_code = response;
								console.log("ㅎㅇ");
							}
						}
			
					});
				}
			});
		
	</script>

</body>
</html>