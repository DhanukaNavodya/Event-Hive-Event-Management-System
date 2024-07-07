<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
  <head>
    <title>EvenetHive</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/aboutus.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/eventCard.css" />      
  </head>
  <body>
  	<%@ include file="header.jsp" %>

	<div class="aboutus-container">
		<div>
		<div class="aboutus-header">About Us</div>
		
		<div class="aboutus-content">
			<div class="aboutus-content-header">Who We Are</div>  
			<div class="aboutus-text">At EventHive, we are passionate about creating unforgettable experiences. With a team of dedicated professionals, we specialize in planning and executing a wide range of events, from corporate gatherings to weddings, and everything in between. Our commitment to excellence and attention to detail sets us apart in the world of event management.</div>
			<div class="aboutus-img">
				<img src="${pageContext.request.contextPath}/assets/about/aboutsus.jpg" class="aboutusimg"/>
			</div>
		</div>
		
		<div class="aboutus-content">
			<div class="aboutus-content-header">Our Mission</div>  
			<div class="aboutus-text">Our mission is to turn your dreams into reality. We understand that every event is unique, and our goal is to ensure that your special occasion is a reflection of your vision. We aim to provide you with the peace of mind that comes from knowing your event is in capable hands.</div>
		</div>
		</div>
	</div>

    <%@ include file="footer.jsp" %>
    
    <script>
		
		const targetDivn = document.querySelector(".aboutusimg");
	
		const options = {
		  threshold: 0,
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
	
		observer.observe(targetDivn);
    
	</script>
    
	<script src="${pageContext.request.contextPath}/scripts/header.js"></script>
	<script src="${pageContext.request.contextPath}/scripts/index.js"></script>
	
  </body>
</html>
