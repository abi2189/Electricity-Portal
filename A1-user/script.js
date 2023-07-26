const form = document.getElementById("form");
const firstName = document.getElementById("first-name");
const lastName = document.getElementById("last-name");
const phone = document.getElementById("phone");
const email = document.getElementById("mail");
const password = document.getElementById("pass");
const confirmPass = document.getElementById("cpass");

form.addEventListener("submit", (e) => {
  e.preventDefault();
  validateForm();
});
function validateForm() {
  const phoneValue = phone.value;
  const emailValue = email.value;
  console.log(email.value);
  const passwordValue = password.value;
  const confirmPassValue = confirmPass.value;
  console.log(passwordValue, confirmPassValue);
  var count = 0;
  if (phoneValue === "") {
    setError(phone, "Phone number cannot be blank");
    count = 1;
  } else if (phoneValue.length != 10) {
    setError(phone, "Phone number must be 10 digits");
    count = 1;
  } else if (isNaN(phoneValue)) {
    setError(phone, "Invalid Phone number");
    count = 1;
  } else {
    setSuccess(phone);
  }
  if (emailValue === "") {
    setError(email, "Email cannot be blank");
    count = 1;
  } else if (!isEmail(emailValue)) {
    setError(email, "Not a valid email");
    count = 1;
  } else {
    setSuccess(email);
  }
  if (passwordValue === "") {
    setError(password, "Password cannot be blank");
    count = 1;
  } else if (passwordValue.length < 8 || passwordValue.length > 20) {
    setError(password, "Password length should be between 8 & 20 characters");
    count = 1;
  } else {
    setSuccess(password);
  }
  if (confirmPassValue === "") {
    setError(confirmPass, "Please confirm password");
    count = 1;
  } else if (passwordValue !== confirmPassValue) {
    setError(confirmPass, "Passwords do not match!");
    count = 1;
  } else {
    setSuccess(confirmPass);
  }
  if (count === 0) {
    alert("You have successfully registered!");
    location.replace("login.html");
  }
}

function setError(input, message) {
  const formControl = input.parentElement;
  const small = formControl.querySelector("small");
  console.log(small);
  formControl.className = "form-control error";
  small.innerText = message;
}

function setSuccess(input) {
  const formControl = input.parentElement;
  formControl.className = "form-control success";
}

function isEmail(mail) {
  if (
    mail.indexOf("@") <= 0 ||
    (mail.charAt(mail.length - 4) != "." && mail.charAt(mail.length - 3) != ".")
  )
    return false;
  else return true;
}
