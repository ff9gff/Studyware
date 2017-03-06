<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    width: 100%;
    font-family:"dotum";
    font-size:12px;
}
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width:82px;
    height: 31px;
    line-height: 31px;
    border: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
}
ul.tabs li.active {
    background: #FFFFFF;
    border-bottom: 1px solid #FFFFFF;
}
.tab_container {
    border: 1px solid #eee;
    border-top: none;
    clear: both;
    float: left;

    background: #FFFFFF;
}
.tab_content {
    padding: 5px;
    font-size: 12px;
    display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    padding:5px;
    list-style:none
}
 #container {

    margin: 0 auto;
}
.table_check{
	width:20px;
	text-align: center;
}
.table_member{
	width: 80px;
	text-align: center;
}
.table_content{

	width: 200px;
}
.table_date{
	width: 100px;
	text-align: center;
}
.table_state{
	font-size: 8px;
	width: 30px;
	text-align: center;
}
.msg_th{
	border-bottom: 3px solid #eee; 
}
#context_menu{
	width: 80px;
	position: absolute;
	background-color: #FFFFFF;
	border-bottom: 1px solid #d8d6d6;
}
#context_menu ul{
	list-style:none;
	padding: 0;
	margin: 0;
}
#context_menu ul li{
	padding: 5px 0px 5px 5px;
    margin: 0px;
    border: 1px solid #d8d6d6;
    border-bottom: 1px solid #FFFFFF;
    font-size: 12px;
}
#context_menu ul li a{
	text-decoration:none;
	color: #000000;
}
</style>
</head>
<body>
<!-- Context Menu -->
<div id="context_menu" hidden>
	<input type="hidden" type="number" id="context_member_no"/>
	<ul>
		<li id="context_msg"><a href="#this">쪽지보내기</a></li>
		<li id="context_history"><a href="#this">이력보기</a></li>
	</ul>
</div>
<!-- 쪽지 보내기 -->
<form id="msg_form" action="admin/msg" method="post" target="testpop">
	<input type="hidden" id="msg_setter" name="msg_setter" value="1"/>
	<div id ="msg_getter"></div>
</form>

<!-- 이력 보기 -->
<form id="history_form" action="admin/history" method="post" target="history_popup">
	<input type="hidden" id="history_member_no" name="history_member_no"/>
</form>


	<h1>여기는 쪽지함입니다.</h1>
	<button id="btn_send_msg">답장</button>
	<button id="btn_delete_msg">삭제</button>
	<div id="container">
		<ul class="tabs">
			<li class="active" rel="msg_re_list">받은쪽지</li>
			<li rel="msg_se_list">보낸쪽지</li>
		</ul>
		<div class="tab_container">
			<table id="msg_re_list" class="tab_content">
				<tr class="msg_th">
					<th class="table_check"><input id="allCheck" onclick="clickAllCheck(this,'rowCheck1')" type="checkbox"></th>
					<th class="table_member">보낸사람</th>
					<th class="table_content" colspan="2">내용</th>
					<th class="table_date">날짜</th>

				</tr>
				<c:forEach var="msg" items="${msgList}">
					<c:if test="${msg.re_member_no == my_no}">
						<tr class="msg_td" onmouseover="mouseoverTR(this)" onmouseout="mouseoutTR(this)">
							<td class="table_check"><input class="rowCheck" onclick="clickRowCheck('rowCheck1')" name="rowCheck1" type="checkbox"
								value="${msg.msg_no}"/></td>
							<td class="table_member">
								<a href="#this" class="btn_nick" data-mno="${msg.se_member_no}" onclick="showContextmenu(this)">
									<c:out value="${nickMap[msg.se_member_no]}" />
								</a>
							</td>
							<td class="table_state">
								<c:if test="${msg.state == 0}">new</c:if>
								<c:if test="${msg.state == 1}">읽음</c:if>
							</td>
							<td class="table_content">
								<a href="#this" class="btn_content" data-msgno="${msg.msg_no}">
								${msg.content}
								</a>
							</td>
							<td class="table_date"><fmt:formatDate value="${msg.reg_date}"
									pattern="yyyy-MM-dd" /></td>
							
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<table id="msg_se_list" class="tab_content">
				<tr class="msg_th">
					<th class="table_check"><input id="allCheck" onclick="clickAllCheck(this,'rowCheck2')"  type="checkbox"></th>
					<th class="table_member">받은사람</th>
					<th class="table_content" colspan="2">내용</th>
					<th class="table_date">날짜</th>

				</tr>
				<c:forEach var="msg" items="${msgList}">
					<c:if test="${msg.se_member_no == my_no}">
						<tr class="msg_td"  onmouseover="mouseoverTR(this)" onmouseout="mouseoutTR(this)">
							<td class="table_check"><input class="rowCheck"  onclick="clickRowCheck('rowCheck2')" name="rowCheck2" type="checkbox"
								value="${msg.msg_no}"/></td>
							<td class="table_member">
								<a href="#this" class="btn_nick" data-mno="${msg.se_member_no}" onclick="showContextmenu(this)">
									<c:out value="${nickMap[msg.re_member_no]}" />
								</a>
							</td>
							<td class="table_state"></td>
							<td class="table_content">
								<a href="#this" class="btn_content" data-msgno="${msg.msg_no}">
								${msg.content}
								</a>
							</td>
							<td class="table_date"><fmt:formatDate value="${msg.reg_date}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

