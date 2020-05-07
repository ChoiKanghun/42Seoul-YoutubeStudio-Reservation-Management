var btn_submit = document.querySelector("#btn_submit");
var when_available = document.querySelector(".availability");
var avail = document.querySelector(".available");

function check_deletable(json){
	if (json.availability == "negative"){
		alert("선택하신 날짜, 시간 그리고 아이디 비밀번호를 확인해주세요!")
	}
	if (json.availability == "positive"){
		when_available.innerHTML = "<img src = 'img/Bell_icon.png' style='width:18px;height:18px' /> 취소 가능합니다";
		avail.style.display = "none";
		btn_submit.style.display = "inline-block";
	}
}

//gets user_id and user_pw
//check if client's cancellation request is available
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

//check if chosen time is cancel-able
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
	
	//if day or hour is null
	if (day == "" || hour == ""){
		window.alert("날짜와 시간을 지정해주세요 !");
		return ;
	}
	//if user_id or user_pw is null
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


//set user_id and user_pw 'null' with client's request.
function submit_ajax(url){
	var oReq = new XMLHttpRequest;
	oReq.open('POST', url);
	
	oReq.setRequestHeader = ("Content-type", "application/json");
	oReq.responseType = "text";
	window.alert("취소 되었습니다!")

	oReq.addEventListener('load', function(){

	});
	oReq.send();
}

//send url to ajax event with form info
//it converts the client's password to encrypted String with SHA256
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