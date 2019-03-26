<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script type="text/javascript" src="/household/resources/js/rsa/jsbn.js"></script>
 <script type="text/javascript" src="/household/resources/js/rsa/rsa.js"></script>
 <script type="text/javascript" src="/household/resources/js/rsa/prng4.js"></script>
 <script type="text/javascript" src="/household/resources/js/rsa/rng.js"></script>
<script type="text/javascript">
function loginBtn(){
	 var username = document.getElementById("email").value;
	 var password = document.getElementById("password").value;
if($("#email").val()==""){
	alert("이메일을 입력해주세요.");
	return false;
}
if($("#password").val()==""){
	alert("비밀번호를 입력해주세요.");
	return false;
}
try {
    var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
    var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
    submitEncryptedForm(username,password, rsaPublicKeyModulus, rsaPublicKeyExponent);
} catch(err) {
    alert(err);
}
return false;
}

function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
    var rsa = new RSAKey();
    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
	alert(username);
    // 사용자ID와 비밀번호를 RSA로 암호화한다.
    var securedUsername = rsa.encrypt(username);
    var securedPassword = rsa.encrypt(password);

    // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
    var securedLoginForm = document.getElementById("securedLoginForm");
    securedLoginForm.securedUsername.value = securedUsername;
    securedLoginForm.securedPassword.value = securedPassword;
//     securedLoginForm.submit();
    $.ajax({
    	type : "post",
    	url : "/household/main/login",
    	data : {"securedUsername":$("#securedUsername").val(),"securedPassword":$("#securedPassword").val()},
    	success:function(data){
    		if(data == 1){
    			alert("로그인 되었습니다.");
    			location.href = "/household/main/index";
    		}else if(data == 0){
    			alert("비밀번호가 틀립니다.");
    			location.reload();
    			return false;
    		}else if(data == -1){
    			alert("회원이 아닙니다.");
    			location.reload();
    			return false;
    		}
    	},
    	error : function(e){
    			alert("error :"+e);
    		}
   	});
}

</script>
<jsp:include page="../include/header.jsp"/>
<head>
<title>Login</title>
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">로그인!</h1>
                  </div>
                  <input type="text" id="rsaPublicKeyModulus" value="${publicKeyModulus }" />
            		<input type="text" id="rsaPublicKeyExponent" value="${publickeyEponent }" />
            		 <form id="securedLoginForm" name="securedLoginForm" style="display: none;">
            			<input type="hidden" name="securedUsername" id="securedUsername" value="" />
            			<input type="hidden" name="securedPassword" id="securedPassword" value="" />
        			  </form>
                  <form class="user">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="이메일주소">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="비밀번호">
                    </div>
                    <input type = "button" class="btn btn-primary btn-user btn-block" value="Login" onclick="loginBtn()">
                    <hr>
                  	<div class="text-center">
                    <a class="small" href="/household/main/forgetpassword">비밀번호 찾기</a>
                  	</div>
                  	<div class="text-center">
                    <a class="small" href="/household/main/signupform">회원가입</a>
                  	</div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="../include/footer.jsp"></jsp:include>

</body>

</html>