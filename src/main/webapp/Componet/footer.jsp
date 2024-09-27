<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 04-06-2024
  Time: 11:08 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        /* Footer Styling */
        footer {
            font-family: "Josefin Sans", sans-serif;
            font-weight: bold;
            background-color: #333;
            color: #fff;
            padding: 20px 0;
            position: relative;
            bottom: 0;
            width: 100%;
        }

        .footer-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .footer-section {
            flex-basis: 20%;
            margin-bottom: 20px;
        }

        .footer-section h3 {
            border-bottom: 2px solid #fff;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }

        .footer-section p,
        .footer-section ul,
        .footer-section li {
            color: #ddd;
            list-style-type: none;
            line-height: 1.6;
        }

        .footer-section ul li a {
            color: #bbb;
            text-decoration: none;
        }

        .footer-section ul li a:hover {
            color: #fff;
        }

        .social-media .social-icons {
            display: flex;
            justify-content: space-around;
        }

        .social-icons li {
            list-style: none;
        }

        .social-icons li a {
            color: #ddd;
            font-size: 24px;
            text-decoration: none;
        }

        .social-icons li a:hover {
            color: #fff;
        }

        .footer-bottom {
            text-align: center;
            padding-top: 10px;
            border-top: 1px solid #444;
        }

        #backToTop {
            background-color: #555;
            border: none;
            padding: 10px 20px;
            color: #fff;
            cursor: pointer;
            border-radius: 5px;
        }

        #backToTop:hover {
            background-color: #777;
        }

    </style>
    <title>Title</title>
    <link rel="stylesheet" href="../RecruiterStyle/style.css">
    <link rel="stylesheet" href="../RecruiterStyle/core.css">
    <link rel="stylesheet" href="../RecruiterStyle/Doc/css/main.css">
</head>
<body>
<footer>
    <div class="footer-container">
        <div class="footer-section company-info">
            <h3>About Us</h3>
            <p>Your trusted job portal providing the best opportunities for career growth. Join us today and take the next step in your career.</p>
        </div>

        <div class="footer-section quick-links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#">Job Categories</a></li>
                <li><a href="#">Post a Job</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Privacy Policy</a></li>
            </ul>
        </div>

        <div class="footer-section contact-info">
            <h3>Contact Us</h3>
            <ul>
                <li>Email: support@jobJunction.com</li>
                <li>Phone: +91 9909498426</li>
                <li>Address: 123,Green city ,Gandhinagar </li>
            </ul>
        </div>

        <div class="footer-section social-media">
            <h3>Follow Us</h3>
            <ul class="social-icons">
                <li><a href="#" class="fa fa-facebook"></a></li>
                <li><a href="#" class="fa fa-twitter"></a></li>
                <li><a href="#" class="fa fa-linkedin"></a></li>
                <li><a href="#" class="fa fa-instagram"></a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 Job Junction. All Rights Reserved.</p>
        <button id="backToTop" onclick="scrollToTop()">Back to Top</button>
    </div>
</footer>

