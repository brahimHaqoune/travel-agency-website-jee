<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ajouter un voyage</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@ include file="menu.jsp" %>

	 <form method="post" action="admin">
	 
	 <input type="hidden" name="page" value="add_travel">
     
	 	<div class="signup-group">
	 		<label>Déstination</label>
	 		<input style="width:95%;" type="text" name="destination" placeholder="Déstination du voyage"  required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Type du voyage</label>
	 		<input style="width:95%;" type="text" name="type" placeholder="Type de voyage" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Date</label>
	 		<input style="width:95%;" type="text" name="date" placeholder="Date" required>
	 	</div>
	 	<div class="signup-group" >
	 		<label>Durée</label>
	 		<input style="width:95%;" type="text" name="duree" placeholder="prix du voyage" >
	 	</div>
	 	<div class="signup-group" >
	 		<label>Prix</label>
	 		<input style="width:95%;" type="text" name="prix" placeholder="prix du voyage" >
	 	</div>
	 	<div class="signup-group">
	 		<label>Thème</label>
	 		<input style="width:95%;" type="text" name="theme" placeholder="Thème du voyage" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Hébergement</label>
	 		<input style="width:95%;" type="text" name="heberg" placeholder="Hébergement" required>
	 	</div>
	 	
	 	<div class="signup-group">
			<button style="width:97%;">Continuer</button>	 
		</div>
	 </form>
	
	 <footer style="position: absolute;left: 0;bottom: 0;width: 100%;">
		
	</footer>
</body>
</html>