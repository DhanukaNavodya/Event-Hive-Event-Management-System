
  	
	<div class="upcoming-event">
	    <a href="eventDetails.jsp?eventId=${param.eventId}">
	        <img
			    src="${pageContext.request.contextPath}/assets/eventBanners/${param.eventImage}"
			    alt="Event_Image"
			    class="upcoming-events-event-image"
			/>

	    </a>
	    <div class="upcoming-event-name">${param.eventName}</div>
	    <div class="upcoming-event-date">Starting From - ${param.eventDate}</div>
	    <div class="upcoming-event-type">${param.eventType}</div>
	</div>
