var btn_submit = document.querySelector("#btn_submit");
var test = document.querySelector("#test");
var avail = document.querySelector(".available");


function check_availability(url){
	var oReq = new XMLHttpRequest;
	oReq.open('GET', url);
	
	oReq.setRequestHeader = ("Content-type", "application/json");
	oReq.responseType = "text";
	oReq.addEventListener('load', function(){
		var json = JSON.parse(this.responseText);
		if (json.availability == "negative"){
			alert("선택하신 시간은 이미 예약이 되어 있습니다.")
		}
		if (json.availability == "positive"){
			test.innerHTML += "예약 가능";
			btn_submit.style.display="inline-block";
		}
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
	check_availability('/ftYoutube/get/reservation?number=' + number 
			+ '&day=' + day + '&hour=' + hour);
});

btn_submit.addEventListener('click', function(){

});