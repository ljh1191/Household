<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Buttons</title>

 <jsp:include page="../include/header.jsp"/>

</head>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("#kdi").css({ 'pointer-events': 'none' });
	$("#lg").css({ 'pointer-events': 'none' });
	$("#naverfiNews").css({ 'pointer-events': 'none' });
});
</script>

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
          <h1 class="h3 mb-1 text-gray-800">Information</h1>
		  <br>
          <!-- Content Row -->
          <div class="row">

            <!-- Border Left Utilities -->
            <div class="col-lg-6">

              <div class="card mb-4 py-3 border-left-primary">
                <div class="card-body">
                  <h3 class="text-lg mb-0"><a class="text-primary" href="http://www.mk.co.kr/">매일경제</a></h3>
                  <hr class="sidebar-divider my-0">
                  <br>
                  ${mkmainhtml }
                </div>
              </div>

              <div class="card mb-4 py-3 border-left-success">
                <div class="card-body">
                  <h3 class="text-lg mb-0"><a class="text-success" href="https://finance.naver.com/">네이버금융(상위종목)</a></h3>
                  <hr class="sidebar-divider my-0">
                  <br>
                  <table>
                  	<tr>
                  		<c:forEach items="${naverStocksRanktitle }" varStatus="stat">
                  			<th class="text-success">${naverStocksRanktitle[stat.index] }</th>
                  		</c:forEach>
                  	</tr>
                  	<c:forEach items="${Stockarr }" var="i" varStatus="stat">
                  		<tr>
               				<td>${i.rank }</td>
               				<td>${i.name }</td>
               				<td>${i.search }</td>
               				<td>${i.now }</td>
               				<td>${i.yesterdayra }</td>
               				<td>${i.updown }</td>
               				<td>${i.deal }</td>
               				<td>${i.pp }</td>
               				<td>${i.high }</td>
               				<td>${i.low }</td>
               				<td>${i.per }</td>
               				<td>${i.roe }</td>
               			</tr>
                  	</c:forEach>
                  	
                  </table>
                  
                </div>
              </div>

              <div class="card mb-4 py-3 border-left-info">
                <div class="card-body">
                  <h3 class="text-lg mb-0"><a class="text-info" href="http://www.lgeri.com/economy/list.do?type=economy&rankOptions=TITLE/50,CONTENTS_PDF/30,KEYWORD/100,KEYWORD_TOP/100">LG경제연구원</a></h3>
                  <hr class="sidebar-divider my-0">
                  <br>
                  <div id = "lg">
                  ${lgnewsli0 }
                  <br>
                  ${lgnewsli1 }
                  </div>
                </div>
              </div>

            </div>

            <!-- Border Bottom Utilities -->
            <div class="col-lg-6">

              <div class="card mb-4 py-3 border-bottom-primary">
                <div class="card-body">
                  	<h3 class="text-lg mb-0"><a class="text-primary" href="http://www.hankyung.com/">한국경제</a></h3>
                  <hr class="sidebar-divider my-0">
                  <br>
                   ${hkmain }
                   <br>
                   ${hknewlist }
                </div>
              </div>

              <div class="card mb-4 py-3 border-bottom-success">
                <div class="card-body">
                  <h3 class="text-lg mb-0"><a class="text-success" href="https://finance.naver.com/news/mainnews.nhn">네이버금융(주요뉴스)</a></h3>
                  <hr class="sidebar-divider my-0">
                  <br>
                  <div id = "naverfiNews">
                  ${naverissu }
                  </div>
                </div>
              </div>

              <div class="card mb-4 py-3 border-bottom-info">
                <div class="card-body">
                  <h3 class="text-lg mb-0"><a class="text-info" href="http://eiec.kdi.re.kr/policy/material/plist.jsp">KDI경제정보센터</a></h3>
                  <hr class="sidebar-divider my-0">
                  <br>
                  <div id = "kdi">
                  ${kdi }
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
