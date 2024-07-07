<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    if (session.getAttribute("userSessionEmail") == null || session.getAttribute("userSessionId") == null) {
       	response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
  <head>
    <title>EvenetHive - Create Event</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/creatEevent.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
  </head>
  <body>
  
  	<%@ include file="header.jsp" %>

	<div class="event-create-container">
		<div class="create-event-title">Create Event</div>
			<form method="post" action="eventController" class="event-details-form" enctype="multipart/form-data">
				<div class="event-details">
					<div class="event-detail-title">Event Title</div>
					<input type="text" class="event-detail-input" name="event_name">
				</div>
				<div class="event-details">
					<div class="event-detail-title">Organization</div>
					<input type="text" class="event-detail-input" name="event_organization">
				</div>
				<div class="event-details">
					<div class="event-detail-title">Event Venue</div>
					<input type="text" class="event-detail-input" name="event_venue">
				</div>
				<div class="event-details">
					<div class="event-detail-title">District</div>
					<select class="event-detail-category-input" name="event_district">
						<% String[] districts ={"Ampara", "Anuradhapura", "Badulla", "Batticaloa", "Colombo",
										"Galle", "Gampaha", "Hambantota", "Jaffna", "Kalutara",
										"Kandy", "Kegalle", "Kilinochchi", "Kurunegala", "Mannar",
										"Matale", "Matara", "Monaragala", "Mullaitivu", "Nuwara Eliya",
										"Polonnaruwa", "Puttalam", "Ratnapura", "Trincomalee", "Vavuniya"};
								
								for(String district : districts) { %>
									<option value="<%= district %>"><%= district %></option><% } %>
					</select>
				</div>
				<div class="event-details">
					<div class="event-detail-title">Event Category</div>
					<select class="event-detail-category-input" name="event_category">
						<option>Sport Event</option>
						<option>Exhibition</option>
						<option>Award Ceremony</option>
						<option>Musical Event</option>
						<option>Comedy Shows</option>
					</select>
				</div>
				<div class="event-time-details">
					<div class="event-time-inputs">
						<div class="event-detail-title">Start Time</div>
						<input type="time" class="event-time-input" name="event_start_time">
					</div>
					<div class="event-time-inputs">
						<div class="event-detail-title">End Time</div>
						<input type="time" class="event-time-input" name="event_end_time">
					</div>
				</div>
				<div class="event-time-details">
					<div class="event-time-inputs">
						<div class="event-detail-title">Start date</div>
						<input type="date" class="event-time-input" name="event_start_date">
					</div>
					<div class="event-time-inputs">
						<div class="event-detail-title">End date</div>
						<input type="date" class="event-time-input" name="event_end_date">
					</div>
				</div>
				
				<div class="event-type-details">
					<div class="event-detail-type">Event Type</div>
					<div class="event-type">
						<div class="event-type-input">
							Online<input type="radio" class="event-type-input" value="online" name="event_type">
						</div>
						<div class="event-type-input">
							Physical<input type="radio" class="event-type-input" value="physical" name="event_type">
						</div>
						<div class="event-type-input">
							Hybrid<input type="radio" class="event-type-input" value="hybrid" name="event_type">
						</div>
					</div>	
				</div>
				<div class="event-type-details">
					<div class="event-detail-type">Event Payments</div>
					<div class="event-type">
						<div class="event-type-input">
							Free<input type="radio" value="free" class="event-type-input" name="event_payment_type">
						</div>
						<div class="event-type-input">
							Paid<input type="radio" value="paid" class="event-type-input" name="event_payment_type">
						</div>
					</div>	
				</div>
				
				<div class="event-time-details" id="packages-prices">
					<div class="event-time-inputs">
						<div class="event-detail-title">Vip Package</div>
						<input type="text" class="event-ticket-price-input" name="vip_package_price">
					</div>
					<div class="event-time-inputs">
						<div class="event-detail-title">Premium Package</div>
						<input type="text" class="event-ticket-price-input" name="premium_package_price">
					</div>
					<div class="event-time-inputs">
						<div class="event-detail-title">Standard Package</div>
						<input type="text" class="event-ticket-price-input" name="standard_package_price">
					</div>
				</div>
				
				<div class="event-type-details">
					<div class="event-detail-type">Payment Refunds</div>
					<div class="event-type">
						<div class="event-type-input">
							Refund Available<input type="checkbox" class="event-type-input" value="yes" name="event_refund_available">
						</div>
					</div>	
				</div>
				<div class="event-type-details">
					<div class="event-detail-type">Event Visibility</div>
					<div class="event-type">
						<div class="event-type-input">
							Private<input type="radio" value="private" class="event-type-input" name="event_visibility">
						</div>
						<div class="event-type-input">
							Public<input type="radio" value="public" class="event-type-input" name="event_visibility">
						</div>
					</div>	
				</div>
				<div class="event-type-details" id="limit-attendance" >
					<div class="event-details">
						<div class="event-detail-title">Maximum Participants (optional)</div>
						<input type="text" class="event-detail-input" name="max_participants">
					</div>
				</div>
				<div class="event-description-title">Event Description</div>
				<div class="event-details">
					<div class="event-detail-title">Event Image</div>
					<input type="file" class="event-detail-input" name="event_image">
				</div>
				<div class="event-details">
					<div class="event-detail-title">Event Description</div>
					<textarea type="text" class="event-description-input" name="event_description"></textarea>
				</div>
				<input type="submit" class="create-event-form-submit-btn" value="Create Event" name="createNewEvent">
			</form>

	</div>	


	<%@ include file="footer.jsp" %>

	<script src="${pageContext.request.contextPath}/scripts/header.js"></script>
	
	<script>
		/*
		-------------Create Event----------------
		*/
		//functions for show the maximum participants field(only if the event is paid and public)
		function LimitAttendanceSection() {
		    const paymentRadio = document.querySelector('input[name="event_payment_type"]:checked');
		    const visibilityRadio = document.querySelector('input[name="event_visibility"]:checked');
		    const limitAttendanceSection = document.getElementById('limit-attendance');
	
		    if (paymentRadio && visibilityRadio && paymentRadio.value === "paid" && visibilityRadio.value === "public") {
		        limitAttendanceSection.style.display = 'block';
		    } else {
		        limitAttendanceSection.style.display = 'none';
		    }
		}    
	
		LimitAttendanceSection();
	
		document.querySelectorAll('input[name="event_payment_type"]').forEach((radio) => {
		    radio.addEventListener('change', LimitAttendanceSection);
		});
	
		document.querySelectorAll('input[name="event_visibility"]').forEach((radio) => {
		    radio.addEventListener('change', LimitAttendanceSection);
		});
	
	
		//functions for show the package prices filed(only if the event is paid)
		function AddPackagePrices() {
		    const paymentRadio = document.querySelector('input[name="event_payment_type"]:checked');
		    const limitAttendanceSection = document.getElementById('packages-prices');
	
		    if (paymentRadio && paymentRadio.value === "paid") {
		        limitAttendanceSection.style.display = 'block';
		    } else {
		        limitAttendanceSection.style.display = 'none';
		    }
		} 
	
		AddPackagePrices(); 
	
		document.querySelectorAll('input[name="event_payment_type"]').forEach((radio) => {
		    radio.addEventListener('change', AddPackagePrices);
		});

	</script>
	
  </body>
</html>