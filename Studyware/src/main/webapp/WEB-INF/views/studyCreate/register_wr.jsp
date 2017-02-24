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
						
						<label for="recruitOption">모집 구분 <p style="color: red; display: inline;">(*)</p></label><br> 
						<select id='recruitType' name='recruitType'>
							<option value='' selected>선택</option>
							<c:forEach items="${recruitTypeList}" var="name_recruit_type">
								<option id='recruit_type' value='${name_recruit_type}'>${name_recruit_type}</option>
							</c:forEach>
						</select><br> <br>  
						<textarea id="recruit_type_no" style="display:none;" name="recruit_type_no" placeholder="모집 구분 번호"></textarea> 
						
	
						<label for="studyCate">스터디 분류 <p style="color: red; display: inline;">(*)</p></label><br> 
						<select id='studyCate' name='studyCate'>
							<option value='' selected>선택</option>
							<c:forEach items="${recruitCateList}" var="name_recruit_cate">
								<option id='study_cate' value='${name_recruit_cate}'>${name_recruit_cate}</option>
							</c:forEach>
						</select><br> <br> 
						<textarea id="recruit_cate_no" style="display:none;" name="recruit_cate_no" placeholder="스터디 분류 번호"></textarea> 
						
						
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
						<input type="text" id="study_name" name="study_name" placeholder="스터디 제목을 입력해 주세요" style="width: 60%;"><br><br>  
							
						
						<!--<textarea id="depthTwo" name="depth2" placeholder="지역2"></textarea><br><br>-->      
						       
										
						<div id="region_plus">
							<table id="regionTable">
								<tr>
									<td>
										<input type="text" name="region_name" placeholder="지역" />
										<input id="addButton" name="addButton" type="button" style="cursor:hand;" value="추가" />
									</td>
								</tr>
							</table>						
						</div> <br /> 	
						
						<div>
							<textarea id="study_content" name="content" style="width: 100%" rows="15" placeholder="스터디 소개" required></textarea>
						</div>					

					</div>
			
					<br />
			
					<div style="width: 100%; display: inline-block; text-align: center;">
						<div style="width: 25%; display: inline-block;; text-align: center;">
							<button type="button" id="study_submit_OK">스터디 등록</button>
						</div>
			
						<div style="text-align: center; width: 25%; display: inline-block;">
							<button type="button" id="study_submit_Cancel">등록 취소</button>
						</div>
					</div><br /><br />
					
					<hr />
					
					
				</form>
				
			</div>
			
		</div>
		
	</div>
	
	<script>
	
		$(document).ready(function() {

			// 1. 스터디 진행할 지역 선택
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
	
////////////////////////////////////////////////////////////////////////////////////////////
			
			// 2. 지역1을 통해 받아온 지역2 리스트를 뿌려준다
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
		
			// 3. 지역1과 지역2 정보를 가지고 최종적인 지역 번호를 찾는다
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
			
////////////////////////////////////////////////////////////////////////////////////////////
			
			// 4. 스터디 모집글을 등록한다
	        $('#study_submit_OK').click(function() {
	        	alert('일해라');
				/* if (final_check == 1) {
					$("#register_form").submit();
				} else {
					alert('똑바로서라');
				} */
			});
			
			// 5. 스터디 모집글 작성을 취소한다
			$("#study_submit_Cancel").click(function() {
				location = '../../studyware';
			});
			
////////////////////////////////////////////////////////////////////////////////////////////
		
			// 공부 내용 추가/삭제 (최소 1개, 최대 5개)
			var oTbl;
			var click = 0;;
			//Row 추가
			$("#addButton").click(function() {
				click++;
				if (click < 5) {
					oTbl = document.getElementById("regionTable");
					var oRow = oTbl.insertRow();
					oRow.onmouseover=function(){
						oTbl.clickedRowIndex=this.rowIndex
					}; //clickedRowIndex - 클릭한 Row의 위치를 확인;
					var oCell = oRow.insertCell();
					
					//삽입될 Form Tag
					var frmTag = "<input type=text name=region_name placeholder=지역>";
					frmTag += " <input type=button value='삭제' onClick='removeRow()' style='cursor:hand'>";
					oCell.innerHTML = frmTag;
				} else {
					alert("공부 항목은 최대 5개까지 입니다!");
				}
			});
		
			//Row 삭제
			function removeRow() {
				oTbl.deleteRow(oTbl.clickedRowIndex);
				click--;
				
				if (click == 1) {
					click = 0;
				}
			}
			
	        $('#delButton').click(function() {
	        	$('#regionTable > tbody:last > tr:last').remove();
	        });
	        
////////////////////////////////////////////////////////////////////////////////////////////
			
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
						}
					});
				}
			});
			
////////////////////////////////////////////////////////////////////////////////////////////

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
						}
					});
				}
			});
        
		});
		
	</script>



</body>
</html>