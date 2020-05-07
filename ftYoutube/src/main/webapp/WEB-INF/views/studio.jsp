<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>

<head>
  <title>42 Youtube Studio</title>
  <meta charset="utf-8">
  <link href="css/studio-media.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 359px) and (max-width:1024px)">
  <link href="css/studio-media-ultimate-small.css" rel="stylesheet" type="text/css" media="only screen and (min-width: 1px) and (max-width:358px)">
  <link href="css/studio.css" rel="stylesheet" type="text/css" />
  <link href="css/studio-headers.css" rel="stylesheet" type="text/css" />
<c:set var="firstday" value="<%=new Date()%>"/>
<c:set var="secondday" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
<c:set var="thirdday" value="<%=new Date(new Date().getTime() + 60*60*24*1000*2)%>"/>
<c:set var="fourthday" value="<%=new Date(new Date().getTime() + 60*60*24*1000*3)%>"/>
<c:set var="fifthday" value="<%=new Date(new Date().getTime() + 60*60*24*1000*4)%>"/>
<c:set var="sixthday" value="<%=new Date(new Date().getTime() + 60*60*24*1000*5)%>"/>
<c:set var="seventhday" value="<%=new Date(new Date().getTime() + 60*60*24*1000*6)%>"/>

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
              <td class="table-head-today">
              <fmt:formatDate value="${firstday}" pattern="M/dd (E)"/>
              <br>today
              </td>
              <td><fmt:formatDate value="${secondday}" pattern="M/dd (E)"/></td>
              <td><fmt:formatDate value="${thirdday}" pattern="M/dd (E)"/></td>
              <td><fmt:formatDate value="${fourthday }" pattern="M/dd (E)"/></td>
              <td><fmt:formatDate value="${fifthday}" pattern="M/dd (E)"/></td>
              <td><fmt:formatDate value="${sixthday}" pattern="M/dd (E)"/></td>
              <td><fmt:formatDate value="${seventhday}" pattern="M/dd (E)"/></td>
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