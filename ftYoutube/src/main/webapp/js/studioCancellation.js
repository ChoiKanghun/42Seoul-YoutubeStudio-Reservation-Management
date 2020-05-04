document.write("<script src='password_hashing.js'></script>");

var btn_submit = document.querySelector("#btn_submit");

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
		
	submit_ajax('/ftYoutube/delete/cancellation?number=' + number 
			+ '&day=' + day + '&hour=' + hour + '&userId=' + user_id + '&userPw=' + user_pw);
});