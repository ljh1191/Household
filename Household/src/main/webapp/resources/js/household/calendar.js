/**
 * 캘린더 생성
 * 캘린더 상세보기(modal)
 * catogory 버튼 생성
 * 수정
 * 삭제
 */
$(document).ready(function(){
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: ['dayGrid'],
   	  events: {
	  	         url: '/household/main/calendarGetdata?membernum='+$("#membernum").val(),
	  	         method: 'get',
	  	          failure: function() {
	  	           alert('there was an error while fetching events!')
 	             },
 	             color : "#36b9cc",
 	            textColor : "white"
  	 },
      defaultView: 'dayGridMonth'
   	 });

    calendar.render();
  });
  function calModal(num){
	$.ajax({
		type : "get",
		url : "/household/main/view",
		data : {"num":num},
		success : function(data){
			calcategoryBtn(data.category);
			caldropdownBtn(data.division);
			$("#num").val(data.num);
			$("#calcontent").val(data.content);
			$("#calmoney").val(data.money);
			$("#calregdate").val(data.regdate);
			$("#calModal").modal('show');
		}
	})
  }
  function calcategoryBtn(category){
		var income = "<button class='btn btn-primary dropdown-toggle' id='caldropdownBtn' type='button' data-toggle='dropdown'>구분<span class='caret'></span></button>"
	    +"<br><br>"
	    +"<ul class='dropdown-menu'>"
	      +"<li><a href=javascript:caldropdownBtn('월급')>월급</a></li>"
	      +"<li><a href=javascript:caldropdownBtn('용돈')>용돈</a></li>"
	      +"<li><a href=javascript:caldropdownBtn('이월')>이월</a></li>"
	      +"<li><a href=javascript:caldropdownBtn('기타')>기타</a></li>"
	    +"</ul>";
	    var expenditure = "<button class='btn btn-primary dropdown-toggle' id='caldropdownBtn' type='button' data-toggle='dropdown'>구분<span class='caret'></span></button>"
		    +"<br><br>"
		    +"<ul class='dropdown-menu'>"
		      +"<li><a href=javascript:caldropdownBtn('식비')>식비</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('교통비')>교통비</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('문화생활')>문화생활</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('생필품')>생필품</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('쇼핑')>쇼핑</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('의료')>의료</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('교육')>교육</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('통신비')>통신비</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('회비')>회비</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('경조사')>경조사</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('저축')>저축</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('공과금')>공과금</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('카드대금')>카드대금</a></li>"
		      +"<li><a href=javascript:caldropdownBtn('기타')>기타</a></li>"
		    +"</ul>";
		$("#categorydrop").val(category);
		$("#calcategory").html(category);
		if(category == "수입"){
			$("#caldropdownCa").html(income);
		}else if(category == "지출"){
			$("#caldropdownCa").html(expenditure);
		}
	}
	function caldropdownBtn(gubun){
		$("#caldropdownBtn").text(gubun);
	}

	function calUpdate(){
		if($("#membernum").val() == ""){
			alert("로그인 후 이용해주세요.");
			location.href = "/household/main/loginform";
		}else{
			if($("#categorydrop").val() == ""){
		   		alert("카테고리를 선택해주세요.");
		   		return false;
		   	}
			if($("#caldropdownBtn").text() == ""){
		   		alert("구분을 선택해주세요.");
		   		return false;
		   	}
		   	if($("#calmoney").val() == ""){
		   		alert("잔액을 입력해주세요.");
		   		return false;
		   	}
		   	if($("#calregdate").val() == ""){
		   		alert("날짜를 선택해주세요.");
		   		return false;
		   	}
		}
	   	$.ajax({
	     	type : "post",
	     	url : "/household/table/viewUpdate",
	     	data : {"division":$("#caldropdownBtn").text(),"membernum":$("#membernum").val(),"num":$("#num").val(),"content":$("#calcontent").val(),"money":$("#calmoney").val(),"regdate":$("#calregdate").val(),"category":$("#categorydrop").val()},
	     	success:function(data){
		     if(data == 1){
		     		alert("변경되었습니다.");
		     		location.reload();
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
			     		location.href = "/household/table/tableform?membernum="+$("#membernum").val();
			     }
		     	},
		 		error : function(e){
					alert("error :"+e);
				}
		     	});
		}
}