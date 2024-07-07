<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	Boolean isSuccess = (Boolean) request.getAttribute("isSuccess");
	String img = (isSuccess) ? "correct.png" : "incorrect.png";
	String message = (String) request.getAttribute("message");
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>EventHive</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/notofication.css" />
</head>
<body>

	<div class="notofication-container">
	
		
		<div class="notofication-success">
			<img src="${pageContext.request.contextPath}/assets/notification/<%= img %>" class="notification-img">
			<div class="notification-msg"><%= message %></div>
		</div>
		
		<a href="${pageContext.request.contextPath}/index.jsp" class="indexpage-link">Ok</a>
	
	</div>

</body>
</html>