<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        /* General Styling */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Hero Section */
        .about-hero {
            background-image: url('images/hero-bg.jpg');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            text-align: center;
        }

        .hero-content h1 {
            font-size: 48px;
            margin: 0;
        }

        .hero-content p {
            font-size: 20px;
            margin-top: 10px;
        }

        /* Intro Section */
        .about-intro {
            padding: 50px 0;
            background-color: #fff;
            text-align: center;
        }

        .about-intro h2 {
            color: #007BFF;
        }

        .about-intro p {
            max-width: 800px;
            margin: 20px auto;
            line-height: 1.8;
        }

        /* Features Section */
        .about-features {
            background-color: #f4f4f4;
            padding: 50px 0;
        }

        .about-features .container {
            display: flex;
            justify-content: space-between;
            text-align: center;
        }

        .feature {
            flex-basis: 30%;
            padding: 20px;
        }

        .feature h3 {
            color: #007BFF;
        }

        .feature ul {
            list-style-type: square;
            text-align: left;
            padding-left: 20px;
        }

        /* Team Section */
        .team-section {
            background-color: #fff;
            padding: 50px 0;
        }

        .team-section h2 {
            text-align: center;
            margin-bottom: 40px;
            color: #007BFF;
        }

        .team-members {
            display: flex;
            justify-content: space-around;
        }

        .team-member {
            text-align: center;
            width: 30%;
        }

        .team-member img {
            width: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .team-member h4 {
            margin: 10px 0 5px;
            font-size: 18px;
        }

        /* CTA Section */
        .cta-section {
            background-color: #007BFF;
            color: white;
            padding: 50px 0;
            text-align: center;
        }

        .cta-section h2 {
            margin-bottom: 20px;
            font-size: 28px;
        }

        .cta-section p {
            margin-bottom: 30px;
        }

        .cta-button {
            background-color: #fff;
            color: #007BFF;
            padding: 10px 30px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .cta-button:hover {
            background-color: #f4f4f4;
            color: #007BFF;
        }

        /* Footer */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 14px;
        }

    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>About Us | JobJunction</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<section class="about-hero">
    <div class="hero-content">
        <h1>About Us</h1>
        <p>Empowering Careers, One Job at a Time</p>
    </div>
</section>

<section class="about-intro">
    <div class="container">
        <h2>Welcome to Job-Junction</h2>
        <p>Job-Junction is your trusted partner in navigating the job market. Our mission is to help job seekers and employers connect and thrive in today's dynamic workforce. Whether you're searching for your dream job or looking to fill positions with top talent, we're here to guide you every step of the way.</p>
    </div>
</section>

<section class="about-features">
    <div class="container">
        <div class="feature">
            <h3>Our Vision</h3>
            <p>To build a platform where job seekers find meaningful employment and companies discover the talent they need to succeed.</p>
        </div>
        <div class="feature">
            <h3>Our Services</h3>
            <ul>
                <li style="margin: 30px ">Thousands of job listings</li>
                <li style="margin: 30px ">Resume building tools</li>
                <li style="margin: 30px ">Company profiles and reviews</li>
                <li style="margin: 30px ">Career advice and resources</li>
            </ul>
        </div>
        <div class="feature">
            <h3>Our Commitment</h3>
            <p>We are committed to simplifying the hiring process, fostering professional growth, and creating opportunities for people to advance in their careers.</p>
        </div>
    </div>
</section>

<section class="team-section">
    <div class="container">
        <h2>Meet the Team</h2>
        <div class="team-members">
            <div class="team-member">
                <img src="./RecruiterStyle/assets/img/personal%20img/sahil.jpg"  style="object-fit: cover;width: 150px;height: 150px" alt="Team Member 1">
                <h4>Sahil Sorathiya</h4>
                <p>CEO & Founder</p>
            </div>
            <div class="team-member">
                <img src="./RecruiterStyle/assets/img/personal%20img/shivam_patel.jpg" style="object-fit: cover;width: 150px;height: 150px" alt="Team Member 2">
                <h4>Shivam Menpara</h4>
                <p>Chief Marketing Officer</p>
            </div>
            <div class="team-member">
                <img src="./RecruiterStyle/assets/img/personal%20img/Uday_Vasoya.jpg"style="object-fit: cover;width: 150px;height: 150px"   alt="Team Member 3">
                <h4>Uday Vasoya</h4>
                <p>Head of Technology</p>
            </div>
        </div>
    </div>
</section>

<section class="cta-section">
    <div class="container">
        <h2>Join Us Today!</h2>
        <p>Looking to jumpstart your career or fill open positions with top talent? Get started with JobJunction today!</p>
        <a href="#" class="cta-button">Explore Jobs</a>
    </div>
</section>

<footer>
    <p>&copy; 2024 JobJunction. All Rights Reserved.</p>
</footer>

</body>
</html>
