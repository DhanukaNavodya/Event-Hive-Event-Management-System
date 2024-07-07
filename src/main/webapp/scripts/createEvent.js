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
