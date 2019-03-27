/**
 * 유효성검사, 회원가입.
 */
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