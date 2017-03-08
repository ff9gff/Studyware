<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<p>${ name } 님 방가워용.. 
	회원번호: ${ member_no }
	
	${recruit_no}번 게시글입니다.
	
	${recruitVO.level_no}레벨입니다.
	
	<div style="text-align: center; vertical-align: middle; background-color: white; height: 100%">

		<div style="display: inline-block; vertical-align: middle; background-color: white; width: 50%; height: 100%; text-align: center;">
		
			<!-- <br/> -->
			<div style="width: 100%; text-align: center;">

				<form id="register_form" name="register_form" action="recruit_update"	
					method="POST" style="text-align: left;">
			
					<div style="margin-left: 5%; margin-right: 5%">
						<span>
							<p style="color: red; display: inline;">(*)</p> 항목은 반드시 입력해 주세요.
						</span> <br /> <br />
						
						<input type="hidden" name="board_name_no" value="1" readonly="readonly" /> 
						
						<input type="hidden" name="member_no" value="${recruitVO.member_no}" readonly="readonly" /> 
						
						<input type="hidden" name="num_now" value="1" readonly="readonly" /> 
						
						<input type="hidden" name="num_max" value="5" readonly="readonly" /> 
						
						<input type="hidden" name="recruit_no" value="${recruit_no	 }" readonly="readonly" /> 

						<input type="hidden" name="level_no" value="${recruitVO.level_no }" readonly="readonly" /> 
					
												
						<label for="recruitOption">모집 구분 <p style="color: red; display: inline;">(*)</p></label><br> 
						<select id='recruitType' name='recruitType'>
							<option value='' selected>선택</option>
							<c:forEach items="${recruitTypeList}" var="name_recruit_type">
								<option id='recruit_type' value='${name_recruit_type}'>${name_recruit_type}</option>
							</c:forEach>
						</select><br>
						<textarea id="recruit_type_no" name="recruit_type_no" placeholder="모집 구분 번호">${recruitVO.recruit_type_no}</textarea> <br> <br>  
						
	
						<label for="studyCate">스터디 분류 <p style="color: red; display: inline;">(*)</p></label><br> 
						<select id='studyCate' name='studyCate'>
							<option value='' selected>선택</option>
							<c:forEach items="${recruitCateList}" var="name_recruit_cate">
								<option id='study_cate' value='${name_recruit_cate}'>${name_recruit_cate}</option>
							</c:forEach>
						</select><br> 
						<textarea id="recruit_cate_no" name="recruit_cate_no" placeholder="스터디 분류 번호">${recruitVO.recruit_cate_no}</textarea> <br> <br>  
						
						
						<label for="depthOne">지역 선택 <p style="color: red; display: inline;">(*)</p></label><br> 
						<select id='depthOne' name='depthOne'>
							<option value='' selected>선택</option>
							<c:forEach items="${depth1List}" var="depth1">
								<option id='depth1' value='${depth1}'>${depth1}</option>
							</c:forEach>
						</select>
						
						<select id='depthTwo' name='depthTwo'>
						</select><br> 
						<textarea id="region_no" name="region_no" placeholder="지역 번호">${recruitVO.region_no}</textarea> <br> <br> 
					
						<label for="study_name">스터디 제목 <p style="color: red; display: inline;">(*)</p> </label><br> 
						<input type="text" id="recruit_title" name="recruit_title" value="${recruitVO.recruit_title}" placeholder="스터디 제목을 입력해 주세요" style="width: 60%;"><br><br>  						       
										 
						<div id="study_plus">
							<table id="studyTable">
								<tr>
									<td>
										<input type="text" name="level1_name" placeholder="내용" style="width: 20%;"/>
										<select id='level1_value' name='level1_value'>
											<option value='' selected>선택</option>
											<c:forEach items="${levelList}" var="level_name">
												<option id='level1_value' value='${level_name}'>${level_name}</option>
											</c:forEach>
										</select>
										<input id="addButton" name="addButton" type="button" style="cursor:hand;" onclick="insRow()" value="추가">
									</td><br />
								</tr>
							</table>						
						</div> <br /> 
																		
						<input type="text" id="recruit_date" name="recruit_date" value="${recruitVO.recruit_date}" placeholder="마감일" style="border:none;"> <br /> <br />
						
				 		<div>
							<textarea id="study_content" name="recruit_content" style="width: 100%" rows="15" placeholder="스터디 소개" required>${recruitVO.recruit_content}</textarea>
						</div>					

					</div>
			
					<br />
				</form>
				
				<div style="width: 100%; display: inline-block; text-align: center;">
						<div style="width: 25%; display: inline-block;; text-align: center;">
							<button type="button" id="recruit_update_OK">등록정보 변경</button>
						</div>
			
						<div style="text-align: center; width: 25%; display: inline-block;">
							<button type="button" id="recruit_update_Cancel">변경 취소</button>
						</div>
					</div><br /><br />
				
			</div>
			
		</div>
		
	</div>
	
	<script>
		
