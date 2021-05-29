<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
		<%@ include file="menu.jsp" %>
		
		<form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="login-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="signup-group">
	 		<label>Login</label>
	 		<input style="width:95%;" type="text" name="username" placeholder="Votre Username" value="<c:out value="${username }"></c:out>">
	 	</div>
	 	<div class="signup-group">
	 		<label>Mot de passe</label>
	 		<input style="width:95%;" type="password" name="password" placeholder="entrer le mot de passe">
	 	</div>
	 	<div class="signup-group">
	 		<button style="width:97%;" type="submit" name="login" >Se connecter</button>
	 	</div>
	 	<p>
	 		êtes-vous nouveau? <a href="Controller?page=sign-up" style="color:#F24638; font-size: 18px;">créer votre compte</a>
	 	</p>
	 </form>
	 
	 
	 <%@ include file="footer.jsp" %>
</body>
</html>