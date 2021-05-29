<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Inscription</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<div class="signup">
	<form method="post" action="Controller">
   		 <input type="hidden" name="page" value="sign-up-form">
		 <input type="hidden" name="page" value="sign-up-form">
	 
	 	<!-- Validations errors -->
	 	<font color="#F24638"><c:out value="${msg }"></c:out></font>
	 	
	 	
	 	<div class="signup-group">
	 		<label>Nom et prénom</label>
	 		<input style="width:95%;" type="text" name="name" placeholder="entrer le nom" value="<c:out value="${name }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Email</label>
	 		<input style="width:95%;" type="email" name="email" placeholder="entrer adresse email" value="<c:out value="${email }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Login</label>
	 		<input style="width:95%;" type="text" name="username" placeholder="Username" value="<c:out value="${username }"></c:out>" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<label>Mot de passe</label>
	 		<input style="width:95%;" type="password" name="password_1" placeholder="Entrer le mot de passe" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Confirmer le mot de passe</label>
	 		<input style="width:95%;" type="password" name="password_2" placeholder="Re-entrer le mot de passe" required>
	 	</div>
	 	
	 	<div class="signup-group">
	 		<button style="width:97%;" type="submit" name="register" >Envoyer</button>
	 	</div>
	 	<p>
	 		Déjà inscrit(e) ?  <a href="Controller?page=login" style="color:#F24638; font-size: 18px;">S'identifier</a>
	 	</p>
	 </form> 
	 </div>
	 
	 
	 
	 <%@ include file="footer.jsp" %>

</body>
</html>