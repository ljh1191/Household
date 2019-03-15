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
              <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
                    <p class="mb-4">We get it, stuff happens. Just enter your email address below and we'll send you a link to reset your password!</p>
                  </div>
                  <form class="user">
                  	
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="email" name="email" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                    </div>
                    <div id = "keyok_text"></div>
                    <script type="text/javascript">
                    function forgetBtn(){
                    	if($("#email").val() == ""){
                    		alert("이메일을 입력해주세요.");
                    		return false;
                    	}
                    	$.ajax({
                    		type : "post",
                    		url : "/household/main/forgetpassword",
                    		data : {"email":$("#email").val()},
                    		success:function(data){
                    			if(data == 1){
                    				alert("메일이 성공적으로 발송되었습니다. 인증키를 입력해주세요.");
                    				$('#keyok_text').html("<div class='form-group'><input type='text'class='form-control form-control-user' id='authkey' name='authkey' aria-describedby='emailHelp' placeholder='authkey...'></div>");
                    				$('#keyok_btn').html("<input type = 'button' class='btn btn-primary btn-user btn-block' value = '인증' onclick='authkeyBtn()'>");
                    			}else{
                    				alert("등록된 회원이 아닙니다.");
                    			}
                    		},
                    		error : function(e){
								alert("error :"+e);
							}
                		});
                    }
                    function authkeyBtn(){
                    	if($("#authkey").val() == ""){
                    		alert("인증키를 입력해주세요.");
                    		return false;
                    	}
                    	$.ajax({
                    		type : "post",
                    		url : "/household/main/authkey",
                    		data : {"authkey" : $("#authkey").val(),"email" : $("#email").val()},
                    		success:function(data){
                    			if(data == 1){
                    				alert("인증되었습니다.");
                    				location.href = "/household/main/passwordchangeForm?email="+$("#email").val();
                    			}else{
                    				alert("인증키가 일치하지 않습니다.");
                    				return false;
                    			}
                    		},
                    		error : function(e){
								alert("error :"+e);
							}
                    		
                    	});
                    }
                    </script>
                    <div id = "keyok_btn">
                    <input type = "button" class="btn btn-primary btn-user btn-block" value = "인증메일 발송" onclick="forgetBtn()">
                    </div>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="register.html">Create an Account!</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="login.html">Already have an account? Login!</a>
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
