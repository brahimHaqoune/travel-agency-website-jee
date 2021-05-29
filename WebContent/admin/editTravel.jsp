<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modification d'un voyage</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	

	 <form method="post" action="admin">
	 
	 <input type="hidden" name="page" value="edit_travel">
	 <input type="hidden" name="id" value="<c:out value="${t.getId() }"/>">
     
	 	<div class="signup-group">
	 		<label>Déstination</label>
	 		<input style="width:95%;" type="text" name="destination" value="<c:out value="${t.getDestination() }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Type du voyage</label>
	 		<input style="width:95%;" type="text" name="type" value="<c:out value="${t.getType() }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Date</label>
	 		<input style="width:95%;" type="text" name="date" value="<c:out value="${t.getDate() }"></c:out>" required>
	 	</div>
	 	<div class="signup-group" >
	 		<label>Durée</label>
	 		<input style="width:95%;" type="text" name="duree" value="<c:out value="${t.getDuree() }"></c:out>" required>
	 	</div>	 	
	 	<div class="signup-group">
	 		<label>Prix</label>
	 		<input style="width:95%;" type="text" name="prix" value="<c:out value="${t.getPrix() }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Theme</label>
	 		<input style="width:95%;" type="text" name="theme" value="<c:out value="${t.getTheme() }"></c:out>" required>
	 	</div>
	 	<div class="signup-group">
	 		<label>Hébergement</label>
	 		<input style="width:95%;" type="text" name="heberg" value="<c:out value="${t.getHeberg() }"></c:out>" required>
	 	</div>
	 	<button style="width:97%;"  style="width:600px;">Continuer</button>
	 </form>


	 
</body>
</html>