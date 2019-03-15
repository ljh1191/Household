<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<jsp:include page="../include/header.jsp"/>

<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                  <form class="user">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="이메일주소">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호">
                    </div>
                    <script type="text/javascript">
                    function loginBtn(){
                    	if($("#email").val()==""){
                    		alert("이메일을 입력해주세요.");
                    		return false;
                    	}
                    	if($("#password").val()==""){
                    		alert("비밀번호를 입력해주세요.");
                    		return false;
                    	}
                    	$.ajax({
                    		type : "post",
                    		url : "/household/main/login",
                    		data : {"email":$("#email").val(),"password":$("#password").val()},
                    		success:function(data){
                    			if(data == 1){
                    				alert("로그인 되었습니다.");
                    				location.href = "/household/main/index";
                    			}else if(data == 0){
                    				alert("비밀번호가 틀립니다.");
                    				return false;
                    			}else if(data == -1){
                    				alert("회원이 아닙니다.");
                    				return false;
                    			}
                    		},
                    		error : function(e){
								alert("error :"+e);
							}
                		})
                    }
                    </script>
                    <input type = "button" class="btn btn-primary btn-user btn-block" value="Login" onclick="loginBtn()">
                    <hr>
                    <a href="index.html" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> Login with Google
                    </a>
                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="forgot-password.html">Forgot Password?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="/household/main/signupform">회원가입</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
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

</body>

</html>