<!-- Footer Start-->
<%--<div class="footer-area footer-bg footer-padding">--%>
<%--    <div class="container">--%>
<%--        <div class="row d-flex justify-content-between">--%>
<%--            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">--%>
<%--                <div class="single-footer-caption mb-50">--%>
<%--                    <div class="single-footer-caption mb-30">--%>
<%--                        <div class="footer-tittle">--%>
<%--                            <h4>About Us</h4>--%>
<%--                            <div class="footer-pera">--%>
<%--                                <p>Heaven frucvitful doesn't cover lesser dvsays appear creeping seasons so behold.</p>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">--%>
<%--                <div class="single-footer-caption mb-50">--%>
<%--                    <div class="footer-tittle">--%>
<%--                        <h4>Contact Info</h4>--%>
<%--                        <ul>--%>
<%--                            <li>--%>
<%--                                <p>Address :Your address goes--%>
<%--                                    here, your demo address.</p>--%>
<%--                            </li>--%>
<%--                            <li><a href="#">Phone : +8880 44338899</a></li>--%>
<%--                            <li><a href="#">Email : info@colorlib.com</a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">--%>
<%--                <div class="single-footer-caption mb-50">--%>
<%--                    <div class="footer-tittle">--%>
<%--                        <h4>Important Link</h4>--%>
<%--                        <ul>--%>
<%--                            <li><a href="#"> View Project</a></li>--%>
<%--                            <li><a href="#">Contact Us</a></li>--%>
<%--                            <li><a href="#">Testimonial</a></li>--%>
<%--                            <li><a href="#">Proparties</a></li>--%>
<%--                            <li><a href="#">Support</a></li>--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">--%>
<%--                <div class="single-footer-caption mb-50">--%>
<%--                    <div class="footer-tittle">--%>
<%--                        <h4>Newsletter</h4>--%>
<%--                        <div class="footer-pera footer-pera2">--%>
<%--                            <p>Heaven fruitful doesn't over lesser in days. Appear creeping.</p>--%>
<%--                        </div>--%>
<%--                        <!-- Form -->--%>
<%--                        <div class="footer-form" >--%>
<%--                            <div id="mc_embed_signup">--%>
<%--                                <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"--%>
<%--                                      method="get" class="subscribe_form relative mail_part">--%>
<%--                                    <input type="email" name="email" id="newsletter-form-email" placeholder="Email Address"--%>
<%--                                           class="placeholder hide-on-focus" onfocus="this.placeholder = ''"--%>
<%--                                           onblur="this.placeholder = ' Email Address '">--%>
<%--                                    <div class="form-icon">--%>
<%--                                        <button type="submit" name="submit" id="newsletter-submit"--%>
<%--                                                class="email_icon newsletter-submit button-contactForm"><img src="userstyle/assets/img/icon/form.png" alt=""></button>--%>
<%--                                    </div>--%>
<%--                                    <div class="mt-10 info"></div>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <!--  -->--%>
<%--        <div class="row footer-wejed justify-content-between">--%>
<%--            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-6">--%>
<%--                <!-- logo -->--%>
<%--                <div class="footer-logo mb-20">--%>
<%--                    <a href="index.html"><img src="userstyle/assets/img/logo/logo2_footer.png" alt=""></a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">--%>
<%--                <div class="footer-tittle-bottom">--%>
<%--                    <span>5000+</span>--%>
<%--                    <p>Talented Hunter</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">--%>
<%--                <div class="footer-tittle-bottom">--%>
<%--                    <span>451</span>--%>
<%--                    <p>Talented Hunter</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col-xl-3 col-lg-3 col-md-4 col-sm-5">--%>
<%--                <!-- Footer Bottom Tittle -->--%>
<%--                <div class="footer-tittle-bottom">--%>
<%--                    <span>568</span>--%>
<%--                    <p>Talented Hunter</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- footer-bottom area -->--%>
<%--<div class="footer-bottom-area footer-bg">--%>
<%--    <div class="container">--%>
<%--        <div class="footer-border">--%>
<%--            <div class="row d-flex justify-content-between align-items-center">--%>
<%--                <div class="col-xl-10 col-lg-10 ">--%>

<%--                </div>--%>
<%--                <div class="col-xl-2 col-lg-2">--%>
<%--                    <div class="footer-social f-right">--%>
<%--                        <a href="#"><i class="fab fa-facebook-f"></i></a>--%>
<%--                        <a href="#"><i class="fab fa-twitter"></i></a>--%>
<%--                        <a href="#"><i class="fas fa-globe"></i></a>--%>
<%--                        <a href="#"><i class="fab fa-behance"></i></a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Footer End-->
</body>
<script>
    // Smooth scroll back to top
    function scrollToTop() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    }

</script>
</html>
