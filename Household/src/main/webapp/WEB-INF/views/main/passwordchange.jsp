<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/household/resources/js/household/passwordchange.js"></script>
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
                    <h1 class="h4 text-gray-900 mb-2">비밀번호 변경!</h1>
                    <br>
                  </div>
                  <form class="user">
                  	
                    <div class="form-group">
                    	<input type = "hidden" id = "email" name = "email" value = "${email }">
                      <input type="password" class="form-control form-control-user" id="newpassword" name="newpassword" placeholder="새 비밀번호">
                      <input type="password" class="form-control form-control-user" id="newpasswordcheck" name="newpasswordcheck" placeholder="새비밀번호 확인">
                    </div>
                    <input type = "button" class="btn btn-primary btn-user btn-block" value = "변경하기" onclick="passwordBtn()">
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

  <!-- Bootstrap core JavaScript-->
  <script src="/household/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/household/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/household/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/household/resources/js/sb-admin-2.min.js"></script>

</body>

</html>
