<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<div style="text-align: center; vertical-align: middle; background-color: white; height: 100%">

		<div style="display: inline-block; vertical-align: middle; background-color: white; width: 50%; height: 100%; text-align: center;">
		
			<!-- <br/> -->
			<div style="width: 100%; text-align: center;">

				<form id="register_form" name="register_form" action="study_create"
					method="post" style="text-align: left;">
			
					<div style="margin-left: 5%; margin-right: 5%">
						<span>
							<p style="color: red; display: inline;">(*)</p> 항목은 반드시 입력해 주세요.
						</span> <br /> <br /> 
	
						<label for="studyOption">스터디 분류 <p style="color: red; display: inline;">(*)</p></label><br> 
						<select id='studyCate' name='studyCate'>
							<option value='' selected>선택</option>
							<c:forEach items="${recruitCateList}" var="name_recruit_cate">
								<option id='depth1' value='${name_recruit_cate}'>${name_recruit_cate}</option>
							</c:forEach>
						</select><br> <br> 
						
						<label for="depthOne">지역 선택 <p style="color: red; display: inline;">(*)</p></label><br> 
						<select id='depthOne' name='depthOne'>
							<option value='' selected>선택</option>
							<c:forEach items="${depth1List}" var="depth1">
								<option id='depth1' value='${depth1}'>${depth1}</option>
							</c:forEach>
						</select>
						
						<select id='depthTwo' name='depthTwo'>
						</select><br> <br> 
						<textarea id="region_no" style="display:none;" name="region_no" placeholder="지역 번호"></textarea> 
					
						<label for="study_name">스터디 제목 <p style="color: red; display: inline;">(*)</p> </label><br> 
						<input type="text" id="study_name" name="study_name" style="width: 60%;" placeholder="스터디 제목을 입력해 주세요"><br><br>  
							
						
						<!--<textarea id="depthTwo" name="depth2" placeholder="지역2"></textarea><br><br>-->      
						       
										
						<label for="phone">핸드폰 번호	<p style="color: red; display: inline;">(*)</p>	</label><br> 
						<input type="text" id="phone" name="phone" style="width: 60%;" placeholder="핸드폰 번호"><br> <br>  
						
						<label for="email">이메일	<p style="color: red; display: inline;">(*)</p> </label><br /> 
						<input type="email" id="email" name="email" placeholder="이메일" 	style="width: 60%;" required />
						<button type="button" id="btn_send_certification" name="btn_send_certification" style="width: 30%;">인증번호 전송</button><br><br> 
						
						<label for="email_certification">인증번호 <p style="color: red; display: inline;">(*)</p>	</label><br /> 
						<input type="text" id="email_certification" placeholder="인증번호" style="width: 60%;" />
						<button type="button" id="btn_check_certification" style="width: 30%;">인증번호 확인</button> <br> <br>
			
			
						<hr />
			
					</div>
			
					<br />
			
					<div style="width: 100%; display: inline-block; text-align: center;">
						<div style="width: 25%; display: inline-block;; text-align: center;">
							<button type="button" id="submit_OK">회원가입</button>
						</div>
			
						<div style="text-align: center; width: 25%; display: inline-block;">
							<button type="button" id="submit_Cancel">가입취소</button>
						</div>
					</div>
				</form>
				
			</div>
			
		</div>
		
	</div>
	
	<script>
	
		$(document).ready(function() {

			// 지역 선택
			// 1. 1차 지역 선택
			// 2. 1차 지역에 해당되는 2차 지역 리스트 (ajax)
			// 3. 2차 지역 선택
			// 4. 1,2차 지역 가지고 지역 코드 찾기 (ajax)
			var list = '';
			list += '<option value="" selected>선택</option>'
			$('#depthTwo').html(list);
			
			var city1;
			var city2;
			
			$('#depthOne').change(function() {
				
				depth2List = [];
				city1 = $(this).val();
				
				if (city1 == '선택') {
					alert('시/도를 입력해주세요');
				} else {	
					$.ajax({
						type : 'post',
						url : '../member/region2',
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'POST'
						},	
						data : city1,
						success : function(data){	
							$(data).each(function() {	
								depth2List.push({depth2: this.depth2});	
							});	
							getAllRegion2(depth2List);
						}
					});
				}
			});
	
			// 디폴트로 나오는 후기 게시글 데이터를 가져오기
			function getAllRegion2(depth2List) {

				for(var i=0; i<depth2List.length; i++){
					console.log(depth2List[i].depth2);
				}
	
				for(var i = 0; i<depth2List.length; i++){
					list += '<option id="depth2" value=' + depth2List[i].depth2 + '>' + depth2List[i].depth2 + '</option>';
				}
				
				$('#depthTwo').html(list);
				list = '';
			} 
				//end of getThumnails()*/
		
		
			var region_no;
			
			$('#depthTwo').change(function() {
				city2 = $(this).val();
				
				if (city2 == '선택') {
					alert('시/구를 입력해주세요');
				} else {
					$.ajax({
						type : 'get',
						url : '../member/region_no_select',
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'POST'
						},
						data : {'city1': city1, 'city2': city2},
						success : function(response) {
							if (response != null) {
								alert(response);
								region_no = response;
								$('#region_no').html(region_no);
							}
						}
					});					
				}		
			});
		
		});

	</script>



</body>
</html>