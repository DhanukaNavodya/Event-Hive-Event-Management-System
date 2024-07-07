/*

-------------login and register----------------

*/

const loginpage = document.getElementById("login-page");
const loginbtn = document.getElementById("loginbtn");
const tologinpagebtn = document.getElementById("registertologin");

const registerpage = document.getElementById("registerpage");
const toregisterpagebtn = document.getElementById("logintiregister");
const signupbtn = document.getElementById("signupbtn");

loginbtn.addEventListener('click', (e) => {
    registerpage.classList.remove("login-page-visible");
    loginpage.classList.add("login-page-visible");
    e.stopPropagation();
});

signupbtn.addEventListener('click', (e) => {
    loginpage.classList.remove("login-page-visible");
    registerpage.classList.add("login-page-visible");
    e.stopPropagation();
});

tologinpagebtn.addEventListener('click', (e) => {
    loginpage.classList.remove("login-page-visible");
    registerpage.classList.add("login-page-visible");
    e.stopPropagation();
});

toregisterpagebtn.addEventListener('click', (e) => {
    registerpage.classList.remove("login-page-visible");
    loginpage.classList.add("login-page-visible");
    e.stopPropagation();
});


document.addEventListener('click', (e) => {
    const targetElement = e.target;

    if(!loginpage.contains(targetElement)){
        if (loginpage.classList.contains("login-page-visible")){
            loginpage.classList.remove("login-page-visible");
        }
        
    }
    if(!registerpage.contains(targetElement)){
		if (registerpage.classList.contains("login-page-visible")){
            registerpage.classList.remove("login-page-visible");
        }
	}
});


/*

-------------Password Validation----------------

*/

// Function to check if password and confirm password match
function checkPasswordMatch() {
  const password = document.querySelector('input[name="reg_password"]').value;
  const confirmPassword = document.querySelector('input[name="reg_confirm_password"]').value;
  const confirmPasswordField = document.querySelector('input[name="reg_confirm_password"]');

  if (password === confirmPassword) {
    confirmPasswordField.style.border = '1px solid #ccc'; // Reset border to default
  } else {
    confirmPasswordField.style.border = '1px solid var(--color-red)'; // Set border color to red
  }
}
// Attach the function to the input event of the confirm password field
const confirmPasswordField = document.querySelector('input[name="reg_confirm_password"]');
confirmPasswordField.addEventListener('input', checkPasswordMatch);


/*

-------------Email Validation----------------

*/
 // Function to check if the email is in a valid format
function isValidEmail(email) {
  const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
  return emailPattern.test(email);
}

// Function to validate email when the user enters it
function validateEmail() {
  const emailInput = document.querySelector('input[name="reg_email"]');
  const email = emailInput.value;

  if (isValidEmail(email)) {
    emailInput.style.border = '1px solid #ccc'; 
  } else {
    emailInput.style.border = '1px solid red'; 
  }
}

// Attach the validateEmail function to the input event of the email field
const emailInputField = document.querySelector('input[name="reg_email"]');
emailInputField.addEventListener('input', validateEmail);
