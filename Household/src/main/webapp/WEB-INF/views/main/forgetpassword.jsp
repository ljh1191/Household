<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
<jsp:include page="../include/header.jsp"/>
<head>
<title>Forget Password</title>
</head>

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
                    <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기!</h1>
                    <br>
                    <p class="mb-4">아래에 이메일 주소를 입력하면 비밀번호를 재설정 할 수있는 인증키가 전송됩니다.</p>
                  </div>
                  <form class="user">
                  	
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="email" name="email" aria-describedby="emailHelp" placeholder="이메일주소...">
                    </div>
                    <div id = "keyok_text"></div>
                    <div id = "keyok_btn">
                    <input type = "button" class="btn btn-primary btn-user btn-block" value = "인증메일 발송" onclick="forgetBtn()">
                    </div>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="/household/main/signupform">회원가입</a>
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

    </div>

  </div>

  <jsp:include page="../include/footer.jsp"></jsp:include>

</body>

</html>
