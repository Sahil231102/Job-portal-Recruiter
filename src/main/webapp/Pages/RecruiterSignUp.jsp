<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
<head>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title> Responsive Registration Form | CodingLab </title>
    <link rel="stylesheet" href="../RecruiterStyle/RecruiterSignUpStyle.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body  style="width: 99%">
<div class="container" >
    <div class="title">Recruiter Registration</div>
    <div class="content">
        <form action="../VendorSignupServlet" method="post" enctype="multipart/form-data">
            <div class="user-details">

                <div class="input-box">
                    <span class="details">Company Name</span>
                    <input type="text" name="companyname" placeholder="Enter Company name" required>
                </div>
                <div class="input-box">
                    <span class="details">Email</span>
                    <input type="text" name="email" placeholder="Enter your email" required>
                </div>
                <div class="input-box">
                    <span class="details">Phone Number</span>
                    <input type="tel" maxlength="10" name="phone" placeholder="Enter your number" required>
                </div>
                <div class="input-box">
                    <span class="details">Company Address</span>
                    <input type="text" name="companyAddress" placeholder="Enter your Company Address" required>
                </div>


                <div class="input-box">
                    <span class="details">City</span>
                    <input type="text" name="city" placeholder="Enter City" required>
                </div>
                <div class="input-box">
                    <span class="details">State</span>
                    <input type="text" name="state" placeholder="Enter  state" required>
                </div>
                <div class="input-box">
                    <span class="details">Country</span>
                    <input type="text" name="country" placeholder="Enter Country" required>
                </div>

                <div class="input-box">
                    <span class="details">Password</span>
                    <input type="text" name="password" placeholder="Enter your password" required>
                </div>

                <div class="input-box">
                    <span class="details">Company Images</span>
                    <input type="file" name="companyImg" required>
                </div>

            </div>

            <div class="signup-link"style="place-items: center;">
                <input  style="color: whitesmoke;background: #0b0b0b; width: 50% ;height: 50px; border-radius: 20px;margin: 0; padding: 0; font-size: 20px"  type="submit" value="Register">
            </div>
            <div class="signup-link">You are already Login? <a href="../User_Login.jsp">Login now</a></div>

        </form>
    </div>
</div>

</body>
</html>