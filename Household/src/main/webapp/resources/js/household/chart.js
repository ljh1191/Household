/**
 * 월별 차트 dropdown버튼.
 */
function mondropdownBtn(num){
	$("#dropdownMonButton").html(num+"월");
	var str = "";
	//db에있는 월값과 비교를 위해 1~9까지의 숫자는 앞에 0을 붙여준다.
	if(num < 10){
		str = ("0"+num);
	}else{
		str = (""+num);
	}
	
	location.href = "/household/main/chartForm?membernum="+$("#membernum").val()+"&month="+str;
}
$(document).ready(function(){
	if($("#mon_dx").val()==0){
		alert("지출내역이 없습니다.");
		return false;
	}
});