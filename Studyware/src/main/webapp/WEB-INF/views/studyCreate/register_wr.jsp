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
						</span> <br /> 
	
						<label for="studyOption">스터디 분류 <p style="color: red; display: inline;">(*)</p></label><br> 
						<select id='depthOne' name='depthOne'>
							<option value='' selected>선택</option>
							<c:forEach items="${depth1List}" var="depth1">
								<option id='depth1' value='${depth1}'>${depth1}</option>
							</c:forEach>
						</select>
						
						<label for="id">아이디 <p style="color: red; display: inline;">(*)</p> </label><br>
						<input type="text" pattern="[A-Za-z0-9]*" style="ime-mode: disabled; width: 60%;" id="id" name="id" placeholder="아이디" /><br><br>  
						
						<label for="pwd">비밀번호 	<p style="color: red; display: inline;">(*)</p> </label><br> 
						<input type="password" id="pwd" style="width: 60%;"	placeholder="비밀번호" /><br><br>
						
						<label for="pwd2">비밀번호 확인</label><br> 
						<input type="password" id="pwd2" name="pwd" style="width: 60%;" placeholder="비밀번호 확인"><br><br> 
						
						<label for="name">이름 <p style="color: red; display: inline;">(*)</p> </label><br> 
						<input type="text" id="name" name="name" style="width: 60%;" placeholder="이름을 입력해 주세요"><br><br>  
						
						<label for="nick">닉네임이름 <p style="color: red; display: inline;">(*)</p></label><br> 
						<input type="text" id="nick" name="nick" style="width: 60%;" placeholder="닉네임"> <br><br>  
						
						<!--<textarea id="depthTwo" name="depth2" placeholder="지역2"></textarea><br><br>-->      
						<textarea id="region_no" style="display:none;" name="region_no" placeholder="지역 번호"></textarea><br>         
										
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
	




</body>
</html>