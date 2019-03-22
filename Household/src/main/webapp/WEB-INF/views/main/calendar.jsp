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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>


  document.addEventListener('DOMContentLoaded', function() {
//   var str = "[";
 /*  for (var i = 1; i < 5; i++) {
  	  str += "{title : '"+$('#list'+i).val()+"', start : '"+$('#listreg'+i).val()+"', textColor : '#ffffff'},";
  	  if(i == 4){
  		str += "{title : '"+$('#list'+i).val()+"', start : '"+$('#listreg'+i).val()+"', textColor : '#ffffff'}]";
  	  }
  } */
 

//   JSONArray jArray = new JSONArray();
  		
//   for( i=0;i<5;i++){
// 	JSONObject jsonObj = new JSONObject();
//   	jsonObj.put("title", $('#list'+i).val());
//   	jsonObj.put("start", $('#listreg'+i).val());
//   	jsonObj.put("textColor", '#ffffff');
  			
//   	jArray.add(jsonObj);
//   }
//   alert(str);
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid' ],
//      events : [{title : "gd",start : "2019-02-22",textColor : "#ffffff"},
// 				{title : "gg",start : "2019-03-23",textColor : "#ffffff"}],
//  	  events :jArray,	
      defaultView: 'dayGridMonth'
    });

    calendar.render();
  });
  
  $(document).ready(function(){
	  alert($("#membernum").val());
	/*   var data="";
	  $.ajax({
		  url:"/household/main/calendarGetdata?membernum="+$("#membernum").val(),
	 		type : "get",
	 		success : function(data){
	 			data =data;
	 			alert(data);
	 		},
	 		error : function(e){
	 			alert("error : "+e);
	 		} 
	  }) */
	  var calendarEl = document.getElementById('calendar');
	  var calendar = new FullCalendar.Calendar(calendarEl, {
	      plugins: [ 'dayGrid' ],
//	      events : [{title : "gd",start : "2019-02-22",textColor : "#ffffff"},
//	 				{title : "gg",start : "2019-03-23",textColor : "#ffffff"}],
	  	  events :$.get("/household/main/calendarGetdata?membernum="+$("#membernum").val(),
		 		function(data){
	  		  alert(data);
	  		      data
	  	        }),
		  
	      defaultView: 'dayGridMonth'
	    });
	 /* $("#calendar").calendar({
		lang : "ko",
	 	header :{
	 		left : "123",
	 		center : "title",
	 		right : 'month,listMonth'
	 	},
	 	eventSources:[{
	 		url:"/household/main/calendarGetdata?membernum="+$("#membernum").val(),
	 		type : "get",
	 		success : function(data){
	 			alert(data);
	 		},
	 		error : function(e){
	 			alert("error : "+e);
	 		},
	 		allDayDefault : true
	 	}]
	 }); */
  });
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
<input type = "text" id = "membernum" name = "membernum" value="${vo.num }">
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
<%-- 	              <input type = "hidden" id = "listSize" name = "listSize" value="${listSize }"> --%>
	              
<%-- 		              <c:forEach items="${list }" var="i" varStatus="stat"> --%>
<%-- 		              	<input type = "hidden" id = "list${stat.index }" name = "list${stat.index }" value="${i.category} ${i.division }:<fmt:formatNumber value="${i.money}" pattern="#,###" />원"> --%>
<%-- 		              	<input type = "hidden" id = "listreg${stat.index }" name = "listreg${stat.index }" value="${i.regdate}"> --%>
<%-- 		              </c:forEach> --%>
		            
	              <div id="calendar"></div>
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