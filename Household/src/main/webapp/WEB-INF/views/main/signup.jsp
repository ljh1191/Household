<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<jsp:include page="../include/header.jsp"/>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
              </div>
              <form class="user">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="name" name = "name" placeholder="이름">
                  </div>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="이메일주소">
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="passwordcheck" name="passwordcheck" placeholder="비밀번호 확인">
                  </div>
                </div>
                <script type="text/javascript">
                function signupBtn(){
                	//빈값체크
                	if($("#name").val()==""){
                		alert("이름을 입력해주세요.");
                		return false;
                	}
                	if($("#email").val()==""){
                		alert("이메일을 입력해주세요.");
                		return false;
                	}
                	if($("#password").val()==""){
                		alert("비밀번호를 입력해주세요.");
                		return false;
                	}
                	if($("#passwordcheck").val()==""){
                		alert("비밀번호 확인을 입력해주세요.");
                		return false;
                	}
                	//비밀번호 일치여부 확인
					if($("#password").val()==$("#passwordcheck").val()){
						$.ajax({
							type : "post",
							url : "/household/main/signup",
							data : {"name" : $("#name").val(),"email" : $("#email").val(),"password" : $("#password").val()},
							success:function(data){
								if(data == -1){
									alert("이미 가입된 이메일이 있습니다.");
									return false;
								}else if(data == 1){
									alert("회원가입 되었습니다.");
									location.href = "/household/main/loginform";
								}
							},
							error : function(e){
								alert("error :"+e);
							}
						});
					}else{
						alert("비밀번호가 틀립니다.");
						return false;
					}
                }
                </script>
                <input type = "button" class="btn btn-primary btn-user btn-block" value="Sign Up" onclick="signupBtn()">
                
                <hr>
                <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="forgot-password.html">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="/household/main/loginform">로그인</a>
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