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
%>

<!DOCTYPE html>
<html>
  <head>
    <title>EvenetHive - Event Details</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/eventDetails.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
  </head>
  <body>
  	<%@ include file="header.jsp" %>
  	
  	<%
  	try {
	    connection = dbConnection.getConnection();
	    String eventId = request.getParameter("eventId");
	    statement = connection.createStatement();
	    String sql = "select * from events where eventId ="+eventId;
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
  	
  	<div class="event-details-container">
  		
  		<div class="event-details-header">
  			<img src="${pageContext.request.contextPath}/assets/eventBanners/<%= resultSet.getString(20) %>" class="event-details-header-image">
  			<div class="event-details-header-main">
  				<div class="event-details-header-texts">
  					<div class="event-details-header-name"><%= resultSet.getString(2) %></div>
  					<div class="event-details-header-organization">by <%= resultSet.getString(3) %></div>
  				</div>
  				<div class="event-details-header-dates">
  				
  					<%
					    String dateStr = resultSet.getString(9);
					
					    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
					    java.util.Date date = dateFormat.parse(dateStr);
					
					    java.util.Calendar calendar = java.util.Calendar.getInstance();
					    calendar.setTime(date);
					
					    int year = calendar.get(java.util.Calendar.YEAR);
					    int month = calendar.get(java.util.Calendar.MONTH);
					    int day = calendar.get(java.util.Calendar.DAY_OF_MONTH);
					    
					    // Get day name
					    java.text.DateFormatSymbols dfs = new java.text.DateFormatSymbols(java.util.Locale.getDefault());
					    String dayName = dfs.getWeekdays()[calendar.get(java.util.Calendar.DAY_OF_WEEK)];
					    
					    // Get month name
					    String monthName = dfs.getMonths()[month];
					%>
  				
  					<div class="event-details-header-dates-title">Date & time</div>
  					<div class="event-details-header-day"><%= dayName %> , <%= day %> <%= monthName%> <%= year %></div>
  					
  					
  					<div class="event-details-header-payments-booking">
  						<a class="event-details-ticket-booking-link" href="${pageContext.request.contextPath}/ticketBooking.jsp?eventId=<%= resultSet.getString(1) %>">Book Now</a>
  						
  						<%
						    String valueFromDatabase = resultSet.getString(17); 
						    if ("yes".equals(valueFromDatabase)) {
						%>
  						
  							<div class="event-details-header-payments-refund">Refund Available</div>
  						
  						<% } %>
  					</div>
  				</div>
  			</div>
  		</div>
  		
  		<div class="event-details-main">
  			<div class="event-details-parts">
  				<div class="event-details-title">Event Title</div>
  				<div class="event-details-text"><%= resultSet.getString(2) %></div>
			</div>
			<div class="event-details-parts">
  				<div class="event-details-title">Organized By</div>
  				<div class="event-details-text"><%= resultSet.getString(3) %></div>
			</div>
			<div class="event-details-parts">
  				<div class="event-details-title">Event Location</div>
  				<div class="event-details-text"><%= resultSet.getString(4) %></div>
			</div>
			<div class="event-details-second-part">
				<div class="event-details-second-part-parts">
					<div class="event-details-title">Starting Date</div>
  					<div class="event-details-text"><%= dayName %> , <%= day %> <%= monthName%> <%= year %></div>
  				</div>
  				<%
				    String endDateStr = resultSet.getString(10);
				
				    java.text.SimpleDateFormat endDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
				    java.util.Date endDate = dateFormat.parse(endDateStr);
				
				    java.util.Calendar endDatecalendar = java.util.Calendar.getInstance();
				    calendar.setTime(endDate);
				
				    int endDateYear = calendar.get(java.util.Calendar.YEAR);
				    int endDateMonth = calendar.get(java.util.Calendar.MONTH);
				    int endDateDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
				    
				    // Get day name
				    java.text.DateFormatSymbols endDfs = new java.text.DateFormatSymbols(java.util.Locale.getDefault());
				    String endDateDayName = endDfs.getWeekdays()[calendar.get(java.util.Calendar.DAY_OF_WEEK)];
				    
				    // Get month name
				    String endDateMonthName = endDfs.getMonths()[month];
				%>
  				<div class="event-details-second-part-parts">
					<div class="event-details-title">Ending Date</div>
  					<div class="event-details-text"><%= endDateDayName %> , <%= endDateDay %> <%= endDateMonthName%> <%= endDateYear %></div>
  				</div>
			</div>
			<div class="event-details-second-part">
				<div class="event-details-second-part-parts">
					<div class="event-details-title">Starting Time</div>
  					<div class="event-details-text"><%= resultSet.getString(7) %></div>
  				</div>
  				<div class="event-details-second-part-parts">
					<div class="event-details-title">Ending Time</div>
  					<div class="event-details-text"><%= resultSet.getString(8) %></div>
  				</div>
			</div>
			<div class="event-details-parts">
  				<div class="event-details-title">Event Type</div>
  				<div class="event-details-text"><%= eventTypeValue %></div>
			</div>
			
			<%		
				if (resultSet.getString(12).equals("free")){
					String eventPaymentsValue = "Free Event!!!";
			%>
			
			<div class="event-details-parts">
  				<div class="event-details-title">Event Payments</div>
  				<div class="event-details-text"><%= eventPaymentsValue %></div>
			</div>
			<%	} %>
			
			<%					
				if (!resultSet.getString(19).isEmpty()){					
			%>
			<div class="event-details-parts-description">
  				<div class="event-details-title">Event Description</div>
  				<div class="event-details-text"><%= resultSet.getString(19) %></div>
			</div>
			<%	} %>
  		</div>
  		<a href="${pageContext.request.contextPath}/ticketBooking.jsp?eventId=<%= resultSet.getString(1) %>" class="event-booking-link-main" style="<% if (true) { %>display: block;<% } else { %>display: none;<% } %>">Book Tickets</a>
  		
  	</div>
  	
  	<%
		    }
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}				
	%>
  	

	<%@ include file="footer.jsp" %>
    
	<script src="${pageContext.request.contextPath}/scripts/header.js"></script>
	
  </body>
</html>