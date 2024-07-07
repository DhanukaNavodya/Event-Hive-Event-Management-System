<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
   	if (session.getAttribute("userSessionEmail") == null && session.getAttribute("userSessionRole") != null && session.getAttribute("userSessionRole").equals("admin")) {
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
    <title>EvenetHive - Admin</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/userProfile.css" /> 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminDashboard.css" />          
  </head>
  
<body>

	<div class="admin-dasboard-header">EventHive - Admin Section</div>
	
	<div class="admin-website-view"><a href="${pageContext.request.contextPath}/index.jsp">User View</a></div>
	
	<div class="user-profile-container">
		<div class="user-profile-navigation">
			<button id="dashboardBtn">Dashboard</button>
			<button id="eventBtn">Manage Events</button>
			<button id="bookingsBtn">Manage Bookings</button>
			<button id="profileBtn">Manage Users</button>
		</div>
		<div class="user-profile-content">
		
			<div id="userprofile-dashboard">
				<div class="userprofile-header">
					<div>Discover and<br>experience<br>extraordinary Events.</div>
					<img src="${pageContext.request.contextPath}/assets/profile/admin.jpg" class="user-admin-img"/>
				</div>
				
				<div class="dashboard-showcase">
					<% 	
						  	connection = dbConnection.getConnection();
						    statement = connection.createStatement();
						    String query1 = "select count(ticketId) from tickets";
						    preparedStatement = connection.prepareStatement(query1);
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
						    String query2 = "select sum(totalAmount) from tickets";
						    preparedStatement = connection.prepareStatement(query2);
						    resultSet = preparedStatement.executeQuery();
					  	
						    while (resultSet.next()) {	
					%>
					<div class="dashboard-showcase-element">
						<div><%= resultSet.getString(1) %></div>
						<div>Revenue (LKR)</div>
					</div>
					<% } %>
					<div class="dashboard-showcase-element-2"></div>
				</div>
				
			</div>
			
			
			<div id="userprofile-events">
				<div class="userprofile-header">
					<div>Discover and<br>experience<br>extraordinary Events.</div>
					<img src="${pageContext.request.contextPath}/assets/profile/admin.jpg" class="user-admin-img"/>
				</div>
				
				<div class="userprofile-events-container">
					<div class="userprofile-events-title">Manage Events</div>
					<div>
					
						<% 	
						  	connection = dbConnection.getConnection();
						    statement = connection.createStatement();
						    String sql = "select * from events";
						    preparedStatement = connection.prepareStatement(sql);
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
		              					<form action="adminController" method="post">
		              						<input type="hidden" value="<%= resultSet.getString(1) %>" name="eventId">
		              						<input type="submit" value="Remove Event" name="admin_remove_event-btn" class="admin_remove_event_btn">
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
					<div>Discover and<br>experience<br>extraordinary Events.</div>
					<img src="${pageContext.request.contextPath}/assets/profile/admin.jpg" class="user-admin-img"/>
				</div>
				
				<div class="userprofile-booking-container">
				
					<div class="userprofile-events-title">Manage Tickets</div>
					<div>					
						<div class="admin-ticket-dashboard-showcase">
							<%
								connection = dbConnection.getConnection();
							    statement = connection.createStatement();
							    String query = "select * from tickets";
							    preparedStatement = connection.prepareStatement(query);
							    resultSet = preparedStatement.executeQuery();
						  	
							    while (resultSet.next()) {	
							%>
							<div class="dashboard-showcase-element">
								<form action="adminController" method="post">
									<input type="text" class="ticketdetails" name="ticketId" value="<%= resultSet.getString(1) %>" readonly>
									<input type="text" class="ticketdetails" name="" value=" User ID - <%= resultSet.getString(2) %>" readonly>
									<input type="text" class="ticketdetails" name="" value=" Event ID - <%= resultSet.getString(3) %>" readonly>
									<input type="text" class="ticketdetails" name="" value=" No of Tickets - <%= resultSet.getString(4) %>" readonly>
									<input type="text" class="ticketdetails" name="" value=" Amount - <%= resultSet.getString(5) %>" readonly>
									<input type="text" class="ticketdetails" name="" value=" Payment Type - <%= resultSet.getString(6) %>" readonly>
									<input type="submit" value="Remove Tickets" name="admin_remove_ticket-btn">
								</form>
							</div>	
							<% } %>					
						</div>		
					</div>
				</div>
			</div>
			
			
			<div id="userprofile-profile">
				<div class="userprofile-header">
					<div>Discover and<br>experience<br>extraordinary Events.</div>
					<img src="${pageContext.request.contextPath}/assets/profile/admin.jpg" class="user-admin-img"/>	
				</div>
				<div class="userprofile-logout">
					<form action="logoutController"  method="post">
						<input type="submit" value="Log Out">
					</form>
				</div>
				<div class="admin-managge-users-container">
					<div class="userprofile-portfolio-title">Add New Users</div>					
						<div>
							<form action="adminController" method="post" class="adminadduers-form">
								<div class="admin-addusers-inputs" id="admin_add_user_name">
									<div class="admin-addusers-inputs-label">User Name</div>		
									<input type="text" name="user_name" class="admin-section-add-user-input-fields">						
								</div>
								<div class="admin-addusers-inputs">
									<div class="admin-addusers-inputs-label">User Email</div>		
									<input type="text" name="user_email" class="admin-section-add-user-input-fields">						
								</div>
								<div class="admin-addusers-inputs">
									<div class="admin-addusers-inputs-label">User Password</div>		
									<input type="text" name="user_password" class="admin-section-add-user-input-fields">						
								</div>
								<div class="admin-addusers-inputs">
									<div class="admin-addusers-inputs-label">User Role</div>	
									<select name="user_role" class="admin-section-add-user-input-fields" class="admin-adduser-user-role">
										<option>user</option>
										<option>sysadmin</option>
										<option>admin</option>
									</select>				
								</div> 
								<div class="admin-addusers-inputs">
									<input type="submit" name="admin-add-user-btn" value="Add User" class="admin-section-adduser-submitbtn">				
								</div>
							</form>
						</div>
				</div>
				
				<div class="admin-managge-users-container">
					<div class="userprofile-portfolio-title">Delete Users</div>					
						<div>
							<form action="adminController" class="adminadduers-form" method="post">
								<div class="admin-addusers-inputs">
									<div class="admin-addusers-inputs-label">User Name</div>		
									<input type="text" name="user_name" class="admin-section-add-user-input-fields">						
								</div>
								<div class="admin-addusers-inputs">
									<div class="admin-addusers-inputs-label">User Email</div>		
									<input type="text" name="user_email" class="admin-section-add-user-input-fields">						
								</div>
								<div class="admin-addusers-inputs">
									<input type="submit" value="Delete User" class="admin-section-adduser-submitbtn" name="admin_delete_user">				
								</div>
							</form>
						</div>
				</div>
				
				<div class="admin-managge-users-container">
					<div class="userprofile-portfolio-title">Update User Role</div>					
						<div>
							<form action="adminController" method="post" class="adminadduers-form">
								<div class="admin-addusers-inputs" id="admin_add_user_name">
									<div class="admin-addusers-inputs-label">User Name</div>		
									<input type="text" name="user_name" class="admin-section-add-user-input-fields">						
								</div>
								<div class="admin-addusers-inputs">
									<div class="admin-addusers-inputs-label">User Email</div>		
									<input type="text" name="user_email" class="admin-section-add-user-input-fields">						
								</div>
								<div class="admin-addusers-inputs">
									<div class="admin-addusers-inputs-label">User Role</div>	
									<select name="user_role" class="admin-section-add-user-input-fields" class="admin-adduser-user-role">
										<option>user</option>
										<option>sysadmin</option>
										<option>admin</option>
									</select>				
								</div> 
								<div class="admin-addusers-inputs">
									<input type="submit" name="admin-update-user-role" value="Add User" class="admin-section-adduser-submitbtn">				
								</div>
							</form>
						</div>
				</div>
			
				
			</div>
			
		</div>
	</div>
	  	
  	<%@ include file="footer.jsp" %>
  	
  	  	<script>
  	  	
	  	//navigation buttons
	  	const dashboardBtn = document.getElementById('dashboardBtn');
	  	const eventBtn = document.getElementById('eventBtn');
	  	const bookingsBtn = document.getElementById('bookingsBtn');
	  	const profileBtn = document.getElementById('profileBtn');
	
	  	//sections
	  	const userProfileDashboard = document.getElementById("userprofile-dashboard");
	  	const userProfileEvents = document.getElementById("userprofile-events");
	  	const userProfileBookings = document.getElementById("userprofile-bookings");
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
	  	  profileBtn.style.backgroundColor = "";
	  	  profileBtn.style.color = "";
	  	}
	
	  	//functions for navigation buttons
	  	eventBtn.addEventListener("click", () => {
	  		resetButtons();
	  		userProfileDashboard.style.display = "none";
	  		userProfileBookings.style.display = "none";
	  		userProfileProfile.style.display = "none";
	  		userProfileEvents.style.display = "block";
	  		eventBtn.style.backgroundColor = "#10107B";
	  	  	eventBtn.style.color = "#ffffff";
	  	});
	
	  	dashboardBtn.addEventListener("click", () => {
	  		resetButtons();
	  		userProfileBookings.style.display = "none";
	  		userProfileProfile.style.display = "none";
	  		userProfileEvents.style.display = "none";
	  		userProfileDashboard.style.display = "block";
	  		dashboardBtn.style.backgroundColor = "#10107B";
	  	  	dashboardBtn.style.color = "#ffffff";
	  	});
	
	  	bookingsBtn.addEventListener("click", () => {
	  		resetButtons();
	  		userProfileDashboard.style.display = "none";
	  		userProfileProfile.style.display = "none";
	  		userProfileEvents.style.display = "none";
	  		userProfileBookings.style.display = "block";
	  		bookingsBtn.style.backgroundColor = "#10107B";
	  	  	bookingsBtn.style.color = "#ffffff";
	  	});
	
	  	profileBtn.addEventListener("click", () => {
	  		resetButtons();
	  		userProfileDashboard.style.display = "none";
	  		userProfileBookings.style.display = "none";
	  		userProfileEvents.style.display = "none";
	  		userProfileProfile.style.display = "block";
	  		profileBtn.style.backgroundColor = "#10107B";
	  	  	profileBtn.style.color = "#ffffff";
	  	});
	  	
	  	/*
	  	-------Email Validation-------
	  	*/
	 	// Function to check if the email is in a valid format
	  	function isValidEmail(email) {
	  	  // Regular expression for a basic email format
	  	  const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	  	  return emailPattern.test(email);
	  	}

	  	// Function to validate email when the form is submitted
	  	function validateEmailOnSubmit(event) {
	  	  const emailInput = document.querySelector('input[name="user_email"]');
	  	  const email = emailInput.value;

	  	  if (!isValidEmail(email)) {
	  	    event.preventDefault(); // Prevent form submission if email is invalid
	  	    alert('Please enter a valid email address.');
	  	  }
	  	}

	  	// Attach the validateEmailOnSubmit function to the form's submit event
	  	const form = document.querySelector('.adminadduers-form');
	  	form.addEventListener('submit', validateEmailOnSubmit);

	  	
	  	
  	</script>
  	
</body>
</html>