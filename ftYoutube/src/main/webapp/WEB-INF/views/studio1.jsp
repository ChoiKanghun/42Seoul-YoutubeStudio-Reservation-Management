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
  <!-- <style type='text/css'>
  @-ms-viewport {width:device-width;}
  @-o-viewport {width:device-width;}
  @viewport {width:device-width;}
</style> -->

</head>

<body style="width:90%; margin: 0 auto;border:1px solid black">

  <header style="height:150px;border:black 1px solid;font-size:30px;text-align:center;vertical-align:middle;position:relative;">


    <nav style="position:absolute;top:0px;right:0px;">
      <button type="button" class="btn_reservation" style="margin-right:10px;">예약하기</button>
      <button type="button" class="btn_cancellation" style="margin-right:20px;">예약취소</button>
    </nav>
    <span class="just_to_middle_align" style="line-height:150px;">
      <div ><b>42 SEOUL Youtube Studio 예약 시스템</b></div>
    </span>
    <img src="img/42.png" alt="42_logo" style="width:150px;position:absolute;left:0px;top:0px;"/>
  </header>

  <aside style="float:left;width:15%;height:inherit;background-color:blue;">a
  </aside>
  <article style="overflow:hidden;">
    <section class = "occupied" style="height:150px;width:100%;background-color:skyblue;text-align:center;vertical-align:middle">
      <span class="just_to_middle_align" style="">
        <div class="studio1_status" style="height:100px;line-height:100px;width:150px;background-color:#7bc379;position:relative;display:inline-block;">
          Studio1
        </div>
        <div class="studio2_status" style="height:100px;line-height:100px;width:150px;background-color:#e05749;position:relative;margin-left:100px;display:inline-block;">
          Studio2
        </div>
      </span>
    </section>
    <section style="float:left;width:100%;">
      <table style="border:1px solid black;width:100%;text-align:center">
        <thead>
          <tr style="border:1px solid black;">
            <td style="border:1px solid black;">시간</td>
            <td style="border:1px solid black;">월</td>
            <td style="border:1px solid black;">화</td>
            <td style="border:1px solid black;">수</td>
            <td style="border:1px solid black;">목</td>
            <td style="border:1px solid black;">금</td>
            <td style="border:1px solid black;">토</td>
            <td style="border:1px solid black;">일</td>
          </tr>
        </thead>
        <tbody>
          <tr style="border:1px solid black;">
            <td style="border:1px solid black;">1</td>
            <td style="border:1px solid black;">2</td>
            <td style="border:1px solid black;">3</td>
            <td style="border:1px solid black;">4</td>
            <td style="border:1px solid black;">5</td>
            <td style="border:1px solid black;">6</td>
            <td style="border:1px solid black;">7</td>
            <td style="border:1px solid black;">8</td>


          </tr>
          <tr style="border:1px solid black;">
            <td style="border:1px solid black;">7</td>

            <td style="border:1px solid black;">2</td>
            <td style="border:1px solid black;">1</td>
            <td style="border:1px solid black;">23</td>
            <td style="border:1px solid black;">4</td>
            <td style="border:1px solid black;">5</td>
            <td style="border:1px solid black;">6</td>
            <td style="border:1px solid black;">7</td>
          </tr>
          <tr style="border:1px solid black;">
            <td style="border:1px solid black;">3</td>
            <td style="border:1px solid black;">3</td>
            <td style="border:1px solid black;">2</td>
            <td style="border:1px solid black;">3</td>
            <td style="border:1px solid black;">4</td>
            <td style="border:1px solid black;">5</td>
            <td style="border:1px solid black;">6</td>
            <td style="border:1px solid black;">7</td>

          </tr>
          <tr style="border:1px solid black;">
            <td style="border:1px solid black;">4</td>
            <td style="border:1px solid black;">2</td>
            <td style="border:1px solid black;">3</td>
            <td style="border:1px solid black;">4</td>
            <td style="border:1px solid black;">5</td>
            <td style="border:1px solid black;">6</td>
            <td style="border:1px solid black;">7</td>
            <td style="border:1px solid black;">7</td>

          </tr>
          <tr style="border:1px solid black;">
            <td style="border:1px solid black;">5</td>
            <td style="border:1px solid black;">2</td>
            <td style="border:1px solid black;">3</td>
            <td style="border:1px solid black;">4</td>
            <td style="border:1px solid black;">5</td>
            <td style="border:1px solid black;">6</td>
            <td style="border:1px solid black;">7</td>
            <td style="border:1px solid black;">7</td>

          </tr>

        </tbody>
          </table>
        </section>
    </article>

  <footer style="display:block;clear:both;height:150px;border:black 1px solid;text-align:center">
    <p style="margin:30px auto;">
    <img src="#" alt="top"/>
  </p>
    <div >에러 발생 시 연락해주세요</div>
    <div style="margin-top:20px;">
      <img src="#" alt="call"/>
      010-5464-9342
      <img src="#" alt="email"/>
      kchoi@student.42seoul.kr
    </div>

  </footer>
</body>
<script src="test.js"></script>

</html>
