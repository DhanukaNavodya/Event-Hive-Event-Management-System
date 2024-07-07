//Event Details Update Form Functions

const eventTitleEditBtn = document.getElementById("event-title-edit-btn");
const eventOrganizerEditBtn = document.getElementById("event-organizer-edit-btn");
const eventLocationEditBtn = document.getElementById("event-location-edit-btn");
const eventStartDateEditBtn = document.getElementById("event-startdate-edit-btn");
const eventEndDateEditBtn = document.getElementById("event-enddate-edit-btn");
const eventStartTimeEditBtn = document.getElementById("event-starttime-edit-btn");
const eventEndTimeEditBtn = document.getElementById("event-endtime-edit-btn");

const eventTitleUpdateSection = document.querySelector(".event-title-update");
const eventOrganizerUpdateSection = document.querySelector(".event-organizer-update");
const eventLocationUpdateSection = document.querySelector(".event-location-update");
const eventStartDateUpdateSection = document.querySelector(".event-startdate-update");
const eventEndDateUpdateSection = document.querySelector(".event-enddate-update");
const eventStartTimeUpdateSection = document.querySelector(".event-starttime-update");
const eventEndTimeUpdateSection = document.querySelector(".event-endtime-update");

eventTitleEditBtn.addEventListener("click", (e) => {
	e.preventDefault();
	eventTitleUpdateSection.style.display = "none" ?  eventTitleUpdateSection.style.display = "block" : eventTitleUpdateSection.style.display = "none" ;
});

eventOrganizerEditBtn.addEventListener("click", (e) => {
	e.preventDefault();
	eventOrganizerUpdateSection.style.display = "none" ?  eventOrganizerUpdateSection.style.display = "block" : eventOrganizerUpdateSection.style.display = "none" ;
});

eventLocationEditBtn.addEventListener("click", (e) => {
	e.preventDefault();
	eventLocationUpdateSection.style.display = "none" ?  eventLocationUpdateSection.style.display = "block" : eventLocationUpdateSection.style.display = "none" ;
});

eventStartDateEditBtn.addEventListener("click", (e) => {
	e.preventDefault();
	eventStartDateUpdateSection.style.display = "none" ?  eventStartDateUpdateSection.style.display = "block" : eventStartDateUpdateSection.style.display = "none" ;
});

eventEndDateEditBtn.addEventListener("click", (e) => {
	e.preventDefault();
	eventEndDateUpdateSection.style.display = "none" ?  eventEndDateUpdateSection.style.display = "block" : eventEndDateUpdateSection.style.display = "none" ;
});

eventStartTimeEditBtn.addEventListener("click", (e) => {
	e.preventDefault();
	eventEndTimeUpdateSection.style.display = "none" ?  eventEndTimeUpdateSection.style.display = "block" : eventEndTimeUpdateSection.style.display = "none" ;
});

eventEndTimeEditBtn.addEventListener("click", (e) => {
	e.preventDefault();
	eventTitleUpdateSection.style.display = "none" ?  eventTitleUpdateSection.style.display = "block" : eventTitleUpdateSection.style.display = "none" ;
});

document.addEventListener('click', (e) => {
    const targetElement = e.target;

    if(!eventTitleUpdateSection.contains(targetElement) && !eventTitleEditBtn.contains(targetElement)){
        eventTitleUpdateSection.style.display = "block" ?  eventTitleUpdateSection.style.display = "none" : pass ;    
    }
    if(!eventOrganizerUpdateSection.contains(targetElement) && !eventOrganizerEditBtn.contains(targetElement)){
        eventOrganizerUpdateSection.style.display = "block" ?  eventOrganizerUpdateSection.style.display = "none" : pass ;    
    }
    if(!eventLocationUpdateSection.contains(targetElement) && !eventLocationEditBtn.contains(targetElement)){
        eventLocationUpdateSection.style.display = "block" ?  eventLocationUpdateSection.style.display = "none" : pass ;    
    }
    if(!eventStartDateUpdateSection.contains(targetElement) && !eventStartDateEditBtn.contains(targetElement)){
        eventStartDateUpdateSection.style.display = "block" ?  eventStartDateUpdateSection.style.display = "none" : pass ;    
    }
    if(!eventEndDateUpdateSection.contains(targetElement) && !eventEndDateEditBtn.contains(targetElement)){
        eventEndDateUpdateSection.style.display = "block" ?  eventEndDateUpdateSection.style.display = "none" : pass ;    
    }
    if(!eventStartTimeUpdateSection.contains(targetElement) && !eventStartTimeEditBtn.contains(targetElement)){
        eventStartTimeUpdateSection.style.display = "block" ?  eventStartTimeUpdateSection.style.display = "none" : pass ;    
    }
    if(!eventEndTimeUpdateSection.contains(targetElement) && !eventEndTimeEditBtn.contains(targetElement)){
        eventEndTimeUpdateSection.style.display = "block" ?  eventEndTimeUpdateSection.style.display = "none" : pass ;    
    }
});