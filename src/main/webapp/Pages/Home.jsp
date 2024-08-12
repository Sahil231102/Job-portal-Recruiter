<%@ page import="java.sql.Connection" %>
<%@ page import="DAO.MyDatabase" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 20-05-2024
  Time: 03:54 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html class="no-js" lang="zxx">
<head>

    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans&display=swap" rel="stylesheet">
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Job board HTML-5 Template </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
<%--    <link rel="shortcut icon" type="image" href="./RecruiterStyle/assets/img/logo/finalogo.jpg">--%>

    <!-- CSS here -->
</head>

<body>
<!-- Preloader Start -->
<%--<div class="pre-loader">--%>
<%--    <div class="pre-loader-box">--%>
<%--        <div class="loader-logo">--%>
<%--            <div class="loading">--%>
<%--                <img width="20%" src="./userstyle/assets/img/logo/lalo.png"/>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="loader-progress" id="progress_div">--%>
<%--            <div class="bar" id="bar1"></div>--%>
<%--        </div>--%>
<%--        <div class="percent" id="percent1">0%</div>--%>
<%--        <div class="loading-text">Loading...</div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Preloader Start -->

<main>

    <!-- slider Area Start-->
    <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="slider-active">
            <div class="single-slider slider-height d-flex align-items-center" data-background="./assets/img/gallery/1.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-9 col-md-10">
                            <div class="hero__caption">
                                <h1 style="font-family:'Josefin Sans', sans-serif">Join the most exciting startup teams.</h1>
                            </div>

                        </div>
                        <img src="./RecruiterStyle/assets/img/Home/home.svg" height="500px" WIDTH="500px">


                    </div>
                    <!-- Search Box -->
<%--                    <div class="row">--%>
<%--                        <div class="col-xl-8">--%>
<%--                            <!-- form -->--%>
<%--                            <form action="#" class="search-box">--%>
<%--                                <div class="input-form">--%>
<%--                                    <input type="text" placeholder="Job Tittle or keyword">--%>
<%--                                </div>--%>
<%--                                <div class="select-form">--%>
<%--                                    <div class="select-itms">--%>
<%--                                        <select name="select" id="select1">--%>
<%--                                            <option value="">Location BD</option>--%>
<%--                                            <option value="">Location PK</option>--%>
<%--                                            <option value="">Location US</option>--%>
<%--                                            <option value="">Location UK</option>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="search-form">--%>
<%--                                    <a href="#">Find job</a>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->
    <!-- Our Services Start -->

    <!-- Our Services End -->
    <!-- Online CV Area Start -->
<%--    <div class="online-cv cv-bg section-overly pt-90 pb-120"  data-background="userstyle/assets/img/gallery/cv_bg.jpg">--%>
<%--        <div class="container">--%>
<%--            <div class="row justify-content-center">--%>
<%--                <div class="col-xl-10">--%>
<%--                    <div class="cv-caption text-center">--%>
<%--                        <p class="pera1">FEATURED TOURS Packages</p>--%>
<%--                        <p class="pera2"> Make a Difference with Your Online Resume!</p>--%>
<%--                        <a href="#" class="border-btn2 border-btn4">Upload your cv</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!-- Online CV Area End-->--%>
    <!-- Featured_job_start -->


    <!-- Featured_job_end -->
    <!-- How  Apply Process Start-->




</main>
<script>
    window.addEventListener('load', function () {
        var loader = document.querySelector('.pre-loader');
        var progress = document.querySelector('#bar1');
        var percent = document.querySelector('#percent1');

        // Function to update the loading progress
        function updateProgress() {
            var width = 0;
            var interval = setInterval(function () {
                if (width >= 100) {
                    clearInterval(interval);
                    loader.style.display = 'none'; // Hide loader once complete
                } else {
                    width++;
                    progress.style.width = width + '%';
                    percent.innerHTML = width + '%';
                }
            }, 30); // Speed of progress
        }

        // Start updating progress
        updateProgress();
    });
</script>


<!-- JS here -->

<!-- All JS Custom Plugins Link Here here -->

</body>
</html>
