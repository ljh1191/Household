<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function mondropdownBtn(num){
	$("#dropdownMonButton").html(num+"월");
	var str = "";
	if(num < 10){
		str = ("0"+num);
	}else{
		str = (""+num);
	}
	
	location.href = "/household/main/chartForm?membernum="+$("#membernum").val()+"&month="+str;
}
</script>

<jsp:include page="../include/header.jsp"/>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <jsp:include page="../include/sidebar.jsp"></jsp:include>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <jsp:include page="../include/topbar.jsp"></jsp:include>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <input type = "hidden" id = "nowmon" name = "nowmon" value = "${selectmon}">
            <div class="dropdown mb-4">
                    <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMonButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      ${selectmon }월
                    </button>
                    <div class="dropdown-menu animated--fade-in" aria-labelledby="dropdownMonButton">
                    	<c:forEach begin="1" end="${nowmon }" varStatus="stat">
                    		<a class="dropdown-item" href="javascript:mondropdownBtn(${stat.index })">${stat.index }월</a>
                    	</c:forEach>
                    </div>
            </div>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">수입</div>
                      
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${hvo.mon_incom }" pattern="#,###" />원</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">지출</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${hvo.mon_dx }" pattern="#,###" />원</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">지출/수입</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><fmt:formatNumber value="${hvo.mon_dx/hvo.mon_incom }" type="percent"/></div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: <fmt:formatNumber value="${hvo.mon_dx/hvo.mon_incom }" type="percent"/>" aria-valuenow="${hvo.mon_dx/hvo.mon_incom }" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">남은 금액</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800"><fmt:formatNumber value="${hvo.mon_incom - hvo.mon_dx }" pattern="#,###" />원</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Area Chart -->
            <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">월별 지출 현황(1월~${nowmon }월)</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area">
                  		<c:forEach begin="0" end="${nowmon-1}" varStatus="stat">
                  			<input type = "hidden" id="area${stat.index}" name="area${stat.index}" value="${hvo.mon_area_incom[stat.index]}"> 
                  		 </c:forEach>
	                    <c:forEach begin="${nowmon}" end="11" varStatus="stat">
	                    <input type = "hidden" id="area${stat.index}" name="area${stat.index}" value="0">
	                  	</c:forEach>
                    <canvas id="myAreaChart"></canvas>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">${selectmon}월 상위 지출 내역</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                  	<c:forEach begin="0" end="2" varStatus="stat">
                  			<input type = "hidden" id="pie_money${stat.index}" name="pie_money${stat.index}" value="${hvo.mon_pie_incom.get(stat.index).money}"> 
               		 </c:forEach>
               		 <c:forEach begin="0" end="2" varStatus="stat">
                  			<input type = "hidden" id="pie_division${stat.index}" name="pie_division${stat.index}" value="${hvo.mon_pie_incom.get(stat.index).division}"> 
               		 </c:forEach>
                    <canvas id="myPieChart"></canvas>
                  </div>
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> ${hvo.mon_pie_incom.get(0).division}
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> ${hvo.mon_pie_incom.get(1).division}
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> ${hvo.mon_pie_incom.get(2).division}
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Row -->
          <div class="row">

            <!-- Content Column -->
            <div class="col-lg-6 mb-4">

              <!-- Project Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">지출 순위</h6>
                </div>
                <div class="card-body">
                  <h4 class="small font-weight-bold">${hvo.mon_bar_incom.get(0).division} <span class="float-right"><fmt:formatNumber value="${hvo.mon_bar_incom.get(0).money/hvo.mon_incom}" type="percent"/></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: <fmt:formatNumber value="${hvo.mon_bar_incom.get(0).money/hvo.mon_incom}" type="percent"/>" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">${hvo.mon_bar_incom.get(1).division} <span class="float-right"><fmt:formatNumber value="${hvo.mon_bar_incom.get(1).money/hvo.mon_incom}" type="percent"/></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-warning" role="progressbar" style="width: <fmt:formatNumber value="${hvo.mon_bar_incom.get(1).money/hvo.mon_incom}" type="percent"/>" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">${hvo.mon_bar_incom.get(2).division} <span class="float-right"><fmt:formatNumber value="${hvo.mon_bar_incom.get(2).money/hvo.mon_incom}" type="percent"/></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar" role="progressbar" style="width: <fmt:formatNumber value="${hvo.mon_bar_incom.get(2).money/hvo.mon_incom}" type="percent"/>" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">${hvo.mon_bar_incom.get(3).division} <span class="float-right"><fmt:formatNumber value="${hvo.mon_bar_incom.get(3).money/hvo.mon_incom}" type="percent"/></span></h4>
                  <div class="progress mb-4">
                    <div class="progress-bar bg-info" role="progressbar" style="width: <fmt:formatNumber value="${hvo.mon_bar_incom.get(3).money/hvo.mon_incom}" type="percent"/>" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                  <h4 class="small font-weight-bold">${hvo.mon_bar_incom.get(4).division} <span class="float-right"><fmt:formatNumber value="${hvo.mon_bar_incom.get(4).money/hvo.mon_incom}" type="percent"/></span></h4>
                  <div class="progress">
                    <div class="progress-bar bg-success" role="progressbar" style="width: <fmt:formatNumber value="${hvo.mon_bar_incom.get(4).money/hvo.mon_incom}" type="percent"/>" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>

              
            </div>

            <div class="col-lg-6 mb-4">
			<!-- Color System -->
              <div class="row">
              <div class="col-lg-6 mb-4">
                  <div class="card bg-danger text-white shadow">
                    <div class="card-body">
                      ${hvo.mon_bar_incom.get(0).division}
                      <div class="text-white-50 small"><fmt:formatNumber value="${hvo.mon_bar_incom.get(0).money}" pattern="#,###" />원</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-warning text-white shadow">
                    <div class="card-body">
                      ${hvo.mon_bar_incom.get(1).division}
                      <div class="text-white-50 small"><fmt:formatNumber value="${hvo.mon_bar_incom.get(1).money}" pattern="#,###" />원</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-primary text-white shadow">
                    <div class="card-body">
                      ${hvo.mon_bar_incom.get(2).division}
                      <div class="text-white-50 small"><fmt:formatNumber value="${hvo.mon_bar_incom.get(2).money}" pattern="#,###" />원</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-info text-white shadow">
                    <div class="card-body">
                      ${hvo.mon_bar_incom.get(3).division}
                      <div class="text-white-50 small"><fmt:formatNumber value="${hvo.mon_bar_incom.get(3).money}" pattern="#,###" />원</div>
                    </div>
                  </div>
                </div>
                <div class="col-lg-6 mb-4">
                  <div class="card bg-success text-white shadow">
                    <div class="card-body">
                      ${hvo.mon_bar_incom.get(4).division}
                      <div class="text-white-50 small"><fmt:formatNumber value="${hvo.mon_bar_incom.get(4).money}" pattern="#,###" />원</div>
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
	<!-- Page level custom scripts -->
	  <script src="/household/resources/js/demo/chart-area-demo.js"></script>
	  <script src="/household/resources/js/demo/chart-pie-demo.js"></script>

</body>

</html>