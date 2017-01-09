<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@ include file="/WEB-INF/jsp/includes.jsp"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<spring:url value="/resources/css/episodes.css" var="epCSS" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>DeathNote all Episodes</title>

<link rel="stylesheet" type="text/css" href="${epCSS}"/>
</head>
<body>
<a href="loadEvents" style="font-family:'ryuk'; color:white; text-decoration:none; text-align:center;"><h1>DEATH NOTE</h1></a>
<div id="episodes-deathnote">
	<c:forEach items="${episodeList}" var="episode">
			<article class="embed-episode"> 
				
				<iframe src="${episode.link}?&showinfo=0" allowfullscreen> </iframe>
				<span class="episode-title"> Episode ${episode.number} - Season ${episode.season} </span>
				<span class="info-accordion"></span>
				<div class="informations-episode">
					<p> ${episode.synopsis} </p>
				</div>
			</article>
	</c:forEach>
</div>
<script type="text/javascript">
			var acc = document.getElementsByClassName("info-accordion");
			var i;

			for (i = 0; i < acc.length; i++) {
			    acc[i].onclick = function(){
			        this.classList.toggle("active");
			        this.nextElementSibling.classList.toggle("show");
			        this.parentNode.classList.toggle("episode-with-info");
			  }
			}
		</script>
</body>
</html>