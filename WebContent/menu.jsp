<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
	<header>
		<h1>
			BI Voyages
		</h1>
		<nav>
			<ul>
				<c:choose>
					<c:when test="${session == null}">
						<li><a href="Controller?page=login" style="color:white; font-size: 20px;">se connecter</a></li>
						<li><a href="Controller?page=sign-up" style="color:white; font-size: 20px;">s'inscrire</a></li>
						<li><a href="AdminController" style="color:white; font-size: 20px;">session admin</a></li>
					</c:when>
					<c:when test="${session != null}">
						<li><a href="Controller?page=logout" style="color:white; font-size: 20px;">déconnexion</a></li>
					</c:when>
				</c:choose>
				
				<li><a href="Controller?page=search" style="color:white; font-size: 20px;">Rechercher</a></li>
				<li><a href="Controller?page=contact" style="color:white; font-size: 20px;">Contact</a></li>
				<li><a href="Controller?page=index" style="color:white; font-size: 20px;">Home</a></li>
				<li><a href="Controller?page=showcart&email=<c:out value="${email }"/>">" style="color:white; font-size: 20px;">Panier</a></li>
		
				
			</ul>
		</nav>
	</header>
	
	<div>
		<nav>
			<div style="width:15%;">
				<a href="https://www.facebook.com"><img align="left" style="width:25px;height :25px; padding: 16px 0px 0px 45px;"src="img/fbLogo.png"></a>
				<a href="https://www.instagram.com"><img align="left" style="width:35px;height: 30px; padding: 13px 0px 0px 10px;"src="img/insLogo.png"></a>
				<a href="phoneNumber.jsp"><img align="left" style="width:35px;height :30px; padding: 13px 0px 0px 10px;"src="img/phoneLogo.png"></a>
			</div>
			
			<ul style="margin: 0px; background-color: #66ACAE;">
				<c:choose><c:when test="${session != null}">
					<li><p style="color:black; margin-right:10px;  color:white; font-size: 20px; padding-bottom:2px;"><c:out value="${username }"></c:out></p></li>
				</c:when></c:choose>
			</ul>
		</nav>
	</div>
			

	
	
	
	