var btn_submit = document.querySelector("#btn_submit");
var when_available = document.querySelector(".availability");
var avail = document.querySelector(".available");

//prevent enter key
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
}, true);

//check if both password and password_check string is identical
function check_password(){
	var pw_info = document.querySelector(".user_pw_info").value;
	var pw_check = document.querySelector(".user_pw_check").value;
	if (pw_info != pw_check){
		window.alert("비밀번호가 일치하지 않습니다");
		when_available.style.display = "none";
		avail.style.display = "inline-block";
		btn_submit.style.display="none";
	} else {
		btn_submit.style.display="inline-block;"
		when_available.style.display = "inline-block";

	}
	
}

//check if time is available
function check_time(json){
	when_available.innerHTML = "";
	if (json.availability == "negative"){
		alert("선택하신 시간은 이미 예약이 되어 있습니다.")
	}
	if (json.availability == "positive"){
		when_available.innerHTML = "<img src = 'img/Bell_icon.png' style='width:18px;height:18px' /> 예약 가능합니다";
		avail.style.display = "none";
		btn_submit.style.display = "inline-block";
	}
}

//send ajax
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
	var user_id = document.querySelector(".user_id_info").value;
	var user_pw = document.querySelector(".user_pw_info").value;
	var user_pw_checked = document.querySelector(".user_pw_check").value;
	var number;
	
	if (radio_studio1.checked){
		number = radio_studio1.value;
	} else if (radio_studio2.checked){
		number = radio_studio2.value;
	}
	
	//if day or hour is null
	if (day == "" || hour == ""){
		window.alert("날짜와 시간을 지정해주세요 !");
		return ;
	}
	//if user_id or user_pw is null
	if (user_id == "" || user_pw == "" || user_pw_checked == ""){
		window.alert("아이디와 비밀번호를 입력해주세요 !");
		return ;
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
	window.alert("예약 되었습니다!")
	oReq.addEventListener('load', function(){
	});
	oReq.send();
}

//send url to ajax event with form info
//user_pw will be encrypted with SHA256
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
		
	submit_ajax('/ftYoutube/post_reservation?number=' + number 
			+ '&day=' + day + '&hour=' + hour + '&userId=' + user_id + '&userPw=' + user_pw);
});