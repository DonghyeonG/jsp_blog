<%@ page contentType="text/html; charset=UTF-8" %> 
 
<% 
Cookie cookie = new Cookie("windowOpen", "close");  
cookie.setMaxAge(1 * 60);    // 60초, 1일 팝업창 뜨지않게 하는 경우: 60 * 60 * 24 
response.addCookie(cookie);      
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>접속 환영</title> 
<link href="../css/style.css" rel="Stylesheet" type="text/css"> 
<script type="text/javascript"> 
  window.close(); 
</script> 
</head> 
<body style="background-color: #55FF55"> 
 
</body> 
</html>