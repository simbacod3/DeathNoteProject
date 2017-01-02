<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@ include file="/WEB-INF/jsp/includes.jsp"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
	<head>
		
		<!-- URL and variables -->
		<spring:url value="/resources/css/main.css" var="mainCSS" />
		<spring:url value="/resources/css/modal-deathnote.css" var="pluginModalCSS" />
		<spring:url value="/resources/js/modal-deathnote.js" var="pluginModalJS" />
		<spring:url value="/resources/css/menu-deathnote.css" var="pluginMenuCSS" />
		<spring:url value="/resources/js/menu-deathnote.js" var="pluginMenuJS" />
		<spring:url value="/resources/img/ryuk.png" var="ryukFlying" />
		
		<!-- METAs files -->
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<title>DeathNote Time line</title>
		
		<!-- CSS references with JSP variables -->
		<link rel="stylesheet" type="text/css" href="${mainCSS}"/>
		<link rel="stylesheet" type="text/css" href="${pluginModalCSS}"/>
		<link rel="stylesheet" type="text/css" href="${pluginMenuCSS}"/>
		
		<!-- JS references with JSP variables -->
		<script src="${pluginModalJS}" charset="utf-8"></script>
		<script src="${pluginMenuJS}" charset="utf-8"></script>
		<script src='${jqueryMouseWheel}' type='text/javascript' ></script>
		
	</head>
	<body>
	
		<!-- Background twinkilng stars effect -->
		<div class="stars"></div>
		<div class="twinkling"></div>
		<!-- End Background twinkling stars effect -->
		
		<div id="main">	
		
		
		<!-- Navigation BAR -->
		   <span style="position:fixed; right: 10px; top: 10px;font-size:30px;cursor:pointer; color:white; z-index:4;" onclick="openMenuNavigation()">&#9776;</span>
		    <div id="mySideBarnav" class="sideBarNav">
		      <span href="javascript:void(0)" class="closebtn" onclick="closeMenuNavigation()">&times;</span>
		      <a href="javascript:void(0)" onclick="splashRyukFlyingForAdmin()">Admin</a>
		      <a href="#">Check a date</a>
		      <a href="#">About us</a>
		      <a href="#">Report bug</a>
		    </div>
		    <!-- END Navigation bar -->
			
			<!-- For the SVG and the binding of datas in the modal -->
			<!-- give the same attribute to one Node ( will correspond to an event )
			and give the same attribute to the modal defined in div that is (or not) displayed 
			On each modal don't forget to create a "openModal" and a "CloseModal" -->
		
			<!-- Sample of table splash -->
			<c:forEach items="${eventList}" var="event">
				<button type="button" name="button" nodeModal-identifier="${event.id}" onclick="openModalDialog(event);">
	  				Click here to open modal number: ${event.id}
				</button>
				
				<!-- The Modal Global-->
				<div class="modal" id="identifier-${event.id}" nodeModal-identifier="1">
				  <!-- Modal content -->
				  <div class="modal-content">
				    <span class="modal-closer" id="CloseIdentifier-${event.id}" nodeModal-identifier="${event.id}">&times;</span>
				    <!-- Add content, arbitrary -->
				    <p>${event.description}</p>
				  </div>
				</div>
			</c:forEach>
			
			<div id="admin-ryuk-connection">
				<span onclick="closeRyukConnect()">&times;</span>
				<img class="mrRyuk"src="${ryukFlying}"></img>
				<form>
					<span>Take possession <br> of </br> the Death Note.</span>
					<label>Username</label>
					<input type="text"/>
					<label>Password</label>
					<input type="text"/>
				</form>
			</div>
		</div>
	</body>
</html>