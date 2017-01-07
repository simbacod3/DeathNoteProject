<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@ include file="/WEB-INF/jsp/includes.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
	<head>
		<!-- External URL and variables JSP -->
		<spring:url value="/resources/css/register.css" var="mainCSS" />
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<title>Register to DeathNote Time line</title>
		
		<!-- CSS link with JSP variables -->
		<link rel="stylesheet" type="text/css" href="${mainCSS}"/>
		
	</head>
	<body>
	<a class="returnToMenu" href="loadEvents">&times;</a>
		<form action="registerAndSend" >
			<span>Registration</span></br></br>
			<label>First name</label> </br>
			<input path="firstname" /> </br></br>
			<label>Last name</label></br>
			<input path="lastname" /> </br></br>
			<label>User name</label></br>
			<input path="username" /> </br></br>
			<label>Age</label></br>
			<input path="age" /></br></br>
			<label>Description (optional)</label></br>
			<input path="description" /></br></br>
			<button>Register </button>
		</form>
	</body>
</html>