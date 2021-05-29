<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>confirmer</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	<a href="Controller?page=success&email=<c:out value="${email}"/>"><input type="submit" value="Confirmer"  style="width:10%;padding:8px;font-size:13px;margin-top:10%;  margin-left:35%; font-size:22px;"></a>
</body>
</html>