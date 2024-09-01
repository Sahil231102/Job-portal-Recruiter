<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 02-08-2024
  Time: 06:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .image-container {
            display: flex;
            justify-content: center;
           padding: 100px;
            align-items: center;
            height: 100px; /* This will center it vertically within the viewport height */
        }

        .image-container img {
            height: 120px;
            width: 500px;
        }
    </style>
    <link rel="stylesheet" href="RecruiterStyle/RecruiterSignUpStyle.css">
    <link rel="stylesheet" href="RecruiterStyle/Loginstyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    <title>Title</title>
</head>
<body>

<div class="wrapper">
    <div class="image-container">
        <img src="RecruiterStyle/assets/img/Login/login.svg" alt="Login Image">
    </div>
    <div class="title-text">

        <div class="title signup">Recruiter Login</div>
    </div>
    <div class="form-container">

        <div class="form-inner">
            <form action="RecruiterLoginController" method="post" class="signup">
                <div class="field">
                    <input type="email" name="R_email" placeholder="Company Email Address" required>
                </div>
                <div class="field">
                    <input type="hidden" name="loginvnd" value="vendor">
                    <input type="password" name="R_password" placeholder="Password" required>
                </div>
                <div class="field btn">
                    <div class="btn-layer"></div>
                    <input type="submit" name="Login" value="Login">
                </div>
                <div class="vendorsignup-link">Not a member? <a href="Pages/RecruiterSignUp.jsp">Signup now</a></div>

            </form>


        </div>
    </div>
</div>

</body>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 5000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer);
                toast.addEventListener('mouseleave', Swal.resumeTimer);
            }
        });

        // Check for URL parameter indicating success (e.g., ?success=true)
        const urlParams = new URLSearchParams(window.location.search);
        const successParam = urlParams.get('s');

        if (successParam && successParam === 'signUp') {
            // Display success toast
            Toast.fire({
                icon: 'success',
                title: 'SingUp Successfully!'
            });
            urlParams.delete('s');
            const newUrl = `./RecruiterLogin.jsp`;
            window.history.replaceState({}, document.title, newUrl);
        }
    });
</script>
</html>
