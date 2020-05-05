var studio_btn_lst = document.querySelector(".occupied").querySelectorAll("div");
var test = document.querySelector("#test");

function addTableHtml(oReq){
	var json = JSON.parse(oReq.responseText);
	var async_table = document.querySelector(".async_table");
	var sourceHTML = document.querySelector("#dayList").innerHTML;
	var resultHTML = "";
	for (var i = 0; i < json.studios.length; i++){
		if (i == 0){
			resultHTML += "<tr>" +
			"<td style='font-weight:600;color:#02c4c7;width:15%'>00:00</td>";
		}
		else if (i % 7 == 0 ){
			resultHTML += "</tr>";
			async_table.insertAdjacentHTML("beforeend", resultHTML);
			resultHTML = "<tr>"
				+ "<td style='font-weight:600;color:#02c4c7;width:15%'>"
				+ json.studios[i].hour + ":" + json.studios[i].minute
				+ "</td>";
		}
		resultHTML += sourceHTML
			.replace("{user_id}", json.studios[i].userId);
	}
	resultHTML += "</tr>";
	async_table.insertAdjacentHTML("beforeend", resultHTML);
	
}

//sends Ajax to get json from REST API Controller
function sendAjax(url){
	var oReq = new XMLHttpRequest;
	oReq.open('GET', url);
	oReq.setRequestHeader = ("Content-type", "application/json");
	oReq.responseType = "text";
	oReq.addEventListener('load', function(){
		addTableHtml(this);
	});
	oReq.send();
}

/*
** when the studio1(2) are clicked, 
** 1. it deletes .async_table's innerHTML
** 2. it shows studio1(2)'s status
*/
for (var i = 0; i < studio_btn_lst.length ; i++){
	studio_btn_lst[i].addEventListener("click", function(evt){
		var async_table = document.querySelector(".async_table");
		var snum;
		
		//event bubbling
		if (evt.target.tagName == "SECTION"){
			snum = evt.target.firstChild.firstChild.dataset.snum;
		} else if (evt.target.tagName == "P"){
			snum = evt.target.parentElement.dataset.snum;
		} else{
			snum = evt.target.dataset.snum;
		}
		
		//clear all contents
		async_table.innerHTML="";
		
		//change studio div's background-color
		if (snum == '1'){
			document.querySelector(".studio1_status").style.backgroundColor = '#02c4c7';
			document.querySelector(".studio2_status").style.backgroundColor = '#797272';
		}
		if (snum == '2'){
			document.querySelector(".studio2_status").style.backgroundColor = '#02c4c7';
			document.querySelector(".studio1_status").style.backgroundColor = '#797272';
		}
		
		//sendAjax with clicked box's dataset(1 or 2)
		sendAjax('/ftYoutube/get/studio' + snum);
	});
}

//when dom loaded, shows studio1's info
window.addEventListener('DOMContentLoaded', (event) => {
	sendAjax('/ftYoutube/get/studio1');
});