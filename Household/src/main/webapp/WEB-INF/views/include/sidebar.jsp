<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script type="text/javascript" src="/household/resources/js/household/sidebar.js"></script>

	<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/household/main/index">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
        </div>
        <div class="sidebar-brand-text mx-3">가계부 사이트</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="/household/main/index">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Main</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Interface
      </div>
		
      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Custom Components:</h6>
            <a class="collapse-item" id = "awrite" href="javascript:writeBtn('awrite')">
          	<span>Write</span></a>
            <a class="collapse-item" id = "calendarSi" href="javascript:calendarForm(${vo.num })">
          	<span>Calendar</span></a>
          </div>
        </div>
      </li>
      
		  <!-- Modal -->
		  <div class="modal income" id="inModal" role="dialog">
		  <form id = "writemodal" name = "writemodal">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		      
		        <div class="modal-header">
<!-- 		          <button type="button" class="close" data-dismiss="modal">&times;</button> -->
                    <nav class="navbar navbar-expand navbar-light bg-light mb-4" style="width: 100%">
                    <ul class="navbar-nav ml-auto">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: gray;">
                        	카테고리를 선택하세요.
                        </a>
                        <div class="dropdown-menu dropdown-menu-right animated--grow-in" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="javascript:categoryBtn('수입')">수입</a>
                          <a class="dropdown-item" href="javascript:categoryBtn('지출')">지출</a>
                        </div>
                      </li>
                    </ul>
                    <ul>
                    	<li class="navbar-nav ml-auto"><div id = "category" class="h3 mb-0 text-gray-800" align="center"></div></li>
                    </ul>
                  </nav>
		        </div>
		        <div class="modal-body">
		        	<input type = "hidden" id = "division" name = "division">
				    <input type = "hidden" id = "membernum" name = "membernum" value="${vo.num}">
    			  <div id="dropdownCa">
				  </div>
				  <input type="text" class="form-control form-control-user" id="content" name="content" aria-describedby="emailHelp" placeholder="내용...">
				  <br>
		          <input type="text" class="form-control form-control-user" id="money" name="money" aria-describedby="emailHelp" placeholder="금액...">
		          <br>
		          <input type="date" class="form-control form-control-user" id="regdate" name="regdate" aria-describedby="emailHelp">
		          <br>
		        </div>
		        <div class="modal-footer">
		          <a href="javascript:incomInsert()" class="btn btn-success btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-check"></i>
                    </span>
                    <span class="text">저장</span>
                  </a>
		          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        </div>
		        
		      </div>
		      
		    </div>
		    </form>
		  </div>
			<!-- end modal -->


      <!-- Nav Item - Pages Collapse Menu -->
      <c:if test="${vo == null }">
	      <li class="nav-item">
	        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
	          <i class="fas fa-fw fa-folder"></i>
	          <span>Pages</span>
	        </a>
	        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
	          <div class="bg-white py-2 collapse-inner rounded">
	            <h6 class="collapse-header">Login Screens:</h6>
	            <a class="collapse-item" href="/household/main/loginform">Login</a>
	            <a class="collapse-item" href="/household/main/signupform">SignUp</a>
	            <a class="collapse-item" href="/household/main/forgetpassword">Forgot Password</a>
	          </div>
	        </div>
	      </li>
      </c:if>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="javascript:chartForm(${vo.num })">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="javascript:tableForm(${vo.num })">
          <i class="fas fa-fw fa-table"></i>
          <span>Tables</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->