<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<link href='/household/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='/household/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />

<script src='/household/resources/fullcalendar/core/main.js'></script>
<script src='/household/resources/fullcalendar/daygrid/main.js'></script>
<script src='/household/resources/fullcalendar/list/main.js'></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
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
</script>
<link href='/household/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='/household/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Color Utilities</title>

  <jsp:include page="../include/header.jsp"/>

</head>

<body id="page-top">
<input type = "hidden" id = "membernum" name = "membernum" value="${vo.num }">
  <!-- Page Wrapper -->
  <div id="wrapper">

    <jsp:include page="../include/sidebar.jsp"></jsp:include>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <jsp:include page="../include/topbar.jsp"></jsp:include>

        <!-- Begin Page Content -->
        <div class="container-fluid">
        
        <!-- Page Heading -->
          <h1 class="h3 mb-1 text-gray-800">Calendar</h1>
		  <br>

          <!-- Content Row -->
          <div class="row">

            <!-- First Column -->
            <div>

              <!-- Custom Text Color Utilities -->
	              <div class="card shadow" style="padding: 20px">
	              <div id="calendar"></div>
	              <div class="modal income" id="calModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					        <input type = "hidden" id = "num" name = "num">
			<!-- 		          <button type="button" class="close" data-dismiss="modal">&times;</button> -->
			                   <nav class="navbar navbar-expand navbar-light bg-light mb-4" style="width: 100%">
			                    <ul class="navbar-nav ml-auto">
			                      <li class="nav-item dropdown">
			                        <a class="nav-link dropdown-toggle" id = "categorydrop" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: gray;">
			                        	카테고리를 선택하세요.
			                        </a>
			                        <div class="dropdown-menu dropdown-menu-right animated--grow-in" aria-labelledby="navbarDropdown">
			                          <a class="dropdown-item" href="javascript:calcategoryBtn('수입')">수입</a>
			                          <a class="dropdown-item" href="javascript:calcategoryBtn('지출')">지출</a>
			                        </div>
			                      </li>
			                    </ul>
			                    <ul>
			                    	<li class="navbar-nav ml-auto"><div id = "calcategory" class="h3 mb-0 text-gray-800" align="center"></div></li>
			                    </ul>
			                  </nav>
					        </div>
					        <div class="modal-body">
			    			  <div id="caldropdownCa">
							  </div>
							  내용 : <input type="text" class="form-control form-control-user" id="calcontent" name="calcontent">
							  <br>
					                  금액 : <input type="text" class="form-control form-control-user" id="calmoney" name="calmoney">
					          <br>
					                  일자 :  <input type="date" class="form-control form-control-user" id="calregdate" name="calregdate">
					          <br>
					        </div>
					        <div class="modal-footer">
					          <a href="javascript:calUpdate()" class="btn btn-success btn-icon-split">
			                    <span class="icon text-white-50">
			                      <i class="fas fa-check"></i>
			                    </span>
			                    <span class="text">수정</span>
			                  </a>
			                  <a href="javascript:calDelete()" class="btn btn-danger btn-icon-split">
			                    <span class="icon text-white-50">
			                      <i class="fas fa-trash"></i>
			                    </span>
			                    <span class="text">삭제</span>
			                  </a>
			                  <div class="my-2"></div>
					          <button type="button" id = "closemodal" class="btn btn-default" data-dismiss="modal">닫기</button>
					        </div>
					      </div>
					      
					    </div>
					  </div>
              </div>

            </div>

          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="../include/footer.jsp"></jsp:include>

</body>

</html>