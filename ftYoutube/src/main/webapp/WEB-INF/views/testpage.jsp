<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Studio test Page</title>
</head>

<body>
</body>

<script>
var userAgent=navigator.userAgent.toLowerCase();

var browser;
if(userAgent.indexOf('edge')>-1){
	browser='익스플로러 엣지';
}else if(userAgent.indexOf('whale')>-1){
	browser='네이버 웨일';
}else if(userAgent.indexOf('chrome')>-1){
	browser='크롬';
}else if(userAgent.indexOf('firefox')>-1){
	browser='파이어폭스';
}else{
	browser='익스플로러';
}

document.write(browser);




</script>
</html>