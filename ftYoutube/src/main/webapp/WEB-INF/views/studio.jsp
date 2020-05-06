<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <title>42 Youtube Studio</title>
  <meta charset="utf-8">
  <link href="css/studio-media.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 359px) and (max-width:1024px)">
  <link href="css/studio-media-ultimate-small.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 1px) and (max-width:358px)">
  <link href="css/studio.css" rel="stylesheet" type="text/css" />
  <link href="css/studio-headers.css" rel="stylesheet" type="text/css" />

</head>

<body>
  <div class="container">

    <header id="header">

      <nav>

        <div class="to_reservation" onclick="location.href='reservation'">
          <p>예약하기</p>
        </div>
        <div class="to_home" onclick="location.href='cancellation'">
          <p>예약취소</p>
        </div>
      </nav>
      <div id="main_title">
        <p><b>42 SEOUL Youtube Studio 예약 시스템</b>
          <p>
      </div>
      <a href="studio">
        <img class="logo_42" src="img/42.png" alt="42_logo" />
      </a>
    </header>

    <aside style="float:left;width:15%;height:inherit;background-color:blue;display:none;">a
    </aside>
    <article style="overflow:hidden;">
      <section class="occupied">
        <div class="studio1_status" data-snum="1">
          <p>▶ Studio1</p>
        </div>
        <div class="studio2_status" data-snum="2">
          <p>▶ Studio2</p>
        </div>

      </section>
      <section class="section_table" style="text-align:center">
        <table>
          <thead>
            <tr>
              <td>시간</td>
              <td>월</td>
              <td>화</td>
              <td>수</td>
              <td>목</td>
              <td>금</td>
              <td>토</td>
              <td>일</td>
            </tr>
          </thead>
          <tbody class="async_table">

          </tbody>
        </table>
      </section>
    </article>
    <div id="top">
      <p style="margin:30px auto;">
        <a href="#header">
          <img src="img/back-to-top-icon-png-8.jpg" alt="top" />
        </a></p>

    </div>
    <footer style="text-align:center">


      <div class="footer_img_wrapper">
        <img src="img/miscellaneous.png" alt="call" />
        010-5464-9342 <br><br>
        <img src="img/multimedia.png" alt="email" />
        kchoi@student.42seoul.kr
      </div>

    </footer>
  </div>
  <script type="template" id="dayList">
    <td >{user_id}</td>
    </script>

</body>
<script src="js/studio.js"></script>

</html>