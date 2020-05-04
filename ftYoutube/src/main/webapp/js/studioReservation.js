document.write("<script src='password_hashing.js'></script>");


var btn_submit = document.querySelector("#btn_submit");
var test = document.querySelector("#test");
var avail = document.querySelector(".available");



function check_password(){
	var pw_info = document.querySelector(".user_pw_info").value;
	var pw_check = document.querySelector(".user_pw_check").value;
	if (pw_info != pw_check){
		window.alert("비밀번호가 일치하지 않습니다");
	} else {
		btn_submit.style.display="inline-block;"
	}
	
}

function check_time(json){
	if (json.availability == "negative"){
		alert("선택하신 시간은 이미 예약이 되어 있습니다.")
	}
	if (json.availability == "positive"){
		test.innerHTML += "예약 가능";
		btn_submit.style.display="inline-block";
	}
}

function check_pw_ajax(url){
	var oReq = new XMLHttpRequest;
	oReq.open('GET', url);
	
	oReq.setRequestHeader = ("Content-type", "application/json");
	oReq.responseType = "text";
	oReq.addEventListener('load', function(){
		var json = JSON.parse(oReq.responseText);

		check_time(json);
		check_password();
	});
	oReq.send();
}

//check if chosen time is available
avail.addEventListener('click', function(){
	var radio_studio1 = document.querySelector(".radio_studio1");
	var radio_studio2 = document.querySelector(".radio_studio2");
	var day = document.querySelector(".day_info").value;
	var hour = document.querySelector(".hour_info").value;
	var number;
	
	if (radio_studio1.checked){
		number = radio_studio1.value;
	} else if (radio_studio2.checked){
		number = radio_studio2.value;
	}
	check_pw_ajax('/ftYoutube/get/reservation?number=' + number 
			+ '&day=' + day + '&hour=' + hour);
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
	window.alert(user_pw);
	var number;
	
	if (radio_studio1.checked){
		number = radio_studio1.value;
	} else if (radio_studio2.checked){
		number = radio_studio2.value;
	}
		
	submit_ajax('/ftYoutube/post_reservation?number=' + number 
			+ '&day=' + day + '&hour=' + hour + '&userId=' + user_id + '&userPw=' + user_pw);
});