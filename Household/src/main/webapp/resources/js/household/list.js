/**
 * category 버튼 활성화
 * 모달생성
 * 수정
 * 삭제
 */
function viewcategoryBtn(category,index){
	var income = "<button class='btn btn-primary dropdown-toggle' id='viewdropdownBtn"+index+"' type='button' data-toggle='dropdown'>구분<span class='caret'></span></button>"
    +"<br><br>"
    +"<ul class='dropdown-menu'>"
      +"<li><a href=javascript:viewdropdownBtn('월급',"+index+")>월급</a></li>"
      +"<li><a href=javascript:viewdropdownBtn('용돈',"+index+")>용돈</a></li>"
      +"<li><a href=javascript:viewdropdownBtn('이월',"+index+")>이월</a></li>"
      +"<li><a href=javascript:viewdropdownBtn('기타',"+index+")>기타</a></li>"
    +"</ul>";
    var expenditure = "<button class='btn btn-primary dropdown-toggle' id='viewdropdownBtn"+index+"' type='button' data-toggle='dropdown'>구분<span class='caret'></span></button>"
	    +"<br><br>"
	    +"<ul class='dropdown-menu'>"
	      +"<li><a href=javascript:viewdropdownBtn('식비',"+index+")>식비</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('교통비',"+index+")>교통비</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('문화생활',"+index+")>문화생활</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('생필품',"+index+")>생필품</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('쇼핑',"+index+")>쇼핑</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('의료',"+index+")>의료</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('교육',"+index+")>교육</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('통신비',"+index+")>통신비</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('회비',"+index+")>회비</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('경조사',"+index+")>경조사</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('저축',"+index+")>저축</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('공과금',"+index+")>공과금</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('카드대금',"+index+")>카드대금</a></li>"
	      +"<li><a href=javascript:viewdropdownBtn('기타',"+index+")>기타</a></li>"
	    +"</ul>";
	$("#viewcategory"+index).html(category);
	$("#viewcategory").val(category);
	if(category == "수입"){
		$("#viewdropdownCa"+index).html(income);
	}else if(category == "지출"){
		$("#viewdropdownCa"+index).html(expenditure);
	}
}
function viewdropdownBtn(gubun,index){
	$("#viewdivision").val(gubun);
	$("#viewdropdownBtn"+index).html(gubun);
}
function viewmodalShow(index,category,obj,division){
	viewcategoryBtn(category,index);
	viewdropdownBtn(division,index);
	$("#"+obj).attr("data-toggle","modal");
	$("#"+obj).attr("data-target","#viewModal"+index);
	$("#"+obj).click();
}

function viewUpdate(num,index){
	if($("#viewmembernum"+index).val() == ""){
		alert("로그인 후 이용해주세요.");
		location.href = "/household/main/loginform";
	}else{
		if($("#viewcategory"+index).text() == ""){
	   		alert("카테고리를 선택해주세요.");
	   		return false;
	   	}
		if($("#viewdropdownBtn"+index).html() == ""){
	   		alert("구분을 선택해주세요.");
	   		return false;
	   	}
	   	if($("#viewmoney"+index).val() == ""){
	   		alert("잔액을 입력해주세요.");
	   		return false;
	   	}
	   	if($("#viewregdate"+index).val() == ""){
	   		alert("날짜를 선택해주세요.");
	   		return false;
	   	}
	}
   	$.ajax({
     	type : "post",
     	url : "/household/table/viewUpdate",
     	data : {"division":$("#viewdropdownBtn"+index).html(),"membernum":$("#viewmembernum"+index).val(),"num":num,"content":$("#viewcontent"+index).val(),"money":$("#viewmoney"+index).val(),"regdate":$("#viewregdate"+index).val(),"category":$("#viewcategory"+index).text()},
     	success:function(data){
	     if(data == 1){
	     		alert("변경되었습니다.");
	     		location.href = "/household/table/tableform?membernum="+$("#viewmembernum"+index).val();
	     }
     	},
 		error : function(e){
			alert("error :"+e);
		}
     		
    });
}
function viewDelete(num){
	if(confirm("정말삭제하시겠습니까?")){
		$.ajax({
	     	type : "post",
	     	url : "/household/table/viewDelete",
	     	data : {"num":num},
	     	success:function(data){
		     if(data == 1){
		     		alert("삭제되었습니다.");
		     		location.reload();
		     }
	     	},
	 		error : function(e){
				alert("error :"+e);
			}
	     });
	}
}