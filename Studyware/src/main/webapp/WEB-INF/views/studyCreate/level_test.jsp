
<!-- 공부수준 등록 연습용 jsp 페이지. 테스트 종료 후 삭제 예정! -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

				<form id="register_form" name="register_form" action="study_level2"
					method="POST" style="text-align: left;">
			
					<div style="margin-left: 5%; margin-right: 5%">
										
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
						
					</div>
			
					<br />
			
					<div style="width: 100%; display: inline-block; text-align: center;">
						<div style="width: 25%; display: inline-block;; text-align: center;">
							<button type="button" id="level_submit_OK">수준 등록</button>
						</div>
			
						<div style="text-align: center; width: 25%; display: inline-block;">
							<button type="button" id="level_submit_Cancel">등록 취소</button>
						</div>
					</div><br /><br />
					
					<hr />
						
				</form>
				
			</div>
			
		</div>
		
	</div>
	
	<script>
			
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
        $('#level_submit_OK').click(function() {
  
			$("#register_form").submit();
			
		});
		
		// 8. 스터디 모집글 작성을 취소한다
		$("#level_submit_Cancel").click(function() {
			location = '../../studyware';
		});
		
////////////////////////////////////////////////////////////////////////////////////////////
			
		
		
	</script>



</body>
</html>