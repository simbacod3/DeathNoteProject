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
		<spring:url value="/resources/js/timeline-svg-creator.js" var="pluginTimelineSVGJS" />
		<spring:url value="/resources/js/menu-deathnote.js" var="pluginMenuJS" />
		<spring:url value="/resources/img/ryuk.png" var="ryukFlying" />
		<spring:url value="/resources/img/DeathNote_Wallpaper.jpg" var="wallpaperPNG" />
		<spring:url value="/resources/img/shinigami-eye.png" var="eyePNG" />
		
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
		<script src='${pluginTimelineSVGJS}' type='text/javascript' ></script>
		
	</head>
	<body>
		
		<!-- Background twinkilng stars effect -->
		<div class="stars"></div>
		<div class="twinkling"></div>
		<!-- End Background twinkling stars effect -->
		
		<div id="main">	
		<a href="loadEvents" class="titleDeathNote">Death Note Time Line <small style="color:red">${failConnection}</small></a>
		
		<!-- Navigation BAR -->
		   <span style="position:fixed; right: 10px; top: 10px;font-size:30px;cursor:pointer; color:white; z-index:4;" onclick="openMenuNavigation()">&#9776;</span>
		    <div id="mySideBarnav" class="sideBarNav">
		      <span href="javascript:void(0)" class="closebtn" onclick="closeMenuNavigation()">&times;</span>
		      <a href="javascript:void(0)" onclick="splashRyukFlyingForAdmin()">Admin</a>
		      <a href="episodes">Check all episodes</a>
		    </div>
		    <!-- END Navigation bar -->
			
			<!-- For the SVG and the binding of datas in the modal -->
			<!-- give the same attribute to one Node ( will correspond to an event )
			and give the same attribute to the modal defined in div that is (or not) displayed 
			On each modal don't forget to create a "openModal" and a "CloseModal" -->
		
			<!-- Sample of table splash -->
			<c:forEach items="${eventList}" var="event">
				
				
				<script type="text/javascript">
					var pOv = "${event.pointOfView}";

					switch(pOv) {
					case"true":
						pOv = "police";
						break;
					case "false":
						pOv = "kira";
						break;
					default:
						pOv = null;
					}
					
					var node = new NodeObject( { "id":${event.id},
												 "description":"${event.description}",
												 "date":"${event.date}",
												 "pointOfView": pOv,
												 "link":"${event.episode.link}"
						});
					addToJavaList(node);
				</script>
				<div class="modal form-event" id="identifier-${event.id}" nodeModal-identifier="1">
					<div class="modal-content">
				<span class="modal-closer" id="CloseIdentifier-${event.id}" nodeModal-identifier="${event.id}">&times;</span> 
				
					<div class="modal-event-title">
						<input type="text" value="${event.title}" readonly="true"/>
					</div>


					<div class="event-picture taped">
						<img src="${wallpaperPNG}"/>
					</div>

					<div class="event-informations">
						<div class="event-period">
							<input type="date" value="${event.date}" readonly="true"/>
						</div>
						<div class="event-location">
							<input type="text" value="${event.location}" readonly="true"/> 
						</div>
					</div>
					
					<div class="event-description">
						<textarea name="event-description" readonly="true">${event.description}</textarea>
					</div>
					
					<div class="event-episode">
						<span class="question-episode">Click on Shinigami Eye if you want to see the Memory</span>
						<div class="shinigami-eye">
							<img src="${eyePNG}">
						</div>
						<div class="episode-viewer">
							<iframe id="player-${event.id}" src="${event.episode.link}?showinfo=0&enablejsapi=1" allowfullscreen></iframe>
						</div>
					</div>
					
			</div>
		</div>

				
			</c:forEach>
			
			<!-- PART WHERE THE TIMELINE WILL BE DRAWN. -->
			<div id="timeline-deathnote"></div>
				
				<script type="text/javascript">
					drawTimeline();
					
				</script>
				<script type="text/javascript">
					var acc = document.getElementsByClassName("shinigami-eye");
					var i;

					for (i = 0; i < acc.length; i++) {
					    acc[i].onclick = function(){
					        this.classList.toggle("opened");
					        this.nextElementSibling.classList.toggle("show");
					  }
					}
				</script>
			
			<!-- Admin connection part -->
			<div id="admin-ryuk-connection">
				<span onclick="closeRyukConnect()">&times;</span>
				<img class="mrRyuk"src="${ryukFlying}"></img>
				<form>
					<span>Take possession <br> of </br> the Death Note.</span>
					<label>Username</label>
					<input type="text" placeholder="User name"  required="required"/>
					<label>Password</label>
					<input type="text" placeholder="Password" required="required"/>
					<br>
					<a href="adminPanel">Connection</a>
					<p>Don't have any Death Note to connect? <a href="register">Register here</a></p>
					
				</form>
				
			</div>
			<!-- END ADMIN -->
		</div>
	</body>
</html>