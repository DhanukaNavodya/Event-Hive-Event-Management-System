<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page import="jakarta.servlet.http.HttpServlet"%>

<%@ page import="com.eventHive.utils.dbConnection"%>


<%
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null; 
	PreparedStatement preparedStatement = null;
	
	int userId  = 0;
%>

<!DOCTYPE html>
<html>
  <head>
    <title>EvenetHive - All Events</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/allEvents.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/eventCard.css" /> 
  </head>
  <body>
  
  	<%@ include file="header.jsp" %>
  	
  	<div class="allevents-container">
  	
  		<div class="allevents-header">
  			<div class="allevents-details">
  				<div class="allevents-header-tagline">Thriving Above Event Expectations.</div>
  				<div class="allevents-headertext"><div>Event<div>Hive</div>-ing</div><div>the Best.Day.<br>Ever.</div></div>
  				<div class="allevents-header-numbers">2k+<br>Total Events<br>Hosted</div>
  			</div>
  			<div class="allevents-img">
  				<img src="${pageContext.request.contextPath}/assets/allevents/unsplash_ugaOk9LkmQY.png">
  			</div>
  		</div>	  		
  	</div>
  	
  	<div class="all-events-container">
  		<div class="upcoming-events-center">
        		<%
					try {
					    connection = dbConnection.getConnection();
					    statement = connection.createStatement();
					    String sql = "select * from events";
					    preparedStatement = connection.prepareStatement(sql);
					    resultSet = preparedStatement.executeQuery();
					    while (resultSet.next()) {		
					    	
					    	String eventTypeValue = "Happens PHYSICALLY!!!";
					    	
					    	if (resultSet.getString(11).equals("physical")) {
					    		eventTypeValue = "Happens PHYSICALLY!!!";
					        } else if (resultSet.getString(11).equals("online")) {
					        	eventTypeValue = "ONLINE EVENT - Attend Anywhere!!!";
					        } 	
				%>
					<div class="eventdetailcard">
					<jsp:include page="eventCard.jsp">
						<jsp:param name="eventId" value="<%= resultSet.getString(1) %>" />
						<jsp:param name="eventImage" value="<%= resultSet.getString(20) %>" />
					    <jsp:param name="eventName" value="<%= resultSet.getString(2) %>" />
					    <jsp:param name="eventDate" value="<%= resultSet.getString(9) %>" />						
					    <jsp:param name="eventType" value="<%= eventTypeValue %>" />
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

	<%@ include file="footer.jsp" %>
    <script>
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
	
  </body>
</html>