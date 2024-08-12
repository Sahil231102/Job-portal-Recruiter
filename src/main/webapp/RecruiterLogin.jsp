<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 02-08-2024
  Time: 06:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="RecruiterStyle/RecruiterSignUpStyle.css">
    <link rel="stylesheet" href="RecruiterStyle/Loginstyle.css">
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    <title>Title</title>
</head>
<body>
<div class="wrapper">
    <div class="title-text">

        <div class="title signup">Recruiter Login</div>
    </div>
    <div class="form-container">

        <div class="form-inner">
            <form action="vendorLoginServlet" method="post" class="signup">
                <div class="field">
                    <input type="email" name="V_email" placeholder="Company Email Address" required>
                </div>
                <div class="field">
                    <input type="hidden" name="loginvnd" value="vendor">
                    <input type="password" name="V_password" placeholder="Password" required>
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
</html>
