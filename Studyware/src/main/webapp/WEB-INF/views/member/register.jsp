<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>Insert title here</title>

<style>
#topMenu {
	height: 30px; /* 메인 메뉴의 높이 */
	width: 850px; /* 메인 메뉴의 넓이 */
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
	margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
	padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: white; /* 글씨 색을 흰색으로 설정 */
	background-color: #2d2d2d; /* 배경 색을 RGB(2D2D2D)로 설정 */
	float: left; /* 왼쪽으로 나열되도록 설정 */
	line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	text-align: center; /* 텍스트를 가운데로 정렬 */
	position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
}

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	text-decoration: none; /* a 태그의 꾸밈 효과 제거 */
	display: block; /* a 태그의 클릭 범위를 넓힘 */
	width: 150px; /* 기본 넓이를 150px로 설정 */
	font-size: 12px; /* 폰트 사이즈를 12px로 설정 */
	font-weight: bold; /* 폰트를 굵게 설정 */
	font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
}



.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: white;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: red; /* 글씨 색 빨간색 */
	background-color: #4d4d4d; /* 배경색을 밝은 회색으로 설정 */
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #2d2d2d; /* 글씨 색을 RGB(2D2D2D)로 설정 */
	background-color: white; /* 배경색을 흰색으로 설정 */
	border: solid 1px black; /* 테두리를 설정 */
	margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 150px; /* 넓이는 190px로 설정 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */
	height: 0px; /* 초기 높이는 0px로 설정 */
	overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
	-webkit-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
	-moz-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
	-o-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
}

.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: 600px; /* 높이를 93px로 설정 */
}

.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
	color: red; /* 글씨색을 빨간색으로 설정 */
	background-color: #dddddd; /* 배경을 RGB(DDDDDD)로 설정 */
}
</style>


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
						
						<nav id="topMenu">
							<ul>
								<li class="topMenuLi"><a class="menuLink">지역1</a>
									<ul class="submenu">							
										<c:forEach items="${depth1List}" var="depth1">
											<li id="submenuLi"><a class="submenuLink longLink" id="memberRegionDepth1">${depth1}</a></li>
										</c:forEach>
									</ul>
								</li>
								<li>|</li>
								<li class="topMenuLi"><a class="menuLink">지역2</a>
									<ul class="submenu">
										<c:forEach begin="1" end="100">
											<li	><a class="submenuLink longLink">지역명</a></li>
										</c:forEach>
									</ul>
								</li>
								<li>|</li>
								
							</ul>
						</nav>
						
						<input type="text" id="depth1Name" name="depth1" style="width: 30%; display: inline;" placeholder="지역1">
						<input type="text" id="depth2Name" name="depth2" style="width: 30%; display: inline;" placeholder="지역2"><br> <br>
					
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
			
			// id 중복 체크      
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

			var cellPhone = document.getElementById('phone');
			cellPhone.onkeyup = function(event) {
				event = event || window.event;
				var _val = this.value.trim();
				this.value = autoHypenPhone(_val);
			}

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
				console.log('ㅎㅇㅎㅇ');
				location = '../../studyware';
			});
			
			
			$('#topMenu .topMenuLi .submenu #submenuLi #memberRegionDepth1').click(function() {
				var depth1 = $('#memberRegionDepth1').val();

				console.log(depth1);
				alert(depth1);
				
				$('#depth1Name').html(depth1);
			});
		});
		
	</script>

</body>
</html>