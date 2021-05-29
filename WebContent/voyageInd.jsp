<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Voyages en individuel</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%@ include file="menu.jsp" %>	


 		<h2 style="font-size:30px; margin:8px auto auto auto; text-align:center; color: #394B88;">Les voyages en individuel</h2><br>
 		
 		<table>
			<tr>
				<th style="color:white; background-color:#425083; width: 15%; text-align: center;">Déstination</th>
				<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Date</th>
				<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Durée</th>
				<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Prix</th>
				<th style="color:white; background-color:#425083; width: 15%; text-align: center;">Thème</th>
				<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Hébergement</th>
				<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Ajouter au panier</th>
			</tr>
	 				
		<c:forEach items="${list}" var="t">	
		<c:if test="${t.getType() == 'Individuel' }">	
 			<tr>	
				<td><p style="text-align: center;"><c:out value="${t.getDestination() }"></c:out></p></td>
				<td><p style="text-align: center;"><c:out value="${t.getDate() }"></c:out></p></td>
				<td><p style="text-align: center;"><c:out value="${t.getDuree() }"></c:out></p></td>
				<td><p style="text-align: center;"><c:out value="${ t.getPrix() }"></c:out> Dhs</p></td>
				<td><p style="text-align: center;"><c:out value="${t.getTheme() }"></c:out></p></td>
				<td><p style="text-align: center;"><c:out value="${t.getHeberg() }"></c:out></p></td>
				<td style="text-align: center;"><a href="Controller?page=addtocart&action=ind&id=<c:out value="${t.getId()}"/>&email=<c:out value="${email}"/>"><img style="width:45px;height :45px;"src="img/addCart.png"></a> <td>				
		 	</tr>
	 	</c:if>		
 		</c:forEach>
 	</table>
 					
</body>
</html>