<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Boîte de réception</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	 <sql:setDataSource user="root" password="agence" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/agence" var="ds"/>
	 
	  <sql:query var="result" dataSource="${ds }">
 
		 select * from contacts;
		 
	   </sql:query>
	   
	  
	
	<h3 style="font-size:30px; margin:20px auto auto auto; text-align:center; color: #394B88;">Boîte de réception</h3>
	<table>
		<tr>
			<th style="color:white; background-color:#425083; width: 30%; text-align: center;">Email</th>
			<th style="color:white; background-color:#425083; width: 50%; text-align: center;">Message</th>
			<th style="color:white; background-color:#425083; width: 20%; text-align: center;">Supprimer</th>
		</tr>
		 <c:forEach items="${result.rows }" var="row">
		 	<tr style="text-align: center;">
			<td><c:out value="${row.email }"></c:out></td>
			<td><c:out value="${row.message }"></c:out></td>
			
			<td style="width: 16%;"><a href="<%= request.getContextPath() %>/admin?page=deleteMsg&email=${row.email}" style="color: #6bb1f8;"><button style="margin-left:25%;width:140px;">Supprimer</button></a> </td>
		</tr>	
		 </c:forEach>
		</table>
</body>
</html>