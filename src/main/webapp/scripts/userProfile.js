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