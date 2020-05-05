<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <title>test</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">

  <style>

  </style>
  <link href="css/studio1.css" rel="stylesheet" type="text/css" />
  <style type='text/css'>
    @-ms-viewport {
      width: device-width;
    }

    @-o-viewport {
      width: device-width;
    }

    @viewport {
      width: device-width;
    }
  </style>

</head>

<body style="width:90%; margin: 0 auto;">

  <header id = "header" style="height:150px;text-align:center;vertical-align:middle;position:relative;">

    <nav style="position:absolute;top:0px;right:0px;">

    <div class="to_reservation" onclick="location.href='reservation'">
      <p>예약하기</p>
    </div>
    <div class="to_home" onclick="location.href='cancellation'">
      <p>예약취소</p>
    </div>
    </nav>
      <div id="main_title"><p><b>42 SEOUL Youtube Studio 예약 시스템</b><p></div>
    <img src="img/42.png" alt="42_logo" style="width:100px;position:absolute;left:0px;top:0px;" />
  </header>

  <aside style="float:left;width:15%;height:inherit;background-color:blue;display:none;">a
  </aside>
  <article style="overflow:hidden;">
    <section class="occupied" style="height:120px;width:100%;text-align:center;vertical-align:middle">
        <div class="studio1_status" data-snum="1" style="line-height:100px;background-color:#02c4c7;position:relative;display:inline-block;">
          <p>▶ Studio1</p>
        </div>
        <div class="studio2_status" data-snum="2" style="line-height:100px;background-color:#797272;position:relative;margin-left:100px;display:inline-block;">
          <p>▶ Studio2</p>
        </div>
      
    </section>
    <section style="float:left;width:100%;">
      <table style="width:100%;text-align:center">
      	<thead>
          <tr>
            <td >시간</td>
            <td >월</td>
            <td >화</td>
            <td >수</td>
            <td >목</td>
            <td >금</td>
            <td >토</td>
            <td >일</td>
          </tr>
      	</thead>
        <tbody class="async_table">
  
        </tbody>
      </table>
    </section>
  </article>
  <div id = "top">
    <p style="margin:30px auto;">
    <a href="#header">
      <img src="img/back-to-top-icon-png-8.jpg" style="width: 40px;height: 40px;" alt="top" />
       </a></p>
 
  </div>
  <footer style="display:block;clear:both;height:150px;text-align:center">


    <div style="margin-top:20px;">
      <img src="img/miscellaneous.png" alt="call" />
      010-5464-9342 <br><br>
      <img src="img/multimedia.png" alt="email" />
      kchoi@student.42seoul.kr
    </div>

  </footer>
  <script type="template" id="dayList">
    <td >{user_id}</td>
    </script>
</body>
<script src="js/studio.js"></script>

</html>

<!--  
  <header style="height:150px;font-size:30px;text-align:center;vertical-align:middle;position:relative;">
    <div id="test"></div>

    <nav style="position:absolute;top:0px;right:0px;">
      <a href="reservation"><button type="button" class="btn_reservation" style="margin-right:10px;">예약하기</button></a>
      <a href="cancellation"><button type="button" class="btn_cancellation" style="margin-right:20px;">예약취소</button></a>
    </nav>
    <span class="just_to_middle_align" style="line-height:150px;">
      <div><b>42 SEOUL Youtube Studio 예약 시스템</b></div>
    </span>
    <img src="img/42.png" alt="42_logo" style="width:100px;position:absolute;left:0px;top:0px;" />
  </header>

  <aside style="float:left;width:15%;height:inherit;background-color:blue;display:none;">a
  </aside>
  <article style="overflow:hidden;">
    <section class="occupied" style="height:150px;width:100%;text-align:center;vertical-align:middle">
      <span class="just_to_middle_align" style="">
        <div class="studio1_status" data-snum="1" style="height:100px;line-height:100px;width:150px;background-color:#7bc379;position:relative;display:inline-block;">
          Studio1
        </div>
        <div class="studio2_status" data-snum="2" style="height:100px;line-height:100px;width:150px;background-color:#e05749;position:relative;margin-left:100px;display:inline-block;">
          Studio2
        </div>
      </span>
    </section>
    
    -->