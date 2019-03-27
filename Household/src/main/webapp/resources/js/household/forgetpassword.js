/**
 * 인증키 이메일 발송.
 * 입력된 인증키 확인.
 */
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
 				//인증키가 발송되면 인증키 입력창과 버튼생성
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
 				//인증되면 비밀번호 변경창으로 이동.
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