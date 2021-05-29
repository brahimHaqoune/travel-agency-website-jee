<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mon panier</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	<c:choose>
	<c:when test="${session != null}"> 	 
		<sql:setDataSource user="root" password="root" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/projet_jee" var="ds"/>
	  	<sql:query var="result" dataSource="${ds }">
 
		 select * from voyages,users_voy
		 where users_voy.id_voy = voyages.id
		 and email = "<c:out value="${email}"></c:out>";
		 
		 
	  	 </sql:query> 
	
	<h3 style="font-size:30px; margin:20px auto auto auto; text-align:center; color: #394B88;">Mon panier</h3>
	
	<c:set var="total" value="0"></c:set>
	
	<table>
		<tr>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Déstination</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Type</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Date</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Durée</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Prix</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Thème</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Hébergement</th>
			<th style="color:white; background-color:#425083; width: 11%; text-align: center;">Supprimer</th>
		</tr>
		 <c:forEach items="${result.rows }" var="row">
		 	<c:set var="total" value="${total + row.prix }"></c:set>
		 	<tr style="text-align: center;">
			<td><c:out value="${row.destination }"></c:out></td>
			<td><c:out value="${row.type }"></c:out></td>
			<td><c:out value="${row.date }"></c:out></td>
			<td><c:out value="${row.duree }"></c:out></td>
			<td><c:out value="${row.prix }"></c:out></td>
			<td><c:out value="${row.theme }"></c:out></td>
			<td><c:out value="${row.heberg }"></c:out></td>
			
			<td style="text-align: center;"><a  class="btn btn-primary" href="Controller?page=remove&action=cart&id=<c:out value="${row.id}"/>&email=<c:out value="${email}"/>"><img style="width:45px;height :45px;"src="img/removeCart.png"></a> <td>
		</tr>	
		 </c:forEach>
		</table>
		
		<table style="width:480px; margin-left:30%;">
		<tr>
			<th style="color:white; background-color:#21618C; width: 50%; text-align: center; font-size:24px;">Total</th>
			<th style="color:black; background-color:#D4E6F1; width: 50%; text-align: center; font-size:24px;"><c:out value="${total} "> </c:out>DHs</th>
		</tr>
		</table>
	
		<a href="Controller?page=confirmer"><input type="submit" value="Payer"  style="width:10%;padding:8px;font-size:13px;  margin-left:45%; font-size:22px;"></a>
	</c:when>
	
	<c:when test="${session == null}">
		<h3 style="font-size:30px; margin:20px auto auto auto; text-align:center; color: #394B88;">Mon panier</h3>
	
	
	<div style="margin-top: 100px;">
			<a href="Controller?page=login"><input type="submit" value="se connecter"  style="width:19%;padding:8px;font-size:13px;  margin-left:35%; font-size:22px;"></a><br><br>
			<a href="Controller?page=sign-up"><input type="submit" value="s'inscrire"  style="width:19%;padding:8px;font-size:13px;  margin-left:35%; font-size:22px;"></a>
	</div>
	</c:when> 
	</c:choose>
	
	
	<div id="bas" style="text-align: center; padding-top:400px; padding-bottom:30px;"> &copy; 2020 Copyright:
	      <a href="Controller?page=index" > BI Voyages </a>
	</div>
</body>
</html>