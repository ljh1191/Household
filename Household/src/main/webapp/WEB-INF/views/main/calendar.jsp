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
<script type="text/javascript" src="/household/resources/js/household/calendar.js"></script>

<link href='/household/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='/household/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Calendar</title>

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

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <jsp:include page="../include/footer.jsp"></jsp:include>

</body>

</html>