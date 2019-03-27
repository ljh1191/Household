/**
 * 로그인 여부 확인, 폼으로 이동.
 * 가계부 작성.
 * category 버튼생성.
 * 모달생성.
 * 모달창 닫을시 내용 초기화.
 */
function tableForm(num){
	if(num == null){
		alert("로그인 이후 이용가능 합니다.");
		location.href = "/household/main/loginform";
	}else{
		location.href = "/household/table/tableform?membernum="+num;
	}
}
function calendarForm(num){
	if(num == null){
		alert("로그인 이후 이용가능 합니다.");
		location.href = "/household/main/loginform";
	}else{
		location.href = "/household/main/calendarForm?membernum="+num;
	}
}
function chartForm(num){
	if(num == null){
		alert("로그인 이후 이용가능 합니다.");
		location.href = "/household/main/loginform";
	}else{
		location.href = "/household/main/chartForm?membernum="+num;
	}
}

function dropdownBtn(gubun){
	$("#division").val(gubun);
	$("#dropdownBtn").text(gubun);
}
function incomInsert(){
	if($("#membernum").val() == ""){
		alert("로그인 후 이용해주세요.");
		location.href = "/household/main/loginform";
	}else{
		if($("#category").text() == ""){
 		alert("카테고리를 선택해주세요.");
 		return false;
 	}
		if($("#division").val() == ""){
 		alert("구분을 선택해주세요.");
 		return false;
 	}
 	if($("#money").val() == ""){
 		alert("잔액을 입력해주세요.");
 		return false;
 	}
 	if($("#regdate").val() == ""){
 		alert("날짜를 선택해주세요.");
 		return false;
 	}
 	$.ajax({
          		type : "post",
          		url : "/household/main/incomeInsert",
          		data : {"division":$("#division").val(),"membernum":$("#membernum").val(),"content":$("#content").val(),"money":$("#money").val(),"regdate":$("#regdate").val(),"category":$("#category").text()},
          		success:function(data){
          			if(data == 1){
          				alert("입력되었습니다.");
          				location.href = "/household/main/index";
          			}
          		},
          		error : function(e){
	alert("error :"+e);
}
        });
	}
}
function categoryBtn(category){
	var income = "<button class='btn btn-primary dropdown-toggle' id='dropdownBtn' type='button' data-toggle='dropdown'>구분<span class='caret'></span></button>"
 +"<br><br>"
 +"<ul class='dropdown-menu'>"
   +"<li><a href=javascript:dropdownBtn('월급')>월급</a></li>"
   +"<li><a href=javascript:dropdownBtn('용돈')>용돈</a></li>"
   +"<li><a href=javascript:dropdownBtn('이월')>이월</a></li>"
   +"<li><a href=javascript:dropdownBtn('기타')>기타</a></li>"
 +"</ul>";
 var expenditure = "<button class='btn btn-primary dropdown-toggle' id='dropdownBtn' type='button' data-toggle='dropdown'>구분<span class='caret'></span></button>"
  +"<br><br>"
  +"<ul class='dropdown-menu'>"
    +"<li><a href=javascript:dropdownBtn('식비')>식비</a></li>"
    +"<li><a href=javascript:dropdownBtn('교통비')>교통비</a></li>"
    +"<li><a href=javascript:dropdownBtn('문화생활')>문화생활</a></li>"
    +"<li><a href=javascript:dropdownBtn('생필품')>생필품</a></li>"
    +"<li><a href=javascript:dropdownBtn('쇼핑')>쇼핑</a></li>"
    +"<li><a href=javascript:dropdownBtn('의료')>의료</a></li>"
    +"<li><a href=javascript:dropdownBtn('교육')>교육</a></li>"
    +"<li><a href=javascript:dropdownBtn('통신비')>통신비</a></li>"
    +"<li><a href=javascript:dropdownBtn('회비')>회비</a></li>"
    +"<li><a href=javascript:dropdownBtn('경조사')>경조사</a></li>"
    +"<li><a href=javascript:dropdownBtn('저축')>저축</a></li>"
    +"<li><a href=javascript:dropdownBtn('공과금')>공과금</a></li>"
    +"<li><a href=javascript:dropdownBtn('카드대금')>카드대금</a></li>"
    +"<li><a href=javascript:dropdownBtn('기타')>기타</a></li>"
  +"</ul>";
	$("#category").text(category);
	if(category == "수입"){
		$("#dropdownCa").html(income);
	}else if(category == "지출"){
		$("#dropdownCa").html(expenditure);
	}
}
function writeBtn(obj){
	$("#"+obj).attr("data-toggle","modal");
	$("#"+obj).attr("data-target","#inModal");
	$("#"+obj).click();
}
$(document).ready(function(){
	$('#inModal').on('hidden.bs.modal', function (e) {
	    	$("#category").text("");
	    	$("#dropdownBtn").css("display","none");
    });
});