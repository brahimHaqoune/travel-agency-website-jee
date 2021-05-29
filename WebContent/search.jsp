<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Rechercher</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
		
	<%@ include file="menu.jsp" %>
	
	<form method="post" action="Controller">
	 
	 <input type="hidden" name="page" value="search1">
     
	 	<div class="signup-group">
	 		<label>Déstination</label>
	 		<input style="width:95%;" type="text" name="destination" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Type du voyage</label>
	 		<input style="width:95%;" type="text" name="type" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Date</label>
	 		<input style="width:95%;" type="text" name="date" placeholder="JJ/MM/AAAA" required>
	 	</div>
	 	<div class="signup-group" >
	 		<label>Durée</label>
	 		<input style="width:95%;" type="text" name="duree" placeholder="En jours"required>
	 	</div>	 	
	 	<div class="signup-group">
	 		<label>Prix</label>
	 		<input style="width:95%;" type="text" name="prix" placeholder="En DH" required>
	 	</div>
	 	
	 	<button style="width:97%;">Rechercher</button>
	 </form>

</body>
</html>