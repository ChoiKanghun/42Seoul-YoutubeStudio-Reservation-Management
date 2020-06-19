var studio_btn_lst = document.querySelector(".occupied").querySelectorAll("div");
var test = document.querySelector("#test");

function addReserveEvent(json, snum) {
  var tableDatas = document.querySelectorAll(".tableData");

  tableDatas.forEach(function(tableData, index) {
    tableData.addEventListener("click", function() {
      var intraId = document.querySelector("#loginInfo").dataset.login;
      var url;
      var queryString = "number=" + snum + "&" +
        "hour=" + tableData.dataset.hour + "&" +
        "day=" + tableData.dataset.day + "&" +
        "&intraId=" + intraId;
      
      var oReq = new XMLHttpRequest;

      if (tableData.innerText === "-") {
        if (intraId !== "로그인하기") {
          url = "get/studio?" + queryString;
          oReq.open('GET', url);
          oReq.setRequestHeader = ("Content-type", "application/json");
          oReq.responseType = "text";
          oReq.addEventListener('load', function() {
            sendAjax('/ftYoutube/get/studio' + snum, snum);
          });
          oReq.send();
        } else {
          alert("로그인해주세요!");
        }
      } else if (intraId == tableData.innerText) {
    	url = "delete/cancellation?" + queryString;
        oReq.open('GET', url);
        oReq.setRequestHeader = ("Content-type", "application/json");
        oReq.responseType = "text";
        oReq.addEventListener('load', function() {
        	console.log(this.responseText);
          sendAjax('/ftYoutube/get/studio' + snum, snum);
        });
        oReq.send();
      } else {
        alert("취소할 수 없습니다.\n로그인하지 않았거나 유저 정보가 일치하지 않습니다.");
      }
    })
  })
}

function getDay(index) {
  var divided = (index % 7);

  switch (divided) {
    case 0:
      return "firstday";
    case 1:
      return "secondday";
    case 2:
      return "thirdday";
    case 3:
      return "fourthday";
    case 4:
      return "fifthday";
    case 5:
      return "sixthday";
    case 6:
      return "seventhday";
  }
  alert("no match index");
}
// the function adds table info with json.responseText
function addTableHtml(oReq, snum) {
  var json = JSON.parse(oReq.responseText);
  var async_table = document.querySelector(".async_table");
  var sourceHTML = document.querySelector("#dayList").innerHTML;
  var resultHTML = "";

  // clear all contents
  async_table.innerHTML = "";

  for (var i = 0; i < json.studios.length; i++) {
    // initialize
    if (i == 0) {
      resultHTML += "<tr>" +
        "<td style='font-weight:600;color:#02c4c7;width:15%'>00:00</td>";
    }
    // when it encounters first day
    else if (i % 7 == 0) {
      resultHTML += "</tr>";
      async_table.insertAdjacentHTML("beforeend", resultHTML);
      resultHTML = "<tr>" +
        "<td style='font-weight:600;color:#02c4c7;width:15%'>" +
        json.studios[i].hour + ":" + json.studios[i].minute +
        "</td>";
    }
    resultHTML += sourceHTML
      .replace("{user_id}", json.studios[i].userId)
      .replace("{day}", getDay(i))
      .replace("{hour}", json.studios[i].hour);
  }
  resultHTML += "</tr>";

  // adds before end of async_table
  async_table.insertAdjacentHTML("beforeend", resultHTML);

  addReserveEvent(json, snum);
}

// sends Ajax to get json from REST API Controller
function sendAjax(url, snum) {
  var oReq = new XMLHttpRequest;
  oReq.open('GET', url);
  oReq.setRequestHeader = ("Content-type", "application/json");
  oReq.responseType = "text";
  oReq.addEventListener('load', function() {
    addTableHtml(this, snum);
  });
  oReq.send();
}

/*
 * * when the studio1(2) are clicked, * 1. it deletes .async_table's innerHTML *
 * 2. it shows studio1(2)'s status
 */
for (var i = 0; i < studio_btn_lst.length; i++) {
  studio_btn_lst[i].addEventListener("click", function(evt) {
    var async_table = document.querySelector(".async_table");
    var snum;

    // event bubbling
    if (evt.target.tagName == "SECTION") {
      snum = evt.target.firstChild.firstChild.dataset.snum;
    } else if (evt.target.tagName == "P") {
      snum = evt.target.parentElement.dataset.snum;
    } else {
      snum = evt.target.dataset.snum;
    }

    // when client click fast in succession
    if (snum == '1' && document.querySelector(".studio1_status").style.backgroundColor == '#02c4c7')
      return;
    if (snum == '2' && document.querySelector(".studio2_status").style.backgroundColor == '#02c4c7')
      return;

    // change studio div's background-color
    if (snum == '1') {
      document.querySelector(".studio1_status").style.backgroundColor = '#02c4c7';
      document.querySelector(".studio2_status").style.backgroundColor = '#797272';
    }
    if (snum == '2') {
      document.querySelector(".studio2_status").style.backgroundColor = '#02c4c7';
      document.querySelector(".studio1_status").style.backgroundColor = '#797272';
    }

    // sendAjax with clicked box's dataset(1 or 2)
    sendAjax('/ftYoutube/get/studio' + snum, snum);
  });
}

// when dom loaded, shows studio1's info
window.addEventListener('DOMContentLoaded', (evt) => {
  sendAjax('/ftYoutube/get/studio1', 1);
});