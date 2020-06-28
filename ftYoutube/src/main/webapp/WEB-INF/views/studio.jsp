<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>

<head>
<title>42 Youtube Studio</title>
<meta charset="utf-8">
<link href="css/studio-media.css" rel="stylesheet" type="text/css"
	media="only screen and (min-width: 359px) and (max-width:1024px)">
<link href="css/studio-media-ultimate-small.css" rel="stylesheet"
	type="text/css"
	media="only screen and (min-width: 1px) and (max-width:358px)">
<link href="css/studio.css" rel="stylesheet" type="text/css" />
<link href="css/studio-headers.css" rel="stylesheet" type="text/css" />
<c:set var="firstday" value="<%=new Date()%>" />
<c:set var="secondday"
	value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000)%>" />
<c:set var="thirdday"
	value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 2)%>" />
<c:set var="fourthday"
	value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 3)%>" />
<c:set var="fifthday"
	value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 4)%>" />
<c:set var="sixthday"
	value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 5)%>" />
<c:set var="seventhday"
	value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 6)%>" />

</head>

<body>
	<div id="loginInfo" style="display: none" data-login="${login }"></div>
	<div class="container">
		<header id="header">

			<nav>
				<%
					String login = (String) request.getAttribute("login");
					if (!login.equals("로그인하기")) {
				%>
				<div id = "login">${login}님 반갑습니다.</div>
				<%
					} else {
				%>
				<div id = "login"
				onclick="location.href='https://api.intra.42.fr/oauth/authorize?client_id=27ef6c6257d555818826985f9a1f85c85bf81ffe9d61780d4d6278cf845cddba&redirect_uri=http%3A%2F%2F121.166.59.211%3A80%2FftYoutube%2Fstudio&response_type=code'">${login}</div>
				<%
					}
				%>
				<!--    <div class="to_reservation" onclick="location.href='reservation'">
        <p>예약하기</p>
        </div>
        <div class="to_home" onclick="location.href='cancellation'">
        <p>예약취소</p> -->

			</nav>
			<div id="main_title">
				<p>
					<b>42 SEOUL Youtube Studio 예약 시스템</b>
				<p>
			</div>
			<a href="studio"> <img class="logo_42" src="img/42.PNG"
				alt="42_logo" />
			</a>
		</header>

		<aside
			style="float: left; width: 15%; height: inherit; background-color: blue; display: none;">a
		</aside>
		<article style="overflow: hidden;">
			<section class="occupied">
				<div class="studio1_status" data-snum="1">
					<p>▶ Studio1</p>
				</div>
				<div class="studio2_status" data-snum="2">
					<p>▶ Studio2</p>
				</div>

			</section>
			<section class="section_table" style="text-align: center">
				<table>
					<thead>
						<tr>
							<td>시간</td>
							<td class="table-head-today"><fmt:formatDate
									value="${firstday}" pattern="M/dd (E)" /> <br>today</td>
							<td><fmt:formatDate value="${secondday}" pattern="M/dd (E)" /></td>
							<td><fmt:formatDate value="${thirdday}" pattern="M/dd (E)" /></td>
							<td><fmt:formatDate value="${fourthday }" pattern="M/dd (E)" /></td>
							<td><fmt:formatDate value="${fifthday}" pattern="M/dd (E)" /></td>
							<td><fmt:formatDate value="${sixthday}" pattern="M/dd (E)" /></td>
							<td><fmt:formatDate value="${seventhday}" pattern="M/dd (E)" /></td>
						</tr>
					</thead>
					<tbody class="async_table">

					</tbody>
				</table>
			</section>
		</article>
		<div id="top">
			<p style="margin: 30px auto;">
				<a href="#header"> <img src="img/back-to-top-icon-png-8.jpg"
					alt="top" />
				</a>
			</p>

		</div>
		<footer style="text-align: center">


			<div class="footer_img_wrapper">
				<img src="img/miscellaneous.png" alt="call" /> 010-5464-9342 <br>
				<br> <img src="img/multimedia.png" alt="email" />
				kchoi@student.42seoul.kr
			</div>

		</footer>
	</div>
	<script type="template" id="dayList">
    <td class="tableData" data-day="{day}" data-hour="{hour}">{user_id}</td>
  </script>
<form action="https://api.intra.42.fr/oauth/token" method="POST" target="ifrm">
	<input name="grant_type" value="authorization_code">
	<input name="client_id" value="27ef6c6257d555818826985f9a1f85c85bf81ffe9d61780d4d6278cf845cddba">
	<input name="client_secret" value="068abc288188c153dd4eb402d7e2556e4d2bf804515584e81a5efa8c151b90f2">
	<input name="code" value="00e5d72a51d708fb34376a9705c4b8bd5f8c709a0333de65d03152b7f72a26ff">
	<input name="redirect_uri" value="http://121.166.59.211:80/ftYoutube/studio">
	<button type="submit">submit</button>
</form>
	<button id="test">test</button>
	
<iframe name="ifrm" id="ifrm"></iframe>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>

function AjaxClass() {}
AjaxClass.prototype.getApiWithToken = function(token) {
  var url = "https://api.intra.42.fr/v2/me";
  var oReq = new XMLHttpRequest;

  oReq.open('GET', url);
  oReq.setRequestHeader("Authorization", "Bearer " + token);
  oReq.setRequestHeader('Content-Type', 'application/json');
  oReq.responseType = "text";
  oReq.addEventListener('load', function() {
    var json = JSON.parse(this.responseText);
    console.log(json.login);
    document.querySelector("#login").innerText = json.login + "님 반갑습니다.";
	
  });
  oReq.send();
}
<%String code = (String) request.getAttribute("code");
System.out.println("code:" + code);
			if (code != null) {
			%>
	var queryString = "grant_type=" + "authorization_code" + "&"
			+ "client_id="
			+ "27ef6c6257d555818826985f9a1f85c85bf81ffe9d61780d4d6278cf845cddba"
			+ "&"
			+ "client_secret="
			+ "068abc288188c153dd4eb402d7e2556e4d2bf804515584e81a5efa8c151b90f2"
			+ "&" 
			+ "code=" + "<%=code%>" + "&" 
			+ "redirect_uri="
			+ "http://121.166.59.211:80/ftYoutube/studio" + "&"
			+ "scope=public";
	document.domain = "api.intra.42.fr";
	$.ajax({
		method : "POST",
		url : "https://api.intra.42.fr/oauth/token",
		data : queryString,
		dataType : "json",
		crossDomain : true,
		contentType : "application/x-www-form-urlencoded",
		headers : {
			"Access-Control-Allow-Origin" : "*"
		},
		success : function(json) {
			var token = json.access_token;
			var getApiObj = new AjaxClass();
			getApiObj.getApiWithToken(token);
		},
		error : function(xhr) {
			console.log('실패 - ', xhr);
		}
	});
<%}%>
document.querySelector("#test").addEventListener("click", function(){
	var responseAPI = document.querySelector("#ifrm").contentWindow.document;
	console.log(responseAPI);
});
</script>
<script src="js/studio.js"></script>

</html>