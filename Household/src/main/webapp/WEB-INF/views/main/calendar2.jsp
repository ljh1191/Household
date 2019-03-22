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

  

   <jsp:include page="../include/sidebar.jsp"></jsp:include>
   
    
      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <jsp:include page="../include/topbar.jsp"></jsp:include>
        <!-- End of Topbar -->

		<!-- Custom Text Color Utilities -->
              <div class="card shadow mb-4">
                
              </div>
		

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

  <jsp:include page="../include/footer.jsp"></jsp:include>

</body>

</html>
