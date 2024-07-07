/*

-------------final amount calculation----------------

*/

let ticketPrice;
let noOfTickets = document.querySelector('input[name="no-of-tickets"]');

const updateAmount = (e, ticketType) => {
    e.preventDefault(); 

    ticketPrice = document.querySelector(`[name="${ticketType}"]`).value;

    let numberOfTickets = parseInt(document.getElementById('no-of-tickets').value);

    let finalAmount = ticketPrice * numberOfTickets;

    document.querySelector('[name="amount"]').value = finalAmount;
}

const decrease = (e) =>{
	e.preventDefault();
	noOfTickets.value > 1 ? noOfTickets.value-- : pass;
	
	ticketPrice ? document.querySelector('[name="amount"]').value = 0 : pass;

    let finalAmount = ticketPrice * noOfTickets.value;

    document.querySelector('[name="amount"]').value = finalAmount;
}

const increase = (e) => {
	e.preventDefault();
	noOfTickets.value < 5 ? noOfTickets.value++ : pass;
	
	ticketPrice ? document.querySelector('[name="amount"]').value = 0 : pass;
	
	// Calculate the final amount
    let finalAmount = ticketPrice * noOfTickets.value;

    // Update the final amount input field
    document.querySelector('[name="amount"]').value = finalAmount;
}



/*

-------------payment type selection----------------

*/
const payWithCardBtn = document.getElementById("pay-with-card-btn");
const payAtEventBtn = document.getElementById("pay-at-event-btn");
const creditCardDetails = document.getElementById("credit-card-details");

payWithCardBtn.addEventListener("click", (e) => {
	e.preventDefault();
	creditCardDetails.style.display = "none" ?  creditCardDetails.style.display = "block" : pass ;
});
payAtEventBtn.addEventListener("click", (e) => {
	e.preventDefault();
	creditCardDetails.style.display = "block" ?  creditCardDetails.style.display = "none" : pass ;
});





















