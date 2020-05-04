var btn_submit = document.querySelector("#btn_submit");
var when_available = document.querySelector(".availability");
var avail = document.querySelector(".available");


function check_deletable(json){
	if (json.availability == "negative"){
		alert("선택하신 날짜, 시간 그리고 아이디 비밀번호를 확인해주세요!")
	}
	if (json.availability == "positive"){
		when_available.innerHTML = "<img src = 'img/Bell_icon.png' style='width:10px;height:10px' /> 취소 가능합니다";
		avail.style.display = "none";
		btn_submit.style.display = "inline-block";
	}
}

function check_ajax(url){
	var oReq = new XMLHttpRequest;
	oReq.open('GET', url);
	
	oReq.setRequestHeader = ("Content-type", "application/json");
	oReq.responseType = "text";
	oReq.addEventListener('load', function(){
		var json = JSON.parse(oReq.responseText);

		check_deletable(json);
	});
	oReq.send();
}

//check if chosen time is available
avail.addEventListener('click', function(){
	var radio_studio1 = document.querySelector(".radio_studio1");
	var radio_studio2 = document.querySelector(".radio_studio2");
	var day = document.querySelector(".day_info").value;
	var hour = document.querySelector(".hour_info").value;
	var user_id = document.querySelector(".user_id_info").value;
	var user_pw = document.querySelector(".user_pw_info").value;
	user_pw = SHA256(user_pw);
	var number;
	
	if (radio_studio1.checked){
		number = radio_studio1.value;
	} else if (radio_studio2.checked){
		number = radio_studio2.value;
	}
	
	if (day == "" || hour == ""){
		window.alert("날짜와 시간을 지정해주세요 !");
		return ;
	}
	if (user_id == "" || user_pw == ""){
		window.alert("아이디와 비밀번호를 입력해주세요 !");
		return ;
	}
	
	check_ajax('/ftYoutube/check/cancellation?number=' + number 
			+ '&day=' + day + '&hour=' + hour
			+ '&userId=' + user_id + '&userPw=' + user_pw);
});

/* <<<<<<<<<<<<<<<<<<  check availability <<<<<<<<<<<<<
 * 
 * >>>>>>>>>>>>>>>>>>  on btn click send post >>>>>>>>>
 */

function submit_ajax(url){
	var oReq = new XMLHttpRequest;
	oReq.open('POST', url);
	
	oReq.setRequestHeader = ("Content-type", "application/json");
	oReq.responseType = "text";
	oReq.addEventListener('load', function(){
		window.alert("취소 되었습니다!")

	});
	oReq.send();
}

btn_submit.addEventListener('click', function(){
	var radio_studio1 = document.querySelector(".radio_studio1");
	var radio_studio2 = document.querySelector(".radio_studio2");
	var day = document.querySelector(".day_info").value;
	var hour = document.querySelector(".hour_info").value;
	var user_id = document.querySelector(".user_id_info").value;
	var user_pw = document.querySelector(".user_pw_info").value;
	user_pw = SHA256(user_pw);
	var number;
	
	if (radio_studio1.checked){
		number = radio_studio1.value;
	} else if (radio_studio2.checked){
		number = radio_studio2.value;
	}
		
	submit_ajax('/ftYoutube/delete/cancellation?number=' + number 
			+ '&day=' + day + '&hour=' + hour + '&userId=' + user_id + '&userPw=' + user_pw);
});