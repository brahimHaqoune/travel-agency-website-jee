<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Résultat de la recherche</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<h2 style="font-size:30px; margin:8px auto auto auto; text-align:center; color: #394B88;">Résulat de la recherche</h2><br>
	
	
	<c:if test="${t.getDestination() != null}">
		<table>
			<tr>
				<th style="color:white; background-color:#425083; width: 18%; text-align: center;">Déstination</th>
				<th style="color:white; background-color:#425083; width: 18%; text-align: center;">Type</th>
				<th style="color:white; background-color:#425083; width: 17%; text-align: center;">Date</th>
				<th style="color:white; background-color:#425083; width: 16%; text-align: center;">Durée</th>
				<th style="color:white; background-color:#425083; width: 16%; text-align: center;">Prix</th>
				<th style="color:white; background-color:#425083; width: 15%; text-align: center;">Ajouter au panier</th>
			</tr>
	 				
 			<tr>	
				<td><p style="text-align: center;"><c:out value="${ t.getDestination() }"></c:out></p></td>
				<td><p style="text-align: center;"><c:out value="${ t.getType() }"></c:out></p></td>
				<td><p style="text-align: center;"><c:out value="${ t.getDate() }"></c:out></p></td>
				<td><p style="text-align: center;"><c:out value="${ t.getDuree() }"></c:out></p></td>
				<td><p style="text-align: center;"><c:out value="${ t.getPrix() }"></c:out> Dhs</p></td>
				<td style="text-align: center;"><a href="Controller?page=addtocart&action=result&id=<c:out value="${t.getId()}"/>&email=<c:out value="${email}"/>"><img style="width:45px;height :45px;"src="img/addCart.png"></a> <td>				

		 	</tr>
 		</table>
 	</c:if>
 	<c:if test="${t.getDestination() == null}">
 			<h2 style="font-size:30px; margin:10% 40% auto 40%; text-align:center; color: red;">Aucaun résultat est trouvé</h2>
 	</c:if>

</body>
</html>