<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
		String code = (String) request.getAttribute("code");
		request.setAttribute("code", code);
	%>
<body>
<img src="img/42API_Loading.png" style="width:100%;height:80%"/>
	<div style="display:none">
	<form method='POST' action="https://api.intra.42.fr/oauth/token" 
		encType="application/json">
		<input name="grant_type" placeholder="grant_type"
			value="client_credentials"> <input name="client_id"
			placeholder="client_id"
			value="27ef6c6257d555818826985f9a1f85c85bf81ffe9d61780d4d6278cf845cddba">
		<input name="client_secret" placeholder="client_secret"
			value="068abc288188c153dd4eb402d7e2556e4d2bf804515584e81a5efa8c151b90f2">
		<input name="code" placeholder="code" value="${requestScope.code}">
		<input name="redirect_uri" placeholder="redirect_uri"
			value="http://localhost:8080/ftYoutube/getTokenPage">
		<button type="submit">button</button>
	</form>

	<form name="form2" method='GET' action="https://api.intra.42.fr/v2/me">
		<input type="text" name="inp" value="hi"></input>
		<button type="submit">form2</button>
	</form>
	</div>
</body>
<script>
function AjaxClass() {	
}
AjaxClass.prototype.getApiWithToken = function(token) {
	var url = "https://api.intra.42.fr/v2/me";
	var oReq = new XMLHttpRequest;
	
	oReq.open('GET', url);
 	oReq.setRequestHeader("Authorization", "Bearer " + token);
	oReq.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
	oReq.responseType = "text";
	oReq.addEventListener('load', function() {
		var json = JSON.parse(this.responseText);
		window.location.href = 'http://localhost:8080/ftYoutube/studio?login=' + json.login;
		
	});
	oReq.send(); 

}
	document.addEventListener("DOMContentLoaded", function() {

		var inputGrantType = document.querySelector("input[name=grant_type]");
		var inputClientId = document.querySelector("input[name=client_id]");
		var inputClientSecret = document
				.querySelector("input[name=client_secret]");
		var inputCode = document.querySelector("input[name=code]");
		var inputRedirectURI = document
				.querySelector("input[name=redirect_uri]");

		var oReq = new XMLHttpRequest;
		var queryString = "";
		queryString += "" 
				+ "grant_type=" + "authorization_code" + "&"
				+ "client_id=" + inputClientId.value + "&" 
				+ "client_secret=" + inputClientSecret.value + "&" 
				+ "code=" + inputCode.value + "&"
				+ "redirect_uri=" + inputRedirectURI.value + "&"
				+ "scope=public";
		oReq.open('POST', "https://api.intra.42.fr/oauth/token");
		oReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		oReq.setRequestHeader("X-Mobile", "false");
		oReq.responseType = "text";
		oReq.addEventListener('load', function() {
			var json = JSON.parse(this.responseText);
			var tokenFromAPI = json.access_token;
			var getApiAjaxObj = new AjaxClass();
			getApiAjaxObj.getApiWithToken(tokenFromAPI);
			
		});
		oReq.send(queryString); 
	})
	
	
</script>

</html>