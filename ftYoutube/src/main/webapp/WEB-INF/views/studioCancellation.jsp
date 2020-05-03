<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form class="" action="delete/cancellation" method='GET' style="margin : 0 auto;width:50%;text-align:center">
    <fieldset>
    	<input class="radio_studio1" type = "radio" name="number" value = "1" checked/>Studio1
    	<input class="radio_studio2" type = "radio" name="number" value = "2"/>Studio2
      <legend>비회원 로그인</legend>
      요일 :
     <select class="day_info" name="day" onchange="deleteBtn()">
        <option value="monday">월</option>
        <option value="tuesday">화</option>
        <option value="wednesday">수</option>
        <option value="thursday">목</option>
        <option value="friday">금</option>
        <option value="saturday">토</option>
        <option value="sunday">일</option>
      </select>
      시간 :
      <select class="hour_info" name="hour" onchange="deleteBtn()">
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

<br>
      아이디 : <input class="user_id_info" type="text" name="userId" value="">
      <br>
      비밀번호 : <input class="user_pw_info" type="password" name="userPw" value="">
    </fieldset>
    <div class ="available">예약가능여부 확인</div>
    <button id = "btn_submit" type="submit">submit</button>t
</form>
<p id="test"></p>
</body>
</html>