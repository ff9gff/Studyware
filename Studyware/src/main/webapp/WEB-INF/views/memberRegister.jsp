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

	<div style="text-align: center; vertical-align: middle; background-color: white; height: 100%">

		<div style="display: inline-block; vertical-align: middle; background-color: white; width: 50%; height: 100%; text-align: center;">
		
			<!-- <br/> -->
			<div style="width: 100%; text-align: center;">

				<form id="register_form" name="register_form" action="sign_up"
					method="post" style="text-align: left;">
			
					<div style="margin-left: 5%; margin-right: 5%">
						<span>
							<p style="color: red; display: inline;">(*)</p> 항목은 반드시 입력해 주세요.
						</span> <br /> 
						
						<label for="id">아이디 <p style="color: red; display: inline;">(*)</p> </label><br>
						<input type="text" pattern="[A-Za-z0-9]*" style="ime-mode: disabled; width: 60%;" id="id" name="id" placeholder="아이디" /><br><br>  
						
						<label for="pwd">비밀번호 	<p style="color: red; display: inline;">(*)</p> </label><br> 
						<input type="password" id="pwd" style="width: 60%;"	placeholder="비밀번호" /><br><br>
						
						<label for="pwd2">비밀번호 확인</label><br> 
						<input type="password" id="pwd2" name="pwd" style="width: 60%;" placeholder="비밀번호 확인"><br><br> 
						
						<label for="username">이름 <p style="color: red; display: inline;">(*)</p> </label><br> 
						<input type="text" id="name" name="name" style="width: 60%;" placeholder="이름을 입력해 주세요"><br><br>  
						
						<label for="nick">닉네임이름 <p style="color: red; display: inline;">(*)</p></label><br> 
						<input type="text" id="nick" name="nick" style="width: 60%;" placeholder="닉네임"> <br><br>  
						
						<label for="region_no">지역 <p style="color: red; display: inline;">(*)</p></label><br> 
						<input type="text" id="region_no" name="region_no" style="width: 60%;" placeholder="지역"><br> <br> 
						
						<label for="region_no">지역 <p style="color: red; display: inline;">(*)</p></label><br> 
						<input type="text" id="region_no" name="region_no" style="width: 60%;" placeholder="지역"><br> <br> 
						
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
			
			$('#id').change(function() {
				$.ajax({
					type : 'post',
					url : 'checkid',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},
					data : JSON.stringify({
						userid : $('#id').val()
					}),
					success : function(response) {
						if (response == 'NOK') {
							$('#result_id').html('이미 사용 중인 아이디입니다');
							$('#result_id').css('color', 'red');
						} else {
							$('#result_id').html('사용 가능한 아이디입니다');
							$('#result_id').css('color', 'blue');
						}
					}

				});

			});

			// pwd 동일 체크      
			$('#pwd2').change(function() {
				if ($('#pwd').val() != $('#pwd2').val()) {
					$('#check-pwd').html('비밀번호가 일치하지 않습니다');
					$('#check-pwd').css('color', 'red');
					$('#pwd').val('');
					$('#pwd2').val('');
				} else {
					$('#check-pwd').html('비밀번호가 일치합니다');
					$('#check-pwd').css('color', 'blue');

				}
			});

			// 닉네임 중복 체크
			$('#nick').change(function() {
				$.ajax({
					type : 'post',
					url : 'checknick',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},
					data : JSON.stringify({
						nickname : $('#nick').val()
					}),
					success : function(response) {
						if (response == 'NOK') {
							$('#result_nick').html('이미 사용 중인 닉네임 입니다.');
							$('#result_nick').css('color', 'red');
						} else {
							$('#result_nick').html('사용 가능한 닉네임 입니다.');
							$('#result_nick').css('color', 'blue');
						}
					}

				});

			});

			// 휴대폰 번호
			function autoHypenPhone(str) {
				str = str.replace(/[^0-9]/g, '');
				var tmp = '';
				if (str.length < 4) {
					return str;
				} else if (str.length < 7) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3);
					return tmp;
				} else if (str.length < 11) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 3);
					tmp += '-';
					tmp += str.substr(6);
					return tmp;
				} else {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 4);
					tmp += '-';
					tmp += str.substr(7);
					return tmp;
				}
				return str;
			}

			//   var cellPhone = $('#mobile'); // document.getElementById('mobile') 와 완벽한 같은 객체는 아니다.
			var cellPhone = document.getElementById('phone');
			cellPhone.onkeyup = function(event) {
				event = event || window.event;
				var _val = this.value.trim();
				this.value = autoHypenPhone(_val);
			}

			// 우편번호 API : https://postcodify.poesis.kr
			// 우편번호 API 다음 서비스 : http://postcode.map.daum.net/guide#sample
			// $("#postcodify_search_button").postcodifyPopUp();

			// 이메일 인증
			var auth_code;
			$('#btn_send_certification').click(function() {
				var email = $('#email').val();

				if (email == '') {
					alert('이메일을 입력해주세요');
				} else {
					alert('인증번호가 전송되었습니다.');
					$.ajax({
						type : 'post',
						url : 'email_auth',
						headers : {
							'Content-Type' : 'application/json',
							'X-HTTP-Method-Override' : 'POST'
						},
						/*           data: JSON.stringify({
						            email: $('#email').val()
						         }), */
						data : $('#email').val(),
						success : function(response) {
							if (response != null) {
								auth_code = response;

							}
						}
					});
				}
			});
			
		

			var final_check = 0; // 인증번호 입력시 회원가입이 되기 위하여...

			// 인증번호 입력 확인
			$('#btn_check_certification').click(function() {
				if ($('#email_certification').val() == auth_code) {
					alert('인증번호가 확인 되었습니다.');
					final_check = 1;

				} else {
					alert('인증번호를 다시 확인 해주길 바랍니다.');
				}
			});

			/** 
			 * 폼요소 초기화 
			 * Reset form element
			 * 
			 * @param e jQuery object
			 */
			/* function resetFormElement(e) {
			   e.wrap('<form>').closest('form').get(0).reset(); 
			   //리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
			   //감싼 폼 ( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
			   //DOM에서 제공하는 초기화하는 메서드 reset()을 호출
			   e.unwrap(); //감싼 <form> 태그를 제거
			} */

			$('#submit_OK').click(function() {
				if (final_check == 1) {
					$("#register_form").submit();
				} else {
					alert('이메일 인증 및 이메일 인증번호 확인을 해 주세요!');
				}
			});
			$("#submit_Cancel").click(function() {
				console.log('앙기모띠');
				location = '../studyware';
			});
		});
	</script>

</body>
</html>