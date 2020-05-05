<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Studio Cancellation</title>
  <link href="css/studioCancellation.css" rel="stylesheet" type="text/css" />
  <link href="css/studioCancellation-media.css" rel="stylesheet" type="text/css" media="screen and (min-width: 359px) and (max-width:1024px)"/>

</head>

<body>

  <div class="container">
  <header id = "header" >

    <nav>

    <div class="to_home" onclick="location.href='studio'">
      <p>홈으로</p>
    </div>
    <div class="to_reservation" onclick="location.href='reservation'">
      <p>예약하기</p>
    </div>
    </nav>
      <div id="main_title"><p><b>42 SEOUL Youtube Studio 예약 시스템</b><p></div>
    <a href="studio">
    <img class="logo_42" src="img/42.png" alt="42_logo"  />
    </a>
  </header>
  
    <div class="wrap_content">
      <form action="cancellation" method="POST" >
        <fieldset>
          <legend>예약 삭제하기</legend>
          <div id="wrapper_radio_boxes" class="wrap_input">
            <div class="wrap_radio">
              <input class="radio_studio1" type="radio" name="number" value="1" checked onchange="deleteBtn()"/>Studio1
              <input class="radio_studio2" type="radio" name="number" value="2" onchange="deleteBtn()"/>Studio2
            </div>
            <span class="focus_input"></span>
          </div>
          <div class="wrap_input">
            <select id="input_day" class="day_info" name="day" onchange="deleteBtn()" required>
              <option value="" disabled selected style="color:gray">취소할 요일을 선택하세요</option>
              <option value="monday">월요일</option>
              <option value="tuesday">화요일</option>
              <option value="wednesday">수요일</option>
              <option value="thursday">목요일</option>
              <option value="friday">금요일</option>
              <option value="saturday">토요일</option>
              <option value="sunday">일요일</option>
            </select>
            <span class="focus_input"></span>

          </div>
          <div class="wrap_input">
            <select id="input_hour" class="hour_info" name="hour" onchange="deleteBtn()" required>
              <option value="" disabled selected style="color:gray">취소할 시간을 선택하세요</option>
              <optgroup label="오전">
                <option value="00">00:00</option>
                <option value="01">01:00</option>
                <option value="02">02:00</option>
                <option value="03">03:00</option>
                <option value="04">04:00</option>
                <option value="05">05:00</option>
                <option value="06">06:00</option>
                <option value="07">07:00</option>
                <option value="08">08:00</option>
                <option value="09">09:00</option>
                <option value="10">10:00</option>
                <option value="11">11:00</option>
              </optgroup>
              <optgroup label="오후">
                <option value="12">12:00</option>
                <option value="13">13:00</option>
                <option value="14">14:00</option>
                <option value="15">15:00</option>
                <option value="16">16:00</option>
                <option value="17">17:00</option>
                <option value="18">18:00</option>
                <option value="19">19:00</option>
                <option value="20">20:00</option>
                <option value="21">21:00</option>
                <option value="22">22:00</option>
                <option value="23">23:00</option>
              </optgroup>
            </select>
            <span class="focus_input"></span>

          </div>
          <div class="wrap_input">
            <input id="input_user_id" class="user_id_info" type="text" name="userId" placeholder="예약한 아이디" maxlength="15" required>
            <span class="focus_input"></span>
          </div>

          <div class="wrap_input">
            <input id="input_user_pw" class="user_pw_info" type="password" name="userPw" onchange="deleteBtn()" placeholder="예약한 비밀번호" maxlength="15" required>
            <span class="focus_input"></span>
          </div>


          <div class="btn_area">
            <div class="availability"></div>
            <div class="available">
              <p>취소가능여부 확인</p>
            </div>
            <button id="btn_submit" type="submit" style="display:none">취소하기</button>
          </div>
        </fieldset>

      </form>

    </div>
  </div>
  <script>
    function deleteBtn() {
      document.querySelector("#btn_submit").style.display = "none";
      document.querySelector(".availability").innerHTML = "";
      document.querySelector(".available").style.display = "inline-block";
    }
  </script>
</body>
<script src="js/password_hashing.js"></script>
<script src="js/studioCancellation.js"></script>

</html>
