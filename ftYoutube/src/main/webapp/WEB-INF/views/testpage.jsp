<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Studio test Page</title>
</head>

<body>

<form method = 'POST' action = "https://api.intra.42.fr/oauth/token">
<input name = "grant_type" placeholder="grant_type">
<input name = "client_id" placeholder = "client_id">
<input name = "client_secret" placeholder = "client_secret">
<input name = "code" placeholder = "code">
<input name = "redirect_uri" placeholder="redirect_uri">
<button type="submit">button</button>
</form>

<form method = 'GET' action = "https://api.intra.42.fr/v2/me">



</form>

</body>

<script>





</script>
</html>