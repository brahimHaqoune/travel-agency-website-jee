<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login admin</title>
<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
	<header>
		<h1>Session admin</h1>
	</header>
	<form method="post" action="admin">
	 
	 <input type="hidden" name="page" value="admin-login-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 
	 	<div class="signup-group">
	 		<label>Username</label>
	 		<input style="width:95%;" type="text" name="username" placeholder="Votre Username" value="<c:out value="${username }"></c:out>">
	 	</div>
	 	<div class="signup-group">
	 		<label>Mot De Passe</label>
	 		<input style="width:95%;" type="password" name="password" placeholder="Entrer le mot de passe">
	 	</div>
	 	<div class="signup-group">
	 		<button style="width:97%;" style="width:600px;">Se connecter</button>
	 	</div>
	 </form>
	 
	 <%@ include file="footer.jsp" %>
	 
</body>
</html>