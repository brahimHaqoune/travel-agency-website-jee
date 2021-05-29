<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liste des commandes</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	 <sql:setDataSource user="root" password="agence" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/agence" var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds }">
 
		 select voyages.id,name,users.email,destination,type,date,duree,prix from users_voy,users,voyages
		 where users_voy.id_voy = voyages.id
		 and users_voy.email = users.email;
		 
	   </sql:query>
	   
	  
	
	<h3 style="font-size:30px; margin:20px auto auto auto; text-align:center; color: #394B88;">Liste des commandes</h3>
	<table>
		<tr>
			<th style="color:white; background-color:#425083; width: 5%; text-align: center;">Nom et prénom</th>
			<th style="color:white; background-color:#425083; width: 11%; text-align: center;">email</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Déstination</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Type</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Date</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Durée</th>
			<th style="color:white; background-color:#425083; width: 14%; text-align: center;">Prix</th>
			<th style="color:white; background-color:#425083; width: 11%; text-align: center;">Supprimer</th>
		</tr>
		 <c:forEach items="${result.rows }" var="row">
		 	<tr style="text-align: center;">
			<td><c:out value="${row.name }"></c:out></td>
			<td><c:out value="${row.email }"></c:out></td>
			<td><c:out value="${row.destination }"></c:out></td>
			<td><c:out value="${row.type }"></c:out></td>
			<td><c:out value="${row.date }"></c:out></td>
			<td><c:out value="${row.duree }"></c:out></td>
			<td><c:out value="${row.prix }"></c:out></td>
			
			<td style="width: 16%;"><a href="<%= request.getContextPath() %>/admin?page=deleteComm&email=${row.email}&id=${row.id}" style="color: #6bb1f8;"><button style="width:140px;">Supprimer</button></a> </td>
		</tr>	
		 </c:forEach>
		</table>
</body>
</html>