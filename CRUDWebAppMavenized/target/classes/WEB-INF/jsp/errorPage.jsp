<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@ include file="/WEB-INF/jsp/includes.jsp"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
	<head>
	
		<spring:url value="/resources/img/ryukapple.jpg" var="ryukapple" />
		<spring:url value="/resources/css/error.css" var="errorCSS" />
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<title>Sorry</title>
		
		<link rel="stylesheet" type="text/css" href="${errorCSS}"/>
	</head>
	<body style="background-image:url(${ryukapple});">
		<div id="main_error">
			<h1>${errorCode}</h1>
			<p>Sorry a problem as occured... let's see the problem:<br> ${errorMsg}</p>
			<a href="loadEvents">Go back to the menu.</a>
		</div>
		
	</body>
</html>