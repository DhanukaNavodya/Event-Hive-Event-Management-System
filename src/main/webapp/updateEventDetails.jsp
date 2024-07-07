<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("userSessionEmail") == null) {
        response.sendRedirect("index.jsp");
   	}
%>

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
    <title>EvenetHive - Update EventDetails</title>
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
	    	String eventTypeValue = "PHYSICAL EVENT";
			String eventPaymentTypeValue = "";
			String eventDescription = "";
			
			if (resultSet.getString(11).equals("physical")) {
				eventTypeValue = "PHYSICAL EVENT";
		    } else if (resultSet.getString(11).equals("online")) {
		    	eventTypeValue = "ONLINE EVENT";
		    } 		
			if (resultSet.getString(12).equals("paid")) {
				eventPaymentTypeValue = "PAID EVENT";
		    } else if (resultSet.getString(11).equals("FREE")) {
		    	eventPaymentTypeValue = "FREE EVENT";
		    } 	
			if (resultSet.getString(19).isEmpty()) {
				eventDescription = "No Description";
		    } else{
		    	eventDescription = resultSet.getString(19);
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
  					<form class="event-banner-update-form" method="post" action="eventController" enctype="multipart/form-data">
  						<div class="event-details-header-dates-title">Add New Banner</div>
  						<div>
  							<input type="file" class="update-banner" name="event_image">
  							<input type="submit" value="update" name="update-event-banner-btn" class="update-event-details-submitbtn">
  						</div>
  					</form>
  					<div class="event-details-header-day" style="display: none;">Wednesday, August 30 2023, 2.30PM</div>
  					<div class="event-details-header-payments" style="display: none;">Free</div>
  					<div class="event-details-header-payments-booking">
  						<a class="event-details-ticket-booking-link" style="display: none;" href="${pageContext.request.contextPath}/ticketBooking.jsp">Book Now</a>
  						<div class="event-details-header-payments-refund" style="display: none;">Refund Available</div>
  					</div>
  					
  				</div>
  			</div>
  		</div>
  		
  		<div class="event-details-main">
  			<div class="event-details-parts">
  				<div class="event-details-title">Event Title</div>
  				<div class="event-details-text"><%= resultSet.getString(2) %></div>
  				<button id="event-title-edit-btn">Edit</button>
			</div>
			<!-- Event Update Pop up Forms -->
			<div class="event-title-update">
		  		<div>Enter New Title</div>
		  		<form class="event-details-update-from" method="post" action="eventController" enctype="multipart/form-data">
		  			<input type="hidden" value="<%= resultSet.getString(1) %>" name="event_id" >
		  			<input type="text" class="event-update-input" name="event_name">
		  			<input type="submit" value="Add New Title" class="update-event-details-submitbtn" name="addNewTitle">
		  		</form>
		  	</div>
			<div class="event-details-parts">
  				<div class="event-details-title">Organized By</div>
  				<div class="event-details-text"><%= resultSet.getString(3) %></div>
  				<button id="event-organizer-edit-btn">Edit</button>
			</div>
			<!-- Event Update Pop up Forms -->
			<div class="event-organizer-update">
		  		<div>Enter New Organizer</div>
		  		<form class="event-details-update-from" method="post" action="eventController">
		  			<input type="hidden" value="<%= resultSet.getString(1) %>" name="event_id" >
		  			<input type="text" class="event-update-input">
		  			<input type="submit" value="Add New Organizer" class="update-event-details-submitbtn" name="addNewOrganization">
		  		</form>
		  	</div>
			<div class="event-details-parts">
  				<div class="event-details-title">Event Location</div>
  				<div class="event-details-text"><%= resultSet.getString(4) %></div>
  				<button id="event-location-edit-btn">Edit</button>
			</div>
			<!-- Event Update Pop up Forms -->
			<div class="event-location-update">
		  		<div>Enter New Location</div>
		  		<form class="event-details-update-from" method="post" action="eventController">
		  			<input type="hidden" value="<%= resultSet.getString(1) %>" name="event_id" >
		  			<input type="text" class="event-update-input">
		  			<input type="submit" value="Add New Location" class="update-event-details-submitbtn" name="addNewLocation">
		  		</form>
		  	</div>
			<div class="event-details-second-part">
				
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
					<div class="event-details-title">Starting Date</div>
  					<div class="event-details-text"><%= dayName %> , <%= day %> <%= monthName%> <%= year %></div>
  					<button id="event-startdate-edit-btn">Edit</button>
  				</div>
  				<div class="event-details-second-part-parts">
					<div class="event-details-title">Ending Date</div>
  					<div class="event-details-text"><%= endDateDayName %> , <%= endDateDay %> <%= endDateMonthName%> <%= endDateYear %></div>
  					<button id="event-enddate-edit-btn">Edit</button>
  				</div>
			</div>
			<!-- Event Update Pop up Forms -->
			<div class="event-startdate-update">
		  		<div>Enter New Starting Date</div>
		  		<form class="event-details-update-from" method="post" action="eventController">
		  			<input type="hidden" value="<%= resultSet.getString(1) %>" name="event_id" >
		  			<input type="text" class="event-update-input">
		  			<input type="submit" value="Add New Starting Date" class="update-event-details-submitbtn" name="addNewstartingDate">
		  		</form>
		  	</div>
		  	<!-- Event Update Pop up Forms -->
			<div class="event-enddate-update">
		  		<div>Enter New Ending Date</div>
		  		<form class="event-details-update-from" method="post" action="eventController">
		  			<input type="hidden" value="<%= resultSet.getString(1) %>" name="event_id" >
		  			<input type="text" class="event-update-input">
		  			<input type="submit" value="Add New Ending Date" class="update-event-details-submitbtn" name="addNewEndingDate">
		  		</form>
		  	</div>
			<div class="event-details-second-part">
				<div class="event-details-second-part-parts">
					<div class="event-details-title">Starting Time</div>
  					<div class="event-details-text"><%= resultSet.getString(7) %></div>
  					<button id="event-starttime-edit-btn">Edit</button>
  				</div>
  				<div class="event-details-second-part-parts">
					<div class="event-details-title">Ending Time</div>
  					<div class="event-details-text"><%= resultSet.getString(8) %></div>
  					<button id="event-endtime-edit-btn">Edit</button>
  				</div>
			</div>
			<!-- Event Update Pop up Forms -->
			<div class="event-starttime-update">
		  		<div>Enter New Starting Time</div>
		  		<form class="event-details-update-from" method="post" action="eventController">
		  			<input type="hidden" value="<%= resultSet.getString(1) %>" name="event_id" >
		  			<input type="text" class="event-update-input">
		  			<input type="submit" value="Add New Starting Time" class="update-event-details-submitbtn" name="addNewStartingTime">
		  		</form>
		  	</div>
		  	<!-- Event Update Pop up Forms -->
			<div class="event-endtime-update">
		  		<div>Enter New Ending Time</div>
		  		<form class="event-details-update-from" method="post" action="eventController">
		  			<input type="hidden" value="<%= resultSet.getString(1) %>" name="event_id" >
		  			<input type="text" class="event-update-input" action="eventController">
		  			<input type="submit" value="Add New Ending Time" class="update-event-details-submitbtn" name="addNewEndingTime">
		  		</form>
		  	</div>
			<div class="event-details-parts">
  				<div class="event-details-title">Event Type</div>
  				<div class="event-details-text"><%= eventTypeValue %></div>
			</div>
			<div class="event-details-parts">
  				<div class="event-details-title">Event Payments</div>
  				<div class="event-details-text"><%= eventPaymentTypeValue %></div>
			</div>
			<div class="event-details-parts-description">
  				<div class="event-details-title">Event Description</div>
  				<div class="event-details-text"><%= eventDescription %></div>
			</div>
  		</div>
  		<a href="${pageContext.request.contextPath}/ticketBooking.jsp" style="display: none;" class="event-booking-link-main" style="<% if (true) { %>display: block;<% } else { %>display: none;<% } %>">Book Tickets</a>
  		
  	</div>
  	
  	<%
		    }
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}				
	%>

	<%@ include file="footer.jsp" %>
	
    <script src="${pageContext.request.contextPath}/scripts/updateEventDetails.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/header.js"></script> 
	
  </body>
</html>