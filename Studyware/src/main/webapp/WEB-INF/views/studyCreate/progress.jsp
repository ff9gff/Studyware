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
<table id="table"></table>
<hr>
<table id="table2"></table>

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
	
	// 전체 리스트 불러오기
	function getAllList(){
		allList_recruit=[];
		allList_apply=[];
		
		var url1 = '/studyware/mypage/progress/all/recruitment/'+member_no;
		$.getJSON(url1, function(data){
			$(data).each(function(){
				allList_recruit.push({recruit_no:this.recruit_no, name_recruit_cate:this.name_recruit_cate, name_recruit_type:this.name_recruit_type,
									member_no:this.member_no, num_now:this.num_now, num_max:this.num_max, recruit_title:this.recruit_title, recruit_date:this.recruit_date});
			});
		});// end getJSON
		
		var url2 = '/studyware/mypage/progress/all/application/'+member_no;
		$.getJSON(url2, function(data){
			$(data).each(function(){
				allList_apply.push({recruit_no:this.recruit_no, apply_no:this.apply_no, member_no:this.member_no,
									level_no:this.level_no, agree:this.agree});
			});
		});// end getJSON
	}// end getAllList()
	
	// 모집 리스트
	function getRecruitList(){
		recruitList='';
		
	}

</script>
</body>
</html>