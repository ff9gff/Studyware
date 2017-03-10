<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>진행중인 스터디</h2>
<button id="btn_all">전체</button>
<button id="btn_recruit">모집</button>
<button id="btn_apply">신청</button>
<table id="table"></table>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	var member_no =  '<%= (String)request.getParameter("data") %>'

		// 모든 recruit 리스트
		allList_recruit=[];
		// 모든 apply 리스트
		allList_apply=[];
		
		var recruitList='';
		var applyList='';
		
		getAllList();

		
		$('#btn_all').click(function(){
			$('#table').html('');
			$('#table').append(recruitList);
			$('#table').append(applyList);
		});
		$('#btn_recruit').click(function(){
			$('#table').html('');
			$('#table').append(recruitList);
		});
		$('#btn_apply').click(function(){
			$('#table').html('');
			$('#table').append(applyList);
		});
	// 전체 리스트 불러오기
	function getAllList(){
		allList_recruit=[];
		allList_apply=[];
		
		var url1 = '/studyware/mypage/progress/all/recruitment/'+member_no;
		$.getJSON(url1, function(data1){
			$(data1).each(function(){
				allList_recruit.push({recruit_no:this.recruit_no, name_recruit_cate:this.name_recruit_cate,
									member_no:this.member_no, num_now:this.num_now, num_max:this.num_max, recruit_title:this.recruit_title, recruit_date:this.recruit_date});
			});
		
		
			var url2 = '/studyware/mypage/progress/all/application/'+member_no;
			$.getJSON(url2, function(data2){
				$(data2).each(function(){
					allList_apply.push({recruit_no:this.recruit_no, apply_no:this.apply_no, member_no:this.member_no,
										level_no:this.level_no, agree:this.agree});
				});
				
				getRecruitList();
				getApplyList();

				$('#table').append(recruitList);
				$('#table').append(applyList);
			});// end getJSON
		});// end getJSON
		
		

	}// end getAllList()
	
	
	
	// 모집 리스트
	function getRecruitList(){
		recruitList='';
		
		for(var i=0; i<allList_recruit.length; i++){
			
			if(allList_recruit[i].member_no == member_no ){
				var date = new Date(allList_recruit[i].recruit_date);
				var dateString = date.toLocaleDateString();
				
				recruitList+='<tr>'
				+'<td><div class="div_recruit">모집</div></td>'
				+'<td><div class="div_cate">'+allList_recruit[i].name_recruit_cate+'</div></td>'
				+'<td><div class="div_classInfo">'
						+'<span>'+allList_recruit[i].recruit_title+'</span><br>'
						+'<span>'+dateString+'</span>'
					+'</div></td>'
				+'<td><button class="btn_applyList" data-no="'+allList_recruit[i].recruit_no+'">신청자리스트</button></td>'
				+'</tr>';
			}
		}// end for
	}// end getRecruitList()

	function getApplyList(){
		applyList='';
		
		for(var i=0; i<allList_apply.length; i++){
			if(allList_apply[i].member_no == member_no){
				for(var j=0; j<allList_recruit.length; j++){
					if(allList_apply[i].recruit_no == allList_recruit[j].recruit_no){
						var date = new Date(allList_recruit[j].recruit_date);
						var dateString = date.toLocaleDateString();
						applyList+='<tr>'
							+'<td><div class="div_apply">신청</div></td>'
							+'<td><div class="div_cate">'+allList_recruit[j].name_recruit_cate+'</div></td>'
							+'<td><div class="div_classInfo">'
									+'<span>'+allList_recruit[j].recruit_title+'</span><br>'
									+'<span>'+dateString+'</span>'
								+'</div></td>'
							+'<td><div class="apply_state">';

							if(allList_apply[i].agree == 0){
								applyList+='수락대기';
							}else{
								applyList+='수락완료';
							}
							applyList+='</div></td></tr>';
					}// end if
				}// end for
			}// end if
		}// end for
	}// end getApplyList()
</script>
</body>
</html>