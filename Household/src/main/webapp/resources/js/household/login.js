/*
 * 유효성검사, 받은 공개키 할당
 * 암호화후 callback
 */
function loginBtn(){
 	var username = $("#email").val();
 	var password = $("#password").val();
	if($("#email").val()==""){
		alert("이메일을 입력해주세요.");
		return false;
	}
	if($("#password").val()==""){
		alert("비밀번호를 입력해주세요.");
		return false;
	}
	try {
	    var rsaPublicKeyModulus = $("#rsaPublicKeyModulus").val();
	    var rsaPublicKeyExponent = $("#rsaPublicKeyExponent").val();
	    submitEncryptedForm(username,password, rsaPublicKeyModulus, rsaPublicKeyExponent);
	} catch(err) {
	    alert(err);
	}
	return false;
	}
	
	function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
	    var rsa = new RSAKey();
	    rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
	    // 암호화
	    var securedUsername = rsa.encrypt(username);
	    var securedPassword = rsa.encrypt(password);
	
	    // value 값넣고 콜백
	    var securedLoginForm = $("#securedLoginForm").val();
	    $("#securedUsername").val(securedUsername);
	    $("#securedPassword").val(securedPassword);
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