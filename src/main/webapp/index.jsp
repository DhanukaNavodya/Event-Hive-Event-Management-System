<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page import="jakarta.servlet.http.HttpServlet"%>

<%@ page import="com.eventHive.utils.dbConnection"%>

<%@ page import="javax.servlet.http.HttpSession" %>

<%
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null; 
	PreparedStatement preparedStatement = null;
	
	Integer userId = (Integer) session.getAttribute("userSessionId");
	if (userId == null) {
	    userId = 0;
	}
	

%>

<!DOCTYPE html>
<html>
  <head>
    <title>EvenetHive</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/eventCard.css" />      

  </head>
  <body>
  	<%@ include file="header.jsp" %>
	
    <div class="index-container">
      <div class="hero-container">
      	<div class="hero-image-container">
	        <img
	          src="${pageContext.request.contextPath}/assets/index/heroimage3.jpg"
	          alt="hero"
	          class="hero-image"
	        />
        </div>
        <div class="hero-text">Made for those<br />who do</div>
      </div>

	      <div class="upcoming-events-section">
	        <div class="upcoming-events">
	        
	        	<div class="upcoming-events-center aaa">
	        		<%
						try {
						    connection = dbConnection.getConnection();
						    statement = connection.createStatement();
						    String query = "select * from events where userId != ?";
						    preparedStatement = connection.prepareStatement(query);
						    preparedStatement.setInt(1, userId);
						    resultSet = preparedStatement.executeQuery();
						    while (resultSet.next()) {											    
					%>
						<div class="eventdetailcard">
						<jsp:include page="eventCard.jsp">
							<jsp:param name="eventId" value="<%= resultSet.getString(1) %>" />
							<jsp:param name="eventImage" value="<%= resultSet.getString(20) %>" />
						    <jsp:param name="eventName" value="<%= resultSet.getString(2) %>" />
						    <jsp:param name="eventDate" value="<%= resultSet.getString(9) %>" />						
						    <jsp:param name="eventType" value="" />
						</jsp:include>
						</div>
	
		        	<%
							}
							connection.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
	          
	          	</div>        
	        </div>
	      </div>

    </div>
    
    <%@ include file="footer.jsp" %>
    
    <script>
	    window.onload = function () {
	    	var heroText = document.querySelector('.hero-image');
	    	heroText.classList.add("fade-inindex");
	    };
	    
		const targetDivs = document.querySelectorAll(".eventdetailcard");
		
		const options = {
		  threshold: 0.5, // Adjust the threshold as needed
		  rootMargin: "0px 0px 0px 0px"
		};
	
		const observer = new IntersectionObserver(function (entries) {
		  entries.forEach(entry => {
		    console.log(entry.target);
		    const isIntersecting = entry.isIntersecting;
		    console.log(isIntersecting);
		    if (isIntersecting) {
		      entry.target.classList.add("fade-in");
		    } else {
		      entry.target.classList.remove("fade-in");
		    }
		  });
		}, options);
		
		targetDivs.forEach((targetDiv) => {
			  observer.observe(targetDiv);
		});
    </script>

	<script src="${pageContext.request.contextPath}/scripts/header.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/index.js"></script>
	
  </body>
</html>
