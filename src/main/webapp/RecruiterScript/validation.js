document.addEventListener("DOMContentLoaded", function() {
    let form = document.querySelector("form.login");
    let firstName = form.querySelector("input[name='firstName']");
    let lastName = form.querySelector("input[name='lastName']");
    let email = form.querySelector("input[type='email']");
    let mobileNumber = form.querySelector("input[type='number']");
    let gender = form.querySelectorAll("input[name='gender']");
    let city = form.querySelector("input[name='city']");
    let password = form.querySelector("input[type='password']");
    let confirmPassword = form.querySelector("input[name='confirmPassword']");

    form.addEventListener("submit", function(event) {
        event.preventDefault();
        if (validateForm()) {
            // If form is valid, submit it
            form.submit();
        }
    });

    function validateForm() {
        let isValid = true;
        isValid = validateField(firstName, "First name cannot be blank") && isValid;
        isValid = validateField(lastName, "Last name cannot be blank") && isValid;
        isValid = validateEmail(email) && isValid;
        isValid = validateMobileNumber(mobileNumber) && isValid;
        isValid = validateGender() && isValid;
        isValid = validateField(city, "City cannot be blank") && isValid;
        isValid = validatePassword(password, "Password cannot be blank") && isValid;
        isValid = validateConfirmPassword(password, confirmPassword, "Passwords do not match") && isValid;
        return isValid;
    }

    function validateField(field, errorMessage) {
        let fieldValue = field.value.trim();
        if (fieldValue === "") {
            showError(field, errorMessage);
            return false;
        }
        hideError(field);
        return true;
    }

    function validateEmail(emailField) {
        let emailValue = emailField.value.trim();
        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(emailValue)) {
            showError(emailField, "Invalid email address");
            return false;
        }
        hideError(emailField);
        return true;
    }

    function validateMobileNumber(mobileNumberField) {
        let mobileNumberValue = mobileNumberField.value.trim();
        let mobileNumberRegex = /^\d{10}$/;
        if (!mobileNumberRegex.test(mobileNumberValue)) {
            showError(mobileNumberField, "Invalid mobile number");
            return false;
        }
        hideError(mobileNumberField);
        return true;
    }

    function validateGender() {
        let isChecked = false;
        for (let i = 0; i < gender.length; i++) {
            if (gender[i].checked) {
                isChecked = true;
                break;
            }
        }
        if (!isChecked) {
            showError(document.querySelector(".radio-container"), "Please select a gender");
            return false;
        }
        return true;
    }

    function validatePassword(passwordField, errorMessage) {
        let passwordValue = passwordField.value.trim();
        if (passwordValue === "") {
            showError(passwordField, errorMessage);
            return false;
        }
        hideError(passwordField);
        return true;
    }

    function validateConfirmPassword(passwordField, confirmPasswordField, errorMessage) {
        let confirmPasswordValue = confirmPasswordField.value.trim();
        if (confirmPasswordValue !== passwordField.value.trim()) {
            showError(confirmPasswordField, errorMessage);
            return false;
        }
        hideError(confirmPasswordField);
        return true;
    }

    function showError(field, message) {
        let errorElement = field.parentElement.querySelector(".error");
        if (errorElement) {
            errorElement.textContent = message;
        }
    }

    function hideError(field) {
        let errorElement = field.parentElement.querySelector(".error");
        if (errorElement) {
            errorElement.textContent = "";
        }
    }
});
