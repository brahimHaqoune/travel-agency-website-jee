<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
		
	<%@ include file="menu.jsp" %>
	
	<h2 style="font-size:30px; margin:8px auto auto auto; text-align:center; color: #394B88;">Contact</h2><br>
	
	
	<form method="post" action="Controller">
	 
	 	<input type="hidden" name="page" value="contact1">
	 
	 	<div class="signup-group">
	 		<label>Votre e-mail</label>
	 		<input style="width:95%;" type="text" name="email" placeholder="Votre email"  value="<c:out value="${email }"></c:out>">
	 	</div>
	 	<div class="signup-group">
	 		<label>Ta question ?</label>
	 		<textarea style="width:98%;"  name="msg" rows="10" cols="85" >Qu'est-ce que vous voulez savoir ?</textarea>
	 	</div>
	 	<div class="signup-group">
	 		<button style="width:97%;" type="submit" name="login" >Envoyer</button>
	 	</div>
	 </form>
	 
</body>
</html>