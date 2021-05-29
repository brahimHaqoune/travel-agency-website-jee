<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Accueil admin</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	 <sql:setDataSource user="root" password="agence" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/agence" var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds }">
 
		 select * from voyages
		 
	   </sql:query>
	   
	  
	
	<h3 style="font-size:30px; margin:20px auto auto auto; text-align:center; color: #394B88;">Liste des voyages</h3>
	<table>
		<tr>
			<th style="color:white; background-color:#425083; width: 5%; text-align: center;">ID</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Déstination</th>
			<th style="color:white; background-color:#425083; width: 11%; text-align: center;">Type</th>
			<th style="color:white; background-color:#425083; width: 11%; text-align: center;">Date</th>
			<th style="color:white; background-color:#425083; width: 11%; text-align: center;">Durée</th>
			<th style="color:white; background-color:#425083; width: 11%; text-align: center;">Prix</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Thème</th>
			<th style="color:white; background-color:#425083; width: 11%; text-align: center;">Hébergement</th>
			<th style="color:white; background-color:#425083; width: 11%; text-align: center;">Action</th>
		</tr>
		 <c:forEach items="${result.rows }" var="row">
		 	<tr style="text-align: center;">
			<td><c:out value="${row.id }"></c:out></td>
			<td><c:out value="${row.destination }"></c:out></td>
			<td><c:out value="${row.type }"></c:out></td>
			<td><c:out value="${row.date}"/></td>
			<td><c:out value="${row.duree}"></c:out></td>
			<td><c:out value="${row.prix}"/></td>
			<td><c:out value="${row.theme}"/></td>
			<td><c:out value="${row.heberg}"/></td>
					
			<td style="width: 16%;"><a href="<%= request.getContextPath() %>/admin?page=edit&id=${row.id}" style="color: #6bb1f8;"><button style="width:140px;">Modifier</button></a> 
			<a href="<%= request.getContextPath() %>/admin?page=delete&id=${row.id}" style="color:#6bb1f8;"><button style="width:140px;">Supprimer</button></a></td>
		</tr>	
		 </c:forEach>
		</table>

	
	
</body>
</html>