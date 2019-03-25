<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
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
</script>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Tables</title>

  <!-- Custom fonts for this template -->
  <link href="/household/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/household/resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="/household/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>


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

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>카테고리</th>
                      <th>구분</th>
                      <th>금액</th>
                      <th>내용</th>
                      <th>날짜</th>
                      <th>상세보기</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>카테고리</th>
                      <th>구분</th>
                      <th>금액</th>
                      <th>내용</th>
                      <th>날짜</th>
                      <th>상세보기</th>
                    </tr>
                  </tfoot>
                  <tbody>
                  <c:forEach items="${list }" var="i" varStatus="stat">
                  	<tr>
                      <td>${i.category }</td>
                      <td>${i.division }</td>
                      <td><fmt:formatNumber value="${i.money }" pattern="#,###" /></td>
                      <td>${i.content }</td>
                      <td>${i.regdate }</td>
                      <td>
                      <a class="nav-link" id="aid${stat.index }" href="javascript:viewmodalShow(${stat.index },'${i.category }','aid${stat.index }','${i.division }')">
			          <span>상세보기</span></a>
					<form id = "viewfrm" name = "viewfrm">
					  <div class="modal income" id="viewModal${stat.index }" role="dialog">
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
			                          <a class="dropdown-item" href="javascript:viewcategoryBtn('수입',${stat.index })">수입</a>
			                          <a class="dropdown-item" href="javascript:viewcategoryBtn('지출',${stat.index })">지출</a>
			                        </div>
			                      </li>
			                    </ul>
			                    <ul>
			                    	<li class="navbar-nav ml-auto"><div id = "viewcategory${stat.index }" class="h3 mb-0 text-gray-800" align="center">${i.category}</div></li>
			                    </ul>
			                  </nav>
					        </div>
					        <div class="modal-body">
							    <input type = "hidden" id = "viewmembernum${stat.index }" name = "viewmembernum${stat.index }" value="${i.membernum}">
			    			  <div id="viewdropdownCa${stat.index }">
							  </div>
							  내용 : <input type="text" class="form-control form-control-user" id="viewcontent${stat.index }" name="viewcontent${stat.index }" aria-describedby="emailHelp" value="${i.content }">
							  <br>
					                  금액 : <input type="text" class="form-control form-control-user" id="viewmoney${stat.index }" name="viewmoney${stat.index }" aria-describedby="emailHelp" value="${i.money }">
					          <br>
					                  일자 :  <input type="date" class="form-control form-control-user" id="viewregdate${stat.index }" name="viewregdate${stat.index }" aria-describedby="emailHelp" value="${i.regdate }">
					          <br>
					        </div>
					        <div class="modal-footer">
					          <a href="javascript:viewUpdate(${i.num},${stat.index })" class="btn btn-success btn-icon-split">
			                    <span class="icon text-white-50">
			                      <i class="fas fa-check"></i>
			                    </span>
			                    <span class="text">수정</span>
			                  </a>
			                  <a href="javascript:viewDelete(${i.num})" class="btn btn-danger btn-icon-split">
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
					  </form>
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
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

   <!-- Bootstrap core JavaScript-->
  <script src="/household/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/household/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/household/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/household/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/household/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/household/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/household/resources/js/demo/datatables-demo.js"></script>

</body>

</html>
