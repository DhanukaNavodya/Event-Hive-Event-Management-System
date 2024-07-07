<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("userSessionEmail") == null || session.getAttribute("userSessionId") == null) {
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
	
	String userIdStr = request.getParameter("userId");	
	int userId = 0;  
	if (userIdStr != null && !userIdStr.isEmpty()) {
		userId = Integer.parseInt(userIdStr);
	}
	
%>

<!DOCTYPE html>
<html>
  <head>
    <title>EvenetHive -  User Profile</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userProfile.css" />           
  </head>
  
<body>

	<%@ include file="header.jsp" %>
	
	<div class="user-profile-container">
		<div class="user-profile-navigation">
			<button id="dashboardBtn">Dashboard</button>
			<button id="eventBtn">Events</button>
			<button id="bookingsBtn">Bookings</button>
			<!--  <button id="inquiriesBtn">Inquiries</button>-->
			<button id="profileBtn">Profile</button>
		</div>
		<div class="user-profile-content">
		
			<div id="userprofile-dashboard">
				<div class="userprofile-header">
					<div class="user-pro-img-text">Discover and<br>experience<br>extraordinary Events.</div>
					<img src="${pageContext.request.contextPath}/assets/profile/proimg2.jpg" class="user-pfo-img"/>				
				</div>
				
				<div class="dashboard-showcase">
					<% 	
						  	connection = dbConnection.getConnection();
						    statement = connection.createStatement();
						    String queryForTicketCount = "select count(ticketId) from tickets t, events e where t.eventId=e.eventId and e.userId= ?";
						    preparedStatement = connection.prepareStatement(queryForTicketCount);
						    preparedStatement.setInt(1, userId);
						    resultSet = preparedStatement.executeQuery();
					  	
						    while (resultSet.next()) {	
					%>
					<div class="dashboard-showcase-element">
						<div><%= resultSet.getString(1) %></div>
						<div>Ticketes Sold</div>
					</div>
					<% } %>	
					<% 	
						  	connection = dbConnection.getConnection();
						    statement = connection.createStatement();
						    String queryForRevenue = "select sum(totalAmount) from tickets t, events e where t.eventId=e.eventId and e.userId= ?";
						    preparedStatement = connection.prepareStatement(queryForRevenue);
						    preparedStatement.setInt(1, userId);
						    resultSet = preparedStatement.executeQuery();
					  	
						    while (resultSet.next()) {	
					%>
					<div class="dashboard-showcase-element">
						<div><%= resultSet.getString(1) %></div>
						<div>Revenue (LKR)</div>
					</div>
					<% } %>
					<% 	
						  	connection = dbConnection.getConnection();
						    statement = connection.createStatement();
						    String queryForParticipants = "select count(noOfTickets) from tickets t, events e where t.eventId=e.eventId and e.userId= ?";
						    preparedStatement = connection.prepareStatement(queryForParticipants);
						    preparedStatement.setInt(1, userId);
						    resultSet = preparedStatement.executeQuery();
					  	
						    while (resultSet.next()) {	
						%>
						<div class="dashboard-showcase-element">
							<div><%= resultSet.getString(1) %></div>
							<div>Total Participants</div>
						</div>
					<% } %>
				</div>
				
			</div>
			
			
			<div id="userprofile-events">
				<div class="userprofile-header">
					<div class="user-pro-img-text">Discover and<br>experience<br>extraordinary Events.</div>
					<img src="${pageContext.request.contextPath}/assets/profile/proimg2.jpg" class="user-pfo-img"/>				
				</div>
				
				<div class="userprofile-events-container">
					<div class="userprofile-events-title">Manage Events</div>
					<div>
					
						<% 	
						  	connection = dbConnection.getConnection();
						    statement = connection.createStatement();
						    String queryForEvents = "select * from events where userId = ?";
						    preparedStatement = connection.prepareStatement(queryForEvents);
						    preparedStatement.setInt(1, userId);
						    resultSet = preparedStatement.executeQuery();
					  		
						    while (resultSet.next()) {	
					  	%>
					
						<div class="userprofile-event">
							<a href="${pageContext.request.contextPath}/updateEventDetails.jsp?eventId=<%= resultSet.getString(1) %>">
								<img
	                				src="${pageContext.request.contextPath}/assets/eventBanners/<%= resultSet.getString(20) %>"
					                alt=""
					                class="upcoming-events-event-image"
	              				/>
	              				<div class="overlay">
		              				<div class="event-details">
		              					<div><%= resultSet.getString(2) %></div>
		              					<form action="eventController" method="post" enctype="multipart/form-data">
		              						<input type="hidden" value="<%= resultSet.getString(1) %>" name="event_id">
		              						<input type="submit" value="Remove Event" name="remove_event-btn" class="admin_remove_event_btn">
		              					</form>			
		              				</div>
	              				</div>
	              			</a>	
						</div>		
						<% } %>								
					</div>
				</div>
			</div>
			
			
			<div id="userprofile-bookings">
				<div class="userprofile-header">
					<div class="user-pro-img-text">Discover and<br>experience<br>extraordinary Events.</div>
					<img src="${pageContext.request.contextPath}/assets/profile/proimg2.jpg" class="user-pfo-img"/>				
				</div>
				
				<div class="userprofile-booking-container">
				
					<div class="userprofile-events-title">Manage Tickets</div>
					<div>					
						<div class="admin-ticket-dashboard-showcase">
							<%
								connection = dbConnection.getConnection();
							    statement = connection.createStatement();
							    String queryForTickets = "select * from tickets  where userId = ?";
							    preparedStatement = connection.prepareStatement(queryForTickets);
							    preparedStatement.setInt(1, userId);
							    resultSet = preparedStatement.executeQuery();
						  	
							    while (resultSet.next()) {	
							%>
							<div class="dashboard-showcase-element">
								<form action="ticketController" method="post">
									<input type="text" class="ticketdetails" name="ticketId" value="<%= resultSet.getString(1) %>" readonly>
									<input type="text" class="ticketdetails" name="" value=" User ID - <%= resultSet.getString(2) %>" readonly>
									<input type="text" class="ticketdetails" name="" value=" Event ID - <%= resultSet.getString(3) %>" readonly>
									<input type="text" class="ticketdetails" name="" value=" No of Tickets - <%= resultSet.getString(4) %>" readonly>
									<input type="text" class="ticketdetails" name="" value=" Amount - <%= resultSet.getString(5) %>" readonly>
									<input type="text" class="ticketdetails" name="" value=" Payment Type - <%= resultSet.getString(6) %>" readonly>
									<input type="submit" value="Remove Tickets" name="remove_ticket-btn">
								</form>
							</div>	
							<% } %>					
						</div>		
					</div>
				</div>
			</div>
					
			<div id="userprofile-profile">
				<div class="userprofile-header">
					<div class="user-pro-img-text">Discover and<br>experience<br>extraordinary Events.</div>
					<img src="${pageContext.request.contextPath}/assets/profile/proimg2.jpg" class="user-pfo-img"/>				
				</div>
				
				<div class="userprofile-logout">
					<form action="logoutController"  method="post">
						<input type="submit" value="Log Out">
					</form>
				</div>
					
				<div class="userprofile-events-container">
				
					<div class="admin-managge-users-container">
					<div class="userprofile-portfolio-title">Reset Password</div>					
						<div>
							<form action="userController" method="post" class="adminadduers-form">
								<div class="admin-addusers-inputs" id="admin_add_user_name">
									<div class="admin-addusers-inputs-label">Current Password</div>		
									<input type="text" name="cur_password" id="cur_password" class="admin-section-add-user-input-fields">						
								</div>
								<div class="admin-addusers-inputs">
									<div class="admin-addusers-inputs-label">New Password</div>		
									<input type="text" name="new_password" id="new_password" class="admin-section-add-user-input-fields">						
								</div>
								<div class="admin-addusers-inputs">
									<div class="admin-addusers-inputs-label">Confirm New Password</div>		
									<input type="text" name="new_password_confirm" id="new_password_confirm" class="admin-section-add-user-input-fields">						
								</div>
								<div class="admin-addusers-inputs">
									<input type="submit" name="reset-password" value="Reset Password" class="admin-section-adduser-submitbtn">				
								</div>
							</form>
						</div>
				</div>

				</div>
				
				<div class="userprofile-booking-container">
				
					<div class="userprofile-events-title">Manage Inquiries</div>
					<div>					
						<div class="admin-ticket-dashboard-showcase">
							<%
								connection = dbConnection.getConnection();
							    statement = connection.createStatement();
							    String queryForInquiry2 = "select * from inquiries  where userId = ?";
							    preparedStatement = connection.prepareStatement(queryForInquiry2);
							    preparedStatement.setInt(1, userId);
							    resultSet = preparedStatement.executeQuery();
						  	
							    while (resultSet.next()) {	
							%>
							<div class="dashboard-showcase-element">
									<form action="inquiryController" method="post">
										<input type="text" class="ticketdetails" name="inquiryId" value="<%= resultSet.getString(1) %>" readonly>
										<input type="text" class="ticketdetails" name="" value=" User ID - <%= resultSet.getString(2) %>" readonly>
										<input type="text" class="ticketdetails" name="" value=" Inquiry - <%= resultSet.getString(3) %>" readonly>
									<input type="submit" value="Remove Inquiry" name="inquiry-delete-btn">
									<a href="${pageContext.request.contextPath}/updateInquiry.jsp?inquiryId=<%= resultSet.getString(1) %>" class="inquiry-update-btn">Update Inquiry</a>

								</form>
							</div>	
							<% } %>					
						</div>		
					</div>
				</div>
				
				
			</div>
			
		</div>
	</div>
	  	
  	<%@ include file="footer.jsp" %>
  	
  	<script src="${pageContext.request.contextPath}/scripts/header.js"></script>
  	<script src="${pageContext.request.contextPath}/scripts/userProfile.js"></script> 
  	
  	<script>
	  	//navigation buttons
	  	const dashboardBtn = document.getElementById('dashboardBtn');
	  	const eventBtn = document.getElementById('eventBtn');
	  	const bookingsBtn = document.getElementById('bookingsBtn');
	  	const inquiryBtn = document.getElementById('inquiriesBtn');
	  	const profileBtn = document.getElementById('profileBtn');
	
	  	//sections
	  	const userProfileDashboard = document.getElementById("userprofile-dashboard");
	  	const userProfileEvents = document.getElementById("userprofile-events");
	  	const userProfileBookings = document.getElementById("userprofile-bookings");
	  	const userProfileInquiry = document.getElementById("userprofile-inquiry");
	  	const userProfileProfile = document.getElementById("userprofile-profile");
	
	  	//intialize navigation button background colors
	  	dashboardBtn.style.backgroundColor = "#10107B";
	  	dashboardBtn.style.color = "#ffffff";
	  	 
	  	//reset navigation button colors 
	  	function resetButtons() {
	  	  dashboardBtn.style.backgroundColor = "";
	  	  dashboardBtn.style.color = "";
	  	  eventBtn.style.backgroundColor = "";
	  	  eventBtn.style.color = "";
	  	  bookingsBtn.style.backgroundColor = "";
	  	  bookingsBtn.style.color = "";
	  	  inquiryBtn.style.backgroundColor = "";
	  	  inquiryBtn.style.color = "";
	  	  profileBtn.style.backgroundColor = "";
	  	  profileBtn.style.color = "";
	  	}
	
	  	//functions for navigation buttons
	  	eventBtn.addEventListener("click", () => {
	  		resetButtons();
	  		userProfileDashboard.style.display = "none";
	  		userProfileBookings.style.display = "none";
	  		userProfileProfile.style.display = "none";
	  		userProfileInquiry.style.display = "none";
	  		userProfileEvents.style.display = "block";
	  		eventBtn.style.backgroundColor = "#10107B";
	  	  	eventBtn.style.color = "#ffffff";
	  	});
	
	  	dashboardBtn.addEventListener("click", () => {
	  		resetButtons();
	  		userProfileBookings.style.display = "none";
	  		userProfileProfile.style.display = "none";
	  		userProfileEvents.style.display = "none";
	  		userProfileInquiry.style.display = "none";
	  		userProfileDashboard.style.display = "block";
	  		dashboardBtn.style.backgroundColor = "#10107B";
	  	  	dashboardBtn.style.color = "#ffffff";
	  	});
	
	  	bookingsBtn.addEventListener("click", () => {
	  		resetButtons();
	  		userProfileDashboard.style.display = "none";
	  		userProfileProfile.style.display = "none";
	  		userProfileEvents.style.display = "none";
	  		userProfileInquiry.style.display = "none";
	  		userProfileBookings.style.display = "block";
	  		bookingsBtn.style.backgroundColor = "#10107B";
	  	  	bookingsBtn.style.color = "#ffffff";
	  	});
	
	  	profileBtn.addEventListener("click", () => {
	  		resetButtons();
	  		userProfileDashboard.style.display = "none";
	  		userProfileBookings.style.display = "none";
	  		userProfileEvents.style.display = "none";
	  		userProfileInquiry.style.display = "none";
	  		userProfileProfile.style.display = "block";
	  		profileBtn.style.backgroundColor = "#10107B";
	  	  	profileBtn.style.color = "#ffffff";
	  	});
	  	
	  	inquiryBtn.addEventListener("click", () => {
	  		resetButtons();
	  		userProfileDashboard.style.display = "none";
	  		userProfileBookings.style.display = "none";
	  		userProfileEvents.style.display = "none";
	  		userProfileProfile.style.display = "none";
	  		userProfileInquiry.style.display = "block";
	  		inquiryBtn.style.backgroundColor = "#10107B";
	  		inquiryBtn.style.color = "#ffffff";
	  	});

  	</script>
  	
</body>
</html>