// 탭 메뉴
$(function(){
	$('.tab_content').hide();
	$('.tab_content:first').show();
	
	$('ul.tabs li').click(function(){
		$('ul.tabs li').removeClass('active').css('color','#333');
		$(this).addClass('active').css('color','darkred');
		$('.tab_content').hide();
		var activeTab = $(this).attr("rel");
		$('#'+activeTab).fadeIn()
		
	});
});

	// 체크박스 전체 선택
	function clickAllCheck(e, rowname){
		var chkObj = document.getElementsByName(rowname);
		var check = $(e).context.checked;
		if(check){
			for(var i=0; i<chkObj.length; i++){
				chkObj[i].checked = true;
				var styletr = chkObj[i].parentNode.parentNode;
				styletr.style.backgroundColor = '#DBD9D9';
			}// end for
		}else{
			for(var i=0; i<chkObj.length; i++){
				chkObj[i].checked = false;
				var styletr = chkObj[i].parentNode.parentNode;
				styletr.style.backgroundColor = '#FFFFFF';
			}// end for
		}// end if
	}// end allCheck()
	
	// 체크박스 선택시 색깔 바꾸기
	function clickRowCheck(rowname){
		var chkObj = document.getElementsByName(rowname);
		for(var i=0; i<chkObj.length; i++){
			if(chkObj[i].checked == true){
				var styletr = chkObj[i].parentNode.parentNode;
				styletr.style.backgroundColor='#DBD9D9';
			}else{
				var styletr = chkObj[i].parentNode.parentNode;
				styletr.style.backgroundColor='#FFFFFF';
			}
		}
	}// end clickRowCheck()
	
	// table list 마우스 오버시 색 바꾸기
	function mouseoverTR(e){
		$(e).context.style.backgroundColor='#DBD9D9';
	}
	function mouseoutTR(e){
		var chk = $(e).children().children();
		if(chk[0].checked == false){
			$(e).context.style.backgroundColor='#FFFFFF';
		}
	}

	
	// 쪽지 보내기 - form 실행
	function sendMsgForm(){
		var f = document.getElementById('msg_form');
		var popOption = "width=400, height=500, resizble=no, scrollbars=no, status=no";
	
		window.open('',"testpop" ,popOption);
		f.submit();  

		$('#msg_getter').html('');
	}// end sendMsgForm()

	// 쪽지보내기 - contextMenu클릭
	$('#context_msg').click(function(){
		var mno = $('#context_member_no').val();
		$('#msg_getter').append('<input type="hidden" name="msg_getter" value="'+mno+'">');
		sendMsgForm();
	});

	// 아이디 클릭시 contextmenu 보이기
	function showContextmenu(e){
		var amno = $(e).attr('data-mno');
		$('#context_member_no').val(amno);
		
		var atag = $(e).offset();
		
		var menubox = $('#context_menu');
		menubox.css("left", (atag.left+30) +"px");
		menubox.css("top", (atag.top+10) +"px");
		menubox.show();

	}
	
	$('#msg_re_list').on('click','.msg_td .btn_nick',function(){
		var amno = $(this).attr('data-mno');
		$('#context_member_no').val(amno);
		
		var atag = $(this).offset();
		
		var menubox = $('#context_menu');
		menubox.css("left", (atag.left+30) +"px");
		menubox.css("top", (atag.top+10) +"px");
		menubox.show();
	});
	
	// 다른 곳 클릭시 contextmenu 사라지기
	$(document).click(function(e){		
		if(!$('#msg_re_list .msg_td').has(e.target).length &&
		   !$('#msg_re_list .msg_td .btn_nick').has(e.target).length&&
		   !$('#msg_se_list .msg_td').has(e.target).length &&
		   !$('#msg_se_list .msg_td .btn_nick').has(e.target).length){
				$('#context_menu').hide();
		} 
	});
	
	// 이력보기 - contextMenu클릭
	$('#context_history').click(function(){
		var mno = $('#context_member_no').val();
		$('#history_member_no').val(mno);

		var f = document.getElementById('history_form');
		var popOption = "width=400, height=300, resizble=no, scrollbars=no, status=no";
	
		window.open('',"history_popup" ,popOption);
		f.submit();  

	});
</script>
</body>
</html>