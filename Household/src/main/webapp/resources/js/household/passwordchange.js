/**
 * 유효성검사, 비밀번호 변경
 */
function passwordBtn(){
	if($("#newpassword").val() == ""){
	alert("새비밀번호를 입력해주세요.");
		return false;
	}
	if($("#newpasswordcheck").val() == ""){
	alert("새비밀번호 확인를 입력해주세요.");
		return false;
	}
	if($("#newpassword").val() == $("#newpasswordcheck").val()){
		$.ajax({
			type : "post",
		url : "/household/main/passwordchange",
		data : {"email" : $("#email").val(),"password" : $("#password").val(),"newpassword" : $("#newpassword").val(),"newpasswordcheck" : $("#newpasswordcheck").val()},
		success:function(data){
//			if(data == 1){
				alert("비밀번호가 변경되었습니다.");
		location.href = "/household/main/loginform";
//		}else{
//			alert("현재 비밀번호가 틀립니다.");
//				return false;
//			}
		},
		error : function(e){
			alert("error :"+e);
					}
		    		
		    	});
			}
}