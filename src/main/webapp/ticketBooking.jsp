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
 
<%@ page import="com.eventHive.daos.ticketDao"%>
<%
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null; 
	PreparedStatement preparedStatement = null;
%>

<!DOCTYPE html>
<html>
  <head>
    <title>EvenetHive - Ticket Booking</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ticketbooking.css" />
    <!--  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />-->
    <!-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />-->
  </head>
  <body>
  
  <% 	
  		String eventId = request.getParameter("eventId");
  	
	  	connection = dbConnection.getConnection();
	    statement = connection.createStatement();
	    String sql = "select * from events where eventId ="+eventId;
	    preparedStatement = connection.prepareStatement(sql);
	    resultSet = preparedStatement.executeQuery();
  	
	    while (resultSet.next()) {	
  %>
  
  
  <div class="ticket-booking-page">
  
  	
  	<div class="ticket-booking-header"><a href="${pageContext.request.contextPath}/eventDetails.jsp?eventId=<%= eventId %>">Back To Event</a></div>
  	
  	<form action="ticketController" method="post">
  
  	<input type="hidden" name="eventid" value="<%= eventId %>">
  	
  	<div class="ticket-booking-title">Book Your Tickets</div>
  	
  	<div class="event-name"><%= resultSet.getString("eventName") %></div>
  	<div class="event-organization">by <%= resultSet.getString("eventOrganization") %></div>
  	
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
					
  	<div class="event-date"><%= dayName %> , <%= day %> <%= monthName%> <%= year %></div>
  	
  	<div class="event-type-selection">
  		<button class="event-type-block" id="vip" onclick="updateAmount(event, 'vip')">
  			<div class="ticket-type">VIP</div>
  			<input type="hidden" class="ticket-price" value="vip" name="vipName" readonly/>
  			<input type="hidden" class="ticket-price" value="<%= resultSet.getString(13) %>" name="vip" readonly/>
  		</button>
  		<button class="event-type-block" id="premium" onclick="updateAmount(event, 'premium')">
  			<div class="ticket-type">Premium</div>
  			<input type="hidden" class="ticket-price" value="premium" name="premiumName" readonly/>
  			<input type="hidden"  class="ticket-price" value="<%= resultSet.getString(14) %>" name="premium" readonly/>
  		</button>
  		<button class="event-type-block" id="standard" onclick="updateAmount(event, 'standard')">
  			<div class="ticket-type">Standard</div>
  			<input type="hidden" class="ticket-price" value="standard" name="standardName" readonly/>
  			<input type="hidden"  class="ticket-price" value="<%= resultSet.getString(15) %>" name="standard" readonly/>
  		</button>
  	</div>
  	
  	<% 
	    String userId = session.getAttribute("userSessionId").toString(); // Get the user's ID from the session
	    String eventId2 = request.getParameter("eventId");
		int ticketCount = 0;
	    int availableTicketCount = 5;
	    boolean earlyTickets = false;
	    int ticketId = 1;
		connection = dbConnection.getConnection();
        String query = "SELECT ticketId, count(noOfTickets) FROM tickets WHERE userId = ? AND eventId = ? GROUP BY ticketId";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, userId); // Set the user ID parameter
        preparedStatement.setString(2, eventId2); // Assuming eventId is defined somewhere

        resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
        	ticketId = resultSet.getInt(1);
            ticketCount = resultSet.getInt(2);
        }
        if(ticketCount>0){
        	earlyTickets =  true;
        }
	%>
  	<div class="number-of-tickets-section">
  		<div class="number-of-tickets-label">Number of Tickets</div>
  		<div class="">
  			<button class="ticket-number-decrease" id="ticket-number-decrease" onclick="decrease(event)">-</button>
  			<input type="number" class="no-of-tickets" value="1" max="<%= 5 - ticketCount %>" min="1" name="no-of-tickets" id="no-of-tickets" readonly>
  			<button class="ticket-number-increase" id="ticket-number-increase" onclick="increase(event)">+</button>
  		</div>
  	</div>
  	
  	<div class="final-amount-section">
  		<div class="final-amount-label">Final Amount</div>	
  		<div class="final-amount">Rs. <input type="text" id="amount" value="0" name="amount"></div>	
  		
  	</div>
  	
  	<div class="payment-type-selection">
  		<input type="button" class="payment-type-btn" id="pay-with-card-btn" value="Pay With Card" name="payment-type">
  		<input type="button" class="payment-type-btn" id="pay-at-event-btn" value="Pay At Event" name="payment-type">
  	</div>
  	
  	<div class="credit-card-details" id="credit-card-details" style="display: none;">
  		<div class="contact-details">
  			<input type="text" placeholder="Name" name="name">
  			<input type="text" placeholder="Email Address" name="email">
  		</div>
  		<div class="card-details">
  			<div>
  				<input type="text" placeholder="Card Number" name="card_number">
  				<input type="text" placeholder="Name on Card" name="card_name">
  			</div>
  			<div>
  				<input type="text" placeholder="Expire date" name="card_exp_date">
  				<input type="text" placeholder="CVV" name="card_cvv">
  			</div>
  		</div>
  	</div>
  	<%
	    String nameAttribute = (earlyTickets) ? "update_book_ticket_btn" : "book_ticket_btn";
	%>
	<input type="hidden" name="ticketId" value="<%= ticketId%>">
	<input type="submit" value="Confirm Booking" class="confirm-booking-active" name="<%= nameAttribute %>">
  	
  	</form>
  	
  </div>
  
  <% } %>
  
	<script src="${pageContext.request.contextPath}/scripts/ticketBooking.js"></script>

</body>
</html>