////////////////////////////////////////////////////////////////////////////////////////////
			
		// 1. 모집구분 내용을 가지고 모집구분 번호를 찾는다
		var recruit_type_no;
		var recruit_type_name;

		$('#recruitType').change(function() {
			
			recruit_type_name = $(this).val();
			
			alert(recruit_type_name);
			
			if (recruit_type_name == '선택') {
				alert('모집 구분을 선택하세요');
			} else {	
				$.ajax({
					type : 'POST',
					url : '../studyCreate/studyType',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},	
					data : recruit_type_name,
					success : function(data){	
						recruit_type_no = data;
						alert("모집 구분 번호: " + recruit_type_no);
						$('#recruit_type_no').html(recruit_type_no);
					}
				});
			}
		});
			
////////////////////////////////////////////////////////////////////////////////////////////
			
		// 2. 스터디종류 내용을 가지고 스터디종류 번호를 찾는다
		var recruit_cate_no;
		var recruit_cate_name;

		$('#studyCate').change(function() {
			
			recruit_cate_name = $(this).val();
			
			alert(recruit_cate_name);
			
			if (recruit_cate_name == '선택') {
				alert('스터디 종류를 선택하세요');
			} else {	
				$.ajax({
					type : 'POST',
					url : '../studyCreate/studyCate',
					headers : {
						'Content-Type' : 'application/json',
						'X-HTTP-Method-Override' : 'POST'
					},	
					data : recruit_cate_name,
					success : function(data){	
						recruit_cate_no = data;
						alert("모집 구분 번호: " + recruit_cate_no);
						$('#recruit_cate_no').html(recruit_cate_no);
					}
				});
			}
		});
			
////////////////////////////////////////////////////////////////////////////////////////////
						
		// 3. 스터디 진행할 지역 선택
		var list = '<option value="" selected>선택</option>';
		$('#depthTwo').html(list);
		
		var city1;
		var city2;
		
		$('#depthOne').change(function() {
			list = '';
			list += '<option value="" selected>선택</option>';
			
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
	
////////////////////////////////////////////////////////////////////////////////////////////
			
		// 4. 지역1을 통해 받아온 지역2 리스트를 뿌려준다
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
		
////////////////////////////////////////////////////////////////////////////////////////////
		
		// 5. 지역1과 지역2 정보를 가지고 최종적인 지역 번호를 찾는다
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
						'X-HTTP-Method-Override' : 'get'
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
			
////////////////////////////////////////////////////////////////////////////////////////////
			
		// 6. 공부 내용 추가/삭제 (최소 1개, 최대 5개)

     	// Region Table
		var oTbl;
		var click = 0;
	
		//Row 추가
		function insRow() {
			click++;
			if (click < 5) {
				oTbl = document.getElementById("studyTable");
				var oRow = oTbl.insertRow();
				oRow.onmouseover=function(){oTbl.clickedRowIndex=this.rowIndex}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
				var oCell = oRow.insertCell();
				
				//삽입될 Form Tag
				var frmTag = "<input type=text name=level" + (click + 1) +  "_name placeholder=내용 style='width: 20%;'>";
				frmTag += " <select id='level" + (click + 1) + "_value' name='level" + (click + 1) + "_value'> ";
				frmTag += " <option value='' selected>선택</option>";
				frmTag += " <option value='상'>상</option>";
				frmTag += " <option value='중'>중</option>";
				frmTag += " <option value='하'>하</option>";
				frmTag += "	</select>";
				frmTag += " <input type=button value='삭제' onClick='removeRow()' style='cursor:hand'><br>";
				
				// $('#plusLevel').html(frmTag);
				oCell.innerHTML = frmTag;
				
				
			} else {
				alert("공부 항목은 최대 5개까지 입니다!");
			}
			
		}
	
		//Row 삭제
		function removeRow() {
			oTbl.deleteRow(oTbl.clickedRowIndex);
			click--;
			
			if (click == 1) {
				click = 0;
			}
		}
		
		$('#level1_value').change(function() {
			alert($(this).val());
		});
		$('#level2_value').change(function() {
			alert($(this).val());
		});
		$('#level3_value').change(function() {
			alert($(this).val());
		});
		$('#level4_value').change(function() {
			alert($(this).val());
		});
		$('#level5_value').change(function() {
			alert($(this).val());
		});
	        
////////////////////////////////////////////////////////////////////////////////////////////
			
		// 7. 스터디 모집글을 등록한다
        $('#recruit_update_OK').click(function() {
        	alert('일해라');
			$("#register_form").submit();
			
		});
		
		// 8. 스터디 모집글 작성을 취소한다
		$("#recruit_update_Cancel").click(function() {
			location = '../../studyware/studyCreate/register_detail?recruit_no=' + ${recruitVO.recruit_no};
		});
		
////////////////////////////////////////////////////////////////////////////////////////////
			
		$(function() { //전역변수선언
			
			$("#end_date, #recruit_date").datepicker({
				dateFormat : 'yy-mm-dd'
			});
		});
		
	</script>



</body>
